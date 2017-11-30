unit u_frm_organizations;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ADODB, ExtCtrls;

type
  Tfrm_organizations = class(TForm)
    orgView: TListView;
    btn_AddOrg: TButton;
    btn_EditOrg: TButton;
    btn_DeleteOrg: TButton;
    btn_Exit: TButton;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btn_ExitClick(Sender: TObject);
    procedure orgViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure btn_DeleteOrgClick(Sender: TObject);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_EditOrgClick(Sender: TObject);
    procedure btn_AddOrgClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initFrm;
  end;

var
  frm_organizations: Tfrm_organizations;
  query: TADOQuery;
  p_key: longint;
  operation:smallint;
implementation

uses u_dm, tsp_weight;

{$R *.dfm}

procedure Tfrm_organizations.initFrm;
var
 li:TListItem;
begin
  orgView.Clear;
  query.Connection:=dm.AlexpromCon;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.organizations order by id');
  query.Open;
  query.First;
  while not query.Eof do
   begin
    li:=orgView.Items.Add;
    li.Caption:=query.FieldValues['id'];
    li.SubItems.Add(query.FieldValues['name']);
    query.Next;
   end;
end;

procedure Tfrm_organizations.btn_AddOrgClick(Sender: TObject);
begin
  dm.AlexpromCon.BeginTrans;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select max(id) from dbo.organizations');
  query.Open;
  p_key:=query.Fields[0].AsInteger;
  p_key:=p_key+1;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('insert into dbo.organizations(id) values (:id)');
  query.Parameters[0].Value:=p_key;
  query.ExecSQL;
  Edit1.Text:='';
  Edit1.Visible:=True;
  Edit1.SetFocus;
end;

procedure Tfrm_organizations.btn_DeleteOrgClick(Sender: TObject);
begin
if MessageDlg('Вы действительно хотите удалить данную организацию?',mtConfirmation,[mbok,mbcancel],0)=mrOk then
  begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('delete from dbo.organizations where id=:id');
    query.Parameters[0].Value:=p_key;
    query.ExecSQL;
  end;
  initFrm;
end;

procedure Tfrm_organizations.btn_EditOrgClick(Sender: TObject);
begin
  dm.AlexpromCon.BeginTrans;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select name from dbo.organizations where id=:id');
  query.Parameters[0].Value:=p_key;
  query.Open;
  Edit1.Visible:=True;
  Edit1.Text:=query.FieldValues['name'];
end;

procedure Tfrm_organizations.btn_ExitClick(Sender: TObject);
begin
 close;
end;

procedure Tfrm_organizations.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=vk_Return then
    begin
     query.Close;
     query.SQL.Clear;
     query.SQL.Add('update dbo.organizations set name=:name where id=:id');
     query.Parameters[0].Value:=Edit1.Text;
     query.Parameters[1].Value:=p_key;
     query.ExecSQL;
     Edit1.Visible:=False;
     dm.AlexpromCon.CommitTrans;
     initFrm;
    end;
 if Key=vk_Escape then
   begin
     Edit1.Visible:=False;
     query.Close;
     query.SQL.Clear;
     query.SQL.Add('select name from  dbo.organizations where id=:id');
     query.Parameters[0].Value:=p_key;
     query.Open;
     query.First;
     if query.fields[0].IsNull then
        begin
          dm.AlexpromCon.RollbackTrans;
        end;
     initFrm;
   end;

end;

procedure Tfrm_organizations.FormClick(Sender: TObject);
begin
 Edit1.Visible:=False;
 orgView.Selected.Selected:=False;
end;

procedure Tfrm_organizations.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure Tfrm_organizations.FormCreate(Sender: TObject);
begin
  query:=TADOQuery.Create(nil);
if not dm.AlexpromCon.Connected then
  begin
   try
    dm.AlexpromCon.Connected:=true;
    initFrm;
   except
    ShowMessage('Нет соединения с сервером базы данных!!! Обратитесь к администратору и повторите попытку позже.');
   end;
  end
else
  begin
    query:=TADOQuery.Create(nil);
    initFrm;
  end;
end;

procedure Tfrm_organizations.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=vk_Escape then
    Edit1.Visible:=False;
end;

procedure Tfrm_organizations.orgViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if selected then
  begin
    p_key:=Item.Index;
    btn_EditOrg.Enabled:=True;
    btn_DeleteOrg.Enabled:=True;
  end
else
  begin
    p_key:=-1;
    btn_EditOrg.Enabled:=False;
    btn_DeleteOrg.Enabled:=False;
  end;
end;

end.

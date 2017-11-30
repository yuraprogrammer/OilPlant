unit u_frm_Loaders;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ADODB, StdCtrls;

type
  Tfrm_editLoaders = class(TForm)
    loadersView: TListView;
    btn_AddMat: TButton;
    btn_EditMat: TButton;
    btn_DeleteMat: TButton;
    btn_Exit: TButton;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure loadersViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_ExitClick(Sender: TObject);
    procedure btn_DeleteMatClick(Sender: TObject);
    procedure btn_EditMatClick(Sender: TObject);
    procedure btn_AddMatClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure initFrm;
  public
    { Public declarations }
  end;

var
  frm_editLoaders: Tfrm_editLoaders;
  query:TADOQuery;
  p_key:longint;
  operation:smallint;
implementation

uses u_dm, tsp_weight;

{$R *.dfm}

procedure Tfrm_editLoaders.btn_AddMatClick(Sender: TObject);
begin
  dm.AlexpromCon.BeginTrans;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select max(mat_id) from dbo.mat_dic');
  query.Open;
  p_key:=query.Fields[0].AsInteger;
  p_key:=p_key+1;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('insert into dbo.mat_dic(mat_id, mat_name,color_code) values (:id,:name,:code)');
  query.Parameters[0].Value:=p_key;
  query.Parameters[1].Value:=' ';
  query.Parameters[2].Value:='00000000';
  query.ExecSQL;
  Edit1.Text:='';
  Edit1.Visible:=True;
  Edit1.SetFocus;
end;

procedure Tfrm_editLoaders.btn_DeleteMatClick(Sender: TObject);
begin
if MessageDlg('Вы действительно хотите удалить данный груз?',mtConfirmation,[mbok,mbcancel],0)=mrOk then
  begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('delete from dbo.mat_dic where mat_id=:id');
    query.Parameters[0].Value:=p_key;
    query.ExecSQL;
  end;
  query.Free;
  initFrm;
end;

procedure Tfrm_editLoaders.btn_EditMatClick(Sender: TObject);
begin
  dm.AlexpromCon.BeginTrans;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select mat_name from dbo.mat_dic where mat_id=:id');
  query.Parameters[0].Value:=p_key;
  query.Open;
  Edit1.Visible:=True;
  Edit1.Text:=query.FieldValues['mat_name'];
end;

procedure Tfrm_editLoaders.btn_ExitClick(Sender: TObject);
begin
 close
end;

procedure Tfrm_editLoaders.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=vk_Return then
    begin
     query.Close;
     query.SQL.Clear;
     query.SQL.Add('update dbo.mat_dic set mat_name=:name where mat_id=:id');
     query.Parameters[0].Value:=Edit1.Text;
     query.Parameters[1].Value:=p_key;
     query.ExecSQL;
     Edit1.Visible:=False;
     dm.AlexpromCon.CommitTrans;
     query.Free;
     initFrm;
    end;
 if Key=vk_Escape then
   begin
     Edit1.Visible:=False;
     query.Close;
     query.SQL.Clear;
     query.SQL.Add('select mat_name from dbo.mat_dic where mat_id=:id');
     query.Parameters[0].Value:=p_key;
     query.Open;
     query.First;
     dm.AlexpromCon.RollbackTrans;
     query.Free;
     initFrm;
   end;
end;

procedure Tfrm_editLoaders.initFrm;
var
 li:TListItem;
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.AlexpromCon;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.mat_dic order by mat_id');
 query.Open;
 query.First;
 loadersView.Clear;
 while not query.Eof do
  begin
   li:=loadersView.Items.Add;
   li.Caption:=query.FieldValues['mat_id'];
   li.SubItems.Add(query.FieldValues['mat_name']);
   query.Next;
  end;
end;

procedure Tfrm_editLoaders.loadersViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
if selected then
  begin
    p_key:=Item.Index;
    btn_EditMat.Enabled:=True;
    btn_DeleteMat.Enabled:=True;
  end
else
  begin
    p_key:=-1;
    btn_EditMat.Enabled:=False;
    btn_DeleteMat.Enabled:=False;
  end;
end;

procedure Tfrm_editLoaders.FormClose(Sender: TObject; var Action: TCloseAction);
begin
try
  frmTSP.InitForm;
except
  exit;
end;
 Action:=caFree;
end;

procedure Tfrm_editLoaders.FormCreate(Sender: TObject);
begin
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
    initFrm;
  end;
end;
procedure Tfrm_editLoaders.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=vk_Escape then
    Edit1.Visible:=False;
end;

end.

unit U_sirie_dic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ADODB;

type
  Tsirie_dic = class(TForm)
    ListView1: TListView;
    btn_AddMat: TButton;
    btn_Edit: TButton;
    btn_Delete: TButton;
    btn_Exit: TButton;
    Edit1: TEdit;
    procedure Edit1KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btn_DeleteClick(Sender: TObject);
    procedure btn_EditClick(Sender: TObject);
    procedure btn_AddMatClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_ExitClick(Sender: TObject);
  private
    { Private declarations }
    procedure InitFrm;
  public
    { Public declarations }
  end;

var
  sirie_dic: Tsirie_dic;
  query:TADOQuery;
  p_key:longint;
implementation

uses udm, uClientBase;

{$R *.dfm}

procedure TSirie_dic.InitFrm;
var
 li:TListItem;
begin

 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.apProductDic where ID>0');
 query.Open;
 query.First;
 ListView1.Clear;
 while not query.Eof do
  begin
    li:=ListView1.Items.Add;
    li.Caption:=query.Fields[0].AsString;
    li.SubItems.Add(query.Fields[1].AsString);
    query.Next;
  end;
end;

procedure Tsirie_dic.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if Selected then
 begin
  p_key:=StrToInt(Item.Caption);
  btn_Edit.Enabled:=True;
  btn_Delete.Enabled:=True;
 end
else
  begin
    p_key:=-1;
    btn_Edit.Enabled:=False;
    btn_Delete.Enabled:=False;
  end;
end;

procedure Tsirie_dic.btn_AddMatClick(Sender: TObject);
begin
  dm.ADOConnection1.BeginTrans;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select max(id) from dbo.apProductDic');
  query.Open;
  p_key:=query.Fields[0].AsInteger;
  p_key:=p_key+1;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('insert into dbo.apProductDic(id) values (:id)');
  query.Parameters[0].Value:=p_key;
  query.ExecSQL;
  Edit1.Text:='';
  Edit1.Visible:=True;
end;

procedure Tsirie_dic.btn_DeleteClick(Sender: TObject);
begin
if MessageDlg('¬ы действительно хотите удалить данную позицию?',mtConfirmation,[mbok,mbcancel],0)=mrOk then
  begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('delete from dbo.apProductDic where id=:id');
    query.Parameters[0].Value:=p_key;
    query.ExecSQL;
  end;
  initFrm;
end;

procedure Tsirie_dic.btn_EditClick(Sender: TObject);
begin
 dm.ADOConnection1.BeginTrans;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select name from dbo.apProductDic where id=:id');
 query.Parameters[0].Value:=p_key;
 query.Open;
 Edit1.Visible:=True;
 Edit1.Text:=query.FieldValues['name'];
end;

procedure Tsirie_dic.btn_ExitClick(Sender: TObject);
begin
 frmClientBase.actionRefreshProductsExecute(nil);
 close;
end;

procedure Tsirie_dic.Edit1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if Key=vk_Return then
    begin
     query.Close;
     query.SQL.Clear;
     query.SQL.Add('update dbo.apProductDic set name=:name where id=:id');
     query.Parameters[0].Value:=Edit1.Text;
     query.Parameters[1].Value:=p_key;
     query.ExecSQL;
     Edit1.Visible:=False;
     dm.ADOConnection1.CommitTrans;
     initFrm;
    end;
 if Key=vk_Escape then
   begin
     Edit1.Visible:=False;
     query.Close;
     query.SQL.Clear;
     query.SQL.Add('select name from  dbo.apProductDic where id=:id');
     query.Parameters[0].Value:=p_key;
     query.Open;
     query.First;
     if query.fields[0].IsNull then
        begin
          dm.ADOConnection1.RollbackTrans;
        end;
     dm.ADOConnection1.RollbackTrans;   
     initFrm;
   end;
end;

procedure Tsirie_dic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure Tsirie_dic.FormCreate(Sender: TObject);
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.ADOConnection1;
 InitFrm;
end;

end.

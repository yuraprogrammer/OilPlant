unit u_tankdic;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ADODB, StdCtrls;

type
  Ttank_dic = class(TForm)
    tankView: TListView;
    btnAdd: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure btnAddClick(Sender: TObject);
    procedure tankViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure tankViewDblClick(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
   procedure InitFrm;
  end;

var
  tank_dic: Ttank_dic;
  query:TADOQuery;
  tank_id:byte;
implementation

uses u_dm, U_edit_tank_param;

{$R *.dfm}

procedure Ttank_dic.InitFrm;
var
 li:TListItem;
begin
 tankView.Clear;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.tank_dic');
 query.Open;
 query.First;
 while not query.Eof do
  begin
   if query.FieldValues['tank_id']<>0 then
    begin
     li:=tankView.Items.Add;
     li.Caption:=query.FieldValues['tank_name'];
     li.SubItems.Add(query.FieldValues['Inside_Diameter']);
     li.SubItems.Add(query.FieldValues['Cylinder_Length']);
     li.SubItems.Add(query.FieldValues['Conus_Height']);
     query.Next;
    end
   else
    query.Next;
 end;
end;

procedure Ttank_dic.btnAddClick(Sender: TObject);
begin
 Application.CreateForm(Tedit_tank_param, edit_tank_param);
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select max(tank_id) from dbo.tank_dic');
 query.Open;
 query.First;
 tank_id:=query.Fields[0].AsInteger+1;
 edit_tank_param.tank_code:=tank_id;
 edit_tank_param.showModal;
end;

procedure Ttank_dic.Button3Click(Sender: TObject);
begin
if messagedlg('Удалить выбранный резервуар?', mtConfirmation, [mbOk, mbCancel], 0)=mrok then
 begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('delete from dbo.tank_dic where tank_id=:tn');
  query.Parameters[0].Value:=tank_id;
  query.ExecSQL;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('delete from dbo.tank_mat where tank_id=:tn');
  query.Parameters[0].Value:=tank_id;
  query.ExecSQL;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('delete from dbo.grad_tank where tank_id=:tn');
  query.Parameters[0].Value:=tank_id;
  query.ExecSQL;
  InitFrm;
 end;
end;

procedure Ttank_dic.Button4Click(Sender: TObject);
begin
 close;
end;

procedure Ttank_dic.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure Ttank_dic.FormCreate(Sender: TObject);
begin
if not dm.alexpromCon.Connected then
 begin
  try
   dm.alexpromCon.Connected:=true;
   query:=TADOQuery.Create(nil);
   query.Connection:=dm.AlexpromCOn;
   initFrm;
  except
   ShowMessage('Нет соединения с сервером базы данных!!! Обратитесь к администратору и повторите попытку позже.');
  end;
 end
else
 begin
  query:=TADOQuery.Create(nil);
  query.Connection:=dm.AlexpromCOn;
  InitFrm;
 end;
end;

procedure Ttank_dic.tankViewDblClick(Sender: TObject);
begin
 Application.CreateForm(Tedit_tank_param, edit_tank_param);
 edit_tank_param.tank_code:=tank_id;
 edit_tank_param.showModal;
end;

procedure Ttank_dic.tankViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if selected then
 begin
   query.Close;
   query.SQL.Clear;
   query.SQL.Add('select tank_id from dbo.tank_dic where tank_name=:tn');
   query.Parameters[0].Value:=trim(item.Caption);
   query.Open;
   query.First;
   tank_id:=query.Fields[0].AsInteger;
   Button3.Enabled:=true;
 end
else
 begin
  tank_id:=255;
  Button3.Enabled:=False;
 end;
end;

end.

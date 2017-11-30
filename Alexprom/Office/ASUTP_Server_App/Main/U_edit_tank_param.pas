unit U_edit_tank_param;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, StdCtrls, ADODB;

type
  Tedit_tank_param = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    MaskEdit2: TMaskEdit;
    Label4: TLabel;
    MaskEdit3: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure MaskEdit2Change(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    tank_code:byte;
  end;

var
  edit_tank_param: Tedit_tank_param;
  query:TADOQuery;
  t_name:string;
  t_height, t_lenght, t_diam:longint;
  new_tank:boolean;
implementation

uses u_dm, u_tankdic;

{$R *.dfm}

procedure Tedit_tank_param.Button1Click(Sender: TObject);
begin
if MessageDlg('Сохранить изменения?', mtConfirmation, [mbOk, mbCancel], 0)=mrOk then
 begin
 try
  query.Close;
  query.SQL.Clear;
  if new_tank=true then
   begin
    query.SQL.Add('insert into dbo.tank_dic (tank_id, tank_name, Conus_Height, ');
    query.SQL.Add('Cylinder_Length, Inside_Diameter, matLevel, matVolume) values (:tid, :tname, :th, :tl, :td, :ml, :mv)');
    query.Parameters[0].Value:=tank_code;
    query.Parameters[1].Value:=t_name;
    query.Parameters[2].Value:=t_height;
    query.Parameters[3].Value:=t_lenght;
    query.Parameters[4].Value:=t_diam;
    query.Parameters[5].Value:=0;
    query.Parameters[6].Value:=0;
    query.ExecSQL;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('insert into dbo.tank_mat (tank_id, mat_id, plotn) values (:tid, :mid, :p)');
    query.Parameters[0].Value:=tank_code;
    query.Parameters[1].Value:=0;
    query.Parameters[2].Value:=0.999;
    query.ExecSQL;
   end
  else
   begin
    query.SQL.Add('update dbo.tank_dic set tank_name=:tname, Conus_Height=:th, ');
    query.SQL.Add('Cylinder_Length=:tl, Inside_Diameter=:td where tank_id=:tid');
    query.Parameters[0].Value:=t_name;
    query.Parameters[1].Value:=t_height;
    query.Parameters[2].Value:=t_lenght;
    query.Parameters[3].Value:=t_diam;
    query.Parameters[4].Value:=tank_code;
    query.ExecSQL;
   end;
  ShowMessage('Обновление выполнено успешно!!!');
 except
  SHowMessage('Ошибка обновления!!! Проверьте правильность ввода данных!!!');
 end;
 end;
end;

procedure Tedit_tank_param.Button2Click(Sender: TObject);
begin
 close;
end;

procedure Tedit_tank_param.Edit1Change(Sender: TObject);
begin
 if Edit1.Text<>'' then
  t_name:=Edit1.Text
 else
  t_name:='empty';
end;

procedure Tedit_tank_param.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
 tank_dic.InitFrm;
end;

procedure Tedit_tank_param.FormCreate(Sender: TObject);
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromcon;
end;

procedure Tedit_tank_param.FormShow(Sender: TObject);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.tank_dic where tank_id=:tid');
 query.Parameters[0].Value:=tank_code;
 query.Open;
 if query.RecordCount<>0 then
  new_tank:=false
 else
  new_tank:=true;
 Edit1.Text:=query.FieldByName('tank_name').AsString;
 MaskEdit1.Text:=query.FieldByName('Conus_Height').AsString;
 MaskEdit2.Text:=query.FieldByName('Cylinder_Length').AsString;
 MaskEdit3.Text:=query.FieldByName('Inside_Diameter').AsString;
end;

procedure Tedit_tank_param.MaskEdit1Change(Sender: TObject);
begin
TRY
if MaskEdit1.Text<>'' then
 t_Height:=StrToInt(trim(MaskEdit1.Text))
else
 t_Height:=0;
EXCEPT

END;
end;

procedure Tedit_tank_param.MaskEdit2Change(Sender: TObject);
begin
TRY
if MaskEdit2.Text<>'' then
 t_lenght:=StrToInt(trim(MaskEdit2.Text))
else
 t_lenght:=0;
EXCEPT

END;
end;

procedure Tedit_tank_param.MaskEdit3Change(Sender: TObject);
begin
TRY
if MaskEdit3.Text<>'' then
 t_diam:=StrToInt(trim(MaskEdit3.Text))
else
 t_diam:=0;
EXCEPT

END;
end;

end.

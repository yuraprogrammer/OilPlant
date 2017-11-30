unit U_input_Tank_chem_Data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ADODB,geometricsolution;

type
  Tinput_Tank_chem_Data = class(TForm)
    GroupBox1: TGroupBox;
    Label9: TLabel;
    Edit3: TEdit;
    Label10: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    Edit4: TEdit;
    Label6: TLabel;
    procedure Edit4Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InitFrm;
  public
    { Public declarations }
  end;

var
  input_Tank_chem_Data: Tinput_Tank_chem_Data;
  query:TADOQuery;
  temper_flash, temper_pom, temper_eok, filter:real;
  i:byte;
implementation

uses u_dm, U_inputTankData, U_inputChemTankData;

{$R *.dfm}

procedure Tinput_Tank_chem_Data.InitFrm;
begin
try
 query.Close;
 query.SQL.Clear;
 query.SQL.ADD('select * from dbo.mat_in_tank where tank_id=:tid');
 query.Parameters[0].Value:=frmInputTankchemData.tank_edit_data_id;
 query.Open;
 query.First;
 GroupBox1.Caption:='Исходные данные по резервуару '+query.FieldValues['tank_name'];
 temper_flash:=query.Fieldbyname('t_flash').asfloat;
 temper_pom:=query.Fieldbyname('t_pom').asfloat;
 temper_eok:=query.Fieldbyname('end_of_kip').asfloat;
 Edit3.Text:=floatToStrf(temper_flash,ffFixed,4,1);
 Edit1.Text:=FloatToStrF(temper_pom,ffFixed,4,1);
 Edit2.Text:=FloatToStrF(temper_eok, ffFixed, 4,1);
except
 exit;
end;
end;

procedure Tinput_Tank_chem_Data.Button1Click(Sender: TObject);
begin
try
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('update dbo.tank_mat set t_flash=:@m, t_pom=:@plotn, end_of_kip=:@t, filter=:@ttt where tank_id=:tid');
  if edit3.Text = '' then
   query.Parameters[0].Value:=null
  else
   query.Parameters[0].Value:=temper_flash;
  if edit1.Text = '' then
   query.Parameters[1].Value:=null
  else
   query.Parameters[1].Value:=temper_pom;
  if edit2.Text ='' then
   query.Parameters[2].Value:=null
  else
   query.Parameters[2].Value:=temper_eok;
  if edit4.Text ='' then
   query.Parameters[3].Value:=null
  else
   query.Parameters[3].Value:=filter;
  query.Parameters[4].Value:=frmInputTankchemData.tank_edit_data_id;
  query.ExecSQL;
  ShowMessage('Обновление выполнено успешно!!!');
  close;
except
  ShowMessage('Обновление выполнено барыжно!!!');
  exit;
end;
end;

procedure Tinput_Tank_chem_Data.Button2Click(Sender: TObject);
begin
 close;
end;

procedure Tinput_Tank_chem_Data.Edit1Change(Sender: TObject);
begin
 try
  temper_pom:=strtofloat(edit1.Text);
 except
  exit;
 end;
end;

procedure Tinput_Tank_chem_Data.Edit2Change(Sender: TObject);
begin
try
 temper_eok:=strtofloat(edit2.Text);
except
 exit;
end;
end;

procedure Tinput_Tank_chem_Data.Edit3Change(Sender: TObject);
begin
try
  temper_flash:=StrToFloat(Edit3.Text);
except
  exit;
end;
end;

procedure Tinput_Tank_chem_Data.Edit4Change(Sender: TObject);
begin
try
 filter:=StrToFloat(Edit4.Text);
except

end;
end;

procedure Tinput_Tank_chem_Data.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 frmInputTankchemData.InitFrm;
 Action:=caFree;
end;

procedure Tinput_Tank_chem_Data.FormCreate(Sender: TObject);
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 InitFrm;
end;

end.

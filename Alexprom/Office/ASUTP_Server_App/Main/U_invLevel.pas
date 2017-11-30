unit U_invLevel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, ADODB;

type
  TfrmInvLevel = class(TForm)
    GroupBox1: TGroupBox;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit2: TMaskEdit;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    btnSave: TButton;
    btnExit: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
  private
    { Private declarations }
    procedure initFrm(t_id:byte; t_data:boolean);
  public
    { Public declarations }
  end;

var
  frmInvLevel: TfrmInvLevel;
  query:TADOQuery;
  level, volume, weight:longint;
  plotn:real;
implementation

uses u_dm, U_newInventory;

{$R *.dfm}

procedure TfrmInvLevel.initFrm(t_id: Byte; t_data:boolean);
begin
query.Close;
query.SQL.Clear;
query.SQL.Add('select * from dbo.inventory_report where tank_id=:tid and inv_month=:tm and inv_year=:ty');
query.Parameters[0].Value:=t_id;
query.parameters[1].Value:=newInventory.invMonth;
query.Parameters[2].Value:=newInventory.invYear;
query.Open;
query.First;
if t_data=false then
 begin
  Caption:=Caption+' '+query.FieldByName('tank_name').AsString+' Начало.';
  GroupBox1.Caption:=GroupBox1.Caption+':'+query.FieldByName('tank_name').AsString;
  if query.FieldByName('start_level').AsString<>'' then
   level:=query.FieldByName('start_level').AsInteger
  else
   level:=0;
  MaskEdit1.Text:=IntToStr(level);
  if query.FieldByName('start_volume').AsString<>'' then
   volume:=query.FieldByName('start_volume').AsInteger
  else
   volume:=0;
  MaskEdit2.Text:=IntToStr(volume);
  if query.FieldByName('start_kg').AsString<>'' then
   weight:=query.FieldByName('start_kg').AsInteger
  else
   weight:=0;
  MaskEdit4.Text:=IntToStr(weight);
  if query.FieldByName('start_plotn').AsString<>'' then
   plotn:=query.FieldByName('start_plotn').AsFloat
  else
   plotn:=0.999;
  if weight<>0 then
   if volume<>0 then
    plotn:=weight/volume;
  MaskEdit3.Text:=FloatToStrF(plotn, ffFixed, 4,3);
 end
else
 begin
  Caption:=Caption+' '+query.FieldByName('tank_name').AsString+' Конец.';
  GroupBox1.Caption:=GroupBox1.Caption+':'+query.FieldByName('tank_name').AsString;
  if query.FieldByName('end_level').AsString<>'' then
   level:=query.FieldByName('end_level').AsInteger
  else
   level:=0;
  MaskEdit1.Text:=IntToStr(level);
  if query.FieldByName('end_volume').AsString<>'' then
   volume:=query.FieldByName('end_volume').AsInteger
  else
   volume:=0;
  MaskEdit2.Text:=IntToStr(volume);
  if query.FieldByName('end_kg').AsString<>'' then
   weight:=query.FieldByName('end_kg').AsInteger
  else
   weight:=0;
  MaskEdit4.Text:=IntToStr(weight);
  if query.FieldByName('end_plotn').AsString<>'' then
   plotn:=query.FieldByName('end_plotn').AsFloat
  else
   plotn:=0.999;
  if weight<>0 then
   if volume<>0 then
    plotn:=weight/volume;
  MaskEdit3.Text:=FloatToStrF(plotn, ffFixed, 4,3);
 end;
end;

procedure TfrmInvLevel.MaskEdit1Change(Sender: TObject);
var
 qry:TADOQuery;
begin
try
 level:=StrToInt(trim(MaskEdit1.Text));
 qry:=TADOQuery.Create(nil);
 qry.Connection:=dm.alexpromCon;
 qry.Close;
 qry.SQL.Clear;
 qry.SQL.Add('select mat_Volume from grad_tank where tank_id=:tid and mat_Level=:ml');
 qry.Parameters[0].Value:=newInventory.p_key;
 qry.Parameters[1].Value:=level;
 qry.Open;
 qry.First;
 if qry.FieldByName('mat_Volume').AsString<>'' then
  volume:=qry.FieldByName('mat_Volume').AsInteger
 else
  volume:=0;
 MaskEdit2.Text:=IntToStr(volume);
 weight:=Round(volume*plotn);
 MaskEdit4.Text:=IntToStr(weight);
 qry.Free;
except
 exit;
end;
end;

procedure TfrmInvLevel.MaskEdit3Change(Sender: TObject);
begin
try
 plotn:=StrToFloat(trim(MaskEdit3.Text));
 weight:=Round(volume*plotn);
 MaskEdit4.Text:=IntToStr(weight);
except
 exit;
end;
end;

procedure TfrmInvLevel.btnExitClick(Sender: TObject);
begin
 close;
end;

procedure TfrmInvLevel.btnSaveClick(Sender: TObject);
begin
try
 if newInventory.data_on=false then
  begin
   query.Close;
   query.SQL.Clear;
   query.SQL.Add('update dbo.inventory set start_level=:sl, start_volume=:sm, ');
   query.SQL.Add('start_kg=:sk, start_plotn=:sp, start_date=:sd, start_time=:st ');
   query.SQL.Add('where inv_Month=:im and inv_Year=:iy and tank_id=:tid');
   query.Parameters[0].Value:=level;
   query.Parameters[1].Value:=volume;
   query.Parameters[2].Value:=weight;
   query.Parameters[3].Value:=plotn;
   query.Parameters[4].Value:=newInventory.invDate;
   query.Parameters[5].Value:=newInventory.invTime;
   query.Parameters[6].Value:=newInventory.invMonth;
   query.Parameters[7].Value:=newInventory.invYear;
   query.Parameters[8].Value:=newInventory.p_key;
   query.ExecSQL;
  end
 else
  begin
   query.Close;
   query.SQL.Clear;
   query.SQL.Add('update dbo.inventory set end_level=:sl, end_volume=:sm, ');
   query.SQL.Add('end_kg=:sk, end_plotn=:sp ');
   query.SQL.Add('where inv_Month=:im and inv_Year=:iy and tank_id=:tid');
   query.Parameters[0].Value:=level;
   query.Parameters[1].Value:=volume;
   query.Parameters[2].Value:=weight;
   query.Parameters[3].Value:=plotn;
   query.Parameters[4].Value:=newInventory.invMonth;
   query.Parameters[5].Value:=newInventory.invYear;
   query.Parameters[6].Value:=newInventory.p_key;
   query.ExecSQL;
  end;
 showMessage('Данные успешно внесены!!!');
 close;
except
 showMessage('Оппаньки!!!');
end;
end;

procedure TfrmInvLevel.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 newInventory.initFrm;
 query.Free;
 Action:=caFree;
end;

procedure TfrmInvLevel.FormCreate(Sender: TObject);
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 initFrm(newInventory.p_key, newInventory.data_on);
end;

end.

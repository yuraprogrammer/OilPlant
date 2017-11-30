unit U_input_Tank_Data;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ADODB,geometricsolution;

type
  Tinput_Tank_Data = class(TForm)
    GroupBox1: TGroupBox;
    MaskEdit1: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    MaskEdit2: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    Edit2: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    Edit3: TEdit;
    Label10: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label11: TLabel;
    ComboBox1: TComboBox;
    Label12: TLabel;
    MaskEdit3: TMaskEdit;
    Label13: TLabel;
    CheckBox1: TCheckBox;
    procedure Edit1Change(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit2Change(Sender: TObject);
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
  input_Tank_Data: Tinput_Tank_Data;
  query:TADOQuery;
  t_length,t_diameter,t_conus:word;
  newVolume,newWeight:longint;
  temper_cur:real;
  plotn20,plotn_cur, plotnNew:real;
  temper_correct, temper_new:real;
  plotn_str:string[6];
  i:byte;
  curLevel, newLevel:longint;
implementation

uses u_dm, U_inputTankData;

{$R *.dfm}

procedure Tinput_Tank_Data.InitFrm;
var
  curMatName:string;
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from sirie_dic');
 query.Open;
 query.First;
 ComboBox1.Clear;
 while not query.Eof do
  begin
    ComboBox1.Items.Add(query.FieldValues['name']);
    query.Next;
  end;
 query.Close;
 query.SQL.Clear;
 query.SQL.ADD('select * from dbo.mat_in_tank where tank_id=:tid');
 query.Parameters[0].Value:=frmInputTankData.tank_edit_data_id;
 query.Open;
 query.First;

 t_length:=query.FieldByName('Cylinder_Length').AsInteger;
 t_diameter:=query.FieldByName('Inside_Diameter').AsInteger;
 t_conus:=query.FieldByName('Conus_Height').AsInteger;
 GroupBox1.Caption:='Исходные данные по резервуару '+query.FieldByName('tank_name').AsString;
 if query.FieldByName('matLevel').AsString<>'' then
  curLevel:=query.FieldByName('matLevel').AsInteger
 else
  curLevel:=0;
 if query.FieldByName('plotn').AsString<>'' then
  plotn_cur:=query.FieldByName('plotn').AsFloat
 else
  plotn_cur:=0.999;
 if query.FieldByName('matvolume').AsString<>'' then
  newVolume:=query.FieldByName('matvolume').AsInteger
 else
  newVolume:=0;
 if query.FieldByName('m').AsString<>'' then
  newWeight:=query.FieldByName('m').AsInteger
 else
  newWeight:=0;
 if query.FieldByName('t').AsString<>'' then
  temper_cur:=query.FieldByName('t').AsFLoat
 else
  temper_cur:=0;
 curMatName:=query.FieldByName('mat_name').AsString;
 if query.FieldByName('in_use').AsString='*' then
  checkbox1.Checked:=true
 else
  checkbox1.Checked:=false;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select id from dbo.sirie_dic where name=:mid');
 query.Parameters[0].Value:=trim(curMatName);
 query.Open;
 query.First;
 ComboBox1.ItemIndex:=query.Fields[0].AsInteger;
 Edit1.Text:=IntToStr(newVolume);
 Edit2.Text:=FloatToStrF(newWeight,ffFixed,6,0);
 Edit3.Text:=FloatToStrF(temper_cur, ffFixed, 4,1);
 MaskEdit1.Text:=IntToStr(curLevel);
 MaskEdit2.Text:=Trim(FloatToStrF(plotn_cur, ffFixed,5,4));
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select plotn20 from v_plotn20 where temper_name=:a and plotn like :b');
 query.Parameters[0].Value:=temper_cur;
 query.Parameters[1].Value:=MaskEdit2.Text;
 query.Open;
 query.First;
 MaskEdit3.Text:=FloatToStrF(query.Fields[0].AsFloat, ffFixed, 5, 4);
end;

procedure Tinput_Tank_Data.MaskEdit1Change(Sender: TObject);
begin
try
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select mat_volume from dbo.grad_tank where tank_id=:tid and mat_level=:ml');
 query.Parameters[0].Value:=frmInputTankData.tank_edit_data_id;
 query.Parameters[1].Value:=trim(maskedit1.Text);
 query.Open;
// plotn_cur:=strtofloat(maskedit2.Text);
 newVolume:=query.Fields[0].Asinteger;
 newWeight:=round(newvolume*plotn_cur);
 edit1.Text:=inttostr(newvolume);
 edit2.Text:=inttostr(newWeight);
 curlevel:=strtoint(trim(maskedit1.Text));
except
 exit;
end;
end;

procedure Tinput_Tank_Data.MaskEdit2Change(Sender: TObject);
label m1;
var
  query_plotn:string[5];
begin
try
  plotn_cur:=StrToFloat(trim(MaskEdit2.Text));
  newweight:=round(newvolume*plotn_cur);
  edit2.Text:=inttostr(round(newweight));
//  newVolume:=Round(newWeight/plotn_cur);
//  Edit1.Text:=IntToStr(newVolume);
//  query.Close;
// query.SQL.Clear;
//  query.SQL.Add('select mat_Level, mat_Volume from dbo.grad_tank where tank_id=:tid order by mat_Level');
//  query.Parameters[0].Value:=frmInputTankData.tank_edit_data_id;
//  query.Open;
//  query.First;
//  while not query.Eof do
//   begin
//    if newVolume>=query.Fields[1].AsInteger then
//      begin
//      query.Next;
//       if newVolume<=query.Fields[1].AsInteger then
//       BEGIN
//         newLevel:=query.Fields[0].AsInteger;
//         goto m1;
//        end;
//      end
//    else
//      query.Next;
//   end;
// m1:
//  MaskEdit1.Text:=IntToStr(newLevel);
//  curLevel:=newLevel;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select plotn20 from v_plotn20 where temper_name=:a and plotn like :b');
  query.Parameters[0].Value:=temper_cur;
  query_plotn:=MaskEdit2.Text;
  query.Parameters[1].Value:=query_plotn;
  query.Open;
  query.First;
  MaskEdit3.Text:=FloatToStrF(query.Fields[0].AsFloat, ffFixed, 5, 4);
except
  exit
end;
end;

procedure Tinput_Tank_Data.Button1Click(Sender: TObject);
var
 toout:longint;
begin
try
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select dont_touch from dbo.tank_dic where tank_id=:tid');
  query.Parameters[0].Value:=frmInputTankData.tank_edit_data_id;
  query.Open;
  query.First;
  toout:=newVolume-query.Fields[0].AsInteger;
  if toout<0 then
   toout:=0;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('update dbo.tank_dic set matLevel=:mLevel, matVolume=:mVolume, to_Out=:@toout');
  query.SQL.Add('where tank_id=:tid');
  query.Parameters[0].Value:=curLevel;
  query.Parameters[1].Value:=newVolume;
  query.Parameters[2].Value:=toout;
  query.Parameters[3].Value:=frmInputTankData.tank_edit_data_id;
  query.ExecSQL;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('update dbo.tank_mat set m=:@m, plotn=:@plotn, t=:@t, mat_id=:mid, p20=:ppp, in_use=:pppp where tank_id=:tid');
  query.Parameters[0].Value:=newWeight;
  query.Parameters[1].Value:=plotn_cur;
  query.Parameters[2].Value:=strtofloat(edit3.Text);
  query.Parameters[3].Value:=ComboBox1.ItemIndex;
  query.Parameters[4].Value:=plotn20;
  if checkbox1.Checked then
   query.Parameters[5].Value:='*'
  else
   query.Parameters[5].Value:='';
  query.Parameters[6].Value:=frmInputTankData.tank_edit_data_id;
  query.ExecSQL;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('update dbo.inventory set end_level=:el, end_volume=:ev, end_kg=:ekg where tank_id=:tid');
  query.Parameters[0].Value:=curLevel;
  query.Parameters[1].Value:=newVolume;
  query.Parameters[2].Value:=newWeight;
  query.Parameters[3].Value:=frmInputTankData.tank_edit_data_id;
  query.ExecSQL;
  ShowMessage('Обновление выполнено успешно!!!');
  close;
except
  ShowMessage('Обновление выполнено барыжно!!!');
  exit;
end;
end;

procedure Tinput_Tank_Data.Button2Click(Sender: TObject);
begin
 close;
end;

procedure Tinput_Tank_Data.Edit1Change(Sender: TObject);
begin
 try
  newVolume:=StrToInt(Trim(Edit1.Text));
  newWeight:=round(newvolume*plotn_cur);
  edit2.Text:=inttostr(newWeight);
 except
  exit;
 end;
end;

procedure Tinput_Tank_Data.Edit3Change(Sender: TObject);
var
  start_symbol:byte;
begin
try
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select plotn20 from v_plotn20 where temper_name =:a and plotn like :b');
  query.Parameters[0].Value:=FloatToStrF(temper_cur, ffFixed, 4,1);
  query.Parameters[1].Value:=FloatToStrF(plotn_cur, ffFixed, 4,3);
  query.Open;
  query.First;
  temper_new:=StrToFloat(Edit3.Text);
  plotn20:=query.Fields[0].asFloat;
  MaskEdit3.Text:=floattostrf(plotn20, fffixed, 4, 3);
//  query.Close;
//  query.SQL.Clear;
//  query.SQL.Add('select * from dbo.temper_correction');
//  query.Open;
//  query.First;
//  while not query.Eof do
//    begin
//      if query.Fields[0].AsFloat<plotn20 then
//        begin
//          if query.Fields[1].AsFloat>plotn20 then
//            begin
 //             temper_correct:=query.Fields[2].AsFloat;
//              query.Next;
//            end
//          else
//            query.Next
//        end
//      else
//        query.Next;
//    end;
//  plotnNew:=newPlotn(temper_new,plotn20,temper_correct);
//  plotn_str:=FloatToStrF(plotnNew, ffFixed, 5,4);
//  start_symbol:=length(plotn_str);
//  if length(plotn_str)<6 then
//    begin
//      for i := 6 downto start_symbol do
//        plotn_str[i]:='0';
//    end;
//  plotnNew:=StrToFloat(plotn_str);
  temper_cur:=temper_new;
//  plotn_cur:=plotnNew;
//  MaskEdit2.Text:=plotn_str;
except
  exit;
end;
end;

procedure Tinput_Tank_Data.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 frmInputTankData.InitFrm;
 Action:=caFree;
end;

procedure Tinput_Tank_Data.FormCreate(Sender: TObject);
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 InitFrm;
end;

end.

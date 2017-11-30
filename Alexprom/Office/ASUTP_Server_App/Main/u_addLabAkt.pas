unit u_addLabAkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ExtCtrls, ADODB;

type
  TfrmAddLabAkt = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    DateTimePicker1: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    Label3: TLabel;
    ListView1: TListView;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    MaskEdit1: TMaskEdit;
    Label5: TLabel;
    MaskEdit2: TMaskEdit;
    Label6: TLabel;
    MaskEdit3: TMaskEdit;
    Label7: TLabel;
    MaskEdit4: TMaskEdit;
    Label8: TLabel;
    MaskEdit5: TMaskEdit;
    Label9: TLabel;
    MaskEdit6: TMaskEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    Label16: TLabel;
    ComboBox1: TComboBox;
    Label17: TLabel;
    ComboBox2: TComboBox;
    Label18: TLabel;
    ComboBox3: TComboBox;
    Label19: TLabel;
    TMC_Box: TComboBox;
    Label20: TLabel;
    ATMC_Box: TComboBox;
    Label21: TLabel;
    ORG_Box: TComboBox;
    Label22: TLabel;
    AORG_Box: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure TMC_BoxChange(Sender: TObject);
    procedure ORG_BoxChange(Sender: TObject);
    procedure ATMC_BoxChange(Sender: TObject);
    procedure AORG_BoxChange(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure MaskEdit2Change(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure MaskEdit4Change(Sender: TObject);
    procedure MaskEdit5Change(Sender: TObject);
    procedure MaskEdit6Change(Sender: TObject);
    procedure MaskEdit7Change(Sender: TObject);
    procedure MaskEdit8Change(Sender: TObject);
    procedure MaskEdit9Change(Sender: TObject);
    procedure MaskEdit10Change(Sender: TObject);
    procedure MaskEdit11Change(Sender: TObject);
    procedure MaskEdit12Change(Sender: TObject);
  private
    { Private declarations }
    procedure changeAktType(at:byte);
    procedure fillEditFields(an:longint);
    procedure createNewAkt(an:longint; at:byte);
  public
    { Public declarations }
  end;

var
  frmAddLabAkt: TfrmAddLabAkt;
  query:TADOQuery;
  selectedAkt:longint;
  newAktNum:longint;
  tsp_main, tsp_op, lab_op:byte;
  TMC_ID, ATMC_ID, ORG_ID, AORG_ID:integer;
  level, water_level, water_kg, weight:longint;
  a_level, a_water_level, a_water_kg, a_weight:longint;
  a_temper,temper,plotn, a_plotn:real;
implementation

uses u_dm;

{$R *.dfm}

procedure TfrmAddLabAkt.AORG_BoxChange(Sender: TObject);
var
 qqq:TADOQuery;
begin
qqq:=TADOQuery.Create(nil);
qqq.Connection:=dm.alexpromCon;
qqq.Close;
qqq.SQL.Clear;
qqq.SQL.Add('select id from organizations where name=:n');
qqq.Parameters[0].Value:=AORG_Box.Text;
qqq.Open;
qqq.First;
if qqq.RecordCount<>0 then
 AORG_ID:=qqq.Fields[0].AsInteger
else
 AORG_ID:=-1;
qqq.Free;
end;

procedure TfrmAddLabAkt.ATMC_BoxChange(Sender: TObject);
var
 qqq:TADOQuery;
begin
qqq:=TADOQuery.Create(nil);
qqq.Connection:=dm.alexpromCon;
qqq.Close;
qqq.SQL.Clear;
qqq.SQL.Add('select mat_id from mat_dic where mat_name=:n');
qqq.Parameters[0].Value:=ATMC_Box.Text;
qqq.Open;
qqq.First;
if qqq.RecordCount<>0 then
 ATMC_ID:=qqq.Fields[0].AsInteger
else
 ATMC_ID:=-1;
qqq.Free;
end;

procedure TfrmAddLabAkt.Button1Click(Sender: TObject);
begin
 createNewAkt(newAktNum, RadioGroup1.ItemIndex);
end;

procedure TfrmAddLabAkt.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TfrmAddLabAkt.changeAktType(at: Byte);
var
 li:TListItem;
begin
case at of
0:begin
 GroupBox1.Enabled:=true;
 GroupBox2.Enabled:=true;
 ListView1.Clear;
 ListView1.Enabled:=False;
 MaskEdit1.Text:='';
 MaskEdit2.Text:='';
 MaskEdit3.Text:='';
 MaskEdit4.Text:='';
 MaskEdit5.Text:='';
 MaskEdit6.Text:='';
 MaskEdit7.Text:='';
 MaskEdit8.Text:='';
 MaskEdit9.Text:='';
 MaskEdit10.Text:='';
 MaskEdit11.Text:='';
 MaskEdit12.Text:='';
 ComboBox1.ItemIndex:=0;
 ComboBox2.ItemIndex:=0;
 ComboBox3.ItemIndex:=0;
 ORG_Box.ItemIndex:=0;
 AORG_Box.ItemIndex:=0;
 TMC_Box.ItemIndex:=0;
 ATMC_Box.ItemIndex:=0;
 DateTimePicker1.Date:=now;
 Button1.Enabled:=true;
end;
1:begin
  GroupBox1.Enabled:=False;
  GroupBox2.Enabled:=false;
  ListView1.Enabled:=True;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.aktview where aktDate=:ad');
  if length(DatetoStr(DateTimePicker1.Date))<>10 then
   query.Parameters[0].Value:='0'+DatetoStr(DateTimePicker1.Date)
  else
   query.Parameters[0].Value:=DatetoStr(DateTimePicker1.Date);
  query.Open;
  query.First;
  listView1.Clear;
  while not query.Eof do
   begin
    li:=ListView1.Items.Add;
    li.Caption:=query.FieldByName('AktNum').AsString;
    li.SubItems.Add(query.FieldByName('aktDate').AsString);
    li.SubItems.Add(query.FieldByName('fact_mat').AsString);
    li.SubItems.Add(query.FieldByName('truckCode').AsString);
    li.SubItems.Add(query.FieldByName('a_plotnost').AsString);
    li.SubItems.Add(query.FieldByName('a_weight').AsString);
    li.SubItems.Add(query.FieldByName('Temperature').AsString);
    query.Next;
   end;
end;
end;
end;

procedure TfrmAddLabAkt.ComboBox1Change(Sender: TObject);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select id from dbo.workers_tsp where fio=:a');
 query.Parameters[0].Value:=ComboBox1.Text;
 query.Open;
 query.First;
 tsp_main:=query.Fields[0].AsInteger;
end;

procedure TfrmAddLabAkt.ComboBox2Change(Sender: TObject);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select id from dbo.workers_tsp where fio=:a');
 query.Parameters[0].Value:=ComboBox2.Text;
 query.Open;
 query.First;
 tsp_op:=query.Fields[0].AsInteger;
end;

procedure TfrmAddLabAkt.ComboBox3Change(Sender: TObject);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select id from dbo.workers_lab where fio=:a');
 query.Parameters[0].Value:=ComboBox3.Text;
 query.Open;
 query.First;
 lab_op:=query.Fields[0].AsInteger;
end;

procedure TfrmAddLabAkt.fillEditFields(an: Integer);
begin
 Panel1.Caption:=IntToStr(an);
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.aktview where aktDate=:ad and aktNum=:an');
 if length(DatetoStr(DateTimePicker1.Date))<>10 then
  query.Parameters[0].Value:='0'+DatetoStr(DateTimePicker1.Date)
 else
  query.Parameters[0].Value:=DatetoStr(DateTimePicker1.Date);
 query.Parameters[1].Value:=an;
 query.Open;
 query.First;
 MaskEdit1.Text:=query.FieldByName('truckCode').AsString;
 if query.FieldByName('Temperature').AsString<>'Null' then
  MaskEdit2.Text:=FloatToStrF(StrToFloat(query.FieldByName('Temperature').AsString),ffFixed,4,1)
 else
  MaskEdit2.Text:='';
 if query.FieldByName('Plotnost').AsString<>'Null' then
  MaskEdit3.Text:=FloatToStrF(StrToFloat(query.FieldByName('Plotnost').AsString), ffFixed, 4, 3)
 else
  MaskEdit3.Text:='';
 MaskEdit4.Text:=query.FieldByName('waterLevel_mm').AsString;
 MaskEdit5.Text:=query.FieldByName('waterLevel_kg').AsString;
 MaskEdit6.Text:=query.FieldByName('weight').AsString;
 MaskEdit7.Text:=query.FieldByName('a_truckCode').AsString;
 if query.FieldByName('a_Temperature').AsString<>'Null' then
  MaskEdit8.Text:=FloatToStrF(StrToFloat(query.FieldByName('a_Temperature').AsString),ffFixed,4,1)
 else
  MaskEdit8.Text:='';
 if query.FieldByName('a_Plotnost').AsString<>'Null' then
  MaskEdit9.Text:=FloatToStrF(StrToFloat(query.FieldByName('a_Plotnost').AsString), ffFixed, 4, 3)
 else
  MaskEdit9.Text:='';
 MaskEdit10.Text:=query.FieldByName('a_waterLevel_mm').AsString;
 MaskEdit11.Text:=query.FieldByName('a_waterLevel_kg').AsString;
 MaskEdit12.Text:=query.FieldByName('a_weight').AsString;
 ComboBox1.Text:=query.FieldByName('tsp_main').AsString;
 ComboBox2.Text:=query.FieldByName('op_tsp').AsString;
 ComboBox3.Text:=query.FieldByName('op_lab').AsString;
 TMC_Box.Text:=query.FieldByName('mat_name').AsString;
 ORG_BOX.Text:=query.FieldByName('org_name').AsString;
 ATMC_Box.Text:=query.FieldByName('fact_mat').AsString;
 AORG_BOX.Text:=query.FieldByName('org_name').AsString;
 Button1.Enabled:=true;
end;

procedure TfrmAddLabAkt.createNewAkt(an: Integer; at: Byte);
var
 query_ins:TADOQuery;
begin
query_ins:=TADOQuery.Create(nil);
query_ins.Connection:=dm.alexpromCon;
try
 query_ins.Close;
 query_ins.SQL.Clear;
 query_ins.SQL.Add('select * from dbo.akt_Lab where aktNum=:an');
 query_ins.Parameters[0].Value:=an;
 query_ins.Open;
 query_ins.First;
 if query_ins.RecordCount<>0 then
  begin
   ShowMessage('Акт уже существует!!!');
   query_ins.Free;
   exit;
  end
 else
  begin
   query_ins.Close;
   query_ins.SQL.Clear;
   query_ins.SQL.Add('insert into dbo.akt_Lab (aktNum, mat_id, org_id, tsp_main, ');
   query_ins.SQL.Add('tsp_op, lab_op, temper, matLevel, plotn, waterMM, waterKG, weight, ');
   query_ins.SQL.Add('a_temper, a_matLevel, a_plotn,  a_waterMM, a_waterKG, a_weight, fk_tsp, aktDate) values (');
   query_ins.SQL.Add(':a,:b,:c,:d,:e,:f,:g,:h,:j,:k,:l,:m,:n,:o,:p,:q,:s,:t,:u, :v)');
   query_ins.Parameters[0].Value:=an;
   query_ins.Parameters[1].Value:=TMC_ID;
   query_ins.Parameters[2].Value:=ORG_ID;
   query_ins.Parameters[3].Value:=tsp_main;
   query_ins.Parameters[4].Value:=tsp_op;
   query_ins.Parameters[5].Value:=lab_op;
   query_ins.Parameters[6].Value:=temper;
   query_ins.Parameters[7].Value:=level;
   query_ins.Parameters[8].Value:=plotn;
   query_ins.Parameters[9].Value:=water_level;
   query_ins.Parameters[10].Value:=water_kg;
   query_ins.Parameters[11].Value:=weight;
   query_ins.Parameters[12].Value:=a_temper;
   query_ins.Parameters[13].Value:=a_level;
   query_ins.Parameters[14].Value:=a_plotn;
   query_ins.Parameters[15].Value:=a_water_level;
   query_ins.Parameters[16].Value:=a_water_kg;
   query_ins.Parameters[17].Value:=a_weight;
   query_ins.Parameters[18].Value:=selectedAkt;
   query_ins.Parameters[19].Value:=DatetoStr(DateTimePicker1.date);
   query_ins.ExecSQL;
   query_ins.Close;
   query_ins.SQL.Clear;
   query_ins.SQL.Add('insert into dbo.frc_sirie (aktNum) values (:an)');
   query_ins.Parameters[0].Value:=an;
   query_ins.ExecSQL;
   query_ins.Close;
   query_ins.SQL.Clear;
   query_ins.SQL.Add('insert into dbo.frc_sirie_task (aktNum) values (:an)');
   query_ins.Parameters[0].Value:=an;
   query_ins.ExecSQL;
   query_ins.Free;
   if MessageDlg('Акт создан успешно!!! Создать новый?', mtConfirmation, [mbOk,mbCancel], 0)=mrOk then
    changeAktType(RadioGroup1.ItemIndex)
   else
    close
  end;
except
 ShowMessage('Incorrect data!!!');
 query_ins.Free;
 exit;
end;
end;

procedure TfrmAddLabAkt.DateTimePicker1Change(Sender: TObject);
begin
 changeAktType(RadioGroup1.ItemIndex);
end;

procedure TfrmAddLabAkt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
end;

procedure TfrmAddLabAkt.FormCreate(Sender: TObject);
begin
 DateTimePicker1.Date:=now;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select max(aktNum) from dbo.akt_lab');
 query.Open;
 query.First;
 newAktNum:=query.Fields[0].AsInteger+1;
 Panel1.Caption:=IntToStr(newAktNum);
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.workers_tsp');
 query.Open;
 query.First;
 ComboBox1.Clear;
 ComboBox2.Clear;
 while not query.Eof do
  begin
   ComboBox1.Items.Add(query.FieldByName('fio').AsString);
   ComboBox2.Items.Add(query.FieldByName('fio').AsString);
   query.Next;
  end;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.workers_lab');
 query.Open;
 query.First;
 ComboBox3.Clear;
 while not query.Eof do
  begin
   ComboBox3.Items.Add(query.FieldByName('fio').AsString);
   query.Next;
  end;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.mat_dic');
 query.Open;
 query.First;
 TMC_Box.Clear;
 ATMC_Box.Clear;
 while not query.Eof do
  begin
   TMC_Box.Items.Add(query.FieldByName('mat_name').AsString);
   ATMC_Box.Items.Add(query.FieldByName('mat_name').AsString);
   query.Next;
  end;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.organizations');
 query.Open;
 query.First;
 ORG_Box.Clear;
 AORG_Box.Clear;
 while not query.Eof do
  begin
   ORG_Box.Items.Add(query.FieldByName('name').AsString);
   AORG_Box.Items.Add(query.FieldByName('name').AsString);
   query.Next;
  end;
 changeAktType(RadioGroup1.ItemIndex);
end;

procedure TfrmAddLabAkt.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if Selected then
 selectedAkt:=StrToInt(Item.Caption)
else
 selectedAkt:=-1;
// newAktNum:=selectedAkt;
 fillEditFields(selectedAkt);
end;

procedure TfrmAddLabAkt.MaskEdit10Change(Sender: TObject);
begin
try
if MaskEdit10.Text<>'' then
 a_water_level:=StrToInt(MaskEdit10.text)
else
 a_water_level:=0;
except

end;
end;

procedure TfrmAddLabAkt.MaskEdit11Change(Sender: TObject);
begin
try
if MaskEdit11.Text<>'' then
 a_water_kg:=StrToInt(MaskEdit11.text)
else
 a_water_kg:=0;
except

end;
end;

procedure TfrmAddLabAkt.MaskEdit12Change(Sender: TObject);
begin
try
if MaskEdit12.Text<>'' then
 a_weight:=StrToInt(MaskEdit12.text)
else
 a_weight:=0;
except

end;
end;

procedure TfrmAddLabAkt.MaskEdit1Change(Sender: TObject);
begin
try
if MaskEdit1.Text<>'' then
 level:=StrToInt(MaskEdit1.text)
else
 level:=0;
except

end;
end;

procedure TfrmAddLabAkt.MaskEdit2Change(Sender: TObject);
begin
try
if MaskEdit2.Text<>'' then
 temper:=StrToFloat(MaskEdit2.text)
else
 temper:=0;
except

end;
end;

procedure TfrmAddLabAkt.MaskEdit3Change(Sender: TObject);
begin
try
if MaskEdit3.Text<>'' then
 plotn:=StrToFloat(MaskEdit3.text)
else
 plotn:=0;
except

end;
end;

procedure TfrmAddLabAkt.MaskEdit4Change(Sender: TObject);
begin
try
if MaskEdit4.Text<>'' then
 water_level:=StrToInt(MaskEdit4.text)
else
 water_level:=0;
except

end;
end;

procedure TfrmAddLabAkt.MaskEdit5Change(Sender: TObject);
begin
try
if MaskEdit5.Text<>'' then
 water_kg:=StrToInt(MaskEdit5.text)
else
 water_kg:=0;
except

end;
end;

procedure TfrmAddLabAkt.MaskEdit6Change(Sender: TObject);
begin
try
if MaskEdit6.Text<>'' then
 weight:=StrToInt(MaskEdit6.text)
else
 weight:=0;
except

end;
end;

procedure TfrmAddLabAkt.MaskEdit7Change(Sender: TObject);
begin
try
if MaskEdit7.Text<>'' then
 a_level:=StrToInt(MaskEdit7.text)
else
 a_level:=0;
except

end;
end;

procedure TfrmAddLabAkt.MaskEdit8Change(Sender: TObject);
begin
try
if MaskEdit8.Text<>'' then
 a_temper:=StrToFloat(MaskEdit8.text)
else
 a_temper:=0;
except

end;
end;

procedure TfrmAddLabAkt.MaskEdit9Change(Sender: TObject);
begin
try
if MaskEdit9.Text<>'' then
 a_plotn:=StrToFloat(MaskEdit9.text)
else
 a_plotn:=0;
except

end;
end;

procedure TfrmAddLabAkt.ORG_BoxChange(Sender: TObject);
var
 qqq:TADOQuery;
begin
qqq:=TADOQuery.Create(nil);
qqq.Connection:=dm.alexpromCon;
qqq.Close;
qqq.SQL.Clear;
qqq.SQL.Add('select id from organizations where name=:n');
qqq.Parameters[0].Value:=ORG_Box.Text;
qqq.Open;
qqq.First;
if qqq.RecordCount<>0 then
 ORG_ID:=qqq.Fields[0].AsInteger
else
 ORG_ID:=-1;
qqq.Free;
end;

procedure TfrmAddLabAkt.RadioGroup1Click(Sender: TObject);
begin
 changeAktType(RadioGroup1.ItemIndex);
end;

procedure TfrmAddLabAkt.TMC_BoxChange(Sender: TObject);
var
 qqq:TADOQuery;
begin
qqq:=TADOQuery.Create(nil);
qqq.Connection:=dm.alexpromCon;
qqq.Close;
qqq.SQL.Clear;
qqq.SQL.Add('select mat_id from mat_dic where mat_name=:n');
qqq.Parameters[0].Value:=TMC_Box.Text;
qqq.Open;
qqq.First;
if qqq.RecordCount<>0 then
 TMC_ID:=qqq.Fields[0].AsInteger
else
 TMC_ID:=-1;
qqq.Free;
end;

end.

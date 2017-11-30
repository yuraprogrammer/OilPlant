unit U_lightsoutputreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, RpDefine, RpRave, DB, ADODB,
  RpCon, RpConDS, mainfunctions;

type
  Tlightoutputreport = class(TForm)
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    DateTimePicker1: TDateTimePicker;
    ListView1: TListView;
    BitBtn1: TBitBtn;
    RvProject1: TRvProject;
    ADOQuery1: TADOQuery;
    RvDataSetConnection2: TRvDataSetConnection;
    Label2: TLabel;
    ComboBox1: TComboBox;
    Label3: TLabel;
    ComboBox2: TComboBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure updateview(view_type:byte;y,m:word; d:string);
  public
    { Public declarations }
  end;

var
  lightoutputreport: Tlightoutputreport;
  query:tadoquery;
implementation

uses u_dm;

{$R *.dfm}

procedure Tlightoutputreport.updateview(view_type: Byte; y: Word; m: Word; d: string);
var
 li:tlistitem;
 dstr, mstr, ystr:string;
begin
case view_type of
0:begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.v_lightsout where aktdate=:ad');
  if length(d)=10 then
   query.Parameters[0].Value:=d
  else
   query.Parameters[0].Value:='0'+d;
  query.Open;
end;
1:begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.v_lightsout where aktdate between :sd and :ed');
  ystr:=inttostr(y);
  mstr:=inttostr(m);
  if length(mstr)=10 then

  else
   mstr:='0'+mstr;
  dstr:=inttostr(day_in_month(m-1, y));
  if length(dstr)=2 then

  else
   dstr:='0'+dstr;
  query.Parameters[0].Value:='01.';
  query.Parameters[1].Value:=dstr+'.'+mstr+'.'+ystr;
  query.Open;
end;
2:begin

end;
end;
listview1.Clear;
query.First;
while not query.Eof do
 begin
  li:=listview1.Items.Add;
  li.Caption:=query.FieldByName('aktdate').AsString;
  li.SubItems.Add(query.FieldByName('a_matlevel').AsString);
  li.SubItems.Add(query.FieldByName('light_perc_task').AsString);
  li.SubItems.Add(query.FieldByName('lightsout').AsString);
  li.SubItems.Add(query.FieldByName('fbgs_perc_task').AsString);
  li.SubItems.Add(query.FieldByName('fbgsout').AsString);
  li.SubItems.Add(query.FieldByName('adt_perc_task').AsString);
  li.SubItems.Add(query.FieldByName('adtout').AsString);
  li.SubItems.Add(query.FieldByName('otg_perc_task').AsString);
  li.SubItems.Add(query.FieldByName('otgout').AsString);
  li.SubItems.Add(query.FieldByName('paraf_perc_task').AsString);
  li.SubItems.Add(query.FieldByName('parafout').AsString);
  li.SubItems.Add(query.FieldByName('water_perc_task').AsString);
  li.SubItems.Add(query.FieldByName('waterout').AsString);
  li.SubItems.Add(query.FieldByName('lost_perc_task').AsString);
  li.SubItems.Add(query.FieldByName('lostout').AsString);
  query.Next;
 end;
end;

procedure Tlightoutputreport.BitBtn1Click(Sender: TObject);
begin
 rvdatasetconnection2.dataset:=query;
 rvproject1.ExecuteReport('lightsreport');
end;

procedure Tlightoutputreport.ComboBox1Change(Sender: TObject);
begin
 updateview(1, strtoint(combobox2.Text), abs(-combobox1.ItemIndex-1), datetostr(datetimepicker1.date));
 radiogroup1.ItemIndex:=1;
end;

procedure Tlightoutputreport.ComboBox2Change(Sender: TObject);
begin
 updateview(2, strtoint(combobox2.Text), abs(-combobox1.ItemIndex-1), datetostr(datetimepicker1.date));
 radiogroup1.ItemIndex:=2;
end;

procedure Tlightoutputreport.DateTimePicker1Change(Sender: TObject);
begin
 updateview(0, strtoint(combobox2.Text), abs(-combobox1.ItemIndex-1), datetostr(datetimepicker1.date));
end;

procedure Tlightoutputreport.FormCreate(Sender: TObject);
var
 y,m,d:word;
begin
 query:=tadoquery.Create(nil);
 query.Connection:=dm.alexpromcon;
 decodedate(now,y,m,d);
 combobox1.ItemIndex:=m-1;
 combobox2.ItemIndex:=combobox2.Items.Count-1;
end;

procedure Tlightoutputreport.RadioGroup1Click(Sender: TObject);
begin
 updateview(radiogroup1.ItemIndex, strtoint(combobox2.Text), abs(-combobox1.ItemIndex-1), datetostr(datetimepicker1.date));
end;

end.

unit U_labakts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, DB, ADODB, RpDefine, RpRave, RpCon,
  RpConDS, mainfunctions;

type
  TfrmLabAkts = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    monthBox: TComboBox;
    yearbox: TComboBox;
    calendar: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    ListView1: TListView;
    RvProject1: TRvProject;
    ADOQuery1: TADOQuery;
    RvDataSetConnection5: TRvDataSetConnection;
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView1DblClick(Sender: TObject);
    procedure calendarChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure monthBoxChange(Sender: TObject);
    procedure yearboxChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    procedure updateList(date:TDate;m,y:word;tip:byte);
  public
    { Public declarations }
  end;

var
  frmLabAkts: TfrmLabAkts;
  aktNum:longint;
  query:TADOQuery;
  year,month,day:word;
implementation

uses u_dm;

{$R *.dfm}

procedure TfrmLabAkts.updateList(date: TDate; m: Word; y: Word; tip: Byte);
var
 li:TListItem;
 i:byte;
 daystr, mstr, ystr:string;
begin
ListView1.Clear;
case tip of
0:begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.v_aktlab where aktDate=:ad');
  if length(DateToStr(date))<>10 then
   query.Parameters[0].Value:='0'+DateToStr(date)
  else
   query.Parameters[0].Value:=DateToStr(date);
  query.Open;
  query.First;
  while not query.Eof do
   begin
    li:=ListView1.Items.Add;
    li.Caption:=query.FieldByName('aktNum').AsString;
    Li.SubItems.Add(query.FieldByName('mat_name').asstring);
    li.SubItems.Add(query.FieldByName('a_matLevel').AsString);
    li.SubItems.Add(query.FieldByName('a_weight').AsString);
    li.SubItems.Add(query.FieldByName('a_Plotn').AsString);
    query.Next;
   end;
 end;
1:begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.v_aktlab where aktDate=:ad');
  for i := 1 to day_in_month(m,y) do
   begin
    daystr:=IntToStr(i);
    if length(daystr)=1 then
     daystr:='0'+daystr;
    mstr:=IntToStr(m);
    if length(mstr)=1 then
     mstr:='0'+mstr;
    ystr:=IntToStr(y);
    query.Close;
    query.Parameters[0].Value:=daystr+'.'+mstr+'.'+ystr;
    query.Open;
    query.First;
    while not query.Eof do
     begin
      li:=ListView1.Items.Add;
      li.Caption:=query.FieldByName('aktNum').AsString;
      Li.SubItems.Add(query.FieldByName('mat_name').asstring);
      li.SubItems.Add(query.FieldByName('a_matLevel').AsString);
      li.SubItems.Add(query.FieldByName('a_weight').AsString);
      li.SubItems.Add(query.FieldByName('a_Plotn').AsString);
      query.Next;
     end;
   end;
end;
2:begin

end;
end;

end;

procedure TfrmLabAkts.yearboxChange(Sender: TObject);
begin
 RadioGroup1.ItemIndex:=2;
 updateList(calendar.Date, monthBox.ItemIndex+1, StrToInt(yearBox.Text), RadioGroup1.ItemIndex);
end;

procedure TfrmLabAkts.calendarChange(Sender: TObject);
begin
 RadioGroup1.ItemIndex:=0;
 updateList(calendar.Date, monthBox.ItemIndex+1, StrToInt(yearBox.Text), RadioGroup1.ItemIndex);
end;

procedure TfrmLabAkts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure TfrmLabAkts.FormCreate(Sender: TObject);
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromcon;
 calendar.Date:=now;
 DecodeDate(now, year, month, day);
 monthBox.ItemIndex:=month-1;
 yearBox.Text:=IntToStr(year);
 updateList(calendar.Date, month-1, StrToInt(yearBox.Text), RadioGroup1.ItemIndex);
end;

procedure TfrmLabAkts.ListView1DblClick(Sender: TObject);
begin
try
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.v_Aktlab where aktnum=:an');
 query.Parameters[0].Value:=aktNum;
 query.Open;
 query.First;
 RvDataSetConnection5.DataSet:=query;
 RvProject1.ExecuteReport('aktLab');
except

end;
end;

procedure TfrmLabAkts.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
 if selected then
  aktNum:=StrToInt(Item.Caption)
 else
  aktNum:=-1;
end;

procedure TfrmLabAkts.monthBoxChange(Sender: TObject);
begin
 Radiogroup1.ItemIndex:=1;
 updateList(calendar.Date, monthBox.ItemIndex+1, StrToInt(yearBox.Text), RadioGroup1.ItemIndex);
end;

procedure TfrmLabAkts.RadioGroup1Click(Sender: TObject);
begin
 updateList(calendar.Date, monthBox.ItemIndex+1, StrToInt(yearBox.Text), RadioGroup1.ItemIndex);
end;

end.

unit U_midRepForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, ADODB, mainFunctions;

type
  TfrmMidRep = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    calendar: TDateTimePicker;
    mBox: TComboBox;
    yBox: TComboBox;
    RadioGroup1: TRadioGroup;
    ListView1: TListView;
    procedure FormCreate(Sender: TObject);
    procedure calendarChange(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView1DblClick(Sender: TObject);
    procedure mBoxChange(Sender: TObject);
    procedure yBoxChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    procedure initFrm(D:TDate; M,Y,t:word);
  public
    { Public declarations }
  end;

var
  frmMidRep: TfrmMidRep;
  query:TADOQuery;
  aktNum:longint;
implementation

uses u_dm;

{$R *.dfm}

procedure TfrmMidRep.initFrm(D: TDate; M: Word; Y: Word; t: Word);
var
 li:TListItem;
 i:byte;
begin
ListView1.Clear;
case t of
  0:begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select * from dbo.v_middleAkt where aktDate=:d and in_work=0');
    if length(DateToStr(d))=10 then
     query.Parameters[0].Value:=DateToStr(d)
    else
     query.Parameters[0].Value:='0'+DateToStr(d);
    query.Open;
    query.First;
    while not query.Eof do
     begin
      li:=ListView1.Items.Add;
      li.Caption:=query.FieldByName('akt_Num').AsString;
      li.SubItems.Add(query.FieldByName('aktDate').AsString);
      li.SubItems.Add(query.FieldByName('aktTime').AsString);
      li.SubItems.Add(query.FieldByName('stopername').AsString);
      li.SubItems.Add(query.FieldByName('fio').AsString);
      li.SubItems.Add(query.FieldByName('p').AsString);
      li.SubItems.Add(query.FieldByName('p20').AsString);
      li.SubItems.Add(query.FieldByName('t').AsString);
      query.Next;
     end;
  end;
  1:begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select * from dbo.v_middleAkt where aktDate between :a and :b and in_work=0');
    if length(intToStr(m))=2 then
     begin
      query.Parameters[0].Value:='01.'+IntToStr(m)+'.'+IntToStr(y);
      query.Parameters[1].Value:=IntToStr(day_in_month(M, Y))+'.'+IntToStr(m)+'.'+IntToStr(y);
     end
    else
     begin
      query.Parameters[0].Value:='01.0'+IntToStr(m)+'.'+IntToStr(y);
      query.Parameters[1].Value:=IntToStr(day_in_month(M, Y))+'.0'+IntToStr(m)+'.'+IntToStr(y);
     end;
    query.Open;
    query.First;
    while not query.Eof do
     begin
      li:=ListView1.Items.Add;
      li.Caption:=query.FieldByName('akt_Num').AsString;
      li.SubItems.Add(query.FieldByName('aktDate').AsString);
      li.SubItems.Add(query.FieldByName('aktTime').AsString);
      li.SubItems.Add(query.FieldByName('stopername').AsString);
      li.SubItems.Add(query.FieldByName('fio').AsString);
      li.SubItems.Add(query.FieldByName('p').AsString);
      li.SubItems.Add(query.FieldByName('p20').AsString);
      li.SubItems.Add(query.FieldByName('t').AsString);
      query.Next;
     end;
  end;
  2:begin
    for i := 1 to 12 do
     begin
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('select * from dbo.v_middleAkt where aktDate between :a and :b and in_work=0');
      if length(intToStr(i))=2 then
       begin
        query.Parameters[0].Value:='01.'+IntToStr(i)+'.'+IntToStr(y);
        query.Parameters[1].Value:=IntToStr(day_in_month(i-1, Y))+'.'+IntToStr(i)+'.'+IntToStr(y);
       end
      else
       begin
        query.Parameters[0].Value:='01.0'+IntToStr(i)+'.'+IntToStr(y);
        query.Parameters[1].Value:=IntToStr(day_in_month(i-1, Y))+'.0'+IntToStr(i)+'.'+IntToStr(y);
       end;
      query.Open;
      query.First;
      if query.RecordCount<>0 then
       while not query.Eof do
        begin
         li:=ListView1.Items.Add;
         li.Caption:=query.FieldByName('akt_Num').AsString;
         li.SubItems.Add(query.FieldByName('aktDate').AsString);
         li.SubItems.Add(query.FieldByName('aktTime').AsString);
         li.SubItems.Add(query.FieldByName('stopername').AsString);
         li.SubItems.Add(query.FieldByName('fio').AsString);
         li.SubItems.Add(query.FieldByName('p').AsString);
         li.SubItems.Add(query.FieldByName('p20').AsString);
         li.SubItems.Add(query.FieldByName('t').AsString);
         query.Next;
        end;
    end;
  end;
end;
end;

procedure TfrmMidRep.ListView1DblClick(Sender: TObject);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.v_middleAkt where akt_num=:d and in_work=0');
 query.Parameters[0].Value:=aktNum;
 query.Open;
 query.First;
end;

procedure TfrmMidRep.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if selected then
 begin
   aktNum:=StrToInt(item.Caption);
 end
else
 begin
  aktNum:=-1;
 end;
end;

procedure TfrmMidRep.mBoxChange(Sender: TObject);
begin
 RadioGroup1.ItemIndex:=1;
 initFrm(calendar.Date, MBox.ItemIndex+1, StrToInt(YBox.Text), RadioGroup1.ItemIndex);
end;

procedure TfrmMidRep.RadioGroup1Click(Sender: TObject);
begin
 initFrm(calendar.Date, MBox.ItemIndex+1, StrToInt(YBox.Text), RadioGroup1.ItemIndex);
end;

procedure TfrmMidRep.yBoxChange(Sender: TObject);
begin
 RadioGroup1.ItemIndex:=2;
 initFrm(calendar.Date, MBox.ItemIndex+1, StrToInt(YBox.Text), RadioGroup1.ItemIndex);
end;

procedure TfrmMidRep.calendarChange(Sender: TObject);
begin
 RadioGroup1.ItemIndex:=0;
 initFrm(calendar.Date, MBox.ItemIndex+1, StrToInt(YBox.Text), RadioGroup1.ItemIndex);
end;

procedure TfrmMidRep.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure TfrmMidRep.FormCreate(Sender: TObject);
var
 y,m,d:word;
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 calendar.Date:=now;
 DecodeDate(now, y, m, d);
 mBox.ItemIndex:=m-1;
 yBox.Text:=IntToStr(y);
 initFrm(calendar.Date, M, Y, RadioGroup1.ItemIndex);
end;

end.

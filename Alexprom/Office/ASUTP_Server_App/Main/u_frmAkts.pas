unit u_frmAkts;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ActnList, Menus, ADODB, DB, RpCon, RpConDS, RpDefine,
  RpRave, StdCtrls, RvDLADO, RpBase, RpSystem, ExtCtrls, Buttons;

type
  TfrmAkts = class(TForm)
    aktCalendar: TDateTimePicker;
    ListView1: TListView;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvDataSetConnection1: TRvDataSetConnection;
    monthBox: TComboBox;
    yearBox: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure aktCalendarChange(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InitFrm(Date:TDate);
  public
    { Public declarations }
  end;

var
  frmAkts: TfrmAkts;
  query:  TADOQuery;
  akt_key:longint;
  aktNum:longint;
implementation

uses u_dm;

{$R *.dfm}

procedure TfrmAkts.InitFrm(Date: TDate);
var
 li:TListItem;
 i:byte;
 date_str:string[10];
begin
case RadioGroup1.ItemIndex of
0:begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.AktView where aktDate=:ad');
 date_str:=DateToStr(Date);
 for I := 0 to length(date_str) - 1 do
   if date_str[i]='/' then
      date_str[i]:='.';
 if length(date_str)<>10 then
   query.Parameters[0].Value:='0'+date_str
 else
  query.Parameters[0].Value:=date_str;
 query.Open;
 query.First;
 ListView1.Clear;
 while not query.Eof do
  begin
    li:=ListView1.Items.Add;
    li.Caption:=query.FieldValues['aktNum'];
    li.SubItems.Add(query.FieldValues['org_name']);
    li.SubItems.Add(query.FieldValues['fact_mat']);
    li.SubItems.Add(query.FieldValues['netto_1']);
    li.SubItems.Add(query.FieldValues['a_Plotnost']);
    query.Next;
  end;
end;
1:begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.AktView where aktDate between :ad and :ed');
 if Length(IntToStr(monthBox.ItemIndex+1))=1 then
  begin
   query.Parameters[0].Value:='01.0'+IntToStr(monthBox.ItemIndex+1)+'.'+yearBox.Items.Strings[yearBox.ItemIndex];
   query.Parameters[1].Value:='31.0'+IntToStr(monthBox.ItemIndex+1)+'.'+yearBox.Items.Strings[yearBox.ItemIndex];
  end
 else
  begin
    query.Parameters[0].Value:='01.'+IntToStr(monthBox.ItemIndex+1)+'.'+yearBox.Items.Strings[yearBox.ItemIndex];
    query.Parameters[1].Value:='31.'+IntToStr(monthBox.ItemIndex+1)+'.'+yearBox.Items.Strings[yearBox.ItemIndex];
  end;
 query.Open;
 query.First;
 ListView1.Clear;
 while not query.Eof do
  begin
    li:=ListView1.Items.Add;
    li.Caption:=query.FieldValues['aktNum'];
    li.SubItems.Add(query.FieldValues['org_name']);
    li.SubItems.Add(query.FieldValues['fact_mat']);
    li.SubItems.Add(query.FieldValues['netto_1']);
    li.SubItems.Add(query.FieldValues['a_Plotnost']);
    query.Next;
  end;
end;
2:begin
end;
end;
end;

procedure TfrmAkts.aktCalendarChange(Sender: TObject);
begin
RadioGroup1.ItemIndex:=0;
InitFrm(aktCalendar.Date);
end;

procedure TfrmAkts.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure TfrmAkts.FormCreate(Sender: TObject);
begin
query:=TADOQuery.Create(nil);
query.Connection:=dm.alexpromCon;
aktCalendar.Date:=now;
InitFrm(aktCalendar.Date);
end;

procedure TfrmAkts.ListView1DblClick(Sender: TObject);
begin
  if aktNum<>-1 then
    begin
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('select * from dbo.aktView where aktNum=:an');
      query.Parameters[0].Value:=aktNum;
      query.Open;
      query.First;
      RvDataSetConnection1.DataSet:=query;
      RvProject1.ExecuteReport('Akt_TSP');
    end;
 InitFrm(aktcalendar.date);    
end;

procedure TfrmAkts.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
 if Selected then
  aktNum:=StrToInt(Item.Caption)
 else
  aktNum:=-1
end;

procedure TfrmAkts.RadioGroup1Click(Sender: TObject);
begin
  InitFrm(aktCalendar.Date);
end;

end.

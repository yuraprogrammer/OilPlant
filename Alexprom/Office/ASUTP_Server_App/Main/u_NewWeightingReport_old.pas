unit u_NewWeightingReport_old;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, RpDefine, RpRave, RpRender, RpRenderHTML,
  RpCon, RpConDS, DB, RpBase, RpSystem,U_dm, ExtCtrls, mainfunctions;

type
  TfrmNewWeightingReport = class(TForm)
    calendar: TDateTimePicker;
    Label1: TLabel;
    ListView1: TListView;
    Button1: TButton;
    RvProject1: TRvProject;
    RvDataSetConnection2: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    Label2: TLabel;
    monthBox: TComboBox;
    Label3: TLabel;
    YearBox: TComboBox;
    RadioGroup1: TRadioGroup;
    ADOQuery1: TADOQuery;
    procedure monthBoxChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure calendarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InitFrm(Date:TDAte);
  public
    { Public declarations }
  end;

var
  frmNewWeightingReport: TfrmNewWeightingReport;
  query,qqq:TADOQuery;
   y,m,d:word;
implementation

{$R *.dfm}

procedure TfrmNewWeightingReport.InitFrm(Date: TDate);
var
  li:TListItem;
  date_str:string[10];
  dstr, mstr, ystr:string;
  i:byte;
begin
 case RadioGroup1.ItemIndex of
 0:begin
   query:=TADOQuery.Create(nil);
   query.Connection:=dm.alexpromCon;
   query.close;
   query.SQL.Clear;
   query.SQL.Add('delete from dbo.weight_report_temp');
   query.ExecSQL;
   query.close;
   query.SQL.Clear;
   query.SQL.Add('select * from dbo.alltrucks where Out_Date=:indate and Out_Time between :a and :b');
   date_str:=DateToStr(Date);
   for i := 0 to length(date_str) - 1 do
     if date_str[i]='/' then
       date_str[i]:='.';
   if length(date_str)<>10 then
     query.Parameters[0].Value:='0'+date_str
   else
     query.Parameters[0].Value:=date_str;
    query.Parameters[1].Value:='08:00:00';
    query.Parameters[2].Value:='23:59:59';
    query.Open;
    qqq:=TADOQuery.Create(nil);
    qqq.Connection:=dm.alexpromCon;
    qqq.close;
    qqq.SQL.Clear;
    qqq.sql.Add('insert into dbo.weight_report_temp (weightingNumber,org_name,mat_name,in_Time,in_Date,');
    qqq.sql.Add('out_Date,out_Time,netto_1,brutto_1,tara,weighting_1,');
    qqq.sql.Add('weighting_2, netto_kalibr, volume_fact, remark, truckcode) values (');
    qqq.sql.Add(':truckNumber,:org_name,:mat_name,:in_Time,:in_Date,');
    qqq.sql.Add(':out_Date,:out_Time,:netto_1,:brutto_1,:tara,:weighting_1,');
    qqq.sql.Add(':weighting_2, :nk, :v_fact, :rem, :tc)');
    while not query.Eof do
     begin
      qqq.Parameters[0].Value:=query.FieldValues['weightingNumber'];
      qqq.Parameters[1].Value:=query.FieldValues['org_name'];
      qqq.Parameters[2].Value:=query.FieldValues['mat_name'];
      qqq.Parameters[3].Value:=query.FieldValues['in_Time'];
      qqq.Parameters[4].Value:=query.FieldValues['in_Date'];
      qqq.Parameters[5].Value:=query.FieldValues['out_Date'];
      qqq.Parameters[6].Value:=query.FieldValues['out_Time'];
      qqq.Parameters[7].Value:=query.FieldValues['netto_1'];
      qqq.Parameters[8].Value:=query.FieldValues['brutto_1'];
      qqq.Parameters[9].Value:=query.FieldValues['tara'];
      qqq.Parameters[10].Value:=query.FieldValues['weighting_1'];
      qqq.Parameters[11].Value:=query.FieldValues['weighting_2'];
      qqq.Parameters[12].Value:=query.FieldValues['netto_kalibr'];
      qqq.Parameters[13].Value:=query.FieldByName('volume_plotn').AsString;
      qqq.Parameters[14].Value:=query.FieldByName('remark').AsString;
      qqq.Parameters[15].Value:=query.FieldByName('truckCode').AsString;
      qqq.ExecSQL;
      query.Next;
     end;
    query.Close;
    date_str:=DateToStr(Date+1);
    for i := 0 to length(date_str) - 1 do
     if date_str[i]='/' then
      date_str[i]:='.';
     if length(date_str)<>10 then
      query.Parameters[0].Value:='0'+date_str
     else
      query.Parameters[0].Value:=date_str;
      query.Parameters[1].Value:='00:00:00';
      query.Parameters[2].Value:='07:59:59';
      query.open;
      while not query.Eof do
       begin
        qqq.Parameters[0].Value:=query.FieldValues['weightingNumber'];
        qqq.Parameters[1].Value:=query.FieldValues['org_name'];
        qqq.Parameters[2].Value:=query.FieldValues['mat_name'];
        qqq.Parameters[3].Value:=query.FieldValues['in_Time'];
        qqq.Parameters[4].Value:=query.FieldValues['in_Date'];
        qqq.Parameters[5].Value:=query.FieldValues['out_Date'];
        qqq.Parameters[6].Value:=query.FieldValues['out_Time'];
        qqq.Parameters[7].Value:=query.FieldValues['netto_1'];
        qqq.Parameters[8].Value:=query.FieldValues['brutto_1'];
        qqq.Parameters[9].Value:=query.FieldValues['tara'];
        qqq.Parameters[10].Value:=query.FieldValues['weighting_1'];
        qqq.Parameters[11].Value:=query.FieldValues['weighting_2'];
        qqq.Parameters[12].Value:=query.FieldValues['netto_kalibr'];
        qqq.Parameters[13].Value:=query.FieldByName('volume_plotn').AsInteger;
        qqq.Parameters[14].Value:=query.FieldByName('remark').AsString;
        qqq.Parameters[15].Value:=query.FieldByName('truckCode').AsInteger;
        qqq.ExecSQL;
        query.Next;
       end;
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('select * from dbo.weight_report_temp order by weightingNumber');
      query.Open;
      query.First;
      ListView1.Items.Clear;
      while not query.Eof do
       begin
        li:=ListView1.Items.Add;
        li.Caption:=query.FieldByName('org_name').AsString;
        li.SubItems.Add(query.FieldByName('in_date').AsString);
        li.SubItems.Add(query.FieldByName('in_time').AsString);
        li.SubItems.Add(query.FieldByName('out_date').AsString);
        li.SubItems.Add(query.FieldByName('out_Time').AsString);
        li.SubItems.Add(query.FieldByName('mat_name').AsString);
        li.SubItems.Add(query.FieldByName('weighting_1').AsString);
        li.SubItems.Add(query.FieldByName('weighting_2').AsString);
        li.SubItems.Add(query.FieldByName('netto_1').AsString);
        li.SubItems.Add(query.FieldByName('tara').AsString);
        li.SubItems.Add(query.FieldByName('brutto_1').AsString);
        li.SubItems.Add(query.FieldByName('netto_kalibr').AsString);
        li.SubItems.Add(query.FieldByName('truckCode').AsString);
        li.SubItems.Add(query.FieldByName('volume_fact').AsString);
        query.Next;
       end;
      if query.RecordCount<>0 then
        Button1.Enabled:=true
      else
        Button1.Enabled:=false;
        query.First;
 end;
 1:begin
   query:=TADOQuery.Create(nil);
   query.Connection:=dm.alexpromCon;
   query.close;
   query.SQL.Clear;
   query.SQL.Add('delete from dbo.weight_report_temp');
   query.ExecSQL;
   query.close;
   query.SQL.Clear;
   query.SQL.Add('select * from dbo.alltrucks where Out_Date = :i and Out_Time between :a and :b');
   if length(IntToStr(MonthBox.ItemIndex+1))=1 then
     date_str:='01.0'+IntToStr(MonthBox.ItemIndex+1)+'.'+yearBox.Items.Strings[yearBox.ItemIndex]
   else
     date_str:='01.'+IntToStr(MonthBox.ItemIndex+1)+'.'+yearBox.Items.Strings[yearBox.ItemIndex];
    query.Parameters[0].Value:=date_str;
    query.Parameters[1].Value:='08:00:00';
    query.Parameters[2].Value:='23:59:59';
    query.Open;
    qqq:=TADOQuery.Create(nil);
    qqq.Connection:=dm.alexpromCon;
    qqq.close;
    qqq.SQL.Clear;
    qqq.sql.Add('insert into dbo.weight_report_temp (weightingNumber,org_name,mat_name,in_Time,in_Date,');
    qqq.sql.Add('out_Date,out_Time,netto_1,brutto_1,tara,weighting_1,');
    qqq.sql.Add('weighting_2, netto_kalibr, volume_fact, remark, truckcode) values (');
    qqq.sql.Add(':truckNumber,:org_name,:mat_name,:in_Time,:in_Date,');
    qqq.sql.Add(':out_Date,:out_Time,:netto_1,:brutto_1,:tara,:weighting_1,');
    qqq.sql.Add(':weighting_2, :nk, :v_fact, :rem, :tc)');
    while not query.Eof do
     begin
      qqq.Parameters[0].Value:=query.FieldValues['weightingNumber'];
      qqq.Parameters[1].Value:=query.FieldValues['org_name'];
      qqq.Parameters[2].Value:=query.FieldValues['mat_name'];
      qqq.Parameters[3].Value:=query.FieldValues['in_Time'];
      qqq.Parameters[4].Value:=query.FieldValues['in_Date'];
      qqq.Parameters[5].Value:=query.FieldValues['out_Date'];
      qqq.Parameters[6].Value:=query.FieldValues['out_Time'];
      qqq.Parameters[7].Value:=query.FieldValues['netto_1'];
      qqq.Parameters[8].Value:=query.FieldValues['brutto_1'];
      qqq.Parameters[9].Value:=query.FieldValues['tara'];
      qqq.Parameters[10].Value:=query.FieldValues['weighting_1'];
      qqq.Parameters[11].Value:=query.FieldValues['weighting_2'];
      qqq.Parameters[12].Value:=query.FieldValues['netto_kalibr'];
      qqq.Parameters[13].Value:=query.FieldByName('volume_plotn').AsInteger;
      qqq.Parameters[14].Value:=query.FieldByName('remark').AsString;
      qqq.Parameters[15].Value:=query.FieldByName('truckCode').AsInteger;
      qqq.ExecSQL;
      query.Next;
     end;

    for I := 2 to day_in_month(MonthBox.ItemIndex, strtoint(yearBox.Items.Strings[yearBox.ItemIndex])) do
     begin
      if length(IntToStr(i))=1 then
        dstr:='0'+IntToStr(i)
      else
        dstr:=IntToStr(i);
      if length(IntToStr(MonthBox.ItemIndex+1))=1 then
        mstr:='0'+IntToStr(MonthBox.ItemIndex+1)
      else
        mstr:=IntToStr(MonthBox.ItemIndex+1);
      ystr:=yearBox.Items.Strings[yearBox.ItemIndex];
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('select * from dbo.alltrucks where Out_Date=:a');
      query.Parameters[0].Value:=dstr+'.'+mstr+'.'+ystr;
      query.open;
      query.First;
      while not query.Eof do
       begin
        qqq.Parameters[0].Value:=query.FieldValues['weightingNumber'];
        qqq.Parameters[1].Value:=query.FieldValues['org_name'];
        qqq.Parameters[2].Value:=query.FieldValues['mat_name'];
        qqq.Parameters[3].Value:=query.FieldValues['in_Time'];
        qqq.Parameters[4].Value:=query.FieldValues['in_Date'];
        qqq.Parameters[5].Value:=query.FieldValues['out_Date'];
        qqq.Parameters[6].Value:=query.FieldValues['out_Time'];
        qqq.Parameters[7].Value:=query.FieldValues['netto_1'];
        qqq.Parameters[8].Value:=query.FieldValues['brutto_1'];
        qqq.Parameters[9].Value:=query.FieldValues['tara'];
        qqq.Parameters[10].Value:=query.FieldValues['weighting_1'];
        qqq.Parameters[11].Value:=query.FieldValues['weighting_2'];
        qqq.Parameters[12].Value:=query.FieldValues['netto_kalibr'];
        qqq.Parameters[13].Value:=query.FieldByName('volume_plotn').AsInteger;
        qqq.Parameters[14].Value:=query.FieldByName('remark').AsString;
        qqq.Parameters[15].Value:=query.FieldByName('truckCode').AsInteger;
        qqq.ExecSQL;
        query.Next;
       end;
     end;
     query.close;
     query.SQL.Clear;
     query.SQL.Add('select * from dbo.alltrucks where Out_Date = :i and Out_Time between :a and :b');
     if length(IntToStr(MonthBox.ItemIndex+2))=1 then
      date_str:='01.0'+IntToStr(MonthBox.ItemIndex+2)+'.'+yearBox.Items.Strings[yearBox.ItemIndex]
     else
      date_str:='01.'+IntToStr(MonthBox.ItemIndex+2)+'.'+yearBox.Items.Strings[yearBox.ItemIndex];
     query.Parameters[1].Value:='00:00:00';
     query.Parameters[2].Value:='07:59:59';
     query.Open;
     while not query.Eof do
      begin
       qqq.Parameters[0].Value:=query.FieldValues['weightingNumber'];
       qqq.Parameters[1].Value:=query.FieldValues['org_name'];
       qqq.Parameters[2].Value:=query.FieldValues['mat_name'];
       qqq.Parameters[3].Value:=query.FieldValues['in_Time'];
       qqq.Parameters[4].Value:=query.FieldValues['in_Date'];
       qqq.Parameters[5].Value:=query.FieldValues['out_Date'];
       qqq.Parameters[6].Value:=query.FieldValues['out_Time'];
       qqq.Parameters[7].Value:=query.FieldValues['netto_1'];
       qqq.Parameters[8].Value:=query.FieldValues['brutto_1'];
       qqq.Parameters[9].Value:=query.FieldValues['tara'];
       qqq.Parameters[10].Value:=query.FieldValues['weighting_1'];
       qqq.Parameters[11].Value:=query.FieldValues['weighting_2'];
       qqq.Parameters[12].Value:=query.FieldValues['netto_kalibr'];
       qqq.Parameters[13].Value:=query.FieldByName('volume_plotn').AsInteger;
       qqq.Parameters[14].Value:=query.FieldByName('remark').AsString;
       qqq.Parameters[15].Value:=query.FieldByName('truckCode').AsInteger;
       qqq.ExecSQL;
       query.Next;
      end;
     query.Close;
     query.SQL.Clear;
     query.SQL.Add('select * from dbo.weight_report_temp order by weightingNumber');
     query.Open;
     query.First;
     ListView1.Items.Clear;
     while not query.Eof do
      begin
       li:=ListView1.Items.Add;
       //li.Caption:=query.FieldByName('truckNumber').AsString;
       li.Caption:=query.FieldByName('org_name').AsString;
       li.SubItems.Add(query.FieldByName('in_date').AsString);
       li.SubItems.Add(query.FieldByName('in_time').AsString);
       li.SubItems.Add(query.FieldByName('out_date').AsString);
       li.SubItems.Add(query.FieldByName('out_Time').AsString);
       li.SubItems.Add(query.FieldByName('mat_name').AsString);
       li.SubItems.Add(query.FieldByName('weighting_1').AsString);
       li.SubItems.Add(query.FieldByName('weighting_2').AsString);
       li.SubItems.Add(query.FieldByName('netto_1').AsString);
       li.SubItems.Add(query.FieldByName('tara').AsString);
       li.SubItems.Add(query.FieldByName('brutto_1').AsString);
       li.SubItems.Add(query.FieldByName('netto_kalibr').AsString);
       li.SubItems.Add(query.FieldByName('truckCode').AsString);
       li.SubItems.Add(query.FieldByName('volume_fact').AsString);
       query.Next;
      end;
     if query.RecordCount<>0 then
       Button1.Enabled:=true
     else
       Button1.Enabled:=false;
       query.First;
 end;
 2:begin
 end;
 end;
end;

procedure TfrmNewWeightingReport.monthBoxChange(Sender: TObject);
begin
  RadioGroup1.ItemIndex:=1;
  query.Free;
  qqq.Free;
  InitFrm(calendar.Date);
end;

procedure TfrmNewWeightingReport.RadioGroup1Click(Sender: TObject);
begin
  query.Free;
  qqq.Free;
  InitFrm(calendar.Date);
end;

procedure TfrmNewWeightingReport.Button1Click(Sender: TObject);
begin
try
  RvDataSetConnection2.DataSet:=query;
  RvProject1.ExecuteReport('Report_TSP');
except
  ShowMessage('Ошибка формирования отчета.');
end;
  close;
end;

procedure TfrmNewWeightingReport.calendarChange(Sender: TObject);
begin
  query.Free;
  qqq.free;
  RadioGroup1.ItemIndex:=0;
  InitFrm(calendar.Date);
end;

procedure TfrmNewWeightingReport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  query.Free;
  qqq.Free
end;

procedure TfrmNewWeightingReport.FormCreate(Sender: TObject);

begin
 calendar.Date:=now;
 decodedate(calendar.Date, y, m, d);
 monthbox.ItemIndex:=m-1;
 InitFrm(calendar.Date);
end;

end.

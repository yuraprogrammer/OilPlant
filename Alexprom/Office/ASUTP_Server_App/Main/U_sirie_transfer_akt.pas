unit U_sirie_transfer_akt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ADODB, ExtCtrls, Db,
  Buttons, RpCon, RpConDS, RpBase, RpSystem, RpDefine, RpRave, mainfunctions;

type
  Tsirie_transfer_akt = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    ReportDate: TDateTimePicker;
    RadioGroup1: TRadioGroup;
    Label2: TLabel;
    MonthBox: TComboBox;
    Label3: TLabel;
    YearBox: TComboBox;
    ListView1: TListView;
    BitBtn1: TBitBtn;
    RvProject1: TRvProject;
    RvDataSetConnection5: TRvDataSetConnection;
    RvDataSetConnection6: TRvDataSetConnection;
    RvDataSetConnection7: TRvDataSetConnection;
    ADOQuery1: TADOQuery;
    Label4: TLabel;
    ComboBox1: TComboBox;
    RvDataSetConnection11: TRvDataSetConnection;
    RvDataSetConnection12: TRvDataSetConnection;
    procedure ReportDateChange(Sender: TObject);
    procedure MonthBoxChange(Sender: TObject);
    procedure YearBoxChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ComboBox1Change(Sender: TObject);
  private
    { Private declarations }
    procedure Update_Data(sd:TDate;m,y:word;tip:byte);
    procedure showTransferDayReport(sd:TDate);
    procedure showDayReport(sd:TDate);
    procedure showMonthReport(m,y:word);
    procedure showYearReport(y:word);
    procedure showTankTransferReport(p,t:byte);
  public
    { Public declarations }
  end;

var
  sirie_transfer_akt: Tsirie_transfer_akt;
  query:TADOQuery;
implementation

uses u_dm;

{$R *.dfm}

procedure Tsirie_transfer_akt.showTankTransferReport(p: Byte; t: Byte);
begin
end;

procedure Tsirie_transfer_akt.Update_Data(sd:TDate;m,y:word;tip:byte);
begin
case tip of
  0:begin
    showTransferDayReport(sd);
  end;
  1:begin
    showDayReport(sd);
    end;
  2:begin
    showMonthReport(m,y);
    end;
  3:begin
    showYearReport(y);
    end;
end;
end;

procedure Tsirie_transfer_akt.YearBoxChange(Sender: TObject);
begin
if RadioGroup1.ItemIndex<>3 then RadioGroup1.ItemIndex:=3;  Update_Data(ReportDate.Date,MonthBox.ItemIndex+1,StrToInt(YearBox.Items.Strings[YearBox.ItemIndex]),RadioGroup1.ItemIndex);
end;

procedure Tsirie_transfer_akt.showTransferDayReport(sd: TDate);
var
  li:TListItem;
  lc:TListColumn;
  query_ins:TADOQuery;
  y,m,d:word;
begin
 query_ins:=TADOQuery.Create(nil);
 query_ins.Connection:=dm.alexpromCon;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('delete from dbo.tank_transfer_report');
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.Transfer_data_by_tank ');
 query.SQL.Add('where transfer_date=:td and transfer_time between :ts and :te');
 if length(DateToStr(sd))<>10 then
  query.Parameters[0].Value:='0'+DateToStr(sd)
 else
  query.Parameters[0].Value:=DateToStr(sd);
 query.Parameters[1].Value:='08:30:00';
 query.Parameters[2].Value:='23:59:59';
 query.Open;
 query.First;
 query_ins.Close;
 query_ins.SQL.clear;
 query_ins.SQL.Add('insert into dbo.tank_transfer_report (transfer_date, source_tank, dest_tank,');
 query_ins.SQL.Add('out_volume, in_volume, comment, in_kg, out_kg,');
 query_ins.SQL.Add('sl_before, sl_after, dl_before, dl_after, sv_before, sv_after,');
 query_ins.SQL.Add('dv_before, dv_after, sm_before, sm_after, dm_before, dm_after) values (');
 query_ins.SQL.Add(':a, :b, :c, :d, :e, :f, :g, :h,:slb,:sla,:dlb,:dla,:svb,:sva,:dvb,:dva,:smb,:sma,:dmb,:dma)');
 while not query.Eof do
  begin
   query_ins.Parameters[0].Value:=query.FieldValues['transfer_date'];
   query_ins.Parameters[1].Value:=query.FieldValues['source_tank'];
   query_ins.Parameters[2].Value:=query.FieldValues['dest_tank'];
   query_ins.Parameters[3].Value:=query.FieldValues['out_volume'];
   query_ins.Parameters[4].Value:=query.FieldValues['in_volume'];
   query_ins.Parameters[5].Value:=query.FieldValues['comment'];
   query_ins.Parameters[6].Value:=query.FieldValues['in_kg'];
   query_ins.Parameters[7].Value:=query.FieldValues['out_kg'];
   query_ins.Parameters[8].Value:=query.FieldValues['sl_before'];
   query_ins.Parameters[9].Value:=query.FieldValues['sl_after'];
   query_ins.Parameters[10].Value:=query.FieldValues['dl_before'];
   query_ins.Parameters[11].Value:=query.FieldValues['dl_after'];
   query_ins.Parameters[12].Value:=query.FieldValues['sv_before'];
   query_ins.Parameters[13].Value:=query.FieldValues['sv_after'];
   query_ins.Parameters[14].Value:=query.FieldValues['dv_before'];
   query_ins.Parameters[15].Value:=query.FieldValues['dv_after'];
   query_ins.Parameters[16].Value:=query.FieldValues['sm_before'];
   query_ins.Parameters[17].Value:=query.FieldValues['sm_after'];
   query_ins.Parameters[18].Value:=query.FieldValues['dm_before'];
   query_ins.Parameters[19].Value:=query.FieldValues['dm_after'];
   query_ins.ExecSQL;
   query.Next;
  end;
 query.Close;
 DecodeDate(Now, y,m,d);
 if d<day_in_month(m,y) then
  begin
   if length(DateToStr(sd))<>10 then
    query.Parameters[0].Value:='0'+DateToStr(sd+1)
   else
    query.Parameters[0].Value:=DateToStr(sd+1);
  end;
 if d=day_in_month(m,y) then
  begin
   if length(IntToStr(m))=2 then
    query.Parameters[0].Value:='01.'+IntToStr(m)+'.'+IntToStr(y)
   else
    query.Parameters[0].Value:='01.0'+IntToStr(m)+'.'+IntToStr(y);
  end;
 query.Parameters[1].Value:='00:00:00';
 query.Parameters[2].Value:='08:29:59';
 query.Open;
 query.First;
 while not query.Eof do
  begin
   if length(DateToStr(sd))<>10 then
    query_ins.Parameters[0].Value:='0'+DateToStr(sd)
   else
    query_ins.Parameters[0].Value:=DateToStr(sd);
   query_ins.Parameters[1].Value:=query.FieldValues['source_tank'];
   query_ins.Parameters[2].Value:=query.FieldValues['dest_tank'];
   query_ins.Parameters[3].Value:=query.FieldValues['out_volume'];
   query_ins.Parameters[4].Value:=query.FieldValues['in_volume'];
   query_ins.Parameters[5].Value:=query.FieldValues['comment'];
   query_ins.Parameters[6].Value:=query.FieldValues['in_kg'];
   query_ins.Parameters[7].Value:=query.FieldValues['out_kg'];
   query_ins.Parameters[8].Value:=query.FieldValues['sl_before'];
   query_ins.Parameters[9].Value:=query.FieldValues['sl_after'];
   query_ins.Parameters[10].Value:=query.FieldValues['dl_before'];
   query_ins.Parameters[11].Value:=query.FieldValues['dl_after'];
   query_ins.Parameters[12].Value:=query.FieldValues['sv_before'];
   query_ins.Parameters[13].Value:=query.FieldValues['sv_after'];
   query_ins.Parameters[14].Value:=query.FieldValues['dv_before'];
   query_ins.Parameters[15].Value:=query.FieldValues['dv_after'];
   query_ins.Parameters[16].Value:=query.FieldValues['sm_before'];
   query_ins.Parameters[17].Value:=query.FieldValues['sm_after'];
   query_ins.Parameters[18].Value:=query.FieldValues['dm_before'];
   query_ins.Parameters[19].Value:=query.FieldValues['dm_after'];
   query_ins.ExecSQL;
   query.Next;
  end;
 if ComboBox1.ItemIndex=0 then
  begin
   ListView1.Columns.Clear;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Дата перемещения';
   lc.Width:=150;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Источник';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Отправлено, л';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Отправлено, кг';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Приемник';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Принято, л';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Принято, кг';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Комментарий';
   lc.Width:=100;
   ListView1.viewStyle:=vsReport;
   ListView1.CLear;
   query.Close;
   query.SQL.Clear;
   query.SQL.Add('select * from tank_transfer_report');
   query.Open;
   query.First;
   while not query.Eof do
    begin
     li:=ListView1.Items.Add;
     li.Caption:=query.FieldValues['transfer_date'];
     li.SubItems.Add(query.FieldByName('source_tank').AsString);
     li.SubItems.Add(query.FieldByName('out_volume').AsString);
     li.SubItems.Add(query.FieldByName('out_kg').AsString);
     li.SubItems.Add(query.FieldByName('dest_tank').AsString);
     li.SubItems.Add(query.FieldByName('in_volume').AsString);
     li.SubItems.Add(query.FieldByName('in_kg').AsString);
     li.SubItems.Add(query.FieldByName('comment').AsString);
     query.Next;
    end;
  query_ins.Free;
 end
else
 begin
  query_ins:=TADOQuery.Create(nil);
  query_ins.Connection:=dm.alexpromCon;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('delete from dbo.transfer_temp_report_day');
  query.ExecSQL;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.tank_transfer_report where source_tank=:tid and transfer_date=:rd');
  query.Parameters[0].Value:=ComboBox1.Text;
  if length(DateToStr(ReportDate.Date))<>10 then
   query.Parameters[1].Value:='0'+DateToStr(ReportDate.Date)
  else
   query.Parameters[1].Value:=DateToStr(ReportDate.Date);
  query.Open;
  query.First;
  query_ins.SQL.Clear;
  query_ins.SQL.Add('insert into dbo.transfer_temp_report_day (transfer_akt_date, tank_id,');
  query_ins.SQL.Add('output_mat, output_kg) values (:a, :b, :c, :d)');
  while not query.Eof do
   begin
    query_ins.Parameters[0].Value:=query.Parameters[1].Value;
    query_ins.Parameters[1].Value:=ComboBox1.Text;
    query_ins.Parameters[2].Value:=query.FieldByName('out_volume').AsString;
    query_ins.Parameters[3].Value:=query.FieldByName('out_kg').AsString;
    query_ins.ExecSQL;
    query.Next;
   end;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.tank_transfer_report where dest_tank=:tid and transfer_date=:rd');
  query.Parameters[0].Value:=ComboBox1.Text;
  if length(DateToStr(ReportDate.Date))<>10 then
   query.Parameters[1].Value:='0'+DateToStr(ReportDate.Date)
  else
   query.Parameters[1].Value:=DateToStr(ReportDate.Date);
  query.Open;
  query.First;
  query_ins.SQL.Clear;
  query_ins.SQL.Add('insert into dbo.transfer_temp_report_day (transfer_akt_date, tank_id,');
  query_ins.SQL.Add('input_mat, input_kg) values (:a, :b, :c, :d)');
  while not query.Eof do
   begin
    query_ins.Parameters[0].Value:=query.Parameters[1].Value;
    query_ins.Parameters[1].Value:=ComboBox1.Text;
    query_ins.Parameters[2].Value:=query.FieldByName('in_volume').AsString;
    query_ins.Parameters[3].Value:=query.FieldByName('in_kg').AsString;
    query_ins.ExecSQL;
    query.Next;
   end;
  ListView1.Columns.Clear;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Дата перемещения';
  lc.Width:=150;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Резервуар';
  lc.Width:=100;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Отправлено, л';
  lc.Width:=100;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Отправлено, кг';
  lc.Width:=100;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Принято, л';
  lc.Width:=100;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Принято, кг';
  lc.Width:=100;
  ListView1.viewStyle:=vsReport;
  ListView1.CLear;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.transfer_temp_report_day');
  query.Open;
  while not query.Eof do
   begin
    li:=ListView1.Items.Add;
    li.Caption:=query.FieldValues['transfer_akt_date'];
    li.SubItems.Add(query.FieldByName('tank_id').AsString);
    li.SubItems.Add(query.FieldByName('output_mat').AsString);
    li.SubItems.Add(query.FieldByName('output_kg').AsString);
    li.SubItems.Add(query.FieldByName('input_mat').AsString);
    li.SubItems.Add(query.FieldByName('input_kg').AsString);
    query.Next;
   end;
  query_ins.Free;
 end;
end;

procedure Tsirie_transfer_akt.showDayReport(sd: TDate);
var
  li:TListItem;
  lc:TListColumn;
  query_ins:TADOQuery;
  y,m,d:word;
  date_str:string[10];
begin
 ListView1.Columns.Clear;
 lc:=ListView1.Columns.Add;
 lc.Caption:='Резервуар';
 lc.Width:=100;
 lc:=ListView1.Columns.Add;
 lc.Caption:='Приход, л';
 lc.Width:=100;
 lc:=ListView1.Columns.Add;
 lc.Caption:='Приход, кг';
 lc.Width:=100;
 lc:=ListView1.Columns.Add;
 lc.Caption:='Расход, л';
 lc.Width:=100;
 lc:=ListView1.Columns.Add;
 lc.Caption:='Расход, кг';
 lc.Width:=100;
 ListView1.viewStyle:=vsReport;
 ListView1.CLear;
 query_ins:=TADOQuery.Create(nil);
 query_ins.Connection:=dm.alexpromCon;
 query.Close;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('delete from dbo.tank_transfer_report');
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.Transfer_data_by_tank ');
 query.SQL.Add('where transfer_date=:td and transfer_time between :ts and :te');
 if length(DateToStr(sd))<>10 then
  query.Parameters[0].Value:='0'+DateToStr(sd)
 else
  query.Parameters[0].Value:=DateToStr(sd);
 query.Parameters[1].Value:='08:30:00';
 query.Parameters[2].Value:='23:59:59';
 query.Open;
 query.First;
 query_ins.Close;
 query_ins.SQL.clear;
 query_ins.SQL.Add('insert into dbo.tank_transfer_report (transfer_date, source_tank, dest_tank,');
 query_ins.SQL.Add('out_volume, in_volume, comment, in_kg, out_kg,');
 query_ins.SQL.Add('sl_before, sl_after, dl_before, dl_after, sv_before, sv_after,');
 query_ins.SQL.Add('dv_before, dv_after, sm_before, sm_after, dm_before, dm_after) values (');
 query_ins.SQL.Add(':a, :b, :c, :d, :e, :f, :g, :h,:slb,:sla,:dlb,:dla,:svb,:sva,:dvb,:dva,:smb,:sma,:dmb,:dma)');
 while not query.Eof do
  begin
   query_ins.Parameters[0].Value:=query.FieldValues['transfer_date'];
   query_ins.Parameters[1].Value:=query.FieldValues['source_tank'];
   query_ins.Parameters[2].Value:=query.FieldValues['dest_tank'];
   query_ins.Parameters[3].Value:=query.FieldValues['out_volume'];
   query_ins.Parameters[4].Value:=query.FieldValues['in_volume'];
   query_ins.Parameters[5].Value:=query.FieldValues['comment'];
   query_ins.Parameters[6].Value:=query.FieldValues['in_kg'];
   query_ins.Parameters[7].Value:=query.FieldValues['out_kg'];
   query_ins.Parameters[8].Value:=query.FieldValues['sl_before'];
   query_ins.Parameters[9].Value:=query.FieldValues['sl_after'];
   query_ins.Parameters[10].Value:=query.FieldValues['dl_before'];
   query_ins.Parameters[11].Value:=query.FieldValues['dl_after'];
   query_ins.Parameters[12].Value:=query.FieldValues['sv_before'];
   query_ins.Parameters[13].Value:=query.FieldValues['sv_after'];
   query_ins.Parameters[14].Value:=query.FieldValues['dv_before'];
   query_ins.Parameters[15].Value:=query.FieldValues['dv_after'];
   query_ins.Parameters[16].Value:=query.FieldValues['sm_before'];
   query_ins.Parameters[17].Value:=query.FieldValues['sm_after'];
   query_ins.Parameters[18].Value:=query.FieldValues['dm_before'];
   query_ins.Parameters[19].Value:=query.FieldValues['dm_after'];
   query_ins.ExecSQL;
   query.Next;
  end;
 query.Close;
 DecodeDate(Now, y,m,d);
 if d<day_in_month(m,y) then
  begin
   if length(DateToStr(sd))<>10 then
    query.Parameters[0].Value:='0'+DateToStr(sd+1)
   else
    query.Parameters[0].Value:=DateToStr(sd+1);
  end;
 if d=day_in_month(m,y) then
  begin
   if length(IntToStr(m))=2 then
    query.Parameters[0].Value:='01.'+IntToStr(m)+'.'+IntToStr(y)
   else
    query.Parameters[0].Value:='01.0'+IntToStr(m)+'.'+IntToStr(y);
  end;
 query.Parameters[1].Value:='00:00:00';
 query.Parameters[2].Value:='08:29:59';
 query.Open;
 query.First;
 while not query.Eof do
  begin
   if length(DateToStr(sd))<>10 then
    query_ins.Parameters[0].Value:='0'+DateToStr(sd)
   else
    query_ins.Parameters[0].Value:=DateToStr(sd);
    query_ins.Parameters[1].Value:=query.FieldValues['source_tank'];
    query_ins.Parameters[2].Value:=query.FieldValues['dest_tank'];
    query_ins.Parameters[3].Value:=query.FieldValues['out_volume'];
    query_ins.Parameters[4].Value:=query.FieldValues['in_volume'];
    query_ins.Parameters[5].Value:=query.FieldValues['comment'];
    query_ins.Parameters[6].Value:=query.FieldValues['in_kg'];
    query_ins.Parameters[7].Value:=query.FieldValues['out_kg'];
    query_ins.Parameters[8].Value:=query.FieldValues['sl_before'];
    query_ins.Parameters[9].Value:=query.FieldValues['sl_after'];
    query_ins.Parameters[10].Value:=query.FieldValues['dl_before'];
    query_ins.Parameters[11].Value:=query.FieldValues['dl_after'];
    query_ins.Parameters[12].Value:=query.FieldValues['sv_before'];
    query_ins.Parameters[13].Value:=query.FieldValues['sv_after'];
    query_ins.Parameters[14].Value:=query.FieldValues['dv_before'];
    query_ins.Parameters[15].Value:=query.FieldValues['dv_after'];
    query_ins.Parameters[16].Value:=query.FieldValues['sm_before'];
    query_ins.Parameters[17].Value:=query.FieldValues['sm_after'];
    query_ins.Parameters[18].Value:=query.FieldValues['dm_before'];
    query_ins.Parameters[19].Value:=query.FieldValues['dm_after'];
    query_ins.ExecSQL;
    query.Next;
   end;
  query_ins.Close;
  query_ins.SQL.Clear;
  query_ins.SQL.Add('delete from dbo.transfer_day_report_by_tank where transfer_date=:td');
  query_ins.Parameters[0].Value:=DateToStr(sd);
  query_ins.ExecSQL;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select tank_name from dbo.tank_dic');
  query.Open;
  query.First;
  query_ins.Close;
  query_ins.SQL.Clear;
  query_ins.SQL.Add('insert into dbo.transfer_day_report_by_tank (transfer_date, tank_name) values (:a, :b)');
  while not query.Eof do
   begin
    query_ins.Parameters[0].Value:=DateToStr(sd);
    query_ins.Parameters[1].Value:=query.Fields[0].AsString;
    query_ins.ExecSQL;
    query.Next;
   end;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select source_tank, sum(out_volume), sum(out_kg) from dbo.tank_transfer_report group by source_tank');
  query.Open;
  query.First;
  query_ins.Close;
  query_ins.SQL.Clear;
  query_ins.SQL.Add('update dbo.transfer_day_report_by_tank set out_val=:ov, ');
  query_ins.SQL.Add('out_kg=:ok where transfer_date=:td and tank_name=:tid');
  while not query.Eof do
   begin
    query_ins.Parameters[0].Value:=query.Fields[1].AsInteger;
    query_ins.Parameters[1].Value:=query.Fields[2].AsInteger;
    if length(DateToStr(sd))<>10 then
     query_ins.Parameters[2].Value:='0'+DateToStr(sd)
    else
     query_ins.Parameters[2].Value:=DateToStr(sd);
    query_ins.Parameters[3].Value:=query.Fields[0].AsString;
    query_ins.ExecSQL;
    query.Next;
   end;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select dest_tank, sum(in_volume), sum(in_kg) from dbo.tank_transfer_report group by dest_tank');
  query.Open;
  query.First;
  query_ins.Close;
  query_ins.SQL.Clear;
  query_ins.SQL.Add('update dbo.transfer_day_report_by_tank set in_val=:ov, ');
  query_ins.SQL.Add('in_kg=:ok where transfer_date=:td and tank_name=:tid');
  while not query.Eof do
   begin
    query_ins.Parameters[0].Value:=query.Fields[1].AsInteger;
    query_ins.Parameters[1].Value:=query.Fields[2].AsInteger;
    if length(DateToStr(sd))<>10 then
     query_ins.Parameters[2].Value:='0'+DateToStr(sd)
    else
     query_ins.Parameters[2].Value:=DateToStr(sd);
    query_ins.Parameters[3].Value:=query.Fields[0].AsString;
    query_ins.ExecSQL;
    query.Next;
   end;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.transfer_day_Report_By_Tank where transfer_dATE=:td');
  query.Parameters[0].Value:=DateToStr(sd);
  query.Open;
  query.First;
  while not query.Eof do
   begin
    li:=ListView1.Items.Add;
    li.Caption:=query.FieldByName('tank_name').AsString;
    li.SubItems.Add(query.FieldByName('in_val').AsString);
    li.SubItems.Add(query.FieldByName('in_kg').AsString);
    li.SubItems.Add(query.FieldByName('out_val').AsString);
    li.SubItems.Add(query.FieldByName('out_kg').AsString);
    query.Next;
   end;
 query_ins.Free;
end;

procedure Tsirie_transfer_akt.showMonthReport(m: Word; y: Word);
var
  li:TListItem;
  lc:TListColumn;
  query_ins:TADOQuery;
  i:byte;
  d_str, m_str, y_str, date_str:string;
begin
 if ComboBox1.ItemIndex=0 then
  begin
   ListView1.Columns.Clear;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Месяц';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Год';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Резервуар';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Приход, л';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Приход, кг';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Расход, л';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Расход, кг';
   lc.Width:=100;
   ListView1.viewStyle:=vsReport;
   ListView1.CLear;
   query.Close;
   query.SQL.Clear;
   query.SQL.Add('select tank_name, transfer_month, transfer_year, ');
   query.SQL.Add('sum(in_val) as in_val ,sum(in_kg) as in_kg, ');
   query.SQL.Add('sum(out_val) as out_val, sum(out_kg) as out_kg ');
   query.SQL.Add('from dbo.transfer_month_report_by_daytank ');
   query.SQL.Add('where transfer_month = :tm and transfer_year = :ty ');
   query.SQL.Add('group by tank_name, transfer_month, transfer_year order by tank_name');
   query.Parameters[0].Value:=m;
   query.Parameters[1].Value:=y;
   query.Open;
   query.First;
   while not query.Eof do
    begin
     li:=ListView1.Items.Add;
     li.Caption:=IntToStr(m);
     li.SubItems.Add(IntToStr(y));
     li.SubItems.Add(query.FieldByName('tank_name').AsString);
     li.SubItems.Add(query.FieldByName('in_val').AsString);
     li.SubItems.Add(query.FieldByName('in_kg').AsString);
     li.SubItems.Add(query.FieldByName('out_val').AsString);
     li.SubItems.Add(query.FieldByName('out_kg').AsString);
     query.Next;
    end;
  end
 else
  begin
   ListView1.Columns.Clear;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Дата перемещения';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Резервуар';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Приход, л';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Приход, кг';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Расход, л';
   lc.Width:=100;
   lc:=ListView1.Columns.Add;
   lc.Caption:='Расход, кг';
   lc.Width:=100;
   ListView1.viewStyle:=vsReport;
   ListView1.CLear;
   query.Close;
   query.SQL.Clear;
   query.SQL.Add('select * from dbo.transfer_month_report_by_daytank ');
   query.SQL.Add('where transfer_month = :tm and transfer_year = :ty and tank_name=:tn order by transfer_date');
   query.Parameters[0].Value:=m;
   query.Parameters[1].Value:=y;
   query.Parameters[2].Value:=ComboBox1.Text;
   query.Open;
   query.First;
   while not query.Eof do
    begin
     li:=ListView1.Items.Add;
     li.Caption:=query.FieldByName('transfer_date').AsString;
     li.SubItems.Add(query.FieldByName('tank_name').AsString);
     li.SubItems.Add(query.FieldByName('in_val').AsString);
     li.SubItems.Add(query.FieldByName('in_kg').AsString);
     li.SubItems.Add(query.FieldByName('out_val').AsString);
     li.SubItems.Add(query.FieldByName('out_kg').AsString);
     query.Next;
    end;
  end;
end;

procedure Tsirie_transfer_akt.showYearReport(y: Word);
var
  li:TListItem;
  lc:TListColumn;
begin
  ListView1.Columns.Clear;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Год';
  lc.Width:=100;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Резервуар';
  lc.Width:=100;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Приход, л';
  lc.Width:=100;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Приход, кг';
  lc.Width:=100;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Расход, л';
  lc.Width:=100;
  lc:=ListView1.Columns.Add;
  lc.Caption:='Расход, кг';
  lc.Width:=100;
  ListView1.viewStyle:=vsReport;
  ListView1.CLear;
  query:=TADOQuery.Create(nil);
  query.Connection:=dm.alexpromCon;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select tank_name,sum(in_val) as in_val ,sum(in_kg) as in_kg, ');
  query.SQL.Add('sum(out_val) as out_val, sum(out_kg) as out_kg ');
  query.SQL.Add('from dbo.v_YearTransferReport ');
  query.SQL.Add('where transfer_year=:tm group by tank_name');
  query.Parameters[0].Value:=y;
  query.Open;
  query.First;
  while not query.Eof do
    begin
      li:=ListView1.Items.Add;
      li.Caption:=IntToStr(y);
      li.SubItems.Add(query.FieldByName('tank_name').AsString);
      li.SubItems.Add(query.FieldByName('in_val').AsString);
      li.SubItems.Add(query.FieldByName('in_kg').AsString);
      li.SubItems.Add(query.FieldByName('out_val').AsString);
      li.SubItems.Add(query.FieldByName('out_kg').AsString);
      query.Next;
    end;
end;

procedure Tsirie_transfer_akt.BitBtn1Click(Sender: TObject);
begin
 case RadioGroup1.ItemIndex of
  0:begin
    if ComboBox1.ItemIndex=0 then
     begin
      RvDataSetConnection7.DataSet:=query;
      RvProject1.ExecuteReport('day_transfer_data');
     end
    else
     begin
      RvDataSetConnection11.DataSet:=query;
      RvProject1.ExecuteReport('day_transfer_data_by_tank');
     end;
  end;
  1:begin
      RvDataSetConnection5.DataSet:=query;
      RvProject1.ExecuteReport('day_transfer_report');
  end;
  2:begin
    if ComboBox1.ItemIndex=0 then
     begin
      RvDataSetConnection6.DataSet:=query;
      RvProject1.ExecuteReport('month_transfer_report');
     end
    else
     begin
      RvDataSetConnection12.DataSet:=query;
      RvProject1.ExecuteReport('month_transfer_by_day');
     end;
  end;
  3:begin
  end;
 end;
end;

procedure Tsirie_transfer_akt.Button4Click(Sender: TObject);
begin
 close;
end;

procedure Tsirie_transfer_akt.ComboBox1Change(Sender: TObject);
begin
 Update_Data(ReportDate.Date,MonthBox.ItemIndex+1,StrToInt(YearBox.Items.Strings[YearBox.ItemIndex]),RadioGroup1.ItemIndex);
end;

procedure Tsirie_transfer_akt.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure Tsirie_transfer_akt.FormCreate(Sender: TObject);
var
 y,m,d:word;
begin
 ReportDate.Date:=now;
 DecodeDate(now,y,m,d);
 MonthBox.ItemIndex:=m-1;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select YearNode from dbo.NODES where yearNode<>0 group by yearNode');
 query.Open;
 YearBox.Clear;
 while not query.Eof do
  begin
    YearBox.Items.Add(query.Fields[0].AsString);
    query.Next;
  end;
 YearBox.ItemIndex:=YearBox.Items.Count-1;
 query.Close;
 ComboBox1.Clear;
 query.SQL.Clear;
 query.SQL.Add('select tank_name from dbo.tank_dic order by tank_id');
 query.Open;
 query.First;
 while not query.Eof do
  begin
   ComboBox1.Items.Add(query.FieldByName('tank_name').AsString);
   query.Next;
  end;
 ComboBox1.ItemIndex:=0;
 Update_Data(ReportDate.Date,MonthBox.ItemIndex+1,StrToInt(YearBox.Items.Strings[YearBox.ItemIndex]),RadioGroup1.ItemIndex);
end;

procedure Tsirie_transfer_akt.MonthBoxChange(Sender: TObject);
begin
if RadioGroup1.ItemIndex<>2 then
 RadioGroup1.ItemIndex:=2;
  Update_Data(ReportDate.Date,MonthBox.ItemIndex+1,StrToInt(YearBox.Items.Strings[YearBox.ItemIndex]),RadioGroup1.ItemIndex);
end;

procedure Tsirie_transfer_akt.RadioGroup1Click(Sender: TObject);
begin
 Update_Data(ReportDate.Date,MonthBox.ItemIndex+1,StrToInt(YearBox.Items.Strings[YearBox.ItemIndex]),RadioGroup1.ItemIndex);
end;

procedure Tsirie_transfer_akt.ReportDateChange(Sender: TObject);
begin
 Update_Data(ReportDate.Date,MonthBox.ItemIndex+1,StrToInt(YearBox.Items.Strings[YearBox.ItemIndex]),RadioGroup1.ItemIndex);
end;

end.

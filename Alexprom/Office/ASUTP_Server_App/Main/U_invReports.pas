unit U_invReports;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ComCtrls, ExtCtrls, ADODB, RpCon, RpConDS,
  RpDefine, RpRave, DB, mainfunctions, OleServer;

type
  TinvReports = class(TForm)
    GroupBox1: TGroupBox;
    monthBox: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    yearBox: TComboBox;
    ListView1: TListView;
    BitBtn1: TBitBtn;
    typeBox: TRadioGroup;
    ADOQuery1: TADOQuery;
    RvProject1: TRvProject;
    RvDataSetConnection8: TRvDataSetConnection;
    Button1: TButton;
    procedure yearBoxChange(Sender: TObject);
    procedure monthBoxChange(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure InitFrm(y,m:word;t:byte);
  public
    { Public declarations }
  end;

var
  invReports: TinvReports;
  query:TADOQuery;
implementation

uses u_dm;

{$R *.dfm}

procedure TinvReports.InitFrm(y,m:word;t:byte);
var
 li:TListItem;
 i:byte;
 query_ins:TADOQuery;
 d_str, m_str, y_str, date_STR:string;
 year, month, day:word;
begin
listview1.Clear;
case t of
0:begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select start_date, start_time from dbo.inventory_report where inv_month=:m and inv_year=:y order by tank_id');
  query.Parameters[0].Value:=m;
  query.Parameters[1].Value:=y;
  query.Open;
  query.First;
  try
   DecodeDate(StrToDate(query.FieldByName('start_date').AsString), year, month, day);
   query.Close;
   query.SQL.Clear;
   query.SQL.Add('select * from inventory_report where inv_month= :a and inv_year=:b order by tank_id');
   query.Parameters[0].Value:=m;
   query.Parameters[1].Value:=y;
   query.Open;
   query.First;
  except
   ShowMessage('На начало этого месяца нет инвентаризационных данных');
  end;
end;
1:begin

end;
end;
   while not query.Eof do
    begin
     li:=ListView1.Items.add;
     li.Caption:=query.FieldByName('tank_name').AsString;
     li.SubItems.Add(query.FieldByName('start_level').AsString);
     li.SubItems.Add(query.FieldByName('start_volume').AsString);
     li.SubItems.Add(query.FieldByName('start_kg').AsString);
     li.SubItems.Add(query.FieldByName('out_val').AsString);
     li.SubItems.Add(query.FieldByName('out_kg').AsString);
     li.SubItems.Add(query.FieldByName('in_val').AsString);
     li.SubItems.Add(query.FieldByName('in_kg').AsString);
     li.SubItems.Add(query.FieldByName('end_level').AsString);
     li.SubItems.Add(query.FieldByName('end_volume').AsString);
     li.SubItems.Add(query.FieldByName('end_kg').AsString);
     li.SubItems.Add(query.FieldByName('delta_volume').AsString);
     li.SubItems.Add(query.FieldByName('delta_kg').AsString);
     li.SubItems.Add(query.FieldByName('delta_vol').AsString);
     li.SubItems.Add(query.FieldByName('delta_weight').AsString);
     query.Next;
    end;
end;

procedure TinvReports.monthBoxChange(Sender: TObject);
begin
 InitFrm(strtoint(yearBox.Text),abs(-monthBox.ItemIndex-1),typeBox.ItemIndex);
end;

procedure TinvReports.yearBoxChange(Sender: TObject);
begin
 InitFrm(strtoint(yearBox.Text),abs(-monthBox.ItemIndex-1),typeBox.ItemIndex);
end;

procedure TinvReports.BitBtn1Click(Sender: TObject);
begin
case typeBox.ItemIndex of
0:begin
  RvDataSetConnection8.DataSet:=query;
  RvProject1.ExecuteReport('invMonthReport');
end;
1:begin
end;
end;
end;

procedure TinvReports.Button1Click(Sender: TObject);
var
 query_ins:TADOQuery;
 i:word;
 d_str, m_str, y_str, date_str:string;
begin
try
  Cursor:=crHourGlass;
  query_ins:=TADOQuery.Create(nil);
  query_ins.Connection:=dm.alexpromCon;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('delete from dbo.transfer_month_report_by_daytank where transfer_month=:m and transfer_year=:y');
  query.Parameters[0].Value:=monthBox.ItemIndex+1;
  query.Parameters[1].Value:=StrToInt(yearBox.Text);
  query.ExecSQL;
  for i := 1 to day_in_month(monthBox.ItemIndex,StrToInt(yearBox.Text))-1 do
   begin
    d_str:=IntToStr(i);
    if length(d_str)=1 then
     d_str:='0'+d_str;
    m_str:=IntToStr(monthBox.ItemIndex+1);
    if length(m_str)=1 then
     m_str:='0'+m_str;
    y_str:=IntToStr(StrToInt(yearBox.Text));
    date_str:=d_str+'.'+m_str+'.'+y_str;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('delete from dbo.tank_transfer_report');
    query.ExecSQL;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select * from dbo.Transfer_data_by_tank ');
    query.SQL.Add('where transfer_date=:td and transfer_time between :ts and :te');
    query.Parameters[0].Value:=date_str;
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
    if i<day_in_month(monthBox.ItemIndex,StrToInt(yearBox.Text)) then
     begin
      d_str:=IntToStr(i+1);
      if length(d_str)=1 then
       d_str:='0'+d_str;
      date_str:=d_str+'.'+m_str+'.'+y_str;
      query.Parameters[0].Value:=date_str;
     end;
     query.Parameters[1].Value:='00:00:00';
     query.Parameters[2].Value:='08:29:59';
     query.Open;
     query.First;
     while not query.Eof do
      begin
       query_ins.Parameters[0].Value:=date_str;
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
     query_ins.Parameters[0].Value:=date_str;
     query_ins.ExecSQL;
     query.Close;
     query.SQL.Clear;
     query.SQL.Add('select tank_id, tank_name from dbo.tank_dic');
     query.Open;
     query.First;
     query_ins.Close;
     query_ins.SQL.Clear;
     query_ins.SQL.Add('insert into dbo.transfer_day_report_by_tank (transfer_date, tank_name, tank_id) values (:a, :b, :c)');
     while not query.Eof do
      begin
       query_ins.Parameters[0].Value:=date_str;
       query_ins.Parameters[1].Value:=query.Fields[1].AsString;
       query_ins.Parameters[2].Value:=query.Fields[0].AsString;
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
       query_ins.Parameters[2].Value:=date_str;
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
       query_ins.Parameters[2].Value:=date_str;
       query_ins.Parameters[3].Value:=query.Fields[0].AsString;
       query_ins.ExecSQL;
       query.Next;
      end;
     d_str:=IntToStr(i);
     if length(d_str)=1 then
      d_str:='0'+d_str;
     m_str:=IntToStr(monthBox.ItemIndex+1);
     if length(m_str)=1 then
      m_str:='0'+m_str;
     y_str:=IntToStr(StrToInt(yearBox.Text));
     date_str:=d_str+'.'+m_str+'.'+y_str;
     query.Close;
     query.SQL.Clear;
     query.SQL.Add('select * from dbo.transfer_day_report_by_tank where transfer_date=:td');
     query.Parameters[0].Value:=date_str;
     query.Open;
     query.First;
     query_ins.Close;
     query_ins.SQL.Clear;
     query_ins.SQL.Add('insert into dbo.transfer_month_report_by_daytank (tank_name, ');
     query_ins.SQL.Add('transfer_month, transfer_year, in_val, in_kg, out_val, out_kg, transfer_date, tank_id) values(');
     query_ins.SQL.Add(':a, :b, :c, :d, :e, :f, :g, :h, :i)');
     while not query.Eof do
      begin
       query_ins.Parameters[0].Value:=query.FieldByName('tank_name').AsString;
       query_ins.Parameters[1].Value:=monthBox.ItemIndex+1;
       query_ins.Parameters[2].Value:=StrToInt(yearBox.Text);
       query_ins.Parameters[3].Value:=query.FieldByName('in_val').AsInteger;
       query_ins.Parameters[4].Value:=query.FieldByName('in_kg').AsInteger;
       query_ins.Parameters[5].Value:=query.FieldByName('out_val').AsInteger;
       query_ins.Parameters[6].Value:=query.FieldByName('out_kg').AsInteger;
       query_ins.Parameters[7].Value:=query.FieldByName('transfer_date').AsString;
       query_ins.Parameters[8].Value:=query.FieldByName('tank_id').AsInteger;
       query_ins.ExecSQL;
       query.Next;
      end;
   end;
 InitFrm(StrToInt(yearBox.Text),monthBox.ItemIndex+1,typeBox.ItemIndex);
finally
 Cursor:=crDefault;
end;
end;

procedure TinvReports.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  query.Free;
  Action:=caFree;
end;

procedure TinvReports.FormCreate(Sender: TObject);
var
 y,m,d:word;
 s:string;
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 DecodeDate(now,y,m,d);
 monthBox.ItemIndex:=m-1;
 yearBox.Text:=IntToStr(y);
 InitFrm(y,m,typeBox.ItemIndex);
end;

end.

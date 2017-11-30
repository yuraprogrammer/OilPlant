unit U_backupServerData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, ExtCtrls, DB, ADODB;

type
  progress_1=class (Tthread)
    procedure Execute;override;
  end;

type
  TDBloadData = class(TForm)
    ADO_tt: TADOConnection;
    ADO_sql: TADOConnection;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Gauge1: TGauge;
    Label2: TLabel;
    Gauge2: TGauge;
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure show_progress_1;
    procedure loadAllData;
    procedure loadHelpData;
  end;

var
  DBloadData: TDBloadData;

implementation

{$R *.dfm}

procedure progress_1.Execute;
begin

end;

procedure TDBloadData.loadAllData;
var
  query_sql,query_tt, query_tt_1,query_tt_2:TADOQuery;
  i,fieldCount:byte;
  desc_query,insert_query, sql_query:string;
  p:progress_1;
  a,b:longint;
begin
  query_sql:=TADOQuery.Create(nil);
  query_sql.Connection:=ADO_sql;
  query_tt:=TADOQuery.Create(nil);
  query_tt.Connection:=ADO_tt;
  query_tt_1:=TADOQuery.Create(nil);
  query_tt_1.Connection:=ADO_tt;
  query_tt_2:=TADOQuery.Create(nil);
  query_tt_2.Connection:=ADO_tt;
  query_tt.Close;
  query_tt.SQL.Clear;
  query_tt.SQL.Add('select tblname from sys.tables where tblowner=:owner');
  query_tt.Parameters[0].Value:='PROGRAMMER';
  query_tt.Open;
  query_tt.First;
  i:=1;
  while not query_tt.Eof do
    begin
      query_tt_1.Close;
      query_tt_1.SQL.Clear;
      query_tt_1.SQL.Add('delete from PROGRAMMER.'+trim(query_tt.Fields[0].AsString)+';');
      query_tt_1.ExecSQL;
      query_tt_1.Close;
      query_tt_1.SQL.clear;
      desc_query:='select colname from sys.columns where id = (select tblid from sys.tables where tblname=:tbl);';
      query_tt_1.SQL.Add(desc_query);
      query_tt_1.Parameters[0].Value:=query_tt.Fields[0].AsString;
      query_tt_1.Open;
      query_tt_1.First;
      fieldCount:=query_tt_1.RecordCount;
      query_sql.Close;
      query_sql.sql.clear;
      sql_query:='select ';
      while not query_tt_1.Eof do
        begin
          sql_query:=sql_query+trim(query_tt_1.Fields[0].AsString)+',';
          query_tt_1.Next;
        end;
      sql_query[length(sql_query)]:=' ';
      sql_query:=sql_query+'from '+query_tt.Fields[0].AsString;
      query_sql.SQL.Add(sql_query);
      query_sql.Open;
      query_sql.First;
      query_tt_2.Close;
      query_tt_2.SQL.Clear;
      query_tt_1.First;
      insert_query:='insert into PROGRAMMER.'+trim(query_tt.Fields[0].AsString)+' (';
      while not query_tt_1.Eof do
        begin
          insert_query:=insert_query+trim(query_tt_1.Fields[0].AsString)+',';
          query_tt_1.Next;
        end;
      insert_query[length(insert_query)]:=')';
      insert_query:=insert_query+' values (';
      query_tt_1.First;
      while not query_tt_1.Eof do
        begin
          insert_query:=insert_query+':'+trim(query_tt_1.Fields[0].AsString)+',';
          query_tt_1.Next;
        end;
      insert_query[length(insert_query)]:=')';
      insert_query:=insert_query+';';
      query_tt_2.SQL.Add(insert_query);
      b:=1;
      while not query_sql.Eof do
        begin
          for i := 0 to fieldCount - 1 do
            query_tt_2.Parameters[i].Value:=query_sql.Fields[i].AsVariant;
          query_tt_2.ExecSQL;
          Gauge2.Progress:=Round(b*100/query_sql.RecordCount);
          inc(b);
          query_sql.Next;
        end;
      Gauge1.Progress:=Round(a*100/query_tt.RecordCount);
      inc(a);
      query_tt.Next;
    end;
    query_tt.Free;
    query_tt_1.Free;
    query_tt_2.Free;
end;

procedure TDBLoadData.loadHelpData;
begin

end;

procedure TDBloadData.Button1Click(Sender: TObject);
begin
if MessageDlg('Вы подтверждаете загрузку данных?',mtConfirmation, [mbOk, mbCancel],0)=mrOk then
  begin
    if RadioGroup1.ItemIndex=0 then
      begin
        loadAllData;
      end;
    if RadioGroup1.ItemIndex=1 then
      begin
        loadHelpData;
      end;     
  end;
end;

procedure TDBloadData.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TDBloadData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Action:=caFree;
end;

procedure TDBLoadData.show_progress_1;
begin

end;

end.

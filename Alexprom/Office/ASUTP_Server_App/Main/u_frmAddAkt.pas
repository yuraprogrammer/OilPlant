unit u_frmAddAkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ADODB, DBCtrls, DB, RpBase, RpSystem,
  RpRender, RpRenderCanvas, RpRenderPreview, RpDefine, RpRave, RpRenderPDF,
  RpRenderHTML, RpCon, RpConDS, ActnList, RpRenderRTF, RpFiler;

type
  TfrmAddAkt = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    MaskEdit6: TMaskEdit;
    Label9: TLabel;
    Label10: TLabel;
    MaskEdit1: TMaskEdit;
    Label11: TLabel;
    MaskEdit2: TMaskEdit;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    MaskEdit3: TMaskEdit;
    Label15: TLabel;
    MaskEdit4: TMaskEdit;
    Label16: TLabel;
    GroupBox5: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    btnSaveAkt: TButton;
    btnClose: TButton;
    GroupBox6: TGroupBox;
    Label20: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label29: TLabel;
    Label19: TLabel;
    Label21: TLabel;
    Edit7: TEdit;
    op_tsp: TDBLookupComboBox;
    op_lab: TDBLookupComboBox;
    main_tsp: TDBLookupComboBox;
    calendar_2: TDateTimePicker;
    DBEdit1: TDBEdit;
    ComboBox1: TComboBox;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit4: TDBEdit;
    DBEdit5: TDBEdit;
    DBEdit6: TDBEdit;
    DBEdit7: TDBEdit;
    DBEdit8: TDBEdit;
    DBEdit9: TDBEdit;
    DBEdit10: TDBEdit;
    DBEdit11: TDBEdit;
    num_naklad: TDBLookupComboBox;
    save_AKT: TADOStoredProc;
    DBEdit12: TDBEdit;
    ActionList1: TActionList;
    previewAkt: TAction;
    RvProject1: TRvProject;
    RvDataSetConnection1: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    ADOQuery1: TADOQuery;
    ADOConnection1: TADOConnection;
    MaskEdit7: TEdit;
    ADOQuery1aktNum: TLargeintField;
    ADOQuery1naklad_num: TWideStringField;
    ADOQuery1matLevel: TIntegerField;
    ADOQuery1Plotnost: TFloatField;
    ADOQuery1Temperature: TIntegerField;
    ADOQuery1waterLevel_mm: TIntegerField;
    ADOQuery1waterLevel_kg: TIntegerField;
    ADOQuery1weight: TIntegerField;
    ADOQuery1a_matLevel: TIntegerField;
    ADOQuery1a_Plotnost: TFloatField;
    ADOQuery1a_temperature: TIntegerField;
    ADOQuery1a_waterLevel_mm: TIntegerField;
    ADOQuery1a_waterLevel_kg: TIntegerField;
    ADOQuery1a_weight: TIntegerField;
    ADOQuery1op_tsp: TWideStringField;
    ADOQuery1tsp_main: TWideStringField;
    ADOQuery1op_lab: TWideStringField;
    ADOQuery1driverFIO: TWideStringField;
    ADOQuery1load_id: TWordField;
    ADOQuery1mat_name: TWideStringField;
    ADOQuery1rootNode: TLargeintField;
    ADOQuery1naklad_id: TLargeintField;
    ADOQuery1in_Date: TWideStringField;
    ADOQuery1in_Time: TWideStringField;
    ADOQuery1netto_1: TLargeintField;
    ADOQuery1fact_mat: TWideStringField;
    ADOQuery1aktDate: TWideStringField;
    ADOQuery1truckModel: TWideStringField;
    ADOQuery1org_name: TWideStringField;
    ADOQuery1a_truckCode: TLargeintField;
    ADOQuery1truckCode: TLargeintField;
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure main_tspCloseUp(Sender: TObject);
    procedure op_labCloseUp(Sender: TObject);
    procedure op_tspCloseUp(Sender: TObject);
    procedure num_nakladCloseUp(Sender: TObject);
    procedure calendar_2Change(Sender: TObject);
    procedure btnSaveAktClick(Sender: TObject);
  private
    { Private declarations }
    procedure initFrm;
    procedure initData;
    procedure saveAkt;
    procedure makeHTML;
  public
    { Public declarations }
  end;

var
  frmAddAkt: TfrmAddAkt;
  query1:TADOQuery;
  query2:TADOQuery;
  query3:TADOQuery;
  query4, qqq:TADOQuery;
  ds1:TDataSource;
  ds2:TDataSource;
  ds3:TDataSource;
  ds4:TDataSource;
  op_tsp_code, op_lab_code, main_tsp_code, naklad_code: longint;
  akt_key:longint;
implementation

uses u_dm;

{$R *.dfm}

procedure TfrmAddAkt.initFrm;
begin
 calendar_2.Date:=now;
 query1.Connection:=dm.alexpromCon;
 query2.Connection:=dm.alexpromCon;
 query3.Connection:=dm.alexpromCon;
 query4.Connection:=dm.alexpromCon;
 query1.Close;
 query1.SQL.Clear;
 query1.SQL.Add('select * from dbo.workers_tsp');
 query1.open;
 query1.First;
 op_tsp.ListSource:=ds1;
 op_tsp.ListField:='fio';
 op_tsp.KeyField:='id';
 query2.Close;
 query2.SQL.Clear;
 query2.SQL.Add('select * from dbo.workers_lab');
 query2.open;
 query2.First;
 op_lab.ListSource:=ds2;
 op_lab.ListField:='fio';
 op_lab.KeyField:='id';
 query3.Close;
 query3.SQL.Clear;
 query3.SQL.Add('select * from dbo.workers_tsp');
 query3.open;
 query3.First;
 main_tsp.ListSource:=ds3;
 main_tsp.ListField:='fio';
 main_tsp.KeyField:='id';
 initData;
end;

procedure TfrmAddAkt.initData;
var
  query:TADOQuery;
  akt:longInt;
  nakladDate:string[10];
  i:byte;
begin
 query4.Close;
 query4.SQL.Clear;
 query4.SQL.Add('select * from dbo.allNaklad where naklad_date=:naklad_date and akt_num=-1');
 nakladDate:=DateToStr(calendar_2.Date);
 for I := 0 to length(nakladDate) - 1 do
   if nakladDate[i]='/' then
    nakladDate[i]:='.';
 if length(nakladDate)<>10 then
   query4.Parameters[0].Value:='0'+nakladDate
 else
  query4.Parameters[0].Value:=nakladDate;
 query4.Open;
 query4.First;
 num_naklad.ListSource:=ds4;
 num_naklad.ListField:='naklad_num';
 num_naklad.KeyField:='naklad_id';
 dbedit1.datasource:=ds4;
 dbedit1.DataField:='mat_name';
 dbedit2.datasource:=ds4;
 dbedit2.DataField:='truckCode';
 dbedit3.datasource:=ds4;
 dbedit3.DataField:='matLevel';
 dbedit4.datasource:=ds4;
 dbedit4.DataField:='Plotnost';
 dbedit5.datasource:=ds4;
 dbedit5.DataField:='waterLevel_mm';
 dbedit6.datasource:=ds4;
 dbedit6.DataField:='waterLevel_kg';
 dbedit7.datasource:=ds4;
 dbedit7.DataField:='weight';
 dbedit8.datasource:=ds4;
 dbedit8.DataField:='Temperature';
 dbedit9.datasource:=ds4;
 dbedit9.DataField:='driverFIO';
 dbedit10.datasource:=ds4;
 dbedit10.DataField:='in_Time';
 dbedit11.datasource:=ds4;
 dbedit11.DataField:='in_Date';
 dbedit12.DataSource:=ds4;
 dbedit12.DataField:='netto_1';
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 query.Close;
 query.SQL.Add('select max(isNull(aktNum,0)) from akts');
 query.Open;
 akt:=query.Fields[0].AsInteger+1;
 Edit7.Text:=IntToStr(akt);
 query.Close;
 query.SQL.Clear;
 query.sql.Add('select mat_name from mat_dic order by mat_id');
 query.Open;
 query.First;
 Combobox1.Clear;
 while not query.Eof do
  begin
    ComboBox1.Items.Add(query.FieldValues['mat_name']);
    query.Next;
  end;
 query.Free;
 RvProject1.ProjectFile:=GetCurrentDir+'\reports\TSP.rav';
end;

procedure TfrmAddAkt.main_tspCloseUp(Sender: TObject);
begin
 if main_tsp.Text<>'' then
  begin
    main_tsp_code:=main_tsp.KeyValue;
  end;
end;

procedure TfrmAddAkt.num_nakladCloseUp(Sender: TObject);
begin
 if num_naklad.Text<>'' then
  begin
    naklad_code:=num_naklad.KeyValue;
    btnSaveAKT.Enabled:=true;
  end;
end;

procedure TfrmAddAkt.op_labCloseUp(Sender: TObject);
begin
 if op_lab.Text<>'' then
  begin
    op_lab_code:=op_lab.KeyValue;
  end;
end;

procedure TfrmAddAkt.op_tspCloseUp(Sender: TObject);
begin
 if op_tsp.Text<>'' then
  begin
    op_tsp_code:=op_tsp.KeyValue;
  end;
end;

procedure TfrmAddAkt.makeHTML;
var
  qqq:TADOQuery;
begin
try
  qqq:=TADOQuery.Create(nil);
  qqq.Connection:=dm.alexpromCon;
  qqq.Close;
  qqq.SQL.Clear;
  qqq.SQL.Add('select * from dbo.aktView where aktNUm=:an');
  qqq.Parameters[0].Value:=akt_key;
  qqq.Open;
  qqq.First;
  ADOQuery1.Close;
  RvDataSetConnection1.DataSet:=qqq;
  RvProject1.ExecuteReport('Akt_TSP');
except
  ShowMessage('Ошибка формирования акта.');
  exit;
end;
  qqq.Free;
  close;
end;

procedure TfrmAddAkt.btnCloseClick(Sender: TObject);
begin
 close;
end;

procedure TfrmAddAkt.saveAkt;
var
  date_str:string[10];
  i:byte;
begin
  save_AKT.Connection:=dm.alexpromCon;
  save_AKT.Parameters[1].Value:=num_naklad.KeyValue;
  save_AKT.Parameters[2].Value:=op_tsp.KeyValue;
  save_AKT.Parameters[3].Value:=2;
  save_AKT.Parameters[4].Value:=MaskEdit1.Text;
  save_AKT.Parameters[5].Value:=MaskEdit3.Text;
  save_AKT.Parameters[6].Value:=MaskEdit4.Text;
  if dbEdit12.Text='' then
    save_AKT.Parameters[7].Value:=0
  else
    save_AKT.Parameters[7].Value:=dbEdit12.Text;
  save_AKT.Parameters[8].Value:=MaskEdit2.Text;
  save_AKT.Parameters[9].Value:=StrToInt(MaskEdit7.Text);
  save_AKT.Parameters[10].Value:=Edit7.Text;
  save_AKT.Parameters[11].Value:=main_tsp.KeyValue;
  save_AKT.Parameters[12].Value:=op_lab.KeyValue;
  save_AKT.Parameters[13].Value:=MaskEdit6.Text;
  save_AKT.Parameters[14].Value:=ComboBox1.ItemIndex;
  date_str:=DateToStr(now);
  for i := 0 to length(date_str) - 1 do
    if date_str[i]='/' then
      date_str[i]:='.';
  if length(date_str)<>10 then
    save_AKT.Parameters[15].Value:='0'+date_str
  else
    save_AKT.Parameters[15].Value:=date_str;
  save_AKT.ExecProc;
  akt_key:=StrToInt(Edit7.Text);
  qqq.Close;
  qqq.SQL.Clear;
  qqq.SQL.Add('insert into dbo.akt_lab(aktnum) values (:an)');
  qqq.Parameters[0].Value:=akt_key;
  qqq.ExecSQL;
  qqq.Close;
  qqq.SQL.Clear;
  qqq.SQL.Add('insert into dbo.frc_sirie(aktnum) values (:an)');
  qqq.Parameters[0].Value:=akt_key;
  qqq.ExecSQL;
  qqq.Close;
  qqq.SQL.Clear;
  qqq.SQL.Add('insert into dbo.frc_siri_taks(aktnum) values (:an)');
  qqq.Parameters[0].Value:=akt_key;
  qqq.ExecSQL;
  makeHTML;
end;

procedure TfrmAddAkt.btnSaveAktClick(Sender: TObject);
begin
if not dm.alexpromCon.Connected then
  begin
    try
      dm.alexpromCon.Connected:=true;
      saveAkt;
      btnSaveAkt.Enabled:=false;
    except
      SHowMessage('Нет соединения с сервером базы данных!!! Обратитесь к администратору и повторите попытку позже.');
    end;
  end
else
  begin
    saveAkt;
    btnSaveAkt.Enabled:=false;
  end;
end;

procedure TfrmAddAkt.calendar_2Change(Sender: TObject);
begin
 initData;
end;

procedure TfrmAddAkt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query1.Free;
 query2.Free;
 query3.Free;
 query4.Free;
 qqq.Free;
 ds1.Free;
 ds2.Free;
 ds3.Free;
 ds4.Free;
end;

procedure TfrmAddAkt.FormCreate(Sender: TObject);
begin
  query1:=TADOQuery.Create(nil);
  query2:=TADOQuery.Create(nil);
  query3:=TADOQuery.Create(nil);
  query4:=TADOQuery.Create(nil);
  qqq:=TADOQuery.Create(nil);
  qqq.Connection:=dm.alexpromCon;
  ds1:=TDataSource.Create(nil);
  ds2:=TDataSource.Create(nil);
  ds3:=TDataSource.Create(nil);
  ds4:=TDataSource.Create(nil);
  ds1.DataSet:=query1;
  ds2.DataSet:=query2;
  ds3.DataSet:=query3;
  ds4.DataSet:=query4;
  if not dm.alexpromCon.Connected then
    begin
     try
      dm.alexpromCon.Connected:=true;
      initFrm;
     except
      ShowMessage('Нет соединения с сервером базы данных!!! Обратитесь к администратору и повторите попытку позже.');
     end;
    end
  else
    begin
      initFrm;
    end;
end;

end.

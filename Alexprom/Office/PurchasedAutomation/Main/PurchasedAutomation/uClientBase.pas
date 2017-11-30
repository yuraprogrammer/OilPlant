unit uClientBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ActnList,
  CategoryButtons, CheckLst, ImgList, ADODB, ExtCtrls, TabNotBk, DB, ppDB,
  ppDBPipe, ppParameter, ppDesignLayer, ppBands, ppTableGrid, myChkBox, ppCtrls,
  ppStrtch, ppPrnabl, ppClass, ppCache, ppComm, ppRelatv, ppProd, ppReport,
  ppViewr, ppVar, Excel2000, OleServer;

type
  TfrmClientBase = class(TForm)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    actionNew: TAction;
    actionOpen: TAction;
    actionDelete: TAction;
    CategoryButtons1: TCategoryButtons;
    ImageList1: TImageList;
    gbClientFilter: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    regionsBox: TCheckListBox;
    productBox: TCheckListBox;
    actionRefresh: TAction;
    actionShowProductDic: TAction;
    actionRefreshProducts: TAction;
    DateFilter: TRadioGroup;
    GroupBox3: TGroupBox;
    dtpStartDate: TDateTimePicker;
    Label3: TLabel;
    Label4: TLabel;
    dtpEndDate: TDateTimePicker;
    ADOQuery1: TADOQuery;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDBPipeline1: TppDBPipeline;
    DataSource1: TDataSource;
    actionPrint: TAction;
    ADOQuery1ID: TLargeintField;
    ADOQuery1OutDate: TWideStringField;
    ADOQuery1Consumer: TIntegerField;
    ADOQuery1ConsumerName: TWideStringField;
    ADOQuery1Mat_ID: TIntegerField;
    ADOQuery1mat_name: TWideStringField;
    ADOQuery1Volume: TFloatField;
    ADOQuery1FactVolume: TFloatField;
    ADOQuery1FactPlotn: TFloatField;
    ADOQuery1FactTemp: TFloatField;
    ADOQuery1FactWeight: TFloatField;
    ADOQuery1Weight: TFloatField;
    ADOQuery1Summa: TFloatField;
    ADOQuery1TonnaPrice: TFloatField;
    ADOQuery1ShortageWeight: TFloatField;
    ADOQuery1ShortageMoney: TFloatField;
    ADOQuery1SubWeight: TFloatField;
    ADOQuery1PercentRatio: TFloatField;
    ReportTabs: TPageControl;
    tsIncoming: TTabSheet;
    tsReports: TTabSheet;
    lvList: TListView;
    reportView: TListView;
    ADOQuery2: TADOQuery;
    ppReport2: TppReport;
    ppDBPipeline2: TppDBPipeline;
    DataSource2: TDataSource;
    ppParameterList2: TppParameterList;
    ppTitleBand1: TppTitleBand;
    ppLabel1: TppLabel;
    ppHeaderBand1: TppHeaderBand;
    ppLine1: TppLine;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLine3: TppLine;
    ppLine4: TppLine;
    ppLine5: TppLine;
    ppLine6: TppLine;
    ppLine7: TppLine;
    ppLine8: TppLine;
    ppLine9: TppLine;
    ppLine10: TppLine;
    ppLine11: TppLine;
    ppLine12: TppLine;
    ppLine13: TppLine;
    ppLine14: TppLine;
    ppLine15: TppLine;
    ppLine16: TppLine;
    ppLine17: TppLine;
    ppLine19: TppLine;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppLine20: TppLine;
    ppFooterBand1: TppFooterBand;
    ppLine2: TppLine;
    ppSystemVariable2: TppSystemVariable;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppTitleBand2: TppTitleBand;
    ppLabel17: TppLabel;
    ppHeaderBand2: TppHeaderBand;
    ppLine21: TppLine;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel29: TppLabel;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLine22: TppLine;
    ppLine23: TppLine;
    ppLine24: TppLine;
    ppLine25: TppLine;
    ppLine26: TppLine;
    ppLine27: TppLine;
    ppLine28: TppLine;
    ppLine29: TppLine;
    ppLine31: TppLine;
    ppLine34: TppLine;
    ppLine35: TppLine;
    ppLine36: TppLine;
    ppLine37: TppLine;
    ppDetailBand2: TppDetailBand;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText27: TppDBText;
    ppDBText28: TppDBText;
    ppDBText29: TppDBText;
    ppDBText30: TppDBText;
    ppLine39: TppLine;
    ppFooterBand2: TppFooterBand;
    ppLine40: TppLine;
    ppSystemVariable3: TppSystemVariable;
    ppSystemVariable4: TppSystemVariable;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer2: TppDesignLayer;
    ppLabel25: TppLabel;
    ppDBText23: TppDBText;
    ppLine30: TppLine;
    ppLine33: TppLine;
    ppLabel26: TppLabel;
    ppLabel28: TppLabel;
    ppLabel33: TppLabel;
    ppLabel34: TppLabel;
    ppLabel35: TppLabel;
    ppLabel36: TppLabel;
    ppLabel37: TppLabel;
    ppLabel39: TppLabel;
    ppLabel40: TppLabel;
    ppLabel41: TppLabel;
    ppLabel42: TppLabel;
    ppLabel43: TppLabel;
    ppLine38: TppLine;
    ppLabel44: TppLabel;
    ppLabel45: TppLabel;
    ppLabel46: TppLabel;
    ppLabel47: TppLabel;
    ppLabel48: TppLabel;
    ppLabel49: TppLabel;
    ppLabel50: TppLabel;
    ppLabel51: TppLabel;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    ppLabel54: TppLabel;
    ppLabel55: TppLabel;
    ppLabel56: TppLabel;
    ppLabel58: TppLabel;
    cbDateFilterUse: TCheckBox;
    ADOQuery2ID: TLargeintField;
    ADOQuery2InDate: TWideStringField;
    ADOQuery2InTime: TWideStringField;
    ADOQuery2Consumer: TIntegerField;
    ADOQuery2ConsumerName: TWideStringField;
    ADOQuery2Mat_ID: TIntegerField;
    ADOQuery2mat_name: TWideStringField;
    ADOQuery2Volume: TFloatField;
    ADOQuery2DriverName: TWideStringField;
    ADOQuery2TankID: TIntegerField;
    ADOQuery2Tank_Name: TWideStringField;
    ADOQuery2OutDate: TWideStringField;
    ADOQuery2FactVolume: TFloatField;
    ADOQuery2FactPlotn: TFloatField;
    ADOQuery2FactTemp: TFloatField;
    ADOQuery2FactWeight: TFloatField;
    ADOQuery2Weight: TFloatField;
    ADOQuery2Notes: TWideStringField;
    ppLine41: TppLine;
    ppLabel59: TppLabel;
    ppLabel60: TppLabel;
    ppDBText24: TppDBText;
    ppLine18: TppLine;
    ppLabel12: TppLabel;
    ppLabel27: TppLabel;
    ppLine32: TppLine;
    ppDBText11: TppDBText;
    actionExport: TAction;
    ppLine42: TppLine;
    ppParameter1: TppParameter;
    ppDBPipeline3: TppDBPipeline;
    ADOQuery3: TADOQuery;
    DataSource3: TDataSource;
    ADOQuery3volume: TFloatField;
    ADOQuery3factvolume: TFloatField;
    ADOQuery3factweight: TFloatField;
    ADOQuery3weight: TFloatField;
    ADOQuery3shortageweight: TFloatField;
    ADOQuery3shortagemoney: TBCDField;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ppDBText31: TppDBText;
    ppDBText32: TppDBText;
    ppDBText33: TppDBText;
    ppDBText34: TppDBText;
    ppLabel38: TppLabel;
    xls: TExcelApplication;
    xlsWS: TExcelWorksheet;
    xlsWB: TExcelWorkbook;
    ExcelOLEObject1: TExcelOLEObject;
    procedure actionNewExecute(Sender: TObject);
    procedure actionOpenExecute(Sender: TObject);
    procedure actionDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure lvListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure actionRefreshExecute(Sender: TObject);
    procedure actionShowProductDicExecute(Sender: TObject);
    procedure regionsBoxClickCheck(Sender: TObject);
    procedure productBoxClickCheck(Sender: TObject);
    procedure actionRefreshProductsExecute(Sender: TObject);
    procedure DateFilterClick(Sender: TObject);
    procedure actionPrintExecute(Sender: TObject);
    procedure ReportTabsChange(Sender: TObject);
    procedure cbDateFilterUseClick(Sender: TObject);
    procedure dtpStartDateChange(Sender: TObject);
    procedure dtpEndDateChange(Sender: TObject);
    procedure lvListCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure actionExportExecute(Sender: TObject);
    procedure reportViewCustomDrawItem(Sender: TCustomListView; Item: TListItem;
      State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    { Private declarations }
    procedure buildStatement(SQL:String);
    procedure fillListView(Stmt:String);
    procedure deleteClientData(Stmt:string);
    procedure fillCustomers;
    procedure fillProducts;
  public
    { Public declarations }
    clAccessLevel:integer;
  end;

var
  frmClientBase: TfrmClientBase;
  productFilterCondition: string;
  regionFilterCondition: string;

  productFilterAct: boolean;
  customerFilterAct: boolean;
  useDateFilter: boolean;
  dateFilterAct: boolean;
  periodFilterAct: boolean;

  conditionCount:integer;
  p_key:TStringList;
  currentKey:longint;
  customersID, productsID, custID, prodID:TStringList;
  ppp:TStringList;
  SQLStatement:string;
  xlsStatement, xlsSummaryStatement:string;

implementation

uses uClientCard, uDM, U_sirie_dic;

{$R *.dfm}

//Удалить карточку выбраного клиента
procedure TfrmClientBase.actionDeleteExecute(Sender: TObject);
begin
if MessageDlg('Вы действительно хотите удалить выбраные данные?',mtConfirmation, [mbYes, mbNo],0)=mrYes then
 try
  dm.ADOConnection1.BeginTrans;
  deleteClientData('dbo.deleteIncomingTMC');
  deleteClientData('dbo.deleteReportIncomingTMC');
  DM.ADOConnection1.CommitTrans;
  actionRefreshExecute(Self);
  MessageDlg('Данные о приходе ТМЦ успешно удалены!!!', mtConfirmation, [mbOk], 0);
 except
  dm.ADOConnection1.RollbackTrans;
  MessageDlg('Ошибка удаления данных!!!', mtError, [mbOk], 0);
 end;
// deleteClientData('dbo.DeleteClientAddress');
end;

procedure TfrmClientBase.deleteClientData(Stmt: string);
var
 query:TADOQuery;
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.ADOConnection1;
 query.SQL.Add('exec '+Stmt+' ');
 query.SQL.Add(IntToStr(currentKey));
 query.ExecSQL;
end;

procedure TfrmClientBase.dtpEndDateChange(Sender: TObject);
begin
 if DateFilter.ItemIndex=1 then DateFilterClick(Self);
end;

procedure TfrmClientBase.dtpStartDateChange(Sender: TObject);
begin
 if DateFilter.ItemIndex=0 then DateFilterClick(Self);
end;

//Создать карточку нового клиента
procedure TfrmClientBase.actionExportExecute(Sender: TObject);
var
 query:TADOQuery;
 j:integer;
 RangeE:Excel2000.ExcelRange;
begin
try
 //Запуск Excel в фоновом режиме
 xls.ConnectKind:=ckRunningOrNew;
 try
   xls.Connect;
 except
  MessageDlg('Microsoft Excel не установлен!!!', mtError, [mbOk], 0);
  exit;
 end;
 xls.Visible[0]:=False;
 //Создание новой книги
 xls.Workbooks.Add(EmptyParam,0);
 xlsWB.ConnectTo(xls.ActiveWorkbook);
 xlsWS.ConnectTo(xlsWB.Sheets[1] as _Worksheet);
 //Заполение данными
 //Заполение заголовка

 xlsWS.Cells.Item[1, 1]:='ООО "Алекспром". Отчет о приходе сырья';
 xlsWS.Cells.Item[2, 1]:='Дата слива';
 xlsWS.Cells.Item[2, 2]:='Поставщик';
 xlsWS.Cells.Item[2, 3]:='ТМЦ';
 xlsWS.Cells.Item[2, 4]:='Объем, л';
 xlsWS.Cells.Item[2, 5]:='Факт. объем, л';
 xlsWS.Cells.Item[2, 6]:='Плотность, кг/м3';
 xlsWS.Cells.Item[2, 7]:='t, °C';
 xlsWS.Cells.Item[2, 8]:='Факт. масса, кг';
 xlsWS.Cells.Item[2, 9]:='Документы, кг';
 xlsWS.Cells.Item[2, 10]:='Сумма, грн';
 xlsWS.Cells.Item[2, 11]:='Цена за 1 тонну, грн';
 xlsWS.Cells.Item[2, 12]:='Недостача, кг';
 xlsWS.Cells.Item[2, 13]:='Недостача на 1 тонну, грн';
 xlsWS.Cells.Item[2, 14]:='Соотнош. в % к факт.тонажу';
 RangeE:=xlsWS.Range['A2','N2'];
 RangeE.Select;
 RangeE.Font.Bold:=True;
 RangeE.Font.Italic:=True;
 RangeE.Font.Size:=10;
 query:=TADOQuery.Create(nil);
 query.Connection:=DM.ADOConnection1;
 query.SQL.Add(xlsStatement);
 query.Open;
 query.First;
 j:=3;
 while not query.Eof do
  begin
   xlsWS.Cells.Item[j,1]:=query.FieldByName('OutDate').AsString;
   xlsWS.Cells.Item[j,2]:=query.FieldByName('ConsumerName').AsString;
   xlsWS.Cells.Item[j,3]:=query.FieldByName('mat_name').AsString;
   xlsWS.Cells.Item[j,4]:=query.FieldByName('Volume').AsString;
   xlsWS.Cells.Item[j,5]:=query.FieldByName('FactVolume').AsString;
   xlsWS.Cells.Item[j,6]:=query.FieldByName('FactPlotn').AsString;
   xlsWS.Cells.Item[j,7]:=query.FieldByName('FactTemp').AsString;
   xlsWS.Cells.Item[j,8]:=query.FieldByName('FactWeight').AsString;
   xlsWS.Cells.Item[j,9]:=query.FieldByName('Weight').AsString;
   xlsWS.Cells.Item[j,10]:=query.FieldByName('Summa').AsString;
   xlsWS.Cells.Item[j,11]:=query.FieldByName('TonnaPrice').AsString;
   xlsWS.Cells.Item[j,12]:=query.FieldByName('ShortageWeight').AsString;
   xlsWS.Cells.Item[j,13]:=query.FieldByName('ShortageMoney').AsString;
   xlsWS.Cells.Item[j,14]:=query.FieldByName('PercentRatio').AsString;
   query.Next;
   j:=j+1;
  end;
 //Заполнение итоговыми данными
 query.Close;
 query.SQL.Clear;
 query.SQL.Add(xlsSummaryStatement);
 query.Open;
 query.First;
 xlsWS.Cells.Item[j,1]:='Итого:';
 xlsWS.Cells.Item[j,4]:=query.FieldByName('Volume').AsString;
 xlsWS.Cells.Item[j,5]:=query.FieldByName('FactVolume').AsString;
 xlsWS.Cells.Item[j,8]:=query.FieldByName('FactWeight').AsString;
 xlsWS.Cells.Item[j,9]:=query.FieldByName('Weight').AsString;
 xlsWS.Cells.Item[j,12]:=query.FieldByName('ShortageWeight').AsString;
 xlsWS.Cells.Item[j,13]:=query.FieldByName('ShortageMoney').AsString;
 RangeE:=xlsWS.Range['A'+IntToStr(j),'N'+IntToStr(j)];
 RangeE.Select;
 RangeE.Font.Bold:=True;
 RangeE.Font.Italic:=True;
 RangeE.Font.Size:=10;
 
 MessageDlg('Экспорт данных успешно завершен!!!', mtInformation, [mbOk], 0);
 xls.Visible[0]:=True;
 xls.Disconnect;
 query.Free;
except
 MessageDlg('Ошибка экспорта данных!!!', mtError, [mbOk], 0);
 xls.Disconnect;
 xls.Quit;
 query.Free;
end;

end;

procedure TfrmClientBase.actionNewExecute(Sender: TObject);
begin
 Application.CreateForm(TfrmClientCard, frmClientCard);
 frmClientCard.crFlag:=false;
 frmClientCard.clAccessLevel:=1;
 frmClientCard.ShowModal;
end;

//Открыть карточку выбраного клиента
procedure TfrmClientBase.actionOpenExecute(Sender: TObject);
var
 query:TADOQuery;
 checked:boolean;
begin
if lvList.Items.Count=0 then
  MessageDlg('Список приходов ТМЦ пуст!!!', mtError, [mbOk], 0)
else
  if lvList.Selected.Index<0 then
    MessageDlg('Не выбран приход ТМЦ из списка!!!', mtError, [mbOk], 0)
  else
    begin
      currentKey:=StrToInt(p_key.Strings[lvList.Selected.Index]);
      try
        query:=TADOQuery.Create(nil);
        query.Connection:=DM.ADOConnection1;
        query.SQL.Add('select Checked from dbo.apViewIncomingTMC where ID='+IntToStr(currentKey));
        query.Open;
        checked:=query.FieldByName('Checked').AsBoolean;
      finally
        query.Free
      end;
      if not checked then
        begin
          Application.CreateForm(TfrmClientCard, frmClientCard);
          frmClientCard.crFlag:=true;
          frmClientCard.clID:=currentKey;
          frmClientCard.clAccessLevel:=0;
          frmClientCard.ShowModal;
        end
      else MessageDlg('Информация о данном приходе сырья уже проверена '+
                      'и изменению не подлежит.', mtInformation, [mbOk],0);  
    end;
end;

procedure TfrmClientBase.actionPrintExecute(Sender: TObject);
var
 i:integer;
 stmt, stmtSummary:string;
begin
if ReportTabs.TabIndex=1 then
 begin
  ADOQuery1.Close;
  ADOQuery1.SQL.Clear;
  ADOQuery3.Close;
  ADOQuery3.SQL.Clear;
  stmt:='select * from dbo.apViewReportIncomingTMC where ';
  stmtSummary:='select '+
                'sum(Volume) as volume,'+
                'sum(FactVolume) as factvolume,'+
                'sum(FactWeight) as factweight,'+
                'sum(Weight) as weight,'+
                'sum(ShortageWeight) as shortageweight,'+
                'sum(ShortageMoney) as shortagemoney '+
                'from dbo.apViewReportIncomingTMC where ';
  i:=0;
  while i<=p_key.Count-1 do
   begin
    stmt:=stmt+'(ID='+p_key.Strings[i]+') OR ';
    stmtSummary:=stmtSummary+'(ID='+p_key.Strings[i]+') OR ';
    i:=i+1;
   end;
  Delete(stmt, Length(stmt)-3, 3);
  Delete(stmtSummary, Length(stmtSummary)-3, 3);
  ADOQuery1.SQL.Add(stmt);
  ADOQuery1.Open;
  ADOQuery3.SQL.Add(stmtSummary);
  ADOQuery3.Open;
  ppReport1.PrintReport;
 end
else
 begin
  ADOQuery2.Close;
  ADOQuery2.SQL.Clear;
  stmt:='select * from dbo.apViewIncomingTMC where ';
  i:=0;
  while i<=p_key.Count-1 do
   begin
    stmt:=stmt+'(ID='+p_key.Strings[i]+') OR ';
    i:=i+1;
   end;
  Delete(stmt, Length(stmt)-3, 3);
  ADOQuery2.SQL.Add(stmt);
  ADOQuery2.Open;
  ppReport2.PrintReport;
 end; 
end;

procedure TfrmClientBase.actionRefreshExecute(Sender: TObject);
begin
 ReportTabsChange(Self);
end;

procedure TfrmClientBase.actionRefreshProductsExecute(Sender: TObject);
var
 i,j:integer;
begin
 fillProducts;
 if ppp.Count<>0 then
  for j := 0 to ppp.Count - 1 do 
   for i := 0 to prodID.Count - 1 do
     if ppp.Strings[j]=prodID.Strings[i] then productBox.Checked[i]:=true;
end;

//Запустить посик по базе клиентов
procedure TfrmClientBase.actionShowProductDicExecute(Sender: TObject);
begin
 Application.CreateForm(Tsirie_dic, sirie_dic);
 sirie_dic.ShowModal;
end;

//Добавление условия фильтрации по приоритету
procedure TfrmClientBase.FormCreate(Sender: TObject);
begin
 custID:=TStringList.Create;
 prodID:=TStringList.Create;
 ppp:=TStringList.Create;
 fillCustomers;
 fillProducts;
 dtpStartDate.Date:=now;
 dtpEndDate.Date:=now;
 p_key:=TStringList.Create;
 customersID:=TStringList.Create;
 productsID:=TStringList.Create;
 ReportTabsChange(Self);
 if ((clAccessLevel=0) OR (clAccessLevel=1)) then
  begin
    actionNew.Enabled:=true;
    actionDelete.Enabled:=true;
  end;
end;

procedure TfrmClientBase.fillCustomers;
var
 regions:TADOQuery;
 list:TStringList;
 i:integer;
begin
 list:=TStringList.Create;
 regions:=TADOQuery.Create(nil);
 regions.Connection:=DM.ADOConnection1;
 custID.Clear;
 regions.SQL.Add('select * from dbo.Organizations where ID>0 order by Name');
 try
   regions.Open;
   regions.First;
   while not regions.Eof do
    begin
      custID.Add(IntToStr(regions.Fields[0].AsInteger));
      list.Add(regions.Fields[1].AsString);
      regions.Next;
    end;
   regionsBox.Items.Clear;
   for i:= 0 to List.Count - 1 do
    begin
     regionsBox.Items.Add(list.Strings[i]);
    end;
 except

 end;
 regions.Free;
 list.Free;
end;

procedure TfrmClientBase.fillProducts;
var
 products:TADOQuery;
 list:TStringList;
 i:integer;
begin
 list:=TStringList.Create;
 products:=TADOQuery.Create(nil);
 products.Connection:=dm.ADOConnection1;
 list.Clear;
 prodID.Clear;
 products.SQL.Add('select * from dbo.mat_dic where mat_id>0');
 try
  products.Open;
  products.First;
  while not products.Eof do
    begin
      prodID.Add(products.Fields[0].AsString);
      list.Add(products.Fields[1].AsString);
      products.Next;
    end;
  productBox.Clear;
  for i:= 0 to List.Count - 1 do
    begin
     productBox.Items.Add(list.Strings[i]);
    end;
 finally
  list.Free;
  products.Free;
 end;
end;

procedure TfrmClientBase.lvListCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
if Item.SubItems[11]<>'_' then
 lvList.Canvas.Brush.Color:=clGreen
else
 lvList.Canvas.Brush.Color:=clYellow;
end;

procedure TfrmClientBase.lvListSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
 if Selected then
  currentKey:=StrToInt(p_key.Strings[Item.Index]);
end;

procedure TfrmClientBase.ReportTabsChange(Sender: TObject);
var
 stmt:string;
begin
 if ReportTabs.TabIndex=0 then
  begin
    stmt:='select * from dbo.apViewIncomingTMC';
    actionExport.Enabled:=False;
  end;
 if ReportTabs.TabIndex=1 then
  begin
   stmt:='select * from dbo.apViewReportIncomingTMC';
   actionExport.Enabled:=True;
  end;
 BuildStatement(stmt);
end;

procedure TfrmClientBase.reportViewCustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
if Item.SubItems[14]='False' then
 reportView.Canvas.Brush.Color:=clYellow
else
 reportView.Canvas.Brush.Color:=clWhite;
end;

procedure TfrmClientBase.productBoxClickCheck(Sender: TObject);
var
 i,j:integer;
 query:TADOQuery;
 Stmt:string;
begin
 productsID.Clear;
 ppp.Clear;
 i:=0;
 while i<productBox.Items.Count-1 do
  begin
    if productBox.Checked[i] then ppp.Add(prodID.Strings[i]);
    i:=i+1;
  end;
 if ppp.Count<>0 then
  begin 
   query:=TADOQuery.Create(nil);
   query.Connection:=dm.ADOConnection1;
   j:=0;
   if ppp.Count=1 then Stmt:=Stmt+'select mat_id from dbo.apViewIncomingTMC where mat_id='+ppp.Strings[j];
   if ppp.Count>1 then
    begin
     Stmt:=Stmt+'select Mat_ID from dbo.apViewIncomingTMC where (';
     while j<=ppp.Count-1 do
      begin
       Stmt:=Stmt+'Mat_ID='+ppp.Strings[j]+' OR ';
       j:=j+1;
      end;
     Delete(Stmt, Length(Stmt)-3, 3);
     Stmt:=Stmt+')';
    end;
   try
    query.SQL.Add(Stmt);
    query.open;
    query.First;
    productsID.Clear;
    if query.RecordCount<>0 then
     begin
      query.First;
      while not query.Eof do
       begin
        productsID.Add('Mat_ID='+IntToStr(query.Fields[0].AsInteger));
        query.Next;
       end;
     end
    else productsID.Add('Mat_ID=0');
     ReportTabsChange(Self);
   finally
    query.free;
   end;
  end
 else ReportTabsChange(Self); 
end;

procedure TfrmClientBase.DateFilterClick(Sender: TObject);
begin
 if DateFilter.ItemIndex=1 then dtpEndDate.Enabled:=True
 else dtpEndDate.Enabled:=False;
 ReportTabsChange(Self);
end;

procedure TfrmClientBase.regionsBoxClickCheck(Sender: TObject);
var
 i:integer;
begin
 customersID.Clear;
 i:=0;
 while i<regionsBox.Items.Count-1 do
  begin
   if regionsBox.Checked[i] then
    customersID.Add('Consumer='+custID.Strings[i]);
    i:=i+1;
  end;
  ReportTabsChange(Self);
end;

procedure TfrmClientBase.buildStatement(SQL:String);
var
 i,j,k:integer;
 SQLStmt, summary:String;
begin
 SQLStmt:=SQL;
 summary:='select '+
                'sum(Volume) as volume,'+
                'sum(FactVolume) as factvolume,'+
                'sum(FactWeight) as factweight,'+
                'sum(Weight) as weight,'+
                'sum(ShortageWeight) as shortageweight,'+
                'sum(ShortageMoney) as shortagemoney '+
                'from dbo.apViewReportIncomingTMC ';
 i:=productsID.Count;
 j:=customersID.Count;
 //динамическое построение запроса для фильтрации приходов
 if j<>0 then //если выбраны контрагенты
  begin
   SQLStmt:=SQLStmt+' where ';
   summary:=summary+' where ';
   k:=0;
   if customersID.Count=1 then
    begin
      SQLStmt:=SQLStmt+customersID.Strings[k];
      summary:=summary+customersID.Strings[k];
    end
   else
    begin
     SQLStmt:=SQLStmt+'(';
     summary:=summary+'(';
     while k<=customersID.Count-1 do
      begin
       SQLStmt:=SQLStmt+customersID.Strings[k]+' OR ';
       summary:=summary+customersID.Strings[k]+' OR ';
       k:=k+1;
      end;
     Delete(SQLStmt, Length(SQLStmt)-3, 3);
     Delete(summary, Length(summary)-3, 3);
     SQLStmt:=SQLStmt+')';
     summary:=summary+')';
    end;
  end;

 if i<>0 then //выбрана ТМЦ
  begin
   if (j=0) then //не выбран контрагент
    begin
      SQLStmt:=SQLStmt+' where ';
      summary:=summary+' where ';
    end
   else
    begin
     SQLStmt:=SQLStmt+' AND '; //выбран контрагент
     summary:=summary+' AND '; //выбран контрагент
    end;
   k:=0;
   if productsID.Count=1 then
    begin
     SQLStmt:=SQLStmt+productsID.Strings[k];
     summary:=summary+productsID.Strings[k];
    end
   else
    begin
     SQLStmt:=SQLStmt+'(';
     summary:=summary+'(';
     while k<=productsID.Count-1 do
      begin
       SQLStmt:=SQLStmt+productsID.Strings[k]+' OR ';
       summary:=summary+productsID.Strings[k]+' OR ';
       k:=k+1;
      end;
     Delete(SQLStmt, Length(SQLStmt)-3, 3);
     Delete(summary, Length(summary)-3, 3);
     SQLStmt:=SQLStmt+')';
     summary:=summary+')';
    end;
  end;

 if useDateFilter then
  begin
   if i=0 then
    if j=0 then
     begin
      SQLStmt:=SQLStmt+' where ';
      summary:=summary+' where ';
     end;
   if (i<>0) OR (j<>0) then
    begin
     SQLStmt:=SQLStmt+' AND ';
     summary:=summary+' AND ';
    end;
   if DateFilter.ItemIndex=0 then
    begin
     SQLStmt:=SQLStmt+' (OutDate = '''+DateToStr(dtpStartDate.Date)+''')';
     summary:=summary+' (OutDate = '''+DateToStr(dtpStartDate.Date)+''')';
    end
   else
    begin
     SQLStmt:=SQLStmt+' (OutDate between '''+DateToStr(dtpStartDate.Date)+''' AND '''+DateToStr(dtpEndDate.Date)+''')';
     summary:=summary+' (OutDate between '''+DateToStr(dtpStartDate.Date)+''' AND '''+DateToStr(dtpEndDate.Date)+''')';
    end;
  end;
 xlsStatement:=SQLStmt;
 xlsSummaryStatement:=summary;
 fillListView(SQLStmt);
end;

procedure TfrmClientBase.cbDateFilterUseClick(Sender: TObject);
begin
 useDateFilter:=cbDateFilterUse.Checked;
 DateFilter.Enabled:=useDateFilter;
 GroupBox3.Enabled:=useDateFilter;
 DateFilterClick(Self);
end;

procedure TfrmClientBase.fillListView(Stmt:String);
var
 materials:TADOQuery;
 li:TListItem;
 count:integer;
begin
 StatusBar1.Panels[0].Text:='Поиск...';
 StatusBar1.Panels[1].Text:='Обработка базы приходов...';
 materials:=TADOQuery.Create(nil);
 materials.Connection:=dm.ADOConnection1;
 materials.SQL.Clear;
 materials.SQL.Add(Stmt);
 materials.Open;
 count:=0;
 p_key.Clear;
 if ReportTabs.TabIndex=0 then
  begin
   lvList.Items.Clear;
   while not materials.Eof do
    begin
     p_key.Add(materials.FieldByName('ID').AsString);
     li:=lvList.Items.Add;
     li.Caption:=materials.FieldByName('InDate').AsString;
     li.SubItems.Add(materials.FieldByName('OutDate').AsString);
     li.SubItems.Add(materials.FieldByName('InTime').AsString);
     li.SubItems.Add(materials.FieldByName('ConsumerName').AsString);
     li.SubItems.Add(materials.FieldByName('mat_name').AsString);
     li.SubItems.Add(materials.FieldByName('Volume').AsString);
     li.SubItems.Add(materials.FieldByName('DriverName').AsString);
     li.SubItems.Add(materials.FieldByName('Tank_Name').AsString);
     li.SubItems.Add(materials.FieldByName('FactVolume').AsString);
     li.SubItems.Add(materials.FieldByName('FactPlotn').AsString);
     li.SubItems.Add(materials.FieldByName('FactTemp').AsString);
     li.SubItems.Add(materials.FieldByName('FactWeight').AsString);
     li.SubItems.Add(materials.FieldByName('FactTime').AsString);
     li.SubItems.Add(materials.FieldByName('Weight').AsString);
     li.SubItems.Add(materials.FieldByName('Notes').AsString);
     materials.Next;
     count:=count+1;
   end;
  end
 else
  begin
   reportView.Items.Clear;
   while not materials.Eof do
    begin
     p_key.Add(materials.FieldByName('ID').AsString);
     li:=reportView.Items.Add;
     li.Caption:=materials.FieldByName('OutDate').AsString;
     li.SubItems.Add(materials.FieldByName('ConsumerName').AsString);
     li.SubItems.Add(materials.FieldByName('mat_name').AsString);
     li.SubItems.Add(materials.FieldByName('Volume').AsString);
     li.SubItems.Add(materials.FieldByName('FactVolume').AsString);
     li.SubItems.Add(materials.FieldByName('FactPlotn').AsString);
     li.SubItems.Add(materials.FieldByName('FactTemp').AsString);
     li.SubItems.Add(materials.FieldByName('FactWeight').AsString);
     li.SubItems.Add(materials.FieldByName('Weight').AsString);
     li.SubItems.Add(materials.FieldByName('Summa').AsString);
     li.SubItems.Add(materials.FieldByName('TonnaPrice').AsString);
     li.SubItems.Add(materials.FieldByName('ShortageWeight').AsString);
     li.SubItems.Add(materials.FieldByName('ShortageMoney').AsString);
     li.SubItems.Add(materials.FieldByName('SubWeight').AsString);
     li.SubItems.Add(materials.FieldByName('PercentRatio').AsString);
     li.SubItems.Add(materials.FieldByName('Checked').AsString);
     materials.Next;
     count:=count+1;
   end;
  end;
//  lvClientList.ItemIndex:=0;
 materials.Free;
 StatusBar1.Panels[0].Text:='Найдено '+inttostr(count)+' приходов';
 StatusBar1.Panels[1].Text:='Обработка базы завершена.';
end;

end.

unit uClientCard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, Buttons, ActnList, ADODB, uDM, DBCtrls, DB,
  ppCtrls, ppTableGrid, ppStrtch, ppPrnabl, ppClass, ppBands, ppDB, ppDBPipe,
  ppCache, ppDesignLayer, ppParameter, ppComm, ppRelatv, ppProd, ppReport,
  myChkBox, ComCtrls;

type
  TfrmClientCard = class(TForm)
    btnEdit: TBitBtn;
    btnClear: TBitBtn;
    btnSave: TBitBtn;
    btnClose: TBitBtn;
    ActionList1: TActionList;
    actionClose: TAction;
    actionEdit: TAction;
    actionClear: TAction;
    actionSave: TAction;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    cbCustomer: TDBLookupComboBox;
    cbMaterial: TDBLookupComboBox;
    leVolume: TLabeledEdit;
    leDriver: TLabeledEdit;
    Label5: TLabel;
    leFactVolume: TLabeledEdit;
    lePlotn: TLabeledEdit;
    leFactTemper: TLabeledEdit;
    leFactWeight: TLabeledEdit;
    leDocuments: TLabeledEdit;
    dtpInDate: TDateTimePicker;
    dtpFactTime: TDateTimePicker;
    dtpOutDate: TDateTimePicker;
    cbTanks: TDBLookupComboBox;
    Label6: TLabel;
    leTonnaPrice: TLabeledEdit;
    Label7: TLabel;
    mNotes: TMemo;
    cbChecked: TCheckBox;
    Label8: TLabel;
    dtpInTime: TMaskEdit;
    procedure actionCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbCustomerCloseUp(Sender: TObject);
    procedure leDriverChange(Sender: TObject);
    procedure actionEditExecute(Sender: TObject);
    procedure actionClearExecute(Sender: TObject);
    procedure leVolumeChange(Sender: TObject);
    procedure actionSaveExecute(Sender: TObject);
    procedure cbMaterialCloseUp(Sender: TObject);
    procedure dtpInDateCloseUp(Sender: TObject);
    procedure dtpFactTimeChange(Sender: TObject);
    procedure dtpOutDateCloseUp(Sender: TObject);
    procedure cbTanksCloseUp(Sender: TObject);
    procedure lePlotnChange(Sender: TObject);
    procedure leFactVolumeChange(Sender: TObject);
    procedure leFactWeightChange(Sender: TObject);
    procedure leFactTemperChange(Sender: TObject);
    procedure leDocumentsChange(Sender: TObject);
    procedure leTonnaPriceChange(Sender: TObject);
    procedure cbCustomerKeyPress(Sender: TObject; var Key: Char);
    procedure cbMaterialKeyPress(Sender: TObject; var Key: Char);
    procedure cbTanksKeyPress(Sender: TObject; var Key: Char);
    procedure mNotesChange(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure dtpInTimeExit(Sender: TObject);
    procedure cbCheckedClick(Sender: TObject);
  private
    { Private declarations }
    procedure InitData;
    procedure OpenClientCard(ID:longint);
    procedure NewClientCard;
    procedure FillCustomer;
    procedure FillMaterial;
    procedure FillTank;
    procedure ClearFields;
    procedure FillFields(ID:integer);
    procedure InsertNewClient;
    procedure UpdateExistingClient;
    procedure ExecuteClientProc(sp_name:string);
    procedure ExecuteAddClientProc(sp_name:string);
  public
    { Public declarations }
    crFlag: boolean; //1 - edit; 0 - new
    clID: longint;
    clAccessLevel:integer;
  end;

type
      Incoming=record
        ID:longint;
        InDate:string;
        InTime:string;
        FactTime:string;
        Customer:integer;
        Material:integer;
        Volume:real;
        Driver:string;
        OutDate:string;
        Tank:integer;
        FactPlotn:real;
        FactVolume:real;
        FactWeight:real;
        FactTemper:real;
        Documents:real;
        TonnaPrice:real;
        Notes:string;
        Checked:boolean;
      end;
var
  frmClientCard: TfrmClientCard;
  customerQuery, materialQuery, tankQuery: TADOQuery;
  clientQuery:TADOQuery;
  materialDS, clientDS, tankDS: TDataSource;
  clientData:Incoming;

implementation

uses uClientBase;

{$R *.dfm}

procedure TfrmClientCard.actionClearExecute(Sender: TObject);
begin
 ClearFields;
end;

procedure TfrmClientCard.ClearFields;
begin
 dtpInDate.Date:=Now;
 dtpFactTime.Time:=Now;
 dtpInTime.Text:='_';
 leVolume.Text:='1';
 leDriver.Text:='_';
 dtpOutDate.Date:=Now;
 lePlotn.Text:='0.1';
 leFactVolume.Text:='1';
 leFactWeight.Text:='1';
 cbCustomer.KeyValue:=0;
 cbMaterial.KeyValue:=0;
 cbTanks.KeyValue:=0;
 leFactTemper.Text:='1';
 leDocuments.Text:='1';
 mNotes.Text:='_';
 cbChecked.Checked:=false;
 InitData;
end;

procedure TfrmClientCard.dtpInDateCloseUp(Sender: TObject);
begin
 if ((clAccessLevel=3) OR (clAccessLevel=0)) OR ((crFlag=true) AND (clientData.InDate<>'_')) then
   clientData.InDate:=DateToStr(dtpInDate.Date)
 else
   clientData.InDate:='_';
end;

procedure TfrmClientCard.dtpInTimeExit(Sender: TObject);
begin
 clientData.InTime:=dtpInTime.Text;
end;

procedure TfrmClientCard.dtpFactTimeChange(Sender: TObject);
begin
 if ((clAccessLevel=3) OR (clAccessLevel=0)) OR ((crFlag=true) AND (clientData.FactTime<>'_')) then
   clientData.FactTime:=TimeToStr(dtpFactTime.Time)
 else
   clientData.FactTime:='_';
end;

procedure TfrmClientCard.dtpOutDateCloseUp(Sender: TObject);
begin
 clientData.OutDate:=DateToStr(dtpOutDate.Date);
end;

procedure TfrmClientCard.InitData;
begin
 dtpInDateCloseUp(Self);
 dtpInTimeExit(Self);
 dtpFactTimeChange(Self);
 cbCustomerCloseUp(Self);
 cbMaterialCloseUp(Self);
 leVolumeChange(Self);
 leDriverChange(Self);
 dtpOutDateCloseUp(Self);
 cbTanksCloseUp(Self);
 lePlotnChange(Self);
 leFactVolumeChange(Self);
 leFactWeightChange(Self);
 leFactTemperChange(Self);
 leDocumentsChange(Self);
 mNotesChange(Self);
 //cbCheckedClick(Self);
end;

procedure TfrmClientCard.FillFields(ID: Integer);
var
 customerID, materialID, tankID: integer;
begin
// clientDS.DataSet:=clientQuery;
 clientQuery.SQL.Clear;
 clientQuery.SQL.Add('select * from dbo.apViewIncomingTMC where ID='+IntToStr(ID));
 clientQuery.Open;
 if clientQuery.RecordCount<>0 then
  begin
    clientQuery.First;

    if (clientQuery.FieldByName('InDate').AsString<>'_') then
        dtpInDate.Date:=StrToDate(clientQuery.FieldByName('InDate').AsString)
    else
        clientData.InDate:='_';
    if (clientQuery.FieldByName('FactTime').AsString<>'_') then
        dtpFactTime.Time:=StrToTime(clientQuery.FieldByName('FactTime').AsString)
    else
        clientData.FactTime:='_';
    dtpInTime.Text:=clientQuery.FieldByName('InTime').AsString;
    customerID:=clientQuery.FieldByName('Consumer').AsInteger;
    materialID:=clientQuery.FieldByName('mat_id').AsInteger;
    tankID:=clientQuery.FieldByName('TankId').AsInteger;
    cbCustomer.KeyValue:= customerID;
    cbMaterial.KeyValue:= materialID;
    cbTanks.KeyValue:=tankID;
    leDriver.Text:=clientQuery.FieldByName('DriverName').AsString;
    dtpOutDate.Date:=StrToDate(clientQuery.FieldByName('OutDate').AsString);
    lePlotn.Text:=FloatToStrF(clientQuery.FieldByName('FactPlotn').AsFloat, ffFixed, 4,3);
    leVolume.Text:=FloatToStr(clientQuery.FieldByName('Volume').AsFloat);
    leFactVolume.Text:=FloatToStr(clientQuery.FieldByName('FactVolume').AsFloat);
    leFactWeight.Text:=FloatToStr(clientQuery.FieldByName('FactWeight').AsFloat);
    leFactTemper.Text:=FloatToStr(clientQuery.FieldByName('FactTemp').AsFloat);
    leDocuments.Text:=FloatToStr(clientQuery.FieldByName('Weight').AsFloat);
    mNotes.Text:=clientQuery.FieldByName('Notes').AsString;
    clientQuery.SQL.Clear;
    clientQuery.SQL.Add('select * from dbo.apViewReportIncomingTMC where ID='+IntToStr(ID));
    clientQuery.Open;
    if clientQuery.RecordCount<>0 then
     leTonnaPrice.Text:=FloatToStr(clientQuery.FieldByName('TonnaPrice').AsFloat)
    else leTonnaPrice.Text:=FloatToStr(0);
    clientData.Customer:=customerID;
    clientData.Material:=materialID;
    clientData.Tank:=tankID;
    cbChecked.Checked:=clientQuery.FieldByName('Checked').AsBoolean;
    clientData.Checked:=cbChecked.Checked;
  end;
end;

procedure TfrmClientCard.actionCloseExecute(Sender: TObject);
begin
 close;
end;

procedure TfrmClientCard.FormCreate(Sender: TObject);
begin
 customerQuery:=TADOQuery.Create(nil);
 materialQuery:=TADOQuery.Create(nil);
 tankQuery:=TADOQuery.Create(nil);
 clientQuery:=TADOQuery.Create(nil);
 clientQuery.Connection:=dm.ADOConnection1;
 customerQuery.Connection:=dm.ADOConnection1;
 materialQuery.Connection:=dm.ADOConnection1;
 tankQuery.Connection:=dm.ADOConnection1;
 materialDS:=TDataSource.Create(nil);
 clientDS:=TDataSource.Create(nil);
 tankDS:=TDataSource.Create(nil);
 cbMaterial.ListSource:=materialDS;
 cbCustomer.ListSource:=clientDS;
 cbTanks.ListSource:=tankDS;
end;

procedure TfrmClientCard.FormShow(Sender: TObject);
begin
 if crFlag then
  begin
   OpenClientCard(clID)
  end
 else NewClientCard;
 GroupBox1.Enabled:=not crFlag;
end;

procedure TfrmClientCard.leFactTemperChange(Sender: TObject);
begin
try
 if leFactTemper.Text<>'' then clientData.FactTemper:=StrToFloat(leFactTemper.Text)
 else clientData.FactTemper:=1;
except

end;
end;

procedure TfrmClientCard.leFactVolumeChange(Sender: TObject);
begin
try
 if leFactVolume.Text<>'' then clientData.FactVolume:=StrToFloat(leFactVolume.Text)
 else clientData.FactVolume:=1;
except

end;
end;

procedure TfrmClientCard.leFactWeightChange(Sender: TObject);
begin
try
 if leFactWeight.Text<>'' then clientData.FactWeight:=StrToFloat(leFactWeight.Text)
 else clientData.FactWeight:=1;
except

end;
end;

procedure TfrmClientCard.lePlotnChange(Sender: TObject);
begin
try
 if lePlotn.Text<>'' then clientData.FactPlotn:=StrToFloat(lePlotn.Text)
 else clientData.FactPlotn:=0.1;
except

end;
end;

procedure TfrmClientCard.leTonnaPriceChange(Sender: TObject);
begin
try
 if leTonnaPrice.Text<>'' then clientData.TonnaPrice:=StrToFloat(leTonnaPrice.Text)
 else clientData.TonnaPrice:=1;
except

end;
end;

procedure TfrmClientCard.leVolumeChange(Sender: TObject);
begin
try
 if leVolume.Text<>'' then clientData.Volume:=StrToFloat(leVolume.Text)
 else clientData.Volume:=1;
except

end;
end;

procedure TfrmClientCard.mNotesChange(Sender: TObject);
begin
 if mNotes.Text<>'' then clientData.Notes:=mNotes.Text
 else clientData.Notes:='_';
end;

procedure TfrmClientCard.leDocumentsChange(Sender: TObject);
begin
try
 if leDocuments.Text<>'' then clientData.Documents:=StrToFloat(leDocuments.Text)
 else clientData.Documents:=1;
except

end;
end;

procedure TfrmClientCard.leDriverChange(Sender: TObject);
begin
  if leDriver.Text<>'' then clientData.Driver:=leDriver.Text
  else clientData.Driver:='_';
end;

procedure TfrmClientCard.OpenClientCard(ID: Integer);
begin
 FillCustomer;
 FillMaterial;
 FillTank;
 clientData.ID:=ID;
 FillFields(ID);
 InitData;
end;

procedure TfrmClientCard.NewClientCard;
begin
 ClearFields;
 FillCustomer;
 FillMaterial;
 FillTank;
 cbCustomer.KeyValue:=0;
 cbMaterial.KeyValue:=0;
 cbTanks.KeyValue:=0;
end;

procedure TfrmClientCard.actionEditExecute(Sender: TObject);
begin
 GroupBox1.Enabled:=True;
 actionSave.Enabled:=true;
 case clAccessLevel of
 0:begin
   dtpInDate.Enabled:=true;
   dtpInTime.Enabled:=true;
   cbCustomer.Enabled:=true;
   cbMaterial.Enabled:=true;
   leVolume.Enabled:=true;
   leDriver.Enabled:=true;
   dtpOutDate.Enabled:=true;
   cbTanks.Enabled:=true;
   lePlotn.Enabled:=true;
   leFactVolume.Enabled:=true;
   leFactWeight.Enabled:=true;
   leFactTemper.Enabled:=true;
   leDocuments.Enabled:=true;
   leTonnaPrice.Enabled:=true;
   mNotes.Enabled:=true;
   if not clientData.Checked then cbChecked.Enabled:=true;
 end;
 1:begin   //3-6
   dtpInDate.Enabled:=false;
   dtpInTime.Enabled:=false;
   cbCustomer.Enabled:=true;
   cbMaterial.Enabled:=true;
   leVolume.Enabled:=true;
   leDriver.Enabled:=true;
   dtpOutDate.Enabled:=false;
   cbTanks.Enabled:=false;
   lePlotn.Enabled:=false;
   leFactVolume.Enabled:=false;
   leFactWeight.Enabled:=false;
   leFactTemper.Enabled:=false;
   leDocuments.Enabled:=false;
   leTonnaPrice.Enabled:=false;
   mNotes.Enabled:=false;
   if not clientData.Checked then cbChecked.Enabled:=true;
 end;
 2:begin  //8-12
   dtpInDate.Enabled:=false;
   dtpInTime.Enabled:=false;
   cbCustomer.Enabled:=false;
   cbMaterial.Enabled:=false;
   leVolume.Enabled:=false;
   leDriver.Enabled:=false;
   dtpOutDate.Enabled:=false;
   cbTanks.Enabled:=true;
   lePlotn.Enabled:=true;
   leFactVolume.Enabled:=true;
   leFactWeight.Enabled:=true;
   leFactTemper.Enabled:=true;
   leDocuments.Enabled:=false;
   leTonnaPrice.Enabled:=false;
   mNotes.Enabled:=false;
   cbChecked.Enabled:=false;
 end;
 3:begin   //1-2
   dtpInDate.Enabled:=true;
   dtpInTime.Enabled:=true;
   cbCustomer.Enabled:=false;
   cbMaterial.Enabled:=false;
   leVolume.Enabled:=false;
   leDriver.Enabled:=false;
   dtpOutDate.Enabled:=false;
   cbTanks.Enabled:=false;
   lePlotn.Enabled:=false;
   leFactVolume.Enabled:=false;
   leFactWeight.Enabled:=false;
   leFactTemper.Enabled:=false;
   leDocuments.Enabled:=false;
   leTonnaPrice.Enabled:=false;
   mNotes.Enabled:=false;
   cbChecked.Enabled:=false;
 end;
 4:begin  //13
   dtpInDate.Enabled:=false;
   dtpInTime.Enabled:=false;
   cbCustomer.Enabled:=false;
   cbMaterial.Enabled:=false;
   leVolume.Enabled:=false;
   leDriver.Enabled:=false;
   dtpOutDate.Enabled:=false;
   cbTanks.Enabled:=false;
   lePlotn.Enabled:=false;
   leFactVolume.Enabled:=false;
   leFactWeight.Enabled:=false;
   leFactTemper.Enabled:=false;
   leDocuments.Enabled:=true;
   leTonnaPrice.Enabled:=false;
   mNotes.Enabled:=false;
   cbChecked.Enabled:=false;
 end;
 5:begin
   dtpInDate.Enabled:=false;
   dtpInTime.Enabled:=false;
   cbCustomer.Enabled:=false;
   cbMaterial.Enabled:=false;
   leVolume.Enabled:=false;
   leDriver.Enabled:=false;
   dtpOutDate.Enabled:=false;
   cbTanks.Enabled:=false;
   lePlotn.Enabled:=false;
   leFactVolume.Enabled:=false;
   leFactWeight.Enabled:=false;
   leFactTemper.Enabled:=false;
   leDocuments.Enabled:=false;
   leTonnaPrice.Enabled:=false;
   mNotes.Enabled:=false;
   cbChecked.Enabled:=false;
 end;
 6:begin //7
   dtpInDate.Enabled:=false;
   dtpInTime.Enabled:=false;
   cbCustomer.Enabled:=false;
   cbMaterial.Enabled:=false;
   leVolume.Enabled:=false;
   leDriver.Enabled:=false;
   dtpOutDate.Enabled:=true;
   cbTanks.Enabled:=false;
   lePlotn.Enabled:=false;
   leFactVolume.Enabled:=false;
   leFactWeight.Enabled:=false;
   leFactTemper.Enabled:=false;
   leDocuments.Enabled:=false;
   leTonnaPrice.Enabled:=false;
   mNotes.Enabled:=false;
   cbChecked.Enabled:=false;
 end;
 7:begin
   dtpInDate.Enabled:=false;
   dtpInTime.Enabled:=false;
   cbCustomer.Enabled:=false;
   cbMaterial.Enabled:=false;
   leVolume.Enabled:=false;
   leDriver.Enabled:=false;
   dtpOutDate.Enabled:=false;
   cbTanks.Enabled:=false;
   lePlotn.Enabled:=false;
   leFactVolume.Enabled:=false;
   leFactWeight.Enabled:=false;
   leFactTemper.Enabled:=false;
   leDocuments.Enabled:=false;
   leTonnaPrice.Enabled:=false;
   mNotes.Enabled:=false;
   cbChecked.Enabled:=false;
 end;
 end;
end;

procedure TfrmClientCard.actionSaveExecute(Sender: TObject);
begin
 //1-edit, 0-new
 if crFlag then UpdateExistingClient
 else InsertNewClient;
 frmClientBase.actionRefreshExecute(nil);
 close;
end;

procedure TfrmClientCard.InsertNewClient;
var
 q:TADOQuery;
begin
 q:=TADOQuery.Create(nil);
 q.Connection:=dm.ADOConnection1;
 q.SQL.Add('select max(id) from dbo.apIncomingTMC');
 q.Open;
 if q.RecordCount<>0 then
  begin
    q.First;
    clientData.ID:=q.Fields[0].AsInteger+1;
  end
 else
  clientData.ID:=0;
 try
   dm.ADOConnection1.BeginTrans;
   ExecuteClientProc('dbo.addIncomingTMC');
   //ExecuteAddClientProc('dbo.addReportIncomingTMC');
   dm.ADOConnection1.CommitTrans;
   MessageDlg('Данные о приходе ТМЦ успешно сохранены.', mtConfirmation, [mbOk], 0);
   crFlag:=true;
 except
   dm.ADOConnection1.RollbackTrans;
   MessageDlg('Данные о приходе ТМЦ не сохранены.', mtError, [mbOk], 0);
 end;
 q.Free;
end;

procedure TfrmClientCard.Label2Click(Sender: TObject);
begin

end;

//Запуск процедур вставки-обновления таблицы клиентов
procedure TfrmClientCard.ExecuteClientProc(sp_name: string);
var
 sp:TADOQuery;
begin
 sp:=TADOQuery.Create(nil);
 sp.Connection:=dm.ADOConnection1;
 sp.SQL.Add('exec '+sp_name+' ');
 sp.SQL.Add(IntToStr(clientData.ID)+',');
 sp.SQL.Add('"'+clientData.InDate+'",');
 sp.SQL.Add('"'+clientData.InTime+'",');
 sp.SQL.Add(IntToStr(clientData.Customer)+',');
 sp.SQL.Add(IntToStr(clientData.Material)+',');
 sp.SQL.Add(FloatToStr(clientData.Volume)+',');
 sp.SQL.Add('"'+clientData.Driver+'",');
 sp.SQL.Add(IntToStr(clientData.Tank)+',');
 sp.SQL.Add('"'+clientData.OutDate+'",');
 sp.SQL.Add(FloatToStr(clientData.FactVolume)+',');
 sp.SQL.Add(FloatToStr(clientData.FactPlotn)+',');
 sp.SQL.Add(FloatToStr(clientData.FactTemper)+',');
 sp.SQL.Add(FloatToStr(clientData.FactWeight)+',');
 sp.SQL.Add(FloatToStr(clientData.Documents)+',');
 sp.SQL.Add('"'+clientData.Notes+'",');
 sp.SQL.Add('"'+clientData.FactTime+'",');
 sp.SQL.Add(BoolToStr(clientData.Checked));
 sp.ExecSQL;
 sp.free;
end;

//Запуск процедур вставки-обновления таблицы клиентов (доп. данные)
procedure TfrmClientCard.ExecuteAddClientProc(sp_name: string);
var
 sp:TADOQuery;
begin
 sp:=TADOQuery.Create(nil);
 sp.Connection:=dm.ADOConnection1;
 sp.SQL.Add('exec '+sp_name+' ');
 sp.SQL.Add(IntToStr(clientData.ID)+',');
 sp.SQL.Add('"'+clientData.OutDate+'",');
 sp.SQL.Add(IntToStr(clientData.Customer)+',');
 sp.SQL.Add(IntToStr(clientData.Material)+',');
 sp.SQL.Add(FloatToStr(clientData.Volume)+',');
 sp.SQL.Add(FloatToStr(clientData.FactVolume)+',');
 sp.SQL.Add(FloatToStr(clientData.FactPlotn)+',');
 sp.SQL.Add(FloatToStr(clientData.FactTemper)+',');
 sp.SQL.Add(FloatToStr(clientData.FactWeight)+',');
 sp.SQL.Add(FloatToStr(clientData.Documents)+',');
 sp.SQL.Add(FloatToStr(clientData.TonnaPrice)+',');
 sp.SQL.Add(BoolToStr(clientData.Checked));
 sp.ExecSQL;
 sp.free;
end;


procedure TfrmClientCard.UpdateExistingClient;
var
 query:TADOQuery;
begin
try
   dm.ADOConnection1.BeginTrans;
   ExecuteClientProc('dbo.updateIncomingTMC');
   if ((clAccessLevel=4) OR (clAccessLevel=0)) AND (clientData.Documents<>0.0) then
    begin
     query:=TADOQuery.Create(nil);
     query.Connection:=DM.ADOConnection1;
     query.SQL.Add('select * from dbo.apReportIncomingTMC where ID='+IntToStr(clientData.ID));
     query.Open;
     if query.RecordCount=0 then ExecuteAddClientProc('dbo.addReportIncomingTMC')
     else ExecuteAddClientProc('dbo.updateReportIncomingTMC');
     query.Free;
    end;
   dm.ADOConnection1.CommitTrans;
   MessageDlg('Данные о приходе ТМЦ успешно сохранены.', mtConfirmation, [mbYes, mbNo], 0);
   crFlag:=true;
 except
   MessageDlg('Некорректные данные. Данные о приходе ТМЦ не сохранены.', mtError, [mbYes, mbNo], 0);
   dm.ADOConnection1.RollbackTrans;
 end;
end;

procedure TfrmClientCard.cbMaterialCloseUp(Sender: TObject);
begin
 clientData.Material:=cbMaterial.KeyValue;
end;

procedure TfrmClientCard.cbMaterialKeyPress(Sender: TObject; var Key: Char);
begin
 cbMaterialCloseUp(Sender);
end;

procedure TfrmClientCard.cbTanksCloseUp(Sender: TObject);
begin
 clientData.Tank:=cbTanks.KeyValue;
end;

procedure TfrmClientCard.cbTanksKeyPress(Sender: TObject; var Key: Char);
begin
 cbTanksCloseUp(Sender);
end;

procedure TfrmClientCard.cbCheckedClick(Sender: TObject);
begin
   if cbChecked.Checked then
    if MessageDlg('После подтверждения проверки данных '+
                  'дальнейшее изменение данных будет невозможно. '+
                  'Вы подтверждаете, что данные проверены?',mtConfirmation, [mbYes, mbNo], 0)=mrYes then
      begin
       //cbChecked.Checked:=true;
       clientData.Checked:=cbChecked.Checked;
       cbChecked.Enabled:=False;
       GroupBox1.Enabled:=False;
       btnClear.Enabled:=False;
       btnSave.Enabled:=False;
       actionSaveExecute(Self);
      end
      else cbChecked.Checked:=false;
end;

procedure TfrmClientCard.cbCustomerCloseUp(Sender: TObject);
begin
 clientData.Customer:=cbCustomer.KeyValue;
end;

procedure TfrmClientCard.cbCustomerKeyPress(Sender: TObject; var Key: Char);
begin
 cbCustomerCloseUp(Self);
end;

procedure TfrmClientCard.FillCustomer;
begin
 customerQuery.SQL.Clear;
 customerQuery.SQL.Add('select * from dbo.Organizations order by ID');
 customerQuery.Open;
 clientDS.DataSet:=customerQuery;
 cbCustomer.ListField:='name';
 cbCustomer.KeyField:='id';
end;

procedure TfrmClientCard.FillMaterial;
begin
 materialQuery.SQL.Clear;
 materialQuery.SQL.Add('select * from dbo.mat_dic order by mat_id');
 materialQuery.Open;
 materialDS.DataSet:=materialQuery;
 cbMaterial.ListField:='mat_name';
 cbMaterial.KeyField:='mat_id';
end;

procedure TfrmClientCard.FillTank;
begin
 tankQuery.SQL.Clear;
 tankQuery.SQL.Add('select * from dbo.tank_dic order by tank_id');
 tankQuery.Open;
 tankDS.DataSet:=tankQuery;
 cbTanks.ListField:='tank_name';
 cbTanks.KeyField:='tank_id';
end;

end.

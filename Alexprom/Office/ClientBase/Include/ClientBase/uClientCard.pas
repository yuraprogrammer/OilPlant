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
    GroupBox1: TGroupBox;
    leLastName: TLabeledEdit;
    leFirstName: TLabeledEdit;
    leSurname: TLabeledEdit;
    meBirthday: TMaskEdit;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    leName: TLabeledEdit;
    leBusiness: TLabeledEdit;
    leInteresting: TLabeledEdit;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label3: TLabel;
    leRegRegion: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    leRegCity: TLabeledEdit;
    leRegStreet: TLabeledEdit;
    leRegBuilding: TLabeledEdit;
    leRegAddBuilding: TLabeledEdit;
    leRegOffice: TLabeledEdit;
    cbSameAddresses: TCheckBox;
    GroupBox5: TGroupBox;
    Label4: TLabel;
    leFactRegion: TLabeledEdit;
    leFactCity: TLabeledEdit;
    leFactStreet: TLabeledEdit;
    leFactBuilding: TLabeledEdit;
    leFactAddBuilding: TLabeledEdit;
    leFactOffice: TLabeledEdit;
    btnEdit: TBitBtn;
    btnClear: TBitBtn;
    btnSave: TBitBtn;
    btnPrint: TBitBtn;
    btnClose: TBitBtn;
    ActionList1: TActionList;
    actionClose: TAction;
    lePrivate: TLabeledEdit;
    cbRegRegion: TDBLookupComboBox;
    cbFactRegion: TDBLookupComboBox;
    actionEdit: TAction;
    actionClear: TAction;
    actionSave: TAction;
    actionPrint: TAction;
    btnClientWork: TBitBtn;
    actionWork: TAction;
    GroupBox6: TGroupBox;
    leAge: TLabeledEdit;
    leRole: TLabeledEdit;
    leCareere: TLabeledEdit;
    leLimitations: TLabeledEdit;
    lePrivelegies: TLabeledEdit;
    lePhone: TLabeledEdit;
    leFax: TLabeledEdit;
    leEMail: TLabeledEdit;
    leManager: TLabeledEdit;
    ADOQuery1: TADOQuery;
    ppReport1: TppReport;
    ppParameterList1: TppParameterList;
    ppDesignLayers1: TppDesignLayers;
    ppDesignLayer1: TppDesignLayer;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBPipeline1: TppDBPipeline;
    DataSource1: TDataSource;
    ppPageStyle1: TppPageStyle;
    ppDesignLayer2: TppDesignLayer;
    ppLabel1: TppLabel;
    ppTableGrid1: TppTableGrid;
    ppTableColumn1: TppTableColumn;
    ppTableColumn2: TppTableColumn;
    ppTableRow1: TppTableRow;
    ppTableCell1: TppTableCell;
    ppTableCell2: TppTableCell;
    ppTableRow2: TppTableRow;
    ppTableCell3: TppTableCell;
    ppTableCell4: TppTableCell;
    ppTableRow3: TppTableRow;
    ppTableCell5: TppTableCell;
    ppTableCell6: TppTableCell;
    ppTableRow4: TppTableRow;
    ppTableCell7: TppTableCell;
    ppTableCell8: TppTableCell;
    ppTableRow5: TppTableRow;
    ppTableCell9: TppTableCell;
    ppTableCell10: TppTableCell;
    ppTableRow6: TppTableRow;
    ppTableCell11: TppTableCell;
    ppTableCell12: TppTableCell;
    ppTableRow7: TppTableRow;
    ppTableCell13: TppTableCell;
    ppTableCell14: TppTableCell;
    ppTableRow8: TppTableRow;
    ppTableCell15: TppTableCell;
    ppTableCell16: TppTableCell;
    ppTableRow9: TppTableRow;
    ppTableCell17: TppTableCell;
    ppTableCell18: TppTableCell;
    ppTableRow10: TppTableRow;
    ppTableCell19: TppTableCell;
    ppTableCell20: TppTableCell;
    ppTableRow11: TppTableRow;
    ppTableCell21: TppTableCell;
    ppTableCell22: TppTableCell;
    ppTableRow12: TppTableRow;
    ppTableCell23: TppTableCell;
    ppTableCell24: TppTableCell;
    ppTableRow13: TppTableRow;
    ppTableCell25: TppTableCell;
    ppTableCell26: TppTableCell;
    ppTableRow14: TppTableRow;
    ppTableCell27: TppTableCell;
    ppTableCell28: TppTableCell;
    ppTableRow15: TppTableRow;
    ppTableCell29: TppTableCell;
    ppTableCell30: TppTableCell;
    ppTableRow16: TppTableRow;
    ppTableCell31: TppTableCell;
    ppTableCell32: TppTableCell;
    ppTableRow17: TppTableRow;
    ppTableCell33: TppTableCell;
    ppTableCell34: TppTableCell;
    ppTableRow18: TppTableRow;
    ppTableCell35: TppTableCell;
    ppTableCell36: TppTableCell;
    ppTableRow19: TppTableRow;
    ppTableCell37: TppTableCell;
    ppTableCell38: TppTableCell;
    ppTableRow20: TppTableRow;
    ppTableCell39: TppTableCell;
    ppTableCell40: TppTableCell;
    ppTableRow21: TppTableRow;
    ppTableCell41: TppTableCell;
    ppTableCell42: TppTableCell;
    ppTableRow22: TppTableRow;
    ppTableCell43: TppTableCell;
    ppTableCell44: TppTableCell;
    ppTableRow23: TppTableRow;
    ppTableCell45: TppTableCell;
    ppTableCell46: TppTableCell;
    ppTableRow24: TppTableRow;
    ppTableCell47: TppTableCell;
    ppTableCell48: TppTableCell;
    ppTableRow25: TppTableRow;
    ppTableCell49: TppTableCell;
    ppTableCell50: TppTableCell;
    ppTableRow26: TppTableRow;
    ppTableCell51: TppTableCell;
    ppTableCell52: TppTableCell;
    ppTableRow27: TppTableRow;
    ppTableCell53: TppTableCell;
    ppTableCell54: TppTableCell;
    ppTableRow28: TppTableRow;
    ppTableCell55: TppTableCell;
    ppTableCell56: TppTableCell;
    ppTableRow29: TppTableRow;
    ppTableCell57: TppTableCell;
    ppTableCell58: TppTableCell;
    ppTableRow30: TppTableRow;
    ppTableCell59: TppTableCell;
    ppTableCell60: TppTableCell;
    ppLabel2: TppLabel;
    ppLabel3: TppLabel;
    ppLabel4: TppLabel;
    ppDBText2: TppDBText;
    ppDBText3: TppDBText;
    ppDBText4: TppDBText;
    ppLabel5: TppLabel;
    ppLabel6: TppLabel;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppLabel14: TppLabel;
    ppLabel15: TppLabel;
    ppLabel16: TppLabel;
    ppLabel17: TppLabel;
    ppLabel18: TppLabel;
    ppLabel19: TppLabel;
    ppLabel20: TppLabel;
    ppLabel21: TppLabel;
    ppLabel22: TppLabel;
    ppLabel23: TppLabel;
    ppLabel24: TppLabel;
    ppLabel25: TppLabel;
    ppTableRow31: TppTableRow;
    ppTableCell61: TppTableCell;
    ppTableCell62: TppTableCell;
    ppTableRow32: TppTableRow;
    ppTableCell63: TppTableCell;
    ppTableCell64: TppTableCell;
    ppLabel26: TppLabel;
    ppLabel27: TppLabel;
    ppLabel28: TppLabel;
    ppLabel29: TppLabel;
    ppDBText1: TppDBText;
    ppDBText5: TppDBText;
    ppDBText6: TppDBText;
    ppDBText7: TppDBText;
    ppDBText8: TppDBText;
    ppDBText9: TppDBText;
    ppDBText10: TppDBText;
    ppDBText11: TppDBText;
    ppDBText12: TppDBText;
    ppDBText13: TppDBText;
    ppDBText14: TppDBText;
    ppDBText15: TppDBText;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppDBText23: TppDBText;
    ppDBText24: TppDBText;
    ppDBText25: TppDBText;
    ppDBText26: TppDBText;
    ADOQuery1Name: TWideStringField;
    ADOQuery1privateID: TWideStringField;
    ADOQuery1businessID: TWideStringField;
    ADOQuery1LastName: TWideStringField;
    ADOQuery1FirstName: TWideStringField;
    ADOQuery1Surname: TWideStringField;
    ADOQuery1clientMark: TIntegerField;
    ADOQuery1Birthday: TWideStringField;
    ADOQuery1Age: TIntegerField;
    ADOQuery1Role: TWideStringField;
    ADOQuery1Careere: TWideStringField;
    ADOQuery1Limitations: TWideStringField;
    ADOQuery1Privelegies: TWideStringField;
    ADOQuery1Phone: TWideStringField;
    ADOQuery1Manager: TWideStringField;
    ADOQuery1Fax: TWideStringField;
    ADOQuery1EMail: TWideStringField;
    ADOQuery1clientType: TIntegerField;
    ADOQuery1CallDate: TWideStringField;
    ADOQuery1CallPurpose: TWideStringField;
    ADOQuery1Requirement: TWideStringField;
    ADOQuery1Periodic: TWideStringField;
    ADOQuery1SupplyType: TIntegerField;
    ADOQuery1SupplyCondition: TIntegerField;
    ADOQuery1WorkResult: TWideStringField;
    ADOQuery1mat_name: TWideStringField;
    ADOQuery1ID: TIntegerField;
    ADOQuery1Interesting: TWideStringField;
    ADOQuery1regionName: TWideStringField;
    ADOQuery1fullFactAddress: TWideStringField;
    ADOQuery1fullRegAddress: TWideStringField;
    ppLabel30: TppLabel;
    ppLabel31: TppLabel;
    ppLabel32: TppLabel;
    ppLabel33: TppLabel;
    myDBCheckBox1: TmyDBCheckBox;
    myDBCheckBox2: TmyDBCheckBox;
    myDBCheckBox3: TmyDBCheckBox;
    myDBCheckBox4: TmyDBCheckBox;
    leSourceInfo: TLabeledEdit;
    leClientManager: TLabeledEdit;
    ppReport2: TppReport;
    ppHeaderBand2: TppHeaderBand;
    ppLabel34: TppLabel;
    ppDetailBand2: TppDetailBand;
    ppTableGrid2: TppTableGrid;
    ppTableRow33: TppTableRow;
    ppTableCell65: TppTableCell;
    ppLabel35: TppLabel;
    ppTableCell66: TppTableCell;
    ppDBText27: TppDBText;
    ppTableRow34: TppTableRow;
    ppTableCell67: TppTableCell;
    ppLabel36: TppLabel;
    ppTableCell68: TppTableCell;
    ppDBText28: TppDBText;
    ppTableRow35: TppTableRow;
    ppTableCell69: TppTableCell;
    ppLabel37: TppLabel;
    ppTableCell70: TppTableCell;
    ppDBText29: TppDBText;
    ppTableRow36: TppTableRow;
    ppTableCell71: TppTableCell;
    ppLabel38: TppLabel;
    ppTableCell72: TppTableCell;
    ppDBText30: TppDBText;
    ppTableRow37: TppTableRow;
    ppTableCell73: TppTableCell;
    ppTableCell74: TppTableCell;
    ppTableRow38: TppTableRow;
    ppTableCell75: TppTableCell;
    ppLabel39: TppLabel;
    ppTableCell76: TppTableCell;
    ppDBText31: TppDBText;
    ppTableRow39: TppTableRow;
    ppTableCell77: TppTableCell;
    ppLabel40: TppLabel;
    ppTableCell78: TppTableCell;
    ppDBText32: TppDBText;
    ppTableRow40: TppTableRow;
    ppTableCell79: TppTableCell;
    ppLabel41: TppLabel;
    ppTableCell80: TppTableCell;
    ppDBText33: TppDBText;
    ppTableRow41: TppTableRow;
    ppTableCell81: TppTableCell;
    ppLabel42: TppLabel;
    ppTableCell82: TppTableCell;
    ppDBText34: TppDBText;
    ppTableRow42: TppTableRow;
    ppTableCell83: TppTableCell;
    ppLabel43: TppLabel;
    ppTableCell84: TppTableCell;
    ppDBText35: TppDBText;
    ppTableRow43: TppTableRow;
    ppTableCell85: TppTableCell;
    ppLabel44: TppLabel;
    ppTableCell86: TppTableCell;
    ppDBText36: TppDBText;
    ppTableRow44: TppTableRow;
    ppTableCell87: TppTableCell;
    ppLabel45: TppLabel;
    ppTableCell88: TppTableCell;
    ppDBText37: TppDBText;
    ppTableRow45: TppTableRow;
    ppTableCell89: TppTableCell;
    ppTableCell90: TppTableCell;
    ppTableRow46: TppTableRow;
    ppTableCell91: TppTableCell;
    ppLabel46: TppLabel;
    ppTableCell92: TppTableCell;
    ppDBText38: TppDBText;
    ppTableRow47: TppTableRow;
    ppTableCell93: TppTableCell;
    ppLabel47: TppLabel;
    ppTableCell94: TppTableCell;
    ppDBText39: TppDBText;
    ppTableRow48: TppTableRow;
    ppTableCell95: TppTableCell;
    ppLabel48: TppLabel;
    ppTableCell96: TppTableCell;
    ppDBText40: TppDBText;
    ppTableRow49: TppTableRow;
    ppTableCell97: TppTableCell;
    ppLabel49: TppLabel;
    ppTableCell98: TppTableCell;
    ppDBText41: TppDBText;
    ppTableRow50: TppTableRow;
    ppTableCell99: TppTableCell;
    ppLabel50: TppLabel;
    ppTableCell100: TppTableCell;
    ppDBText42: TppDBText;
    ppTableRow51: TppTableRow;
    ppTableCell101: TppTableCell;
    ppLabel51: TppLabel;
    ppTableCell102: TppTableCell;
    ppLabel52: TppLabel;
    ppLabel53: TppLabel;
    myDBCheckBox5: TmyDBCheckBox;
    ppTableRow52: TppTableRow;
    ppTableCell103: TppTableCell;
    ppLabel54: TppLabel;
    ppTableCell104: TppTableCell;
    ppTableRow53: TppTableRow;
    ppTableCell105: TppTableCell;
    ppLabel55: TppLabel;
    ppTableCell106: TppTableCell;
    ppDBText43: TppDBText;
    ppTableRow54: TppTableRow;
    ppTableCell107: TppTableCell;
    ppTableCell108: TppTableCell;
    ppTableRow55: TppTableRow;
    ppTableCell109: TppTableCell;
    ppLabel56: TppLabel;
    ppTableCell110: TppTableCell;
    ppDBText44: TppDBText;
    ppTableRow56: TppTableRow;
    ppTableCell111: TppTableCell;
    ppLabel57: TppLabel;
    ppTableCell112: TppTableCell;
    ppDBText45: TppDBText;
    ppTableRow57: TppTableRow;
    ppTableCell113: TppTableCell;
    ppLabel58: TppLabel;
    ppTableCell114: TppTableCell;
    ppDBText46: TppDBText;
    ppTableRow58: TppTableRow;
    ppTableCell115: TppTableCell;
    ppLabel59: TppLabel;
    ppTableCell116: TppTableCell;
    ppDBText47: TppDBText;
    ppTableRow59: TppTableRow;
    ppTableCell117: TppTableCell;
    ppLabel60: TppLabel;
    ppTableCell118: TppTableCell;
    ppDBText48: TppDBText;
    ppTableRow60: TppTableRow;
    ppTableCell119: TppTableCell;
    ppTableCell120: TppTableCell;
    ppTableRow61: TppTableRow;
    ppTableCell121: TppTableCell;
    ppLabel61: TppLabel;
    ppTableCell122: TppTableCell;
    ppDBText49: TppDBText;
    ppTableRow62: TppTableRow;
    ppTableCell123: TppTableCell;
    ppLabel62: TppLabel;
    ppTableCell124: TppTableCell;
    ppDBText50: TppDBText;
    ppTableRow63: TppTableRow;
    ppTableCell125: TppTableCell;
    ppLabel63: TppLabel;
    ppTableCell126: TppTableCell;
    ppDBText51: TppDBText;
    ppTableRow64: TppTableRow;
    ppTableCell127: TppTableCell;
    ppLabel64: TppLabel;
    ppTableCell128: TppTableCell;
    ppDBText52: TppDBText;
    ppTableColumn3: TppTableColumn;
    ppTableColumn4: TppTableColumn;
    ppLabel65: TppLabel;
    ppLabel66: TppLabel;
    myDBCheckBox6: TmyDBCheckBox;
    myDBCheckBox7: TmyDBCheckBox;
    myDBCheckBox8: TmyDBCheckBox;
    ppPageStyle2: TppPageStyle;
    ppDesignLayers2: TppDesignLayers;
    ppDesignLayer3: TppDesignLayer;
    ppDesignLayer4: TppDesignLayer;
    ppParameterList2: TppParameterList;
    ADOQuery1SourceInfo: TWideStringField;
    ADOQuery1ClientManager: TWideStringField;
    ADOQuery1AddInfo: TWideMemoField;
    ppTableRow65: TppTableRow;
    ppTableCell129: TppTableCell;
    ppTableCell130: TppTableCell;
    ppTableRow66: TppTableRow;
    ppTableCell131: TppTableCell;
    ppTableCell132: TppTableCell;
    ppTableRow67: TppTableRow;
    ppTableCell133: TppTableCell;
    ppTableCell134: TppTableCell;
    ppLabel67: TppLabel;
    ppLabel68: TppLabel;
    ppDBText53: TppDBText;
    ppDBText54: TppDBText;
    ppTableRow68: TppTableRow;
    ppTableCell135: TppTableCell;
    ppTableCell136: TppTableCell;
    ppTableRow69: TppTableRow;
    ppTableCell137: TppTableCell;
    ppTableCell138: TppTableCell;
    ppTableRow70: TppTableRow;
    ppTableCell139: TppTableCell;
    ppTableCell140: TppTableCell;
    ppLabel69: TppLabel;
    ppLabel70: TppLabel;
    ppDBText55: TppDBText;
    ppDBText56: TppDBText;
    GroupBox7: TGroupBox;
    reAddInfo: TRichEdit;
    cbPrintAddInfo: TCheckBox;
    procedure actionCloseExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbSameAddressesClick(Sender: TObject);
    procedure cbRegRegionCloseUp(Sender: TObject);
    procedure leRegRegionChange(Sender: TObject);
    procedure leRegCityChange(Sender: TObject);
    procedure leRegStreetChange(Sender: TObject);
    procedure actionEditExecute(Sender: TObject);
    procedure actionClearExecute(Sender: TObject);
    procedure leRegBuildingChange(Sender: TObject);
    procedure leRegAddBuildingChange(Sender: TObject);
    procedure leRegOfficeChange(Sender: TObject);
    procedure actionSaveExecute(Sender: TObject);
    procedure cbFactRegionCloseUp(Sender: TObject);
    procedure leFactRegionChange(Sender: TObject);
    procedure leFactCityChange(Sender: TObject);
    procedure leFactStreetChange(Sender: TObject);
    procedure leFactBuildingChange(Sender: TObject);
    procedure leFactAddBuildingChange(Sender: TObject);
    procedure leFactOfficeChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure leLastNameChange(Sender: TObject);
    procedure leFirstNameChange(Sender: TObject);
    procedure leSurnameChange(Sender: TObject);
    procedure meBirthdayChange(Sender: TObject);
    procedure leNameChange(Sender: TObject);
    procedure lePrivateChange(Sender: TObject);
    procedure leBusinessChange(Sender: TObject);
    procedure leInterestingChange(Sender: TObject);
    procedure leAgeChange(Sender: TObject);
    procedure leRoleChange(Sender: TObject);
    procedure leCareereChange(Sender: TObject);
    procedure leLimitationsChange(Sender: TObject);
    procedure lePrivelegiesChange(Sender: TObject);
    procedure lePhoneChange(Sender: TObject);
    procedure leFaxChange(Sender: TObject);
    procedure leEMailChange(Sender: TObject);
    procedure leManagerChange(Sender: TObject);
    procedure actionWorkExecute(Sender: TObject);
    procedure actionPrintExecute(Sender: TObject);
    procedure cbRegRegionKeyPress(Sender: TObject; var Key: Char);
    procedure cbFactRegionKeyPress(Sender: TObject; var Key: Char);
    procedure leSourceInfoChange(Sender: TObject);
    procedure leClientManagerChange(Sender: TObject);
    procedure reAddInfoChange(Sender: TObject);
  private
    { Private declarations }
    procedure InitData;
    procedure OpenClientCard(ID:longint);
    procedure NewClientCard;
    procedure FillRegion;
    procedure ClearFields;
    procedure FillFields(ID:integer);
    procedure InsertNewClient;
    procedure UpdateExistingClient;
    procedure ExecuteClientProc(sp_name:string);
    procedure ExecuteClientWorkProc(sp_name:string);
    procedure ExecuteAddClientProc(sp_name:string);
    procedure ExecuteAddressProc(sp_name:string);
  public
    { Public declarations }
    crFlag: boolean; //1 - edit; 0 - new
    clID: longint;
  end;

type
      Client=record
        ID:longint;
        Name:string;
        LastName:string;
        FirstName:string;
        SurName:string;
        Birthday:string;
        clPrivate:string;
        clBusiness:string;
        clInteresting:string;
        mark:integer;
        clType:integer;
        regAddress:longint;
        regOblast:integer;
        regRegion:string;
        regCity:string;
        regStreet:string;
        regBuilding:string;
        regAddBuilding:string;
        regOffice:string;
        factAddress:longint;
        factOblast:integer;
        factRegion:string;
        factCity:string;
        factStreet:string;
        factBuilding:string;
        factAddBuilding:string;
        factOffice:string;
        Age:integer;
        Role:string;
        Careere:string;
        Limitations:string;
        Privelegies:string;
        Phone:string;
        Manager:string;
        Fax:string;
        E_Mail:string;
        SourceInfo:string;
        ClientManager:string;
        AddInfo:string;
      end;
var
  frmClientCard: TfrmClientCard;
  regQuery, factQuery: TADOQuery;
  clientQuery:TADOQuery;
  regRegionDS, clientDS, factRegionsDS: TDataSource;
  sameAddress: boolean;
  clientData:Client;

implementation

uses uClientBase, uClientWork;

{$R *.dfm}

procedure TfrmClientCard.actionClearExecute(Sender: TObject);
begin
 ClearFields;
end;

procedure TfrmClientCard.ClearFields;
begin
 leLastName.Text:='_';
 leFirstName.Text:='_';
 leSurname.Text:='_';
 meBirthday.Text:='_';
 leName.Text:='_';
 lePrivate.Text:='_';
 leBusiness.Text:='_';
 leInteresting.Text:='_';
 RadioGroup1.ItemIndex:=0;
 RadioGroup2.ItemIndex:=0;
 cbRegRegion.KeyValue:=0;
 cbFactRegion.KeyValue:=0;
 leRegRegion.Text:='_';
 leFactRegion.Text:='_';
 leRegCity.Text:='_';
 leFactCity.Text:='_';
 leRegStreet.Text:='_';
 leFactStreet.Text:='_';
 leRegBuilding.Text:='_';
 leFactBuilding.Text:='_';
 leRegAddBuilding.Text:='_';
 leFactAddBuilding.Text:='_';
 leRegOffice.Text:='_';
 leFactOffice.Text:='_';
 leAge.Text:='0';
 leRole.Text:='_';
 leCareere.Text:='_';
 leLimitations.Text:='_';
 lePrivelegies.Text:='_';
 leManager.Text:='_';
 lePhone.Text:='_';
 leFax.Text:='_';
 leEMail.Text:='_';
 leSourceInfo.Text:='_';
 leClientManager.Text:='_';
 reAddInfo.Text:='_';
 InitData;
end;

procedure TfrmClientCard.InitData;
begin
 leNameChange(Self);
 leLastNameChange(Self);
 leFirstNameChange(Self);
 leSurNameChange(Self);
 meBirthdayChange(Self);
 lePrivateChange(Self);
 leBusinessChange(Self);
 leInterestingChange(Self);
 leregRegionChange(Self);
 leregCityChange(Self);
 leregStreetChange(Self);
 leregBuildingChange(Self);
 leregAddBuildingChange(Self);
 leregOfficeChange(Self);
 lefactRegionChange(Self);
 lefactCityChange(Self);
 lefactStreetChange(Self);
 lefactBuildingChange(Self);
 lefactAddBuildingChange(Self);
 lefactOfficeChange(Self);
 leAgeChange(Self);
 leRoleChange(Self);
 leCareereChange(Self);
 leLimitationsChange(Self);
 lePrivelegiesChange(Self);
 leManagerChange(Self);
 lePhoneChange(Self);
 leFaxChange(Self);
 leEMailChange(Self);
 //cbregRegionCloseUp(Self);
 //cbFactRegionCloseUp(Self);
 leSourceInfoChange(Self);
 leClientManagerChange(Self);
 reAddInfoChange(Self);
end;

procedure TfrmClientCard.FillFields(ID: Integer);
var
 regID, factID: integer;
begin
 clientDS.DataSet:=clientQuery;
 clientQuery.SQL.Clear;
 clientQuery.SQL.Add('select * from dbo.apClientCard where ID='+IntToStr(ID));
 clientQuery.Open;
 if clientQuery.RecordCount<>0 then
  begin
    clientQuery.First;
    leLastName.Text:=clientQuery.FieldByName('LastName').AsString;
    leFirstName.Text:=clientQuery.FieldByName('FirstName').AsString;
    leSurName.Text:=clientQuery.FieldByName('SurName').AsString;
    meBirthDay.Text:=clientQuery.FieldByName('Birthday').AsString;
    leName.Text:=clientQuery.FieldByName('Name').AsString;
    lePrivate.Text:=clientQuery.FieldByName('PrivateID').AsString;
    leBusiness.Text:=clientQuery.FieldByName('BusinessID').AsString;
    //leInteresting.Text:=clientQuery.FieldByName('productName').AsString;
    RadioGroup1.ItemIndex:=clientQuery.FieldByName('clientMark').AsInteger;
    RadioGroup2.ItemIndex:=clientQuery.FieldByName('clientType').AsInteger;
    regID:=clientQuery.FieldByName('regionID').AsInteger;
    factID:=clientQuery.FieldByName('factRegionID').AsInteger;
    cbRegRegion.KeyValue:= regID;
    cbFactRegion.KeyValue:= factID;
    leRegRegion.Text:=clientQuery.FieldByName('Region').AsString;
    leRegCity.Text:=clientQuery.FieldByName('City').AsString;
    leRegStreet.Text:=clientQuery.FieldByName('Street').AsString;
    leRegBuilding.Text:=clientQuery.FieldByName('Building').AsString;
    leRegAddBuilding.Text:=clientQuery.FieldByName('addBuilding').AsString;
    leRegOffice.Text:=clientQuery.FieldByName('Office').AsString;
    {if regID=factID then
     begin
      cbSameAddresses.Checked:=true;
      cbSameAddressesClick(self);
     end
    else
     begin}
    leFactRegion.Text:=clientQuery.FieldByName('factRegion').AsString;
    leFactCity.Text:=clientQuery.FieldByName('factCity').AsString;
    leFactStreet.Text:=clientQuery.FieldByName('factStreet').AsString;
    leFactBuilding.Text:=clientQuery.FieldByName('factBuilding').AsString;
    leFactAddBuilding.Text:=clientQuery.FieldByName('factAddBuilding').AsString;
    leFactOffice.Text:=clientQuery.FieldByName('factOffice').AsString;
    // end;
    leAge.Text:=clientQuery.FieldByName('Age').AsString;
    leRole.Text:=clientQuery.FieldByName('Role').AsString;
    leCareere.Text:=clientQuery.FieldByName('Careere').AsString;
    leLimitations.Text:=clientQuery.FieldByName('Limitations').AsString;
    lePrivelegies.Text:=clientQuery.FieldByName('Privelegies').AsString;
    leManager.Text:=clientQuery.FieldByName('Manager').AsString;
    lePhone.Text:=clientQuery.FieldByName('Phone').AsString;
    leFax.Text:=clientQuery.FieldByName('Fax').AsString;
    leEMail.Text:=clientQuery.FieldByName('EMail').AsString;
    leSourceInfo.Text:=clientQuery.FieldByName('SourceInfo').AsString;
    leClientManager.Text:=clientQuery.FieldByName('ClientManager').AsString;
    reAddInfo.Text:=clientQuery.FieldByName('AddInfo').AsString;
    clientData.factAddress:=ID;
    clientData.regAddress:=ID;
    clientData.factOblast:=factID;
    clientData.regOblast:=regID;
  end;
end;

procedure TfrmClientCard.actionCloseExecute(Sender: TObject);
begin
 close;
end;

procedure TfrmClientCard.FormCreate(Sender: TObject);
begin
 regQuery:=TADOQuery.Create(nil);
 factQuery:=TADOQuery.Create(nil);
 clientQuery:=TADOQuery.Create(nil);
 clientQuery.Connection:=dm.ADOConnection1;
 regQuery.Connection:=dm.ADOConnection1;
 factQuery.Connection:=dm.ADOConnection1;
 regRegionDS:=TDataSource.Create(nil);
 factRegionsDS:=TDataSource.Create(nil);
 clientDS:=TDataSource.Create(nil);
end;

procedure TfrmClientCard.FormShow(Sender: TObject);
begin
 if crFlag then
  begin
   OpenClientCard(clID)
  end
 else NewClientCard;
 GroupBox1.Enabled:=not crFlag;
 GroupBox2.Enabled:=not crFlag;
 GroupBox3.Enabled:=not crFlag;
 GroupBox4.Enabled:=not crFlag;
 reAddInfo.Enabled:=not crFlag;
end;

procedure TfrmClientCard.leAgeChange(Sender: TObject);
begin
try
 if leAge.Text<>'' then clientData.Age:=StrToInt(Trim(leAge.Text))
 else clientData.Age:=0;
except
 exit;
end;
end;

procedure TfrmClientCard.leBusinessChange(Sender: TObject);
begin
 if leBusiness.Text<>'' then clientData.clBusiness:=leBusiness.Text
 else clientData.clBusiness:='_';
end;

procedure TfrmClientCard.leCareereChange(Sender: TObject);
begin
 if leCareere.Text<>'' then clientData.Careere:=leCareere.Text
 else clientData.Careere:='_';
end;

procedure TfrmClientCard.leClientManagerChange(Sender: TObject);
begin
 if leClientManager.Text<>'' then clientData.ClientManager:=leClientManager.Text
 else clientData.ClientManager:='_';
end;

procedure TfrmClientCard.leEMailChange(Sender: TObject);
begin
 if leEMail.Text<>'' then clientData.E_Mail:=leEMail.Text
 else clientData.E_Mail:='';
end;

procedure TfrmClientCard.leFactAddBuildingChange(Sender: TObject);
begin
 if leFactAddBuilding.text<>'' then clientData.factAddBuilding:=leFactAddBuilding.Text
 else clientData.factAddBuilding:='_';
end;

procedure TfrmClientCard.leFactBuildingChange(Sender: TObject);
begin
 if leFactBuilding.Text<>'' then clientData.factBuilding:=leFactBuilding.Text
 else  clientData.factBuilding:='_';
end;

procedure TfrmClientCard.leFactCityChange(Sender: TObject);
begin
 if leFactCity.Text<>'' then clientData.factCity:=leFactCity.Text
 else clientData.factCity:='_';
end;

procedure TfrmClientCard.leFactOfficeChange(Sender: TObject);
begin
 if leFactOffice.Text<>'' then clientData.factOffice:=leFactOffice.Text
 else clientData.factOffice:='_';
end;

procedure TfrmClientCard.leFactRegionChange(Sender: TObject);
begin
 if leFactRegion.Text<>'' then clientData.factRegion:=leFactRegion.Text
 else clientData.factRegion:='_';
end;

procedure TfrmClientCard.leFactStreetChange(Sender: TObject);
begin
 if leFactStreet.Text<>'' then clientData.factStreet:=leFactStreet.Text
 else clientData.factStreet:='_';
end;

procedure TfrmClientCard.leFaxChange(Sender: TObject);
begin
 if leFax.Text<>'' then clientData.Fax:=leFax.Text
 else clientData.Fax:='_';
end;

procedure TfrmClientCard.leFirstNameChange(Sender: TObject);
begin
 if leFirstName.Text<>'' then clientData.FirstName:=leFirstName.Text
 else clientData.FirstName:='_';
end;

procedure TfrmClientCard.leInterestingChange(Sender: TObject);
begin
 if leInteresting.Text<>'' then clientData.clInteresting:=leInteresting.Text
 else clientData.clInteresting:='_';
end;

procedure TfrmClientCard.leLastNameChange(Sender: TObject);
begin
 if leLastName.Text<>'' then clientData.LastName:=leLastName.Text
 else clientData.LastName:='_';
end;

procedure TfrmClientCard.leLimitationsChange(Sender: TObject);
begin
 if leLimitations.Text<>'' then clientData.Limitations:=leLimitations.Text
 else clientData.Limitations:='_';
end;

procedure TfrmClientCard.leManagerChange(Sender: TObject);
begin
 if leManager.Text<>'' then clientData.Manager:=leManager.Text
 else clientData.Manager:='_';
end;

procedure TfrmClientCard.leNameChange(Sender: TObject);
begin
 if leName.Text<>'' then clientData.Name:=leName.Text
 else clientData.Name:='_';
end;

procedure TfrmClientCard.lePhoneChange(Sender: TObject);
begin
 if lePhone.Text<>'' then clientData.Phone:=lePhone.Text
 else clientData.Phone:='_';
end;

procedure TfrmClientCard.lePrivateChange(Sender: TObject);
begin
 if lePrivate.Text<>'' then clientData.clPrivate:=lePrivate.Text
 else clientData.clPrivate:='_';
end;

procedure TfrmClientCard.lePrivelegiesChange(Sender: TObject);
begin
if lePrivelegies.Text<>'' then clientData.Privelegies:=lePrivelegies.Text
else clientData.Privelegies:='_';
end;

procedure TfrmClientCard.leRegAddBuildingChange(Sender: TObject);
begin
  if sameAddress then leFactAddBuilding.Text:=leRegAddBuilding.Text;
  if leRegAddBuilding.Text<>'' then clientData.regAddBuilding:=leRegAddBuilding.Text
  else clientData.regAddBuilding:='_';
end;

procedure TfrmClientCard.leRegBuildingChange(Sender: TObject);
begin
 if sameAddress then leFactBuilding.Text:=leRegBuilding.Text;
 if leRegBuilding.Text<>'' then clientData.regBuilding:=leRegBuilding.Text
 else clientData.regBuilding:='_';
end;

procedure TfrmClientCard.leRegCityChange(Sender: TObject);
begin
  if sameAddress then leFactCity.Text:=leRegCity.Text;
  if leRegCity.Text<>'' then clientData.regCity:=leRegCity.Text
  else clientData.regCity:='_';
end;

procedure TfrmClientCard.leRegOfficeChange(Sender: TObject);
begin
 if sameAddress then leFactOffice.Text:=leRegOffice.Text;
 if leRegOffice.Text<>'' then clientData.regOffice:=leRegOffice.Text
 else clientData.regOffice:='_';
end;

procedure TfrmClientCard.leRegRegionChange(Sender: TObject);
begin
  if sameAddress then leFactRegion.Text:=leRegRegion.Text;
  if leRegRegion.Text<>'' then clientData.regRegion:=leRegRegion.Text
  else clientData.regRegion:='_';
end;

procedure TfrmClientCard.leRegStreetChange(Sender: TObject);
begin
  if sameAddress then leFactStreet.Text:=leRegStreet.Text;
  if leRegStreet.Text<>'' then clientData.regStreet:=leRegStreet.Text
  else clientData.regStreet:='_';
end;

procedure TfrmClientCard.leRoleChange(Sender: TObject);
begin
 if leRole.Text<>'' then clientData.Role:=leRole.Text
 else clientData.Role:='_';
end;

procedure TfrmClientCard.leSourceInfoChange(Sender: TObject);
begin
 if leSourceInfo.Text<>'' then clientData.SourceInfo:=leSourceInfo.Text
 else clientData.SourceInfo:='_';
end;

procedure TfrmClientCard.leSurnameChange(Sender: TObject);
begin
 if leSurName.Text<>'' then clientData.SurName:=leSurName.Text
 else clientData.SurName:='_';
end;

procedure TfrmClientCard.meBirthdayChange(Sender: TObject);
begin
 clientData.Birthday:=meBirthday.Text;
end;

procedure TfrmClientCard.OpenClientCard(ID: Integer);
begin
 FillRegion;
 clientData.ID:=ID;
 FillFields(ID);
 InitData;
end;

procedure TfrmClientCard.RadioGroup1Click(Sender: TObject);
begin
 clientData.mark:=RadioGroup1.ItemIndex;
end;

procedure TfrmClientCard.RadioGroup2Click(Sender: TObject);
begin
 clientData.clType:=RadioGroup2.ItemIndex;
end;

procedure TfrmClientCard.reAddInfoChange(Sender: TObject);
begin
 if reAddInfo.Text<>'' then clientData.AddInfo:=reAddInfo.Text
 else clientData.AddInfo:='_';
end;

procedure TfrmClientCard.NewClientCard;
begin
 ClearFields;
 FillRegion;
 cbRegRegion.KeyValue:=0;
 cbFactRegion.KeyValue:=0;
end;

procedure TfrmClientCard.actionEditExecute(Sender: TObject);
begin
 GroupBox1.Enabled:=True;
 GroupBox2.Enabled:=True;
 GroupBox3.Enabled:=True;
 GroupBox4.Enabled:=True;
 btnSave.Enabled:=true;
 reAddInfo.Enabled:=True;
end;

procedure TfrmClientCard.actionPrintExecute(Sender: TObject);
begin
try
 ADOQuery1.Close;
 ADOQuery1.Parameters[0].Value:=clientData.ID;
 ADOQuery1.Open;
 if cbPrintAddInfo.Checked then ppReport2.PrintReport
 else ppReport1.PrintReport;
except
 MessageDlg('Ошибка построения отчета!!!',mtError,[mbOk],0);
end;
end;

procedure TfrmClientCard.actionSaveExecute(Sender: TObject);
begin
 //1-edit, 0-new
 if crFlag then UpdateExistingClient
 else InsertNewClient;
 frmClientBase.actionRefreshExecute(nil);
end;

procedure TfrmClientCard.actionWorkExecute(Sender: TObject);
begin
 Application.CreateForm(TfrmClientWork, frmClientWork);
 frmClientWork.clID:=clientData.ID;
 frmClientWork.ShowModal;
end;

procedure TfrmClientCard.InsertNewClient;
var
 q:TADOQuery;
begin
 q:=TADOQuery.Create(nil);
 q.Connection:=dm.ADOConnection1;
 q.SQL.Add('select max(id) from dbo.apClients');
 q.Open;
 if q.RecordCount<>0 then
  begin
    q.First;
    clientData.ID:=q.Fields[0].AsInteger+1;
  end
 else
  clientData.ID:=0;
 q.SQL.Clear;
 q.SQL.Add('select max(id) from dbo.apClientRegisterAddress');
 q.Open;
 if q.RecordCount<>0 then
  begin
    q.First;
    clientData.regAddress:=q.Fields[0].AsInteger+1;
  end
 else
  clientData.regAddress:=0;
 q.SQL.Clear;
 q.SQL.Add('select max(id) from dbo.apClientFactAddress');
 q.Open;
 if q.RecordCount<>0 then
  begin
    q.First;
    clientData.factAddress:=q.Fields[0].AsInteger+1;
  end
 else
  clientData.factAddress:=0;
 try
   dm.ADOConnection1.BeginTrans;
   ExecuteClientProc('dbo.addClient');
   ExecuteAddClientProc('dbo.addClientAdditional');
   ExecuteAddressProc('dbo.addClientAddress');
   ExecuteClientWorkProc('dbo.addClientWork');
   dm.ADOConnection1.CommitTrans;
   MessageDlg('Данные о клиенте успешно сохранены.', mtConfirmation, [mbOk], 0);
   crFlag:=true;
 except
   dm.ADOConnection1.RollbackTrans;
   MessageDlg('Данные о клиенте не сохранены.', mtError, [mbOk], 0);
 end;
 q.Free;
end;

procedure TfrmClientCard.ExecuteClientWorkProc(sp_name: string);
var
 sp:TADOQuery;
 i:longint;
begin
 sp:=TADOQuery.Create(nil);
 sp.Connection:=dm.ADOConnection1;
 sp.SQL.Clear;
 sp.SQL.Add('select max(id) from dbo.apClientWork');
 sp.Open;
 sp.First;
 i:=sp.Fields[0].AsInteger+1;
 sp.SQL.Clear;
 sp.SQL.Add('exec '+sp_name+' ');
 sp.SQL.Add(IntToStr(i)+',');
 sp.SQL.Add(IntToStr(clientData.ID)+',');
 sp.SQL.Add('"_",');
 sp.SQL.Add('"_",');
 sp.SQL.Add(IntToStr(0)+',');
 sp.SQL.Add('"_",');
 sp.SQL.Add('"_",');
 sp.SQL.Add(IntToStr(0)+',');
 sp.SQL.Add(IntToStr(0)+',');
 sp.SQL.Add('"_"');
 sp.ExecSQL;
 sp.free;
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
 sp.SQL.Add('"'+clientData.Name+'",');
 sp.SQL.Add('"'+clientData.clPrivate+'",');
 sp.SQL.Add('"'+clientData.clBusiness+'",');
 sp.SQL.Add('"'+clientData.LastName+'",');
 sp.SQL.Add('"'+clientData.FirstName+'",');
 sp.SQL.Add('"'+clientData.SurName+'",');
 sp.SQL.Add(IntToStr(clientData.regOblast)+',');
 sp.SQL.Add(IntToStr(clientData.ID)+',');
 sp.SQL.Add(IntToStr(clientData.ID)+',');
 sp.SQL.Add(IntToStr(clientData.mark)+',');
 sp.SQL.Add('"'+clientData.Birthday+'",');
 sp.SQL.Add(IntToStr(clientData.clType)+',');
 sp.SQL.Add('"'+clientData.clInteresting+'",');
 sp.SQL.Add('"'+clientData.SourceInfo+'",');
 sp.SQL.Add('"'+clientData.ClientManager+'",');
 sp.SQL.Add('"'+clientData.AddINfo+'",');
 sp.SQL.Add('"'+clientData.ClientManager+'"'); 
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
 sp.SQL.Add(IntToStr(clientData.Age)+',');
 sp.SQL.Add('"'+clientData.Role+'",');
 sp.SQL.Add('"'+clientData.Careere+'",');
 sp.SQL.Add('"'+clientData.Limitations+'",');
 sp.SQL.Add('"'+clientData.Privelegies+'",');
 sp.SQL.Add('"'+clientData.Phone+'",');
 sp.SQL.Add('"'+clientData.Manager+'",');
 sp.SQL.Add('"'+clientData.Fax+'",');
 sp.SQL.Add('"'+clientData.E_Mail+'"');
 sp.ExecSQL;
 sp.free;
end;

//Запуск процедур вставки-обновления таблицы клиентов (адрес)
procedure TfrmClientCard.ExecuteAddressProc(sp_name: string);
var
 sp:TADOQuery;
begin
 sp:=TADOQuery.Create(nil);
 sp.Connection:=dm.ADOConnection1;
 sp.SQL.Add('exec '+sp_name+' ');
 sp.SQL.Add(IntToStr(0)+',');
 sp.SQL.Add(IntToStr(clientData.ID)+',');
 sp.SQL.Add(IntToStr(clientData.regOblast)+',');
 sp.SQL.Add(IntToStr(clientData.ID)+',');
 sp.SQL.Add('"_",');
 sp.SQL.Add('"'+clientData.regRegion+'",');
 sp.SQL.Add('"'+clientData.regCity+'",');
 sp.SQL.Add('"'+clientData.regStreet+'",');
 sp.SQL.Add('"'+clientData.regBuilding+'",');
 sp.SQL.Add('"'+clientData.regAddBuilding+'",');
 sp.SQL.Add('"'+clientData.regOffice+'"');
 sp.ExecSQL;
 sp.SQL.Clear;
 sp.SQL.Add('exec '+sp_name+' ');
 sp.SQL.Add(IntToStr(1)+',');
 sp.SQL.Add(IntToStr(clientData.ID)+',');
 sp.SQL.Add(IntToStr(clientData.factOblast)+',');
 sp.SQL.Add(IntToStr(clientData.ID)+',');
 sp.SQL.Add('"_",');
 sp.SQL.Add('"'+clientData.factRegion+'",');
 sp.SQL.Add('"'+clientData.factCity+'",');
 sp.SQL.Add('"'+clientData.factStreet+'",');
 sp.SQL.Add('"'+clientData.factBuilding+'",');
 sp.SQL.Add('"'+clientData.factAddBuilding+'",');
 sp.SQL.Add('"'+clientData.factOffice+'"');
 sp.ExecSQL;
 sp.free;
end;

procedure TfrmClientCard.UpdateExistingClient;
begin
try
   dm.ADOConnection1.BeginTrans;
   ExecuteClientProc('dbo.updateClient');
   ExecuteAddClientProc('dbo.updateClientAdditional');
   ExecuteAddressProc('dbo.updateClientAddress');
   dm.ADOConnection1.CommitTrans;
   MessageDlg('Данные о клиенте успешно сохранены.', mtConfirmation, [mbYes, mbNo], 0);
   crFlag:=true;
 except
   dm.ADOConnection1.RollbackTrans;
 end;
end;

procedure TfrmClientCard.cbFactRegionCloseUp(Sender: TObject);
begin
 clientData.factOblast:=cbFactRegion.KeyValue;
 //clientData.factOblast:=cbFactRegion.ListFieldIndex;
end;

procedure TfrmClientCard.cbFactRegionKeyPress(Sender: TObject; var Key: Char);
begin
 cbFactRegionCloseUp(Sender);
end;

procedure TfrmClientCard.cbRegRegionCloseUp(Sender: TObject);
begin
 if sameAddress then cbFactRegion.KeyValue:=cbRegRegion.KeyValue;
 clientData.regOblast:=cbRegRegion.KeyValue;
end;

procedure TfrmClientCard.cbRegRegionKeyPress(Sender: TObject; var Key: Char);
begin
 cbRegRegionCloseUp(Sender);
end;

procedure TfrmClientCard.cbSameAddressesClick(Sender: TObject);
begin
 if cbSameAddresses.Checked then sameAddress:=true
 else sameAddress:=false;
 GroupBox5.Enabled:=not sameAddress;
 if sameAddress then
  begin
    leFactRegion.Text:=leRegRegion.Text;
    leFactCity.Text:=leRegCity.Text;
    leFactStreet.Text:=leRegStreet.Text;
    leFactBuilding.Text:=leRegBuilding.Text;
    leFactAddBuilding.Text:=leRegAddBuilding.Text;
    leFactOffice.Text:=leRegOffice.Text;
    cbFactRegion.KeyValue:=cbRegRegion.KeyValue;
    clientData.factOblast:=clientData.regOblast;
    clientData.factAddress:=clientData.regAddress;
  end;
end;

procedure TfrmClientCard.FillRegion;
begin
 regQuery.SQL.Clear;
 regQuery.SQL.Add('select * from dbo.apRegionsDic order by ID');
 regQuery.Open;
 factQuery.SQL.Clear;
 factQuery.SQL.Add('select * from dbo.apRegionsDic order by ID');
 factQuery.Open;
 regRegionDS.DataSet:=regQuery;
 factRegionsDS.DataSet:=factQuery;
 cbRegRegion.ListSource:=regRegionDS;
 cbFactRegion.ListSource:=factRegionsDS;
 cbRegRegion.ListField:='Name';
 cbRegRegion.KeyField:='ID';
 cbFactRegion.ListField:='Name';
 cbFactRegion.KeyField:='ID';
end;

end.

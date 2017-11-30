unit U_frmEditUppgAkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, adodb, DB, RpCon, RpConDS, RpDefine, RpRave;

type
  TfrmEditUppgAkt = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    Label5: TLabel;
    Panel5: TPanel;
    Label6: TLabel;
    Panel6: TPanel;
    GroupBox1: TGroupBox;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel16: TPanel;
    Panel15: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    MaskEdit1: TMaskEdit;
    Panel33: TPanel;
    MaskEdit2: TMaskEdit;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    MaskEdit4: TMaskEdit;
    Panel37: TPanel;
    MaskEdit5: TMaskEdit;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    GroupBox4: TGroupBox;
    Panel47: TPanel;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    Panel61: TPanel;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit17: TMaskEdit;
    MaskEdit18: TMaskEdit;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Panel62: TPanel;
    Panel63: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    Panel66: TPanel;
    Panel67: TPanel;
    Panel68: TPanel;
    Panel69: TPanel;
    Panel70: TPanel;
    Panel71: TPanel;
    Panel72: TPanel;
    Panel73: TPanel;
    Panel74: TPanel;
    Panel75: TPanel;
    Panel78: TPanel;
    Panel79: TPanel;
    Panel80: TPanel;
    Panel81: TPanel;
    Panel82: TPanel;
    Button1: TButton;
    Button2: TButton;
    GroupBox6: TGroupBox;
    Panel83: TPanel;
    Panel84: TPanel;
    Panel85: TPanel;
    Panel86: TPanel;
    Panel87: TPanel;
    Panel88: TPanel;
    Panel89: TPanel;
    Panel90: TPanel;
    Panel91: TPanel;
    Panel92: TPanel;
    Panel93: TPanel;
    Panel94: TPanel;
    Panel95: TPanel;
    Panel96: TPanel;
    Panel76: TPanel;
    MaskEdit3: TMaskEdit;
    MaskEdit6: TMaskEdit;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    MaskEdit19: TMaskEdit;
    MaskEdit20: TMaskEdit;
    Panel77: TPanel;
    Panel97: TPanel;
    Panel98: TPanel;
    Panel99: TPanel;
    Panel100: TPanel;
    Panel101: TPanel;
    Panel102: TPanel;
    Panel103: TPanel;
    Panel104: TPanel;
    Panel105: TPanel;
    Panel106: TPanel;
    Panel107: TPanel;
    Panel108: TPanel;
    Panel109: TPanel;
    Panel110: TPanel;
    Panel111: TPanel;
    Panel112: TPanel;
    Panel113: TPanel;
    Panel114: TPanel;
    Panel115: TPanel;
    Panel116: TPanel;
    Panel117: TPanel;
    Panel118: TPanel;
    Panel119: TPanel;
    Panel120: TPanel;
    Panel121: TPanel;
    Panel122: TPanel;
    Panel123: TPanel;
    Panel124: TPanel;
    Panel125: TPanel;
    Panel126: TPanel;
    Panel127: TPanel;
    Panel128: TPanel;
    Panel129: TPanel;
    Panel130: TPanel;
    Panel131: TPanel;
    Panel132: TPanel;
    Panel133: TPanel;
    Panel134: TPanel;
    Panel135: TPanel;
    Panel136: TPanel;
    Panel137: TPanel;
    Panel138: TPanel;
    Panel139: TPanel;
    Panel140: TPanel;
    Panel141: TPanel;
    Panel142: TPanel;
    Panel143: TPanel;
    MaskEdit21: TMaskEdit;
    MaskEdit22: TMaskEdit;
    MaskEdit23: TMaskEdit;
    MaskEdit24: TMaskEdit;
    MaskEdit25: TMaskEdit;
    MaskEdit26: TMaskEdit;
    MaskEdit27: TMaskEdit;
    MaskEdit28: TMaskEdit;
    MaskEdit29: TMaskEdit;
    MaskEdit30: TMaskEdit;
    MaskEdit31: TMaskEdit;
    MaskEdit32: TMaskEdit;
    MaskEdit33: TMaskEdit;
    MaskEdit34: TMaskEdit;
    MaskEdit35: TMaskEdit;
    MaskEdit36: TMaskEdit;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    ComboBox6: TComboBox;
    ComboBox7: TComboBox;
    ComboBox8: TComboBox;
    ComboBox9: TComboBox;
    ComboBox10: TComboBox;
    ComboBox11: TComboBox;
    ComboBox12: TComboBox;
    ComboBox13: TComboBox;
    ComboBox14: TComboBox;
    Panel144: TPanel;
    Panel145: TPanel;
    Panel146: TPanel;
    Panel147: TPanel;
    MaskEdit37: TMaskEdit;
    MaskEdit38: TMaskEdit;
    Panel148: TPanel;
    Panel149: TPanel;
    Panel150: TPanel;
    Panel151: TPanel;
    Panel152: TPanel;
    Panel153: TPanel;
    Panel154: TPanel;
    Panel155: TPanel;
    Panel156: TPanel;
    Panel157: TPanel;
    Panel158: TPanel;
    Panel159: TPanel;
    Panel160: TPanel;
    Panel161: TPanel;
    Panel162: TPanel;
    Panel163: TPanel;
    Panel164: TPanel;
    Panel165: TPanel;
    Panel166: TPanel;
    Panel167: TPanel;
    Panel168: TPanel;
    Panel169: TPanel;
    Panel170: TPanel;
    Panel171: TPanel;
    Panel172: TPanel;
    Panel173: TPanel;
    Panel174: TPanel;
    Panel175: TPanel;
    Panel176: TPanel;
    Panel177: TPanel;
    Panel178: TPanel;
    Panel179: TPanel;
    Panel180: TPanel;
    Panel181: TPanel;
    Panel182: TPanel;
    Panel183: TPanel;
    Panel184: TPanel;
    Panel185: TPanel;
    Panel186: TPanel;
    Panel187: TPanel;
    Panel188: TPanel;
    Panel189: TPanel;
    Panel190: TPanel;
    Panel191: TPanel;
    Panel192: TPanel;
    Panel193: TPanel;
    Panel194: TPanel;
    Panel195: TPanel;
    MaskEdit39: TMaskEdit;
    MaskEdit40: TMaskEdit;
    MaskEdit41: TMaskEdit;
    MaskEdit42: TMaskEdit;
    MaskEdit43: TMaskEdit;
    MaskEdit44: TMaskEdit;
    MaskEdit45: TMaskEdit;
    MaskEdit46: TMaskEdit;
    MaskEdit47: TMaskEdit;
    MaskEdit48: TMaskEdit;
    MaskEdit49: TMaskEdit;
    MaskEdit50: TMaskEdit;
    MaskEdit51: TMaskEdit;
    MaskEdit52: TMaskEdit;
    MaskEdit53: TMaskEdit;
    MaskEdit54: TMaskEdit;
    MaskEdit55: TMaskEdit;
    MaskEdit56: TMaskEdit;
    MaskEdit57: TMaskEdit;
    MaskEdit58: TMaskEdit;
    MaskEdit59: TMaskEdit;
    MaskEdit60: TMaskEdit;
    MaskEdit61: TMaskEdit;
    MaskEdit62: TMaskEdit;
    MaskEdit63: TMaskEdit;
    MaskEdit64: TMaskEdit;
    MaskEdit65: TMaskEdit;
    MaskEdit66: TMaskEdit;
    MaskEdit67: TMaskEdit;
    MaskEdit68: TMaskEdit;
    MaskEdit69: TMaskEdit;
    MaskEdit70: TMaskEdit;
    Panel196: TPanel;
    Panel197: TPanel;
    Panel198: TPanel;
    Panel199: TPanel;
    Panel200: TPanel;
    Panel201: TPanel;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Panel202: TPanel;
    Panel203: TPanel;
    Panel204: TPanel;
    Panel205: TPanel;
    Panel206: TPanel;
    Panel207: TPanel;
    Panel208: TPanel;
    Panel209: TPanel;
    Panel210: TPanel;
    Panel211: TPanel;
    Panel212: TPanel;
    Panel213: TPanel;
    Panel214: TPanel;
    Panel215: TPanel;
    Panel216: TPanel;
    Panel217: TPanel;
    Panel218: TPanel;
    Panel219: TPanel;
    Panel220: TPanel;
    Panel221: TPanel;
    Panel222: TPanel;
    Panel223: TPanel;
    Panel224: TPanel;
    Panel225: TPanel;
    Panel226: TPanel;
    Panel227: TPanel;
    Panel228: TPanel;
    Panel229: TPanel;
    Panel230: TPanel;
    Panel231: TPanel;
    Panel232: TPanel;
    Panel233: TPanel;
    Panel234: TPanel;
    Panel235: TPanel;
    Panel236: TPanel;
    Panel237: TPanel;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    ADOQuery1: TADOQuery;
    procedure ComboBox13Change(Sender: TObject);
    procedure ComboBox11Change(Sender: TObject);
    procedure ComboBox9Change(Sender: TObject);
    procedure ComboBox7Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure MaskEdit19Change(Sender: TObject);
    procedure MaskEdit20Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit3Change(Sender: TObject);
    procedure MaskEdit6Change(Sender: TObject);
    procedure MaskEdit21Change(Sender: TObject);
    procedure MaskEdit22Change(Sender: TObject);
    procedure MaskEdit23Change(Sender: TObject);
    procedure MaskEdit24Change(Sender: TObject);
    procedure MaskEdit37Change(Sender: TObject);
    procedure MaskEdit38Change(Sender: TObject);
    procedure MaskEdit39Change(Sender: TObject);
    procedure MaskEdit40Change(Sender: TObject);
    procedure Edit9Change(Sender: TObject);
    procedure Edit10Change(Sender: TObject);
    procedure MaskEdit53Change(Sender: TObject);
    procedure MaskEdit54Change(Sender: TObject);
    procedure Edit11Change(Sender: TObject);
    procedure MaskEdit55Change(Sender: TObject);
    procedure Edit12Change(Sender: TObject);
    procedure MaskEdit56Change(Sender: TObject);
    procedure Edit13Change(Sender: TObject);
    procedure MaskEdit57Change(Sender: TObject);
    procedure Edit14Change(Sender: TObject);
    procedure MaskEdit58Change(Sender: TObject);
    procedure MaskEdit25Change(Sender: TObject);
    procedure MaskEdit26Change(Sender: TObject);
    procedure MaskEdit27Change(Sender: TObject);
    procedure MaskEdit28Change(Sender: TObject);
    procedure MaskEdit41Change(Sender: TObject);
    procedure MaskEdit42Change(Sender: TObject);
    procedure Edit15Change(Sender: TObject);
    procedure Edit16Change(Sender: TObject);
    procedure MaskEdit59Change(Sender: TObject);
    procedure MaskEdit60Change(Sender: TObject);
    procedure MaskEdit43Change(Sender: TObject);
    procedure MaskEdit44Change(Sender: TObject);
    procedure Edit18Change(Sender: TObject);
    procedure Edit19Change(Sender: TObject);
    procedure MaskEdit61Change(Sender: TObject);
    procedure MaskEdit62Change(Sender: TObject);
    procedure MaskEdit29Change(Sender: TObject);
    procedure MaskEdit30Change(Sender: TObject);
    procedure MaskEdit31Change(Sender: TObject);
    procedure MaskEdit32Change(Sender: TObject);
    procedure MaskEdit45Change(Sender: TObject);
    procedure MaskEdit46Change(Sender: TObject);
    procedure Edit20Change(Sender: TObject);
    procedure Edit21Change(Sender: TObject);
    procedure MaskEdit63Change(Sender: TObject);
    procedure MaskEdit64Change(Sender: TObject);
    procedure MaskEdit47Change(Sender: TObject);
    procedure MaskEdit48Change(Sender: TObject);
    procedure Edit22Change(Sender: TObject);
    procedure Edit23Change(Sender: TObject);
    procedure MaskEdit65Change(Sender: TObject);
    procedure MaskEdit66Change(Sender: TObject);
    procedure MaskEdit33Change(Sender: TObject);
    procedure MaskEdit34Change(Sender: TObject);
    procedure MaskEdit49Change(Sender: TObject);
    procedure MaskEdit50Change(Sender: TObject);
    procedure Edit24Change(Sender: TObject);
    procedure Edit25Change(Sender: TObject);
    procedure MaskEdit67Change(Sender: TObject);
    procedure MaskEdit68Change(Sender: TObject);
  private
    { Private declarations }
    procedure initfrm;
  public
    { Public declarations }
  end;

var
  frmEditUppgAkt: TfrmEditUppgAkt;
  query:tadoquery;
  aktnum,fbgsstartlevel0, fbgsstartlevel1, fbgsstartlevel2, fbgsendlevel0, fbgsendlevel1, fbgsendlevel2:longint;
  adtstartlevel0, adtstartlevel1, adtendlevel0, adtendlevel1:longint;
  otgstartlevel0, otgstartlevel1, otgendlevel0, otgendlevel1:longint;
  zpstartlevel0, zpendlevel0, e1startlevel, e1endlevel:longint;
  p25startlevel0, p25startlevel1, p25startlevel2, p25endlevel0, p25endlevel1, p25endlevel2:longint;
  fbgsstartvol0, fbgsstartvol1, fbgsstartvol2, fbgsendvol0, fbgsendvol1, fbgsendvol2:longint;
  adtstartvol0, adtstartvol1, adtendvol0, adtendvol1:longint;
  otgstartvol0, otgstartvol1, otgendvol0, otgendvol1:longint;
  zpstartvol0, zpendvol0, e1startvol, e1endvol:longint;
  p25startvol0, p25startvol1, p25startvol2, p25endvol0, p25endvol1, p25endvol2:longint;
  fbgsstartm0, fbgsstartm1, fbgsstartm2, fbgsendm0, fbgsendm1, fbgsendm2:longint;
  adtstartm0, adtstartm1, adtendm0, adtendm1:longint;
  otgstartm0, otgstartm1, otgendm0, otgendm1:longint;
  zpstartm0, zpendm0, e1startm, e1endm:longint;
  p25startm0, p25startm1, p25startm2, p25endm0, p25endm1, p25endm2:longint;
  fbgsstartp0, fbgsstartp1, fbgsstartp2, fbgsendp0, fbgsendp1, fbgsendp2:real;
  adtstartp0, adtstartp1, adtendp0, adtendp1:real;
  otgstartp0, otgstartp1, otgendp0, otgendp1:real;
  zpstartp0, zpendp0, e1startp, e1endp:real;
  p25startp0, p25startp1, p25startp2, p25endp0, p25endp1, p25endp2:real;
  fbgsstartp200, fbgsstartp201, fbgsstartp202, fbgsendp200, fbgsendp201, fbgsendp202:real;
  adtstartp200, adtstartp201, adtendp200, adtendp201:real;
  otgstartp200, otgstartp201, otgendp200, otgendp201:real;
  zpstartp200, zpendp200, e1startp20, e1endp20:real;
  p25startp200, p25startp201, p25startp202, p25endp200, p25endp201, p25endp202:real;
  fbgsstartt0, fbgsstartt1, fbgsstartt2, fbgsendt0, fbgsendt1, fbgsendt2:real;
  adtstartt0, adtstartt1, adtendt0, adtendt1:longint;
  otgstartt0, otgstartt1, otgendt0, otgendt1:longint;
  zpstartt0, zpendt0, e1startt, e1endt:longint;
  p25startt0, p25startt1, p25startt2, p25endt0, p25endt1, p25endt2:longint;
  fbgsstarttime0, fbgsstarttime1, fbgsstarttime2, fbgsendtime0, fbgsendtime1, fbgsendtime2:string[5];
  adtstarttime0, adtstarttime1, adtendtime0, adtendtime1:string[5];
  otgstarttime0, otgstarttime1, otgendtime0, otgendtime1:string[5];
  zpstarttime0, e3starttime0, zpendtime0, e3endtime0:string[5];
  fbgstank0, fbgstank1, fbgstank2, adttank0, adttank1, otgtank0, otgtank1, zptank0:byte;
  fbgsprodvol0, fbgsprodvol1, fbgsprodvol2, fbgsprodm0, fbgsprodm1, fbgsprodm2:integer;
  adtprodvol0, adtprodvol1, adtprodm0, adtprodm1:integer;
  otgprodvol0, otgprodvol1, otgprodm0, otgprodm1:integer;
  zpprodvol0, zpprodm0:integer;
implementation

uses u_dm;

{$R *.dfm}

procedure TfrmEditUppgAkt.Button3Click(Sender: TObject);
begin
button3.Enabled:=false;
try
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update dbo.fbgs_work set fbgs_start_time_0=:fst0, fbgs_end_time_0=:fet0, ');
 query.SQL.Add('fbgs_tank_id_0=:fti0, fbgs_start_level_0=:fsl0, ');
 query.SQL.Add('fbgs_end_level_0=:fel0, fbgs_start_volume_0=:fsv0, ');
 query.SQL.Add('fbgs_end_volume_0=:fev0, fbgs_start_temp_0=:fstemp0, ');
 query.SQL.Add('fbgs_end_temp_0=:fetemp0, fbgs_start_p_0=:fsp0, fbgs_end_P_0=:fep0, ');
 query.SQL.Add('fbgs_start_m_0=:fsm0, fbgs_end_m_0=:fem0, fbgs_start_p20_0=:fsp200, ');
 query.SQL.Add('fbgs_end_p20_0=:fep200, fbgs_start_time_1=:fst1, fbgs_end_time_1=:fet1,');
 query.SQL.Add('fbgs_tank_id_1=:fti1, fbgs_start_level_1=:fsl1, ');
 query.SQL.Add('fbgs_end_level_1=:fel1, fbgs_start_volume_1=:fsv1, ');
 query.SQL.Add('fbgs_end_volume_1=:fev1, fbgs_start_temp_1=:fstemp1, ');
 query.SQL.Add('fbgs_end_temp_1=:fetemp1, fbgs_start_p_1=:fsp1, fbgs_end_P_1=:fep1, ');
 query.SQL.Add('fbgs_start_m_1=:fsm1, fbgs_end_m_1=:fem1, fbgs_start_p20_1=:fsp201, ');
 query.SQL.Add('fbgs_end_p20_1=:fep201, fbgs_start_time_2=:fst2, fbgs_end_time_2=:fet2,');
 query.SQL.Add('fbgs_tank_id_2=:fti2, fbgs_start_level_2=:fsl2, ');
 query.SQL.Add('fbgs_end_level_2=:fel2, fbgs_start_volume_2=:fsv2, ');
 query.SQL.Add('fbgs_end_volume_2=:fev2, fbgs_start_temp_2=:fstemp2, ');
 query.SQL.Add('fbgs_end_temp_2=:fetemp2, fbgs_start_p_2=:fsp2, fbgs_end_P_2=:fep2, ');
 query.SQL.Add('fbgs_start_m_2=:fsm2, fbgs_end_m_2=:fem2, fbgs_start_p20_2=:fsp202, ');
 query.SQL.Add('fbgs_end_p20_2=:fep202 where akt_num=:an');
 query.Parameters[0].Value:=fbgsstarttime0;
 query.Parameters[1].Value:=fbgsendtime0;
 query.Parameters[2].Value:=fbgstank0;
 query.Parameters[3].Value:=fbgsstartlevel0;
 query.Parameters[4].Value:=fbgsendlevel0;
 query.Parameters[5].Value:=fbgsstartvol0;
 query.Parameters[6].Value:=fbgsendvol0;
 if fbgsstartt0<>-1000 then
  query.Parameters[7].Value:=fbgsstartt0
 else
  query.Parameters[7].Value:=null;
 if fbgsendt0<>-1000 then
  query.Parameters[8].Value:=fbgsendt0
 else
  query.Parameters[8].Value:=null;
 query.Parameters[9].Value:=fbgsstartp0;
 query.Parameters[10].Value:=fbgsendp0;
 query.Parameters[11].Value:=fbgsstartm0;
 query.Parameters[12].Value:=fbgsendm0;
 query.Parameters[13].Value:=fbgsstartp200;
 query.Parameters[14].Value:=fbgsendp200;
 query.Parameters[15].Value:=fbgsstarttime1;
 query.Parameters[16].Value:=fbgsendtime1;
 query.Parameters[17].Value:=fbgstank1;
 query.Parameters[18].Value:=fbgsstartlevel1;
 query.Parameters[19].Value:=fbgsendlevel1;
 query.Parameters[20].Value:=fbgsstartvol1;
 query.Parameters[21].Value:=fbgsendvol1;
 if fbgsstartt1<>-1000 then
  query.Parameters[22].Value:=fbgsstartt1
 else
  query.Parameters[22].Value:=null;
 if fbgsendt1<>-1000 then
  query.Parameters[23].Value:=fbgsendt1
 else
  query.Parameters[23].Value:=null;
 query.Parameters[24].Value:=fbgsstartp1;
 query.Parameters[25].Value:=fbgsendp1;
 query.Parameters[26].Value:=fbgsstartm1;
 query.Parameters[27].Value:=fbgsendm1;
 query.Parameters[28].Value:=fbgsstartp201;
 query.Parameters[29].Value:=fbgsendp201;
 query.Parameters[30].Value:=fbgsstarttime2;
 query.Parameters[31].Value:=fbgsendtime2;
 query.Parameters[32].Value:=fbgstank2;
 query.Parameters[33].Value:=fbgsstartlevel2;
 query.Parameters[34].Value:=fbgsendlevel2;
 query.Parameters[35].Value:=fbgsstartvol2;
 query.Parameters[36].Value:=fbgsendvol2;
 if fbgsstartt2<>-1000 then
  query.Parameters[37].Value:=fbgsstartt2
 else
  query.Parameters[37].Value:=null;
 if fbgsendt2<>-1000 then
  query.Parameters[38].Value:=fbgsendt2
 else
  query.Parameters[38].Value:=null;
 query.Parameters[39].Value:=fbgsstartp2;
 query.Parameters[40].Value:=fbgsendp2;
 query.Parameters[41].Value:=fbgsstartm2;
 query.Parameters[42].Value:=fbgsendm2;
 query.Parameters[43].Value:=fbgsstartp202;
 query.Parameters[44].Value:=fbgsendp202;
 query.Parameters[45].Value:=aktnum;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update dbo.adt_work set ADT_start_time_0=:fst0, adt_end_time_0=:fet0, ');
 query.SQL.Add('adt_tank_id_0=:fti0, adt_start_level_0=:fsl0, ');
 query.SQL.Add('adt_end_level_0=:fel0, adt_start_volume_0=:fsv0, ');
 query.SQL.Add('adt_end_volume_0=:fev0, adt_start_temp_0=:fstemp0, ');
 query.SQL.Add('adt_end_temp_0=:fetemp0, adt_start_p_0=:fsp0, adt_end_P_0=:fep0, ');
 query.SQL.Add('adt_start_m_0=:fsm0, adt_end_m_0=:fem0, adt_start_p20_0=:fsp200, ');
 query.SQL.Add('adt_end_p20_0=:fep200, adt_start_time_1=:fst1, adt_end_time_1=:fet1,');
 query.SQL.Add('adt_tank_id_1=:fti1, adt_start_level_1=:fsl1, ');
 query.SQL.Add('adt_end_level_1=:fel1, adt_start_volume_1=:fsv1, ');
 query.SQL.Add('adt_end_volume_1=:fev1, adt_start_temp_1=:fstemp1, ');
 query.SQL.Add('adt_end_temp_1=:fetemp1, adt_start_p_1=:fsp1, adt_end_P_1=:fep1, ');
 query.SQL.Add('adt_start_m_1=:fsm1, adt_end_m_1=:fem1, adt_start_p20_1=:fsp201, ');
 query.SQL.Add('adt_end_p20_1=:fep201 where akt_num=:an');
 query.Parameters[0].Value:=adtstarttime0;
 query.Parameters[1].Value:=adtendtime0;
 query.Parameters[2].Value:=adttank0;
 query.Parameters[3].Value:=adtstartlevel0;
 query.Parameters[4].Value:=adtendlevel0;
 query.Parameters[5].Value:=adtstartvol0;
 query.Parameters[6].Value:=adtendvol0;
 if adtstartt0<>-1000 then
  query.Parameters[7].Value:=adtstartt0
 else
  query.Parameters[7].Value:=null;
 if adtendt0<>-1000 then
  query.Parameters[8].Value:=adtendt0
 else
  query.Parameters[8].Value:=null;
 query.Parameters[9].Value:=adtstartp0;
 query.Parameters[10].Value:=adtendp0;
 query.Parameters[11].Value:=adtstartm0;
 query.Parameters[12].Value:=adtendm0;
 query.Parameters[13].Value:=adtstartp200;
 query.Parameters[14].Value:=adtendp200;
 query.Parameters[15].Value:=adtstarttime1;
 query.Parameters[16].Value:=adtendtime1;
 query.Parameters[17].Value:=adttank1;
 query.Parameters[18].Value:=adtstartlevel1;
 query.Parameters[19].Value:=adtendlevel1;
 query.Parameters[20].Value:=adtstartvol1;
 query.Parameters[21].Value:=adtendvol1;
 if adtstartt1<>-1000 then
  query.Parameters[22].Value:=adtstartt1
 else
  query.Parameters[22].Value:=null;
 query.Parameters[23].Value:=adtendt1;
 query.Parameters[24].Value:=adtstartp1;
 query.Parameters[25].Value:=adtendp1;
 query.Parameters[26].Value:=adtstartm1;
 query.Parameters[27].Value:=adtendm1;
 query.Parameters[28].Value:=adtstartp201;
 query.Parameters[29].Value:=adtendp201;
 query.Parameters[30].Value:=aktnum;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update dbo.otg_work set otg_start_time_0=:fst0, otg_end_time_0=:fet0, ');
 query.SQL.Add('otg_tank_id_0=:fti0, otg_start_level_0=:fsl0, ');
 query.SQL.Add('otg_end_level_0=:fel0, otg_start_volume_0=:fsv0, ');
 query.SQL.Add('otg_end_volume_0=:fev0, otg_start_temp_0=:fstemp0, ');
 query.SQL.Add('otg_end_temp_0=:fetemp0, otg_start_p_0=:fsp0, otg_end_P_0=:fep0, ');
 query.SQL.Add('otg_start_m_0=:fsm0, otg_end_m_0=:fem0, otg_start_p20_0=:fsp200, ');
 query.SQL.Add('otg_end_p20_0=:fep200, otg_start_time_1=:fst1, otg_end_time_1=:fet1,');
 query.SQL.Add('otg_tank_id_1=:fti1, otg_start_level_1=:fsl1, ');
 query.SQL.Add('otg_end_level_1=:fel1, otg_start_volume_1=:fsv1, ');
 query.SQL.Add('otg_end_volume_1=:fev1, otg_start_temp_1=:fstemp1, ');
 query.SQL.Add('otg_end_temp_1=:fetemp1, otg_start_p_1=:fsp1, otg_end_P_1=:fep1, ');
 query.SQL.Add('otg_start_m_1=:fsm1, otg_end_m_1=:fem1, otg_start_p20_1=:fsp201, ');
 query.SQL.Add('otg_end_p20_1=:fep201 where akt_num=:an');
 query.Parameters[0].Value:=otgstarttime0;
 query.Parameters[1].Value:=otgendtime0;
 query.Parameters[2].Value:=otgtank0;
 query.Parameters[3].Value:=otgstartlevel0;
 query.Parameters[4].Value:=otgendlevel0;
 query.Parameters[5].Value:=otgstartvol0;
 query.Parameters[6].Value:=otgendvol0;
 if otgstartt0<>-1000 then
  query.Parameters[7].Value:=otgstartt0
 else
  query.Parameters[7].Value:=null;
 if otgendt0<>-1000 then
  query.Parameters[8].Value:=otgendt0
 else
  query.Parameters[8].Value:=null;
 query.Parameters[9].Value:=otgstartp0;
 query.Parameters[10].Value:=otgendp0;
 query.Parameters[11].Value:=otgstartm0;
 query.Parameters[12].Value:=otgendm0;
 query.Parameters[13].Value:=otgstartp200;
 query.Parameters[14].Value:=otgendp200;
 query.Parameters[15].Value:=otgstarttime1;
 query.Parameters[16].Value:=otgendtime1;
 query.Parameters[17].Value:=otgtank1;
 query.Parameters[18].Value:=otgstartlevel1;
 query.Parameters[19].Value:=otgendlevel1;
 query.Parameters[20].Value:=otgstartvol1;
 query.Parameters[21].Value:=otgendvol1;
 if otgstartt1<>-1000 then
  query.Parameters[22].Value:=otgstartt1
 else
  query.Parameters[22].Value:=null;
 query.Parameters[23].Value:=otgendt1;
 query.Parameters[24].Value:=otgstartp1;
 query.Parameters[25].Value:=otgendp1;
 query.Parameters[26].Value:=otgstartm1;
 query.Parameters[27].Value:=otgendm1;
 query.Parameters[28].Value:=otgstartp201;
 query.Parameters[29].Value:=otgendp201;
 query.Parameters[30].Value:=aktnum;
 query.ExecSQL;

 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update dbo.zp_work set zp_start_time_0=:fst0, zp_end_time_0=:fet0, ');
 query.SQL.Add('zp_tank_id_0=:fti0, zp_start_level_0=:fsl0, ');
 query.SQL.Add('zp_end_level_0=:fel0, zp_start_volume_0=:fsv0, ');
 query.SQL.Add('zp_end_volume_0=:fev0, zp_start_temp_0=:fstemp0, ');
 query.SQL.Add('zp_end_temp_0=:fetemp0, zp_start_p_0=:fsp0, zp_end_P_0=:fep0, ');
 query.SQL.Add('zp_start_m_0=:fsm0, zp_end_m_0=:fem0, zp_start_p20_0=:fsp200, ');
 query.SQL.Add('zp_end_p20_0=:fep200 where akt_num=:an');
 query.Parameters[0].Value:=zpstarttime0;
 query.Parameters[1].Value:=zpendtime0;
 query.Parameters[2].Value:=zptank0;
 query.Parameters[3].Value:=zpstartlevel0;
 query.Parameters[4].Value:=zpendlevel0;
 query.Parameters[5].Value:=zpstartvol0;
 query.Parameters[6].Value:=zpendvol0;
 if zpstartt0<>-1000 then
  query.Parameters[7].Value:=zpstartt0
 else
  query.Parameters[7].Value:=null;
 if zpendt0<>-1000 then
  query.Parameters[8].Value:=zpendt0
 else
  query.Parameters[8].Value:=null;
 query.Parameters[9].Value:=zpstartp0;
 query.Parameters[10].Value:=zpendp0;
 query.Parameters[11].Value:=zpstartm0;
 query.Parameters[12].Value:=zpendm0;
 query.Parameters[13].Value:=zpstartp200;
 query.Parameters[14].Value:=zpendp200;
 query.Parameters[15].Value:=aktnum;
 query.ExecSQL;
 ShowMessage('Success!!!');
except
 ShowMessage('Fail!!!');
end;
 button3.Enabled:=true;
end;

procedure TfrmEditUppgAkt.Button5Click(Sender: TObject);
begin
 close;
end;

procedure TfrmEditUppgAkt.ComboBox11Change(Sender: TObject);
var
 q:TADOQuery;
begin
 otgtank0:=combobox11.ItemIndex;
 combobox12.ItemIndex:=combobox11.ItemIndex;
 q:=TADOQuery.Create(nil);
 q.Connection:=dm.alexpromCon;
 q.Close;
 q.SQL.Clear;
 q.SQL.Add('select matLevel, matVolume, plotn, m, t, p20 from dbo.mat_in_tank where tank_id=:tid');
 q.Parameters[0].Value:=otgtank0;
 q.Open;
 q.First;
 MaskEdit45.Text:=q.FieldByName('matLevel').AsString;
 Panel116.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  otgstartvol0:=q.FieldByName('matVolume').AsInteger
 else
  otgstartvol0:=0;
 Edit20.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit63.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel163.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  otgstartm0:=q.FieldByName('m').AsInteger
 else
  otgstartm0:=0;
 Panel187.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  otgstartp200:=q.FieldByName('p20').AsFLoat
 else
  otgstartp200:=0.0000;
 MaskEdit46.Text:=q.FieldByName('matLevel').AsString;
 Panel117.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  otgendvol0:=q.FieldByName('matVolume').AsInteger
 else
  otgendvol0:=0;
 Edit21.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit64.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel164.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  otgendm0:=q.FieldByName('m').AsInteger
 else
  otgendm0:=0;
 Panel188.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  otgendp200:=q.FieldByName('p20').AsFloat
 else
  otgendp200:=0.0000;
 otgprodvol0:=otgendvol0-otgstartvol0;
 Panel118.Caption:=IntToStr(otgprodvol0);
 otgprodm0:=otgendm0-otgstartm0;
 Panel165.Caption:=IntToStr(otgprodm0);
 q.Free;
end;

procedure TfrmEditUppgAkt.ComboBox13Change(Sender: TObject);
var
 q:TADOQuery;
begin
 otgtank1:=combobox13.ItemIndex;
 combobox14.ItemIndex:=combobox13.ItemIndex;
 q:=TADOQuery.Create(nil);
 q.Connection:=dm.alexpromCon;
 q.Close;
 q.SQL.Clear;
 q.SQL.Add('select matLevel, matVolume, plotn, m, t, p20 from dbo.mat_in_tank where tank_id=:tid');
 q.Parameters[0].Value:=otgtank1;
 q.Open;
 q.First;
 MaskEdit47.Text:=q.FieldByName('matLevel').AsString;
 Panel120.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  otgstartvol1:=q.FieldByName('matVolume').AsInteger
 else
  otgstartvol1:=0;
 Edit22.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit65.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel166.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  otgstartm1:=q.FieldByName('m').AsInteger
 else
  otgstartm1:=0;
 Panel190.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  otgstartp201:=q.FieldByName('p20').AsFLoat
 else
  otgstartp201:=0.0000;
 MaskEdit48.Text:=q.FieldByName('matLevel').AsString;
 Panel121.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  otgendvol1:=q.FieldByName('matVolume').AsInteger
 else
  otgendvol1:=0;
 Edit23.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit66.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel167.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  otgendm1:=q.FieldByName('m').AsInteger
 else
  otgendm1:=0;
 Panel191.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  otgendp201:=q.FieldByName('p20').AsFloat
 else
  otgendp201:=0.0000;
 otgprodvol1:=otgendvol1-otgstartvol1;
 Panel122.Caption:=IntToStr(otgprodvol1);
 otgprodm1:=otgendm1-otgstartm1;
 Panel168.Caption:=IntToStr(otgprodm1);
 q.Free;
end;

procedure TfrmEditUppgAkt.ComboBox1Change(Sender: TObject);
var
 q:TADOQuery;
begin
 fbgstank0:=combobox1.ItemIndex;
 combobox2.ItemIndex:=combobox1.ItemIndex;
 q:=TADOQuery.Create(nil);
 q.Connection:=dm.alexpromCon;
 q.Close;
 q.SQL.Clear;
 q.SQL.Add('select matLevel, matVolume, plotn, m, t, p20 from dbo.mat_in_tank where tank_id=:tid');
 q.Parameters[0].Value:=fbgstank0;
 q.Open;
 q.First;
 MaskEdit19.Text:=q.FieldByName('matLevel').AsString;
 Panel77.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  fbgsstartvol0:=q.FieldByName('matVolume').AsInteger
 else
  fbgsstartvol0:=0;
 Edit9.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit53.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel148.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  fbgsstartm0:=q.FieldByName('m').AsInteger
 else
  fbgsstartm0:=0;
 Panel172.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  fbgsstartp200:=q.FieldByName('p20').AsFLoat
 else
  fbgsstartp200:=0.0000;
 MaskEdit20.Text:=q.FieldByName('matLevel').AsString;
 Panel97.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  fbgsendvol0:=q.FieldByName('matVolume').AsInteger
 else
  fbgsendvol0:=0;
 Edit10.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit54.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel149.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  fbgsendm0:=q.FieldByName('m').AsInteger
 else
  fbgsendm0:=0;
 Panel173.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  fbgsendp200:=q.FieldByName('p20').AsFloat
 else
  fbgsendp200:=0.0000;
 fbgsprodvol0:=fbgsendvol0-fbgsstartvol0;
 Panel98.Caption:=IntToStr(fbgsprodvol0);
 fbgsprodm0:=fbgsendm0-fbgsstartm0;
 Panel150.Caption:=IntToStr(fbgsprodm0);
 q.Free;
end;

procedure TfrmEditUppgAkt.ComboBox3Change(Sender: TObject);
var
 q:TADOQuery;
begin
 fbgstank1:=combobox3.ItemIndex;
 combobox4.ItemIndex:=combobox3.ItemIndex;
 q:=TADOQuery.Create(nil);
 q.Connection:=dm.alexpromCon;
 q.Close;
 q.SQL.Clear;
 q.SQL.Add('select matLevel, matVolume, plotn, m, t, p20 from dbo.mat_in_tank where tank_id=:tid');
 q.Parameters[0].Value:=fbgstank1;
 q.Open;
 q.First;
 MaskEdit37.Text:=q.FieldByName('matLevel').AsString;
 Panel100.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  fbgsstartvol1:=q.FieldByName('matVolume').AsInteger
 else
  fbgsstartvol1:=0;
 Edit11.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit55.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel151.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  fbgsstartm1:=q.FieldByName('m').AsInteger
 else
  fbgsstartm1:=0;
 Panel175.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  fbgsstartp201:=q.FieldByName('p20').AsFLoat
 else
  fbgsstartp201:=0.0000;
 MaskEdit38.Text:=q.FieldByName('matLevel').AsString;
 Panel101.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  fbgsendvol1:=q.FieldByName('matVolume').AsInteger
 else
  fbgsendvol1:=0;
 Edit12.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit56.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel152.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  fbgsendm1:=q.FieldByName('m').AsInteger
 else
  fbgsendm1:=0;
 Panel176.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  fbgsendp201:=q.FieldByName('p20').AsFloat
 else
  fbgsendp201:=0.0000;
 fbgsprodvol1:=fbgsendvol1-fbgsstartvol1;
 Panel102.Caption:=IntToStr(fbgsprodvol1);
 fbgsprodm1:=fbgsendm1-fbgsstartm1;
 Panel153.Caption:=IntToStr(fbgsprodm1);
 q.Free;
end;

procedure TfrmEditUppgAkt.ComboBox5Change(Sender: TObject);
var
 q:TADOQuery;
begin
 fbgstank2:=combobox5.ItemIndex;
 combobox6.ItemIndex:=combobox5.ItemIndex;
 q:=TADOQuery.Create(nil);
 q.Connection:=dm.alexpromCon;
 q.Close;
 q.SQL.Clear;
 q.SQL.Add('select matLevel, matVolume, plotn, m, t, p20 from dbo.mat_in_tank where tank_id=:tid');
 q.Parameters[0].Value:=fbgstank2;
 q.Open;
 q.First;
 MaskEdit39.Text:=q.FieldByName('matLevel').AsString;
 Panel104.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  fbgsstartvol2:=q.FieldByName('matVolume').AsInteger
 else
  fbgsstartvol2:=0;
 Edit13.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit57.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel154.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  fbgsstartm2:=q.FieldByName('m').AsInteger
 else
  fbgsstartm2:=0;
 Panel178.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  fbgsstartp202:=q.FieldByName('p20').AsFLoat
 else
  fbgsstartp202:=0.0000;
 MaskEdit40.Text:=q.FieldByName('matLevel').AsString;
 Panel105.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  fbgsendvol2:=q.FieldByName('matVolume').AsInteger
 else
  fbgsendvol2:=0;
 Edit14.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit58.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel155.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  fbgsendm2:=q.FieldByName('m').AsInteger
 else
  fbgsendm2:=0;
 Panel179.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  fbgsendp202:=q.FieldByName('p20').AsFloat
 else
  fbgsendp202:=0.0000;
 fbgsprodvol2:=fbgsendvol2-fbgsstartvol2;
 Panel106.Caption:=IntToStr(fbgsprodvol2);
 fbgsprodm2:=fbgsendm2-fbgsstartm2;
 Panel156.Caption:=IntToStr(fbgsprodm2);
 q.Free;
end;

procedure TfrmEditUppgAkt.ComboBox7Change(Sender: TObject);
var
 q:TADOQuery;
begin
 q:=TADOQuery.Create(nil);
 q.Connection:=dm.alexpromCon;
 adttank0:=combobox7.ItemIndex;
 combobox8.ItemIndex:=combobox7.ItemIndex;
 q.Close;
 q.SQL.Clear;
 q.SQL.Add('select matLevel, matVolume, plotn, m, t, p20 from dbo.mat_in_tank where tank_id=:tid');
 q.Parameters[0].Value:=adttank0;
 q.Open;
 q.First;
 MaskEdit41.Text:=q.FieldByName('matLevel').AsString;
 Panel108.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  adtstartvol0:=q.FieldByName('matVolume').AsInteger
 else
  adtstartvol0:=0;
 Edit15.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit59.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel157.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  adtstartm0:=q.FieldByName('m').AsInteger
 else
  adtstartm0:=0;
 Panel181.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  adtstartp200:=q.FieldByName('p20').AsFLoat
 else
  adtstartp200:=0.000;
 MaskEdit42.Text:=q.FieldByName('matLevel').AsString;
 Panel109.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  adtendvol0:=q.FieldByName('matVolume').AsInteger
 else
  adtendvol0:=0;
 Edit16.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit60.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel158.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  adtendm0:=q.FieldByName('m').AsInteger
 else
  adtendm0:=0;
 Panel182.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  adtendp200:=q.FieldByName('p20').AsFloat
 else
  adtendp200:=0.0000;
 adtprodvol0:=adtendvol0-adtstartvol0;
 Panel110.Caption:=IntToStr(adtprodvol0);
 adtprodm0:=adtendm0-adtstartm0;
 Panel159.Caption:=IntToStr(adtprodm0);
 q.Free;
end;

procedure TfrmEditUppgAkt.ComboBox9Change(Sender: TObject);
var
 q:TADOQuery;
begin
 adttank1:=combobox9.ItemIndex;
 combobox10.ItemIndex:=combobox9.ItemIndex;
 q:=TADOQUery.Create(nil);
 q.Connection:=dm.alexpromCon;
 q.Close;
 q.SQL.Clear;
 q.SQL.Add('select matLevel, matVolume, plotn, m, t, p20 from dbo.mat_in_tank where tank_id=:tid');
 q.Parameters[0].Value:=adttank1;
 q.Open;
 q.First;
 MaskEdit43.Text:=q.FieldByName('matLevel').AsString;
 Panel112.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  adtstartvol1:=q.FieldByName('matVolume').AsInteger
 else
  adtstartvol1:=0;
 Edit18.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit61.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3)
 else
 Panel160.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  adtstartm1:=q.FieldByName('m').AsInteger
 else
  adtstartm1:=0;
 Panel184.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  adtstartp201:=q.FieldByName('p20').AsFLoat
 else
  adtstartp201:=0.000;
 MaskEdit44.Text:=q.FieldByName('matLevel').AsString;
 Panel113.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  adtendvol1:=q.FieldByName('matVolume').AsInteger
 else
  adtendvol1:=0;
 Edit19.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit62.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel161.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  adtendm1:=q.FieldByName('m').AsInteger
 else
  adtendm1:=0;
 Panel185.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  adtendp201:=q.FieldByName('p20').AsFloat
 else
  adtendp201:=0.0000;
 adtprodvol1:=adtendvol1-adtstartvol1;
 Panel114.Caption:=IntToStr(adtprodvol1);
 adtprodm1:=adtendm1-adtstartm1;
 Panel162.Caption:=IntToStr(adtprodm1);
 q.Free;
end;

procedure TfrmEditUppgAkt.Edit10Change(Sender: TObject);
begin
if Edit10.Text<>'' then
 fbgsendt0:=StrToInt(trim(Edit10.Text))
else
 fbgsendt0:=-1000;
end;

procedure TfrmEditUppgAkt.Edit11Change(Sender: TObject);
begin
if edit11.Text<>'' then
 fbgsstartt1:=StrToInt(trim(Edit11.Text))
else
 fbgsstartt1:=-1000;
end;

procedure TfrmEditUppgAkt.Edit12Change(Sender: TObject);
begin
if edit12.Text<>'' then
 fbgsendt1:=StrtoInt(trim(edit12.Text))
else
 fbgsendt1:=-1000;
end;

procedure TfrmEditUppgAkt.Edit13Change(Sender: TObject);
begin
if Edit13.Text<>'' then
 fbgsstartt2:=StrtoInt(trim(edit13.Text))
else
 fbgsstartt2:=-1000;
end;

procedure TfrmEditUppgAkt.Edit14Change(Sender: TObject);
begin
if edit14.Text<>'' then
 fbgsendt2:=StrToInt(Trim(Edit14.Text))
else
 fbgsendt2:=-1000;
end;

procedure TfrmEditUppgAkt.Edit15Change(Sender: TObject);
begin
if Edit15.Text<>'' then
 adtstartt0:=StrToInt(trim(Edit15.Text))
else
 adtstartt0:=-1000;
end;

procedure TfrmEditUppgAkt.Edit16Change(Sender: TObject);
begin
if Edit16.Text<>'' then
 adtendt0:=StrToInt(trim(Edit16.Text))
else
 adtendt0:=-1000;
end;

procedure TfrmEditUppgAkt.Edit18Change(Sender: TObject);
begin
if Edit18.Text<>'' then
 adtstartt1:=StrToInt(trim(Edit18.Text))
else
 adtstartt1:=-1000;
end;

procedure TfrmEditUppgAkt.Edit19Change(Sender: TObject);
begin
if Edit19.Text<>'' then
 adtendt1:=StrToInt(trim(Edit19.Text))
else
 adtendt1:=-1000;
end;

procedure TfrmEditUppgAkt.Edit20Change(Sender: TObject);
begin
if Edit20.Text<>'' then
 otgstartt0:=StrToInt(trim(Edit20.Text))
else
 otgstartt0:=-1000;
end;

procedure TfrmEditUppgAkt.Edit21Change(Sender: TObject);
begin
if Edit21.Text<>'' then
 otgendt0:=StrToInt(trim(Edit21.Text))
else
 otgendt0:=-1000;
end;

procedure TfrmEditUppgAkt.Edit22Change(Sender: TObject);
begin
if Edit22.Text<>'' then
 otgstartt1:=StrToInt(trim(Edit22.Text))
else
 otgstartt1:=-1000;
end;

procedure TfrmEditUppgAkt.Edit23Change(Sender: TObject);
begin
if Edit23.Text<>'' then
 otgendt1:=StrToInt(trim(Edit23.Text))
else
 otgendt1:=-1000;
end;

procedure TfrmEditUppgAkt.Edit24Change(Sender: TObject);
begin
if Edit24.Text<>'' then
 zpstartt0:=StrToInt(trim(Edit24.Text))
else
 zpstartt0:=-1000;
end;

procedure TfrmEditUppgAkt.Edit25Change(Sender: TObject);
begin
if Edit25.Text<>'' then
 zpendt0:=StrToInt(trim(Edit25.Text))
else
 zpendt0:=-1000;
end;

procedure TfrmEditUppgAkt.Edit9Change(Sender: TObject);
begin
if Edit9.Text<>'' then
 fbgsstartt0:=StrToInt(trim(Edit9.Text))
else
 fbgsstartt0:=-1000;
end;

procedure TfrmEditUppgAkt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure TfrmEditUppgAkt.FormCreate(Sender: TObject);
begin
 query:=tadoquery.Create(nil);
 query.Connection:=dm.alexpromcon;
 initfrm;
end;

procedure tfrmedituppgakt.initfrm;
var
 q:TADOQuery;
begin
 q:=TADOQuery.Create(nil);
 q.Connection:=dm.alexpromCon;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select tank_name from dbo.tank_dic order by tank_id');
 query.Open;
 query.First;
 combobox1.Clear;
 combobox2.Clear;
 combobox3.Clear;
 combobox4.Clear;
 combobox5.Clear;
 combobox6.Clear;
 combobox7.Clear;
 combobox8.Clear;
 combobox9.Clear;
 combobox10.Clear;
 combobox11.Clear;
 combobox12.Clear;
 combobox13.Clear;
 combobox14.Clear;
 while not query.Eof do
  begin
    combobox1.Items.Add(query.Fields[0].asstring);
    combobox2.Items.Add(query.Fields[0].asstring);
    combobox3.Items.Add(query.Fields[0].asstring);
    combobox4.Items.Add(query.Fields[0].asstring);
    combobox5.Items.Add(query.Fields[0].asstring);
    combobox6.Items.Add(query.Fields[0].asstring);
    combobox7.Items.Add(query.Fields[0].asstring);
    combobox8.Items.Add(query.Fields[0].asstring);
    combobox9.Items.Add(query.Fields[0].asstring);
    combobox10.Items.Add(query.Fields[0].asstring);
    combobox11.Items.Add(query.Fields[0].asstring);
    combobox12.Items.Add(query.Fields[0].asstring);
    combobox13.Items.Add(query.Fields[0].asstring);
    combobox14.Items.Add(query.Fields[0].asstring);
    query.Next;
  end;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.v_uppgakts where akt_num=(select max(akt_num) from dbo.v_uppgakts)');
 query.Open;
 query.First;
 aktnum:=query.Fields[0].AsInteger;
 panel1.Caption:=inttostr(aktnum);
 panel2.Caption:=query.FieldByName('aktdate').AsString;
 panel3.Caption:=query.FieldByName('akttime').AsString;
 panel4.Caption:=query.FieldByName('stopername').AsString;
 panel5.Caption:=query.FieldByName('oper1name').AsString;
 panel6.Caption:=query.FieldByName('oper2name').AsString;
 panel7.Caption:=query.FieldByName('name_1').AsString;
 panel8.Caption:=query.FieldByName('name_2').AsString;
 panel9.Caption:=query.FieldByName('name_3').AsString;
 panel10.Caption:=query.FieldByName('name_4').AsString;
 panel11.Caption:=query.FieldByName('name_5').AsString;
 panel12.Caption:=query.FieldByName('name_6').AsString;
 panel13.Caption:=query.FieldByName('name_7').AsString;
 panel14.Caption:=query.FieldByName('name_8').AsString;
 panel15.Caption:=query.FieldByName('name_9').AsString;
 panel16.Caption:=query.FieldByName('name_10').AsString;
 panel17.Caption:=query.FieldByName('comp1percent').AsString;
 panel18.Caption:=query.FieldByName('comp2percent').AsString;
 panel19.Caption:=query.FieldByName('comp3percent').AsString;
 panel20.Caption:=query.FieldByName('comp4percent').AsString;
 panel21.Caption:=query.FieldByName('comp5percent').AsString;
 panel22.Caption:=query.FieldByName('comp6percent').AsString;
 panel23.Caption:=query.FieldByName('comp7percent').AsString;
 panel24.Caption:=query.FieldByName('comp8percent').AsString;
 panel25.Caption:=query.FieldByName('comp9percent').AsString;
 panel26.Caption:=query.FieldByName('comp10percent').AsString;
 panel33.Caption:=query.FieldByName('e1_start_volume_0').AsString;
 panel37.Caption:=query.FieldByName('e1_end_volume_0').AsString;
 panel35.Caption:=query.FieldByName('e1_start_time_0').AsString;
 panel36.Caption:=query.FieldByName('e1_end_time_0').AsString;
 maskedit1.Text:=query.FieldByName('e1_start_level_0').AsString;
 maskedit4.Text:=query.FieldByName('e1_end_level_0').AsString;
 maskedit2.Text:=query.FieldByName('e1_start_p_0').AsString;
 maskedit5.Text:=query.FieldByName('e1_end_p_0').AsString;
 edit1.Text:=query.FieldByName('e1_start_temp_0').AsString;
 edit2.Text:=query.FieldByName('e1_end_temp_0').AsString;
 panel43.Caption:=query.FieldByName('e1_start_m_0').AsString;
 panel44.Caption:=query.FieldByName('e1_end_m_0').AsString;
 panel34.Caption:=query.FieldByName('e1_start_p20_0').AsString;
 panel38.Caption:=query.FieldByName('e1_end_p20_0').AsString;
 fbgstank0:=query.FieldByName('fbgs_tank_id_0').AsInteger;
 ComboBox1.ItemIndex:=query.FieldByName('fbgs_tank_id_0').AsInteger;
 ComboBox2.ItemIndex:=query.FieldByName('fbgs_tank_id_0').AsInteger;
 MaskEdit3.Text:=query.FieldByName('fbgs_start_time_0').AsString;
 MaskEdit19.Text:=query.FieldByName('fbgs_start_level_0').AsString;
 Panel77.Caption:=query.FieldByName('fbgs_start_volume_0').AsString;
 if query.FIeldByname('fbgs_start_volume_0').AsString<>null then
  fbgsstartvol0:=query.FieldByName('fbgs_start_volume_0').AsInteger
 else
  fbgsstartvol0:=0;
 Edit9.Text:=query.FieldByName('fbgs_start_temp_0').AsString;
 if query.FieldByName('fbgs_start_p_0').AsString<>'' then
  MaskEdit53.Text:=FloatToStrF(query.FieldByName('fbgs_start_p_0').AsFLoat, ffFixed, 4, 3);

 Panel148.Caption:=query.FieldByName('fbgs_start_m_0').AsString;
 if query.FieldByName('fbgs_start_m_0').AsString<>'' then
  fbgsstartm0:=query.FieldByName('fbgs_start_m_0').AsInteger
 else
  fbgsstartm0:=0;
 Panel172.Caption:=query.FieldByName('fbgs_start_p20_0').AsString;
 if query.FieldByName('fbgs_start_p20_0').AsString<>'' then
  fbgsstartp200:=query.FieldByName('fbgs_start_p20_0').AsFloat
 else
  fbgsstartp200:=0.0000;
 q.Close;
 q.SQL.Clear;
 q.SQL.Add('select * from dbo.mat_in_tank where tank_id=:tid');
 q.Parameters[0].Value:=query.FieldByName('fbgs_tank_id_0').AsInteger;
 q.Open;
 q.First;
 MaskEdit6.Text:=query.FieldByName('fbgs_end_time_0').AsString;
 MaskEdit20.Text:=q.FieldByName('matLevel').AsString;
 Panel97.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  fbgsendvol0:=q.FieldByName('matvolume').AsInteger
 else
  fbgsendvol0:=0;
 Edit10.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit54.Text:=FLoatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel149.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  fbgsendm0:=q.FieldByName('m').AsInteger
 else
  fbgsendm0:=0;
 Panel173.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  fbgsendp200:=q.FieldByName('p20').AsFloat
 else
  fbgsendp200:=0.0000;
 fbgsprodvol0:=fbgsendvol0-fbgsstartvol0;
 Panel98.Caption:=IntToStr(fbgsprodvol0);
 fbgsprodm0:=fbgsendm0-fbgsstartm0;
 Panel150.Caption:=IntToStr(fbgsprodm0);
 fbgstank1:=query.FieldByName('fbgs_tank_id_1').AsInteger;
 ComboBox3.ItemIndex:=query.FieldByName('fbgs_tank_id_1').AsInteger;
 ComboBox4.ItemIndex:=query.FieldByName('fbgs_tank_id_1').AsInteger;
 MaskEdit21.Text:=query.FieldByName('fbgs_start_time_1').AsString;
 MaskEdit22.Text:=query.FieldByName('fbgs_end_time_1').AsString;
 MaskEdit37.Text:=query.FieldByName('fbgs_start_level_1').AsString;
 Panel100.Caption:=query.FieldByName('fbgs_start_volume_1').AsString;
 if query.FIeldByname('fbgs_start_volume_1').AsString<>null then
  fbgsstartvol1:=query.FieldByName('fbgs_start_volume_1').AsInteger
 else
  fbgsstartvol1:=0;
 Edit11.Text:=query.FieldByName('fbgs_start_temp_1').AsString;
 if query.FieldByName('fbgs_start_p_1').AsString<>'' then
  MaskEdit55.Text:=FLoatToStrF(query.FieldByName('fbgs_start_p_1').AsFloat, ffFixed, 4,3);
 Panel151.Caption:=query.FieldByName('fbgs_start_m_1').AsString;
 if query.FieldByName('fbgs_start_m_1').AsString<>'' then
  fbgsstartm1:=query.FieldByName('fbgs_start_m_1').AsInteger
 else
  fbgsstartm1:=0;
 Panel175.Caption:=query.FieldByName('fbgs_start_p20_1').AsString;
 if query.FieldByName('fbgs_start_p20_1').AsString<>'' then
  fbgsstartp201:=query.FieldByName('fbgs_start_p20_1').AsFloat
 else
  fbgsstartp201:=0.0000;
 q.Close;
 q.Parameters[0].Value:=query.FieldByName('fbgs_tank_id_1').AsInteger;
 q.Open;
 q.First;
 MaskEdit38.Text:=q.FieldByName('matLevel').AsString;
 Panel101.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  fbgsendvol1:=q.FieldByName('matvolume').AsInteger
 else
  fbgsendvol1:=0;
 Edit12.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit56.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel152.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  fbgsendm1:=q.FieldByName('m').AsInteger
 else
  fbgsendm1:=0;
 Panel176.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  fbgsendp201:=q.FieldByName('p20').AsFloat
 else
  fbgsendp201:=0.0000;
 fbgsprodvol1:=fbgsendvol1-fbgsstartvol1;
 Panel102.Caption:=IntToStr(fbgsprodvol1);
 fbgsprodm1:=fbgsendm1-fbgsstartm1;
 Panel153.Caption:=INtToStr(fbgsprodm1);
 fbgstank2:=query.FieldByName('fbgs_tank_id_2').AsInteger;
 ComboBox5.ItemIndex:=query.FieldByName('fbgs_tank_id_2').AsInteger;
 ComboBox6.ItemIndex:=query.FieldByName('fbgs_tank_id_2').AsInteger;
 MaskEdit23.Text:=query.FieldByName('fbgs_start_time_2').AsString;
 MaskEdit24.Text:=query.FieldByName('fbgs_end_time_2').AsString;
 MaskEdit39.Text:=query.FieldByName('fbgs_start_level_2').AsString;
 Panel104.Caption:=query.FieldByName('fbgs_start_volume_2').AsString;
 if query.FIeldByname('fbgs_start_volume_2').AsString<>null then
  fbgsstartvol2:=query.FieldByName('fbgs_start_volume_2').AsInteger
 else
  fbgsstartvol2:=0;
 Edit13.Text:=query.FieldByName('fbgs_start_temp_2').AsString;
 if query.FieldByName('fbgs_start_p_2').AsString<>'' then
  MaskEdit57.Text:=FloatToStrF(query.FieldByName('fbgs_start_p_2').AsFloat, ffFixed, 4, 3);
 Panel154.Caption:=query.FieldByName('fbgs_start_m_2').AsString;
 if query.FieldByName('fbgs_start_m_2').AsString<>'' then
  fbgsstartm2:=query.FieldByName('fbgs_start_m_2').AsInteger
 else
  fbgsstartm2:=0;
 Panel178.Caption:=query.FieldByName('fbgs_start_p20_2').AsString;
 if query.FieldByName('fbgs_start_p20_2').AsString<>'' then
  fbgsstartp202:=query.FieldByName('fbgs_start_p20_2').AsFloat
 else
  fbgsstartp202:=0.0000;
 q.Close;
 q.Parameters[0].Value:=query.FieldByName('fbgs_tank_id_2').AsInteger;
 q.Open;
 q.First;
 MaskEdit40.Text:=q.FieldByName('matLevel').AsString;
 Panel105.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  fbgsendvol2:=q.FieldByName('matvolume').AsInteger
 else
  fbgsendvol2:=0;
 Edit14.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit58.Text:=FloatToStrF(q.FieldByName('plotn').AsFLoat, ffFixed, 4, 3);
 Panel155.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  fbgsendm2:=q.FieldByName('m').AsInteger
 else
  fbgsendm2:=0;
 Panel179.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  fbgsendp202:=q.FieldByName('p20').AsFloat
 else
  fbgsendp202:=0.0000;
 fbgsprodvol2:=fbgsendvol2-fbgsstartvol2;
 Panel106.Caption:=IntToStr(fbgsprodvol2);
 fbgsprodm2:=fbgsendm2-fbgsstartm2;
 Panel156.Caption:=INtToStr(fbgsprodm2);
 adttank0:=query.FieldByName('adt_tank_id_0').AsInteger;
 ComboBox7.ItemIndex:=adtTank0;
 Combobox8.ItemIndex:=adtTank0;
 MaskEdit25.Text:=query.FieldByName('adt_start_time_0').AsString;
 MaskEdit26.Text:=query.FieldByName('adt_end_time_0').AsString;
 MaskEdit41.Text:=query.FieldByName('adt_start_level_0').AsString;
 Panel108.Caption:=query.FieldByName('adt_start_volume_0').AsString;
 if query.FieldByName('adt_start_volume_0').AsString<>'' then
  adtstartvol0:=query.FieldByName('adt_start_volume_0').AsInteger
 else
  adtstartvol0:=0;
 Edit15.Text:=query.FieldByName('adt_start_temp_0').AsString;
 if query.FieldByName('adt_start_p_0').AsString<>'' then
  MaskEdit59.Text:=FLoatToStrF(query.FieldByName('adt_start_p_0').AsFloat, ffFixed, 4, 3);
 Panel157.Caption:=query.FieldByName('adt_start_m_0').AsString;
 if query.FieldByName('adt_start_m_0').AsString<>'' then
  adtstartm0:=query.FieldByName('adt_start_m_0').AsInteger
 else
  adtstartm0:=0;
 Panel181.Caption:=query.FieldByName('adt_start_p20_0').AsString;
 if query.FieldByName('adt_start_p20_0').AsString<>'' then
  adtstartp200:=query.FieldByName('adt_start_p20_0').AsFloat
 else
  adtstartp200:=0.0000;
 q.Close;
 q.Parameters[0].Value:=adttank0;
 q.Open;
 q.First;
 MaskEdit42.Text:=q.FieldByName('matLevel').AsString;
 Panel109.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  adtendvol0:=q.FieldByName('matVolume').AsInteger
 else
  adtendvol0:=0;
 Edit16.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit60.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel158.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  adtendm0:=q.FieldByName('m').AsInteger
 else
  adtendm0:=0;
 Panel182.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  adtendp200:=q.FieldByName('p20').AsFloat
 else
  adtendp200:=0.0000;
 adtprodvol0:=adtendvol0-adtstartvol0;
 Panel110.Caption:=IntToStr(adtprodvol0);
 adtprodm0:=adtendm0-adtstartm0;
 Panel159.Caption:=IntToStr(adtprodm0);
 adttank1:=query.FieldByName('adt_tank_id_1').AsInteger;
 ComboBox9.ItemIndex:=adtTank1;
 ComboBox10.ItemIndex:=adtTank1;
 MaskEdit27.Text:=query.FieldByName('adt_start_time_1').AsString;
 MaskEdit28.Text:=query.FieldByName('adt_end_time_1').AsString;
 MaskEdit43.Text:=query.FieldByName('adt_start_level_1').AsString;
 Panel112.Caption:=query.FieldByName('adt_start_volume_1').AsString;
 if query.FieldByName('adt_start_volume_0').AsString<>'' then
  adtstartvol1:=query.FieldByName('adt_start_volume_1').AsInteger
 else
  adtstartvol1:=0;
 Edit18.Text:=query.FieldByName('adt_start_temp_1').AsString;
 if query.FieldByName('adt_start_p_1').AsString<>'' then
  MaskEdit61.Text:=FloatToStrF(query.FieldByName('adt_start_p_1').AsFloat, ffFixed, 4, 3);
 Panel160.Caption:=query.FieldByName('adt_start_m_1').AsString;
 if query.FieldByName('adt_start_m_1').AsString<>'' then
  adtstartm1:=query.FieldByName('adt_start_m_1').AsInteger
 else
  adtstartm1:=0;
 Panel184.Caption:=query.FieldByName('adt_start_p20_1').AsString;
 if query.FieldByName('adt_start_p20_1').AsString<>'' then
  adtstartp201:=query.FieldByName('adt_start_p20_1').AsFloat
 else
  adtstartp201:=0.0000;
 q.Close;
 q.Parameters[0].Value:=adttank1;
 q.Open;
 q.First;
 MaskEdit44.Text:=q.FieldByName('matLevel').AsString;
 Panel113.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  adtendvol1:=q.FieldByName('matVolume').AsInteger
 else
  adtendvol1:=0;
 Edit19.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit62.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel161.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  adtendm1:=q.FieldByName('m').AsInteger
 else
  adtendm1:=0;
 Panel185.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  adtendp201:=q.FieldByName('p20').AsFloat
 else
  adtendp201:=0.0000;
 adtprodvol1:=adtendvol1-adtstartvol1;
 Panel114.Caption:=IntToStr(adtprodvol1);
 adtprodm1:=adtendm1-adtstartm1;
 Panel162.Caption:=IntToStr(adtprodm1);

 otgtank0:=query.FieldByName('otg_tank_id_0').AsInteger;
 ComboBox11.ItemIndex:=otgTank0;
 Combobox12.ItemIndex:=otgTank0;
 MaskEdit29.Text:=query.FieldByName('otg_start_time_0').AsString;
 MaskEdit30.Text:=query.FieldByName('otg_end_time_0').AsString;
 MaskEdit45.Text:=query.FieldByName('otg_start_level_0').AsString;
 Panel116.Caption:=query.FieldByName('otg_start_volume_0').AsString;
 if query.FieldByName('otg_start_volume_0').AsString<>'' then
  otgstartvol0:=query.FieldByName('otg_start_volume_0').AsInteger
 else
  otgstartvol0:=0;
 Edit20.Text:=query.FieldByName('otg_start_temp_0').AsString;
 if query.FieldByName('otg_start_p_0').AsString<>'' then
  MaskEdit63.Text:=FLoatToStrF(query.FieldByName('otg_start_p_0').AsFloat, ffFixed, 4, 3);
 Panel163.Caption:=query.FieldByName('otg_start_m_0').AsString;
 if query.FieldByName('otg_start_m_0').AsString<>'' then
  otgstartm0:=query.FieldByName('otg_start_m_0').AsInteger
 else
  otgstartm0:=0;
 Panel187.Caption:=query.FieldByName('otg_start_p20_0').AsString;
 if query.FieldByName('otg_start_p20_0').AsString<>'' then
  otgstartp200:=query.FieldByName('otg_start_p20_0').AsFloat
 else
  otgstartp200:=0.0000;
 q.Close;
 q.Parameters[0].Value:=otgtank0;
 q.Open;
 q.First;
 MaskEdit46.Text:=q.FieldByName('matLevel').AsString;
 Panel117.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  otgendvol0:=q.FieldByName('matVolume').AsInteger
 else
  otgendvol0:=0;
 Edit21.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit64.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel164.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  otgendm0:=q.FieldByName('m').AsInteger
 else
  otgendm0:=0;
 Panel188.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  otgendp200:=q.FieldByName('p20').AsFloat
 else
  otgendp200:=0.0000;
 otgprodvol0:=otgendvol0-otgstartvol0;
 Panel118.Caption:=IntToStr(otgprodvol0);
 otgprodm0:=otgendm0-otgstartm0;
 Panel165.Caption:=IntToStr(otgprodm0);

 otgtank1:=query.FieldByName('otg_tank_id_1').AsInteger;
 ComboBox13.ItemIndex:=otgTank1;
 Combobox14.ItemIndex:=otgTank1;
 MaskEdit31.Text:=query.FieldByName('otg_start_time_1').AsString;
 MaskEdit32.Text:=query.FieldByName('otg_end_time_1').AsString;
 MaskEdit47.Text:=query.FieldByName('otg_start_level_1').AsString;
 Panel120.Caption:=query.FieldByName('otg_start_volume_1').AsString;
 if query.FieldByName('otg_start_volume_1').AsString<>'' then
  otgstartvol1:=query.FieldByName('otg_start_volume_1').AsInteger
 else
  otgstartvol1:=0;
 Edit22.Text:=query.FieldByName('otg_start_temp_1').AsString;
 if query.FieldByName('otg_start_p_1').AsString<>'' then
  MaskEdit65.Text:=FLoatToStrF(query.FieldByName('otg_start_p_1').AsFloat, ffFixed, 4, 3);
 Panel166.Caption:=query.FieldByName('otg_start_m_1').AsString;
 if query.FieldByName('otg_start_m_1').AsString<>'' then
  otgstartm1:=query.FieldByName('otg_start_m_1').AsInteger
 else
  otgstartm1:=0;
 Panel190.Caption:=query.FieldByName('otg_start_p20_1').AsString;
 if query.FieldByName('otg_start_p20_1').AsString<>'' then
  otgstartp201:=query.FieldByName('otg_start_p20_1').AsFloat
 else
  otgstartp201:=0.0000;
 q.Close;
 q.Parameters[0].Value:=otgtank1;
 q.Open;
 q.First;
 MaskEdit48.Text:=q.FieldByName('matLevel').AsString;
 Panel121.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  otgendvol1:=q.FieldByName('matVolume').AsInteger
 else
  otgendvol1:=0;
 Edit23.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit66.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel167.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  otgendm1:=q.FieldByName('m').AsInteger
 else
  otgendm1:=0;
 Panel191.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  otgendp201:=q.FieldByName('p20').AsFloat
 else
  otgendp201:=0.0000;
 otgprodvol1:=otgendvol1-otgstartvol1;
 Panel122.Caption:=IntToStr(otgprodvol1);
 otgprodm1:=otgendm1-otgstartm1;
 Panel168.Caption:=IntToStr(otgprodm1);

 zptank0:=query.FieldByName('zp_tank_id_0').AsInteger;
 MaskEdit33.Text:=query.FieldByName('zp_start_time_0').AsString;
 MaskEdit34.Text:=query.FieldByName('zp_end_time_0').AsString;
 MaskEdit49.Text:=query.FieldByName('zp_start_level_0').AsString;
 Panel134.Caption:=query.FieldByName('zp_start_volume_0').AsString;
 if query.FieldByName('zp_start_volume_0').AsString<>'' then
  zpstartvol0:=query.FieldByName('zp_start_volume_0').AsInteger
 else
  zpstartvol0:=0;
 Edit24.Text:=query.FieldByName('zp_start_temp_0').AsString;
 if query.FieldByName('zp_start_p_0').AsString<>'' then
  MaskEdit67.Text:=FLoatToStrF(query.FieldByName('zp_start_p_0').AsFloat, ffFixed, 4, 3);
 Panel169.Caption:=query.FieldByName('zp_start_m_0').AsString;
 if query.FieldByName('zp_start_m_0').AsString<>'' then
  zpstartm0:=query.FieldByName('zp_start_m_0').AsInteger
 else
  zpstartm0:=0;
 Panel193.Caption:=query.FieldByName('zp_start_p20_0').AsString;
 if query.FieldByName('zp_start_p20_0').AsString<>'' then
  zpstartp200:=query.FieldByName('zp_start_p20_0').AsFloat
 else
  zpstartp200:=0.0000;
 q.Close;
 q.Parameters[0].Value:=zptank0;
 q.Open;
 q.First;
 MaskEdit50.Text:=q.FieldByName('matLevel').AsString;
 Panel135.Caption:=q.FieldByName('matVolume').AsString;
 if q.FieldByName('matVolume').AsString<>'' then
  zpendvol0:=q.FieldByName('matVolume').AsInteger
 else
  zpendvol0:=0;
 Edit25.Text:=q.FieldByName('t').AsString;
 if q.FieldByName('plotn').AsString<>'' then
  MaskEdit68.Text:=FloatToStrF(q.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
 Panel170.Caption:=q.FieldByName('m').AsString;
 if q.FieldByName('m').AsString<>'' then
  zpendm0:=q.FieldByName('m').AsInteger
 else
  zpendm0:=0;
 Panel194.Caption:=q.FieldByName('p20').AsString;
 if q.FieldByName('p20').AsString<>'' then
  zpendp200:=q.FieldByName('p20').AsFloat
 else
  zpendp200:=0.0000;
 zpprodvol0:=zpendvol0-zpstartvol0;
 Panel136.Caption:=IntToStr(zpprodvol0);
 zpprodm0:=zpendm0-zpstartm0;
 Panel171.Caption:=IntToStr(zpprodm0);
 q.Free;
end;


procedure TfrmEditUppgAkt.MaskEdit19Change(Sender: TObject);
begin
try
if maskedit19.text<>'    ' then
 fbgsstartlevel0:=StrToInt(trim(maskedit19.Text))
else
 fbgsstartlevel0:=0;
except

end;
end;

procedure TfrmEditUppgAkt.MaskEdit20Change(Sender: TObject);
begin
if maskedit20.text<>'    ' then
 fbgsendlevel0:=StrToInt(trim(maskedit20.Text))
else
 fbgsendlevel0:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit21Change(Sender: TObject);
begin
try
if MaskEdit21.Text<>'  :  ' then
 fbgsstarttime1:=MaskEdit21.Text
else
 fbgsstarttime1:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit22Change(Sender: TObject);
begin
try
if MaskEdit22.Text<>'  :  ' then
 fbgsendtime1:=MaskEdit22.Text
else
 fbgsendtime1:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit23Change(Sender: TObject);
begin
try
if MaskEdit23.Text<>'  :  ' then
 fbgsstarttime2:=MaskEdit23.Text
else
 fbgsstarttime2:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit24Change(Sender: TObject);
begin
try
if MaskEdit24.Text<>'  :  ' then
 fbgsendtime2:=MaskEdit24.Text
else
 fbgsendtime2:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit25Change(Sender: TObject);
begin
try
if MaskEdit25.Text<>'  :  ' then
 adtstarttime0:=MaskEdit25.Text
else
 adtstarttime0:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit26Change(Sender: TObject);
begin
try
if MaskEdit26.Text<>'  :  ' then
 adtendtime0:=MaskEdit26.Text
else
 adtendtime0:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit27Change(Sender: TObject);
begin
try
if MaskEdit27.Text<>'  :  ' then
 adtstarttime1:=MaskEdit27.Text
else
 adtstarttime1:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit28Change(Sender: TObject);
begin
try
if MaskEdit28.Text<>'  :  ' then
 adtendtime1:=MaskEdit28.Text
else
 adtendtime1:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit29Change(Sender: TObject);
begin
try
if MaskEdit29.Text<>'  :  ' then
 otgstarttime0:=MaskEdit29.Text
else
 otgstarttime0:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit30Change(Sender: TObject);
begin
try
if MaskEdit30.Text<>'  :  ' then
 otgendtime0:=MaskEdit30.Text
else
 otgendtime0:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit31Change(Sender: TObject);
begin
try
if MaskEdit31.Text<>'  :  ' then
 otgstarttime1:=MaskEdit31.Text
else
 otgstarttime1:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit32Change(Sender: TObject);
begin
try
if MaskEdit32.Text<>'  :  ' then
 otgendtime1:=MaskEdit32.Text
else
 otgendtime1:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit33Change(Sender: TObject);
begin
try
if MaskEdit33.Text<>'  :  ' then
 zpstarttime0:=MaskEdit33.Text
else
 zpstarttime0:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit34Change(Sender: TObject);
begin
try
if MaskEdit34.Text<>'  :  ' then
 zpendtime0:=MaskEdit34.Text
else
 zpendtime0:=null;
except
exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit37Change(Sender: TObject);
begin
if MaskEdit37.Text<>'    ' then
 fbgsstartlevel1:=StrToInt(trim(MaskEdit37.Text))
else
 fbgsstartlevel1:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit38Change(Sender: TObject);
begin
if MaskEdit38.Text<>'    ' then
 fbgsendlevel1:=StrToInt(trim(MaskEdit38.Text))
else
 fbgsendlevel1:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit39Change(Sender: TObject);
begin
if MaskEdit39.Text<>'    ' then
 fbgsstartlevel2:=StrToInt(trim(MaskEdit39.Text))
else
 fbgsstartlevel2:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit3Change(Sender: TObject);
begin
try
if MaskEdit3.Text<>':' then
 fbgsstarttime0:=MaskEdit3.Text
else
 fbgsstarttime0:=null;
except

end;
end;

procedure TfrmEditUppgAkt.MaskEdit40Change(Sender: TObject);
begin
if MaskEdit40.Text<>'    ' then
 fbgsendlevel2:=StrToInt(trim(MaskEdit40.Text))
else
 fbgsendlevel2:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit41Change(Sender: TObject);
begin
if MaskEdit41.Text<>'    ' then
 adtstartlevel0:=StrToInt(trim(MaskEdit41.Text))
else
 adtstartlevel0:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit42Change(Sender: TObject);
begin
if MaskEdit42.Text<>'    ' then
 adtendlevel0:=StrToInt(trim(MaskEdit42.Text))
else
 adtendlevel0:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit43Change(Sender: TObject);
begin
if MaskEdit43.Text<>'    ' then
 adtstartlevel1:=StrToInt(trim(MaskEdit43.Text))
else
 adtstartlevel1:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit44Change(Sender: TObject);
begin
if MaskEdit44.Text<>'    ' then
 adtendlevel1:=StrToInt(trim(MaskEdit44.Text))
else
 adtendlevel1:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit45Change(Sender: TObject);
begin
try
if MaskEdit45.Text<>'    ' then
 otgstartlevel0:=StrToInt(trim(MaskEdit45.Text))
else
 otgstartlevel0:=0;
except
 exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit46Change(Sender: TObject);
begin
try
if MaskEdit46.Text<>'    ' then
 otgendlevel0:=StrToInt(trim(MaskEdit46.Text))
else
 otgendlevel0:=0;
except
 exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit47Change(Sender: TObject);
begin
try
if MaskEdit47.Text<>'    ' then
 otgstartlevel1:=StrToInt(trim(MaskEdit47.Text))
else
 otgstartlevel1:=0;
except
 exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit48Change(Sender: TObject);
begin
try
if MaskEdit48.Text<>'    ' then
 otgendlevel1:=StrToInt(trim(MaskEdit48.Text))
else
 otgendlevel1:=0;
except
 exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit49Change(Sender: TObject);
begin
try
if MaskEdit49.Text<>'    ' then
 zpstartlevel0:=StrToInt(trim(MaskEdit45.Text))
else
 zpstartlevel0:=0;
except
 exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit50Change(Sender: TObject);
begin
try
if MaskEdit50.Text<>'    ' then
 zpendlevel0:=StrToInt(trim(MaskEdit50.Text))
else
 zpendlevel0:=0;
except
 exit;
end;
end;

procedure TfrmEditUppgAkt.MaskEdit53Change(Sender: TObject);
begin
if MaskEdit53.Text<>' ,   ' then
 fbgsstartp0:=StrToFloat(trim(MaskEdit53.Text))
else
 fbgsstartp0:=0.000;
end;

procedure TfrmEditUppgAkt.MaskEdit54Change(Sender: TObject);
begin
if MaskEdit54.Text<>' ,   ' then
 fbgsendp0:=StrToFloat(trim(MaskEdit54.Text))
else
 fbgsendp0:=0.000;
end;

procedure TfrmEditUppgAkt.MaskEdit55Change(Sender: TObject);
var
 i:byte;
begin
if MaskEdit55.Text<>' ,   ' then
 begin
  if Length(trim(MaskEdit55.Text))<>5 then
   begin
    for i := 5 downto Length(trim(MaskEdit55.Text)) - 1 do
     MaskEdit55.Text:=MaskEdit55.Text+'0';
    fbgsstartp1:=StrToFloat(trim(MaskEdit55.Text))
  end
 end
else
 fbgsstartp1:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit56Change(Sender: TObject);
begin
if maskedit56.Text<>' ,   ' then
 fbgsendp1:=StrToFloat(trim(Maskedit56.Text))
else
 fbgsendp1:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit57Change(Sender: TObject);
begin
if maskedit57.Text<>' ,   ' then
 fbgsstartp2:=StrToFloat(Trim(MaskEdit57.Text))
else
 fbgsstartp2:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit58Change(Sender: TObject);
begin
if MaskEdit58.Text<>' ,   ' then
 fbgsendp2:=StrToFloat(Trim(MaskEdit58.Text))
else
 fbgsendp2:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit59Change(Sender: TObject);
begin
if MaskEdit59.Text<>' ,   ' then
 adtstartp0:=StrToFloat(Trim(MaskEdit59.Text))
else
 adtstartp0:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit60Change(Sender: TObject);
begin
if MaskEdit60.Text<>' ,   ' then
 adtendp0:=StrToFloat(Trim(MaskEdit60.Text))
else
 adtendp0:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit61Change(Sender: TObject);
begin
if MaskEdit61.Text<>' ,   ' then
 adtstartp1:=StrToFloat(Trim(MaskEdit61.Text))
else
 adtstartp1:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit62Change(Sender: TObject);
begin
if MaskEdit62.Text<>' ,   ' then
 adtendp1:=StrToFloat(Trim(MaskEdit62.Text))
else
 adtendp1:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit63Change(Sender: TObject);
begin
if MaskEdit63.Text<>' ,   ' then
 otgstartp0:=StrToFloat(Trim(MaskEdit63.Text))
else
 otgstartp0:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit64Change(Sender: TObject);
begin
if MaskEdit64.Text<>' ,   ' then
 otgendp0:=StrToFloat(Trim(MaskEdit64.Text))
else
 otgendp0:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit65Change(Sender: TObject);
begin
if MaskEdit65.Text<>' ,   ' then
 otgstartp1:=StrToFloat(Trim(MaskEdit65.Text))
else
 otgstartp1:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit66Change(Sender: TObject);
begin
if MaskEdit66.Text<>' ,   ' then
 otgendp1:=StrToFloat(Trim(MaskEdit66.Text))
else
 otgendp1:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit67Change(Sender: TObject);
begin
if MaskEdit67.Text<>' ,   ' then
 zpstartp0:=StrToFloat(Trim(MaskEdit67.Text))
else
 zpstartp0:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit68Change(Sender: TObject);
begin
if MaskEdit68.Text<>' ,   ' then
 zpendp0:=StrToFloat(Trim(MaskEdit68.Text))
else
 zpendp0:=0;
end;

procedure TfrmEditUppgAkt.MaskEdit6Change(Sender: TObject);
begin
try
if MaskEdit6.Text<>'  :  ' then
 fbgsendtime0:=MaskEdit6.Text
else
 fbgsendtime0:=null;
except
exit;
end;
end;

end.

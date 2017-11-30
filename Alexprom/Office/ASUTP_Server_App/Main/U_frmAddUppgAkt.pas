unit U_frmAddUppgAkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, ComCtrls, StdCtrls, ExtCtrls, adodb, db, Mask;

type
  TfrmAddUppgAkt = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    calendar: TDateTimePicker;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    Label5: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    GroupBox3: TGroupBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    GroupBox4: TGroupBox;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Panel26: TPanel;
    Panel27: TPanel;
    Label20: TLabel;
    Panel28: TPanel;
    Panel29: TPanel;
    Label21: TLabel;
    Panel30: TPanel;
    Panel31: TPanel;
    Label22: TLabel;
    Panel32: TPanel;
    Panel33: TPanel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Button3: TButton;
    Button4: TButton;
    GroupBox5: TGroupBox;
    Panel34: TPanel;
    Panel35: TPanel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Panel36: TPanel;
    Label31: TLabel;
    Panel37: TPanel;
    Label32: TLabel;
    Panel38: TPanel;
    Panel39: TPanel;
    Label33: TLabel;
    Panel40: TPanel;
    Label34: TLabel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
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
    Panel76: TPanel;
    Panel77: TPanel;
    Panel78: TPanel;
    Panel79: TPanel;
    Panel80: TPanel;
    Panel81: TPanel;
    Panel82: TPanel;
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
    Panel98: TPanel;
    Panel99: TPanel;
    Panel100: TPanel;
    Panel101: TPanel;
    Panel102: TPanel;
    Panel103: TPanel;
    Panel118: TPanel;
    Panel125: TPanel;
    Panel126: TPanel;
    Panel127: TPanel;
    Panel128: TPanel;
    Panel129: TPanel;
    Panel130: TPanel;
    Panel131: TPanel;
    timer: TMaskEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure initfrm; 
  public
    { Public declarations }
  end;

var
  frmAddUppgAkt: TfrmAddUppgAkt;
  query, query_stop, query_op,query_op1:tadoquery;
  ds, ds1, ds2:tdatasource;
  newaktnum, procnum, tasknum:longint;
  e1startlevel0, e1endlevel0, e1startvol0, e1endvol0,e1startm0, e1endm0, e1startt0, e1endt0:longint;
  e1startp0, e1endp0, e1startp200, e1endp200:real;
  e3startlevel0, e3endlevel0, e3startvol0, e3endvol0,e3startm0, e3endm0, e3startt0, e3endt0:longint;
  e3startp0, e3endp0, e3startp200, e3endp200:real;
  fbgsstartlevel0, fbgsstartlevel1, fbgsstartlevel2, fbgsendlevel0, fbgsendlevel1, fbgsendlevel2:longint;
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
  fbgstank0, fbgstank1, fbgstank2, adttank0, adttank1, otgtank0, otgtank1:byte;

implementation

uses u_dm;

{$R *.dfm}

procedure tfrmadduppgakt.initfrm;
var
 query_tank:tadoquery;
begin
 query_tank:=tadoquery.Create(nil);
 query_tank.Connection:=dm.alexpromCon;
 query_stop.Close;
 query_stop.sql.Clear;
 query_stop.sql.add('select id, fio from dbo.workers_uppg where code=3');
 query_stop.open;
 query_stop.First;
 ds.DataSet:=query_stop;
 dblookupcombobox1.listSource:=ds;
 dblookupcombobox1.listField:='fio';
 dblookupcombobox1.KeyField:='id';
 query_op.Close;
 query_op.sql.Clear;
 query_op.sql.add('select id, fio from dbo.workers_uppg where code=6');
 query_op.open;
 query_op.First;
 ds1.DataSet:=query_op;
 dblookupcombobox2.listSource:=ds1;
 dblookupcombobox2.listField:='fio';
 dblookupcombobox2.KeyField:='id';
 query_op1.Close;
 query_op1.sql.Clear;
 query_op1.sql.add('select id, fio from dbo.workers_uppg where code=6');
 query_op1.open;
 query_op1.First;
 ds2.DataSet:=query_op1;
 dblookupcombobox3.listSource:=ds2;
 dblookupcombobox3.listField:='fio';
 dblookupcombobox3.KeyField:='id';
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.v_procentovka where id=(select max(id) from dbo.v_procentovka)');
 query.Open;
 query.First;
 panel1.Caption:=query.FieldByName('name_1').AsString;
 panel2.Caption:=query.FieldByName('name_2').AsString;
 panel3.Caption:=query.FieldByName('name_3').AsString;
 panel4.Caption:=query.FieldByName('name_4').AsString;
 panel5.Caption:=query.FieldByName('name_5').AsString;
 panel6.Caption:=query.FieldByName('name_6').AsString;
 panel7.Caption:=query.FieldByName('name_7').AsString;
 panel8.Caption:=query.FieldByName('name_8').AsString;
 panel9.Caption:=query.FieldByName('name_9').AsString;
 panel10.Caption:=query.FieldByName('name_10').AsString;
 panel11.Caption:=query.FieldByName('comp1percent').AsString;
 panel12.Caption:=query.FieldByName('comp2percent').AsString;
 panel13.Caption:=query.FieldByName('comp3percent').AsString;
 panel14.Caption:=query.FieldByName('comp4percent').AsString;
 panel15.Caption:=query.FieldByName('comp5percent').AsString;
 panel16.Caption:=query.FieldByName('comp6percent').AsString;
 panel17.Caption:=query.FieldByName('comp7percent').AsString;
 panel18.Caption:=query.FieldByName('comp8percent').AsString;
 panel19.Caption:=query.FieldByName('comp9percent').AsString;
 panel20.Caption:=query.FieldByName('comp10percent').AsString;
 procnum:=query.FieldByName('id').Asinteger;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.uppgtasks where id=(select max(id) from dbo.uppgtasks)');
 query.Open;
 panel24.Caption:=query.FieldByName('fbgs_char').AsString;
 panel25.Caption:=query.FieldByName('fbgs_tkk').AsString;
 panel26.Caption:=query.FieldByName('adt_char_0').AsString;
 panel27.Caption:=query.FieldByName('adt_tflash').AsString;
 panel28.Caption:=query.FieldByName('adt_char_1').AsString;
 panel29.Caption:=query.FieldByName('adt_tpom').AsString;
 panel30.Caption:=query.FieldByName('otg_char_0').AsString;
 panel31.Caption:=query.FieldByName('otg_tflash').AsString;
 panel32.Caption:=query.FieldByName('otg_char_1').AsString;
 panel33.Caption:=query.FieldByName('otg_out').AsString;
 tasknum:=query.FieldByName('id').Asinteger;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.v_uppgakts where akt_num=(select max(akt_num) from dbo.v_uppgakts)');
 query.Open;
 newaktnum:=query.FieldByName('akt_num').AsInteger+1;
 if newaktnum<>0 then
  begin
   Panel35.Caption:=query.FieldByName('E1_end_Level_0').AsString;
   Panel36.Caption:=query.FieldByName('E1_end_Volume_0').AsString;
   if query.FieldByName('E1_end_Volume_0').AsString='' then
    e1endvol0:=0
   else
    e1endvol0:=query.FieldByName('E1_end_Volume_0').Asinteger;
   panel37.Caption:=query.FieldByName('E1_end_p_0').AsString;
   if query.FieldByName('E1_end_p_0').AsString='' then
    e1endp0:=0
   else
    e1endp0:=query.FieldByName('E1_end_p_0').Asfloat;
   panel38.Caption:=query.FieldByName('E1_end_temp_0').AsString;
   if query.FieldByName('E1_end_temp_0').AsString='' then
    e1endt0:=0
   else
    e1endt0:=query.FieldByName('E1_end_temp_0').Asinteger;
   panel39.Caption:=query.FieldByName('E1_end_m_0').AsString;
   if query.FieldByName('E1_end_m_0').AsString='' then
    e1endm0:=0
   else
    e1endm0:=query.FieldByName('E1_end_m_0').Asinteger;
   panel40.Caption:=query.FieldByName('E1_end_p20_0').AsString;
   if query.FieldByName('E1_end_p20_0').AsString='' then
    e1endp200:=0
   else
    e1endp200:=query.FieldByName('E1_end_p20_0').Asfloat;
   Panel42.Caption:=query.FieldByName('p25_end_Level_0').AsString;
   if query.FieldByName('p25_end_Level_0').AsString='' then
    p25endlevel0:=0
   else
    p25endlevel0:=query.FieldByName('p25_end_Level_0').Asinteger;
   Panel43.Caption:=query.FieldByName('p25_end_Volume_0').AsString;
   if query.FieldByName('p25_end_Volume_0').AsString='' then
    p25endvol0:=0
   else
    p25endvol0:=query.FieldByName('p25_end_Volume_0').Asinteger;
   panel44.Caption:=query.FieldByName('p25_end_p_0').AsString;
   if query.FieldByName('p25_end_p_0').AsString='' then
    p25endp0:=0
   else
    p25endp0:=query.FieldByName('p25_end_p_0').Asfloat;
   panel45.Caption:=query.FieldByName('p25_end_temp_0').AsString;
   if query.FieldByName('p25_end_temp_0').AsString='' then
    p25endt0:=0
   else
    p25endt0:=query.FieldByName('p25_end_temp_0').Asinteger;
   panel46.Caption:=query.FieldByName('p25_end_m_0').AsString;
   if query.FieldByName('p25_end_m_0').AsString='' then
    p25endm0:=0
   else
    p25endm0:=query.FieldByName('p25_end_m_0').Asinteger;
   panel47.Caption:=query.FieldByName('p25_end_p20_0').AsString;
   if query.FieldByName('p25_end_p20_0').AsString='' then
    p25endp200:=0
   else
    p25endp200:=query.FieldByName('p25_end_p20_0').Asfloat;
   panel48.Caption:=query.FieldByName('fbgs_name_0').AsString;
   query_tank.Close;
   query_tank.SQL.Clear;
   query_tank.SQL.Add('select tank_id from dbo.tank_dic where tank_name=:tname');
   query_tank.Parameters[0].Value:=query.FieldByName('fbgs_name_0').AsString;
   query_tank.Open;
   query_tank.First;
   if query.FieldByName('fbgs_name_0').AsString='' then
     fbgstank0:=0
   else
     fbgstank0:=query_tank.FieldByName('tank_id').AsInteger;
   Panel49.Caption:=query.FieldByName('fbgs_end_Level_0').AsString;
   if query.FieldByName('fbgs_end_Level_0').AsString='' then
    fbgsendlevel0:=0
   else
    fbgsendlevel0:=query.FieldByName('fbgs_end_Level_0').Asinteger;
   Panel50.Caption:=query.FieldByName('fbgs_end_Volume_0').AsString;
   if query.FieldByName('fbgs_end_Volume_0').AsString='' then
    fbgsendvol0:=0
   else
    fbgsendvol0:=query.FieldByName('fbgs_end_Volume_0').Asinteger;
   panel51.Caption:=query.FieldByName('fbgs_end_p_0').AsString;
   if query.FieldByName('fbgs_end_p_0').AsString='' then
    fbgsendp0:=0
   else
    fbgsendp0:=query.FieldByName('fbgs_end_p_0').Asfloat;
   panel52.Caption:=query.FieldByName('fbgs_end_temp_0').AsString;
   if query.FieldByName('fbgs_end_temp_0').AsString='' then
    fbgsendt0:=0
   else
    fbgsendt0:=query.FieldByName('fbgs_end_temp_0').Asfloat;
   panel53.Caption:=query.FieldByName('fbgs_end_m_0').AsString;
   if query.FieldByName('fbgs_end_m_0').AsString='' then
    fbgsendm0:=0
   else
    fbgsendm0:=query.FieldByName('fbgs_end_m_0').Asinteger;
   panel54.Caption:=query.FieldByName('fbgs_end_p20_0').AsString;
   if query.FieldByName('fbgs_end_p20_0').AsString='' then
    fbgsendp200:=0
   else
    fbgsendp200:=query.FieldByName('fbgs_end_p20_0').Asfloat;
   panel55.Caption:=query.FieldByName('fbgs_name_1').AsString;
   query_tank.Close;
   query_tank.SQL.Clear;
   query_tank.SQL.Add('select tank_id from dbo.tank_dic where tank_name=:tname');
   query_tank.Parameters[0].Value:=query.FieldByName('fbgs_name_1').AsString;
   query_tank.Open;
   query_tank.First;
   if query.FieldByName('fbgs_name_1').AsString='' then
     fbgstank1:=0
   else
     fbgstank1:=query_tank.FieldByName('tank_id').AsInteger;
   Panel56.Caption:=query.FieldByName('fbgs_end_Level_1').AsString;
   if query.FieldByName('fbgs_end_Level_1').AsString='' then
    fbgsendlevel1:=0
   else
    fbgsendlevel1:=query.FieldByName('fbgs_end_Level_1').Asinteger;
   Panel57.Caption:=query.FieldByName('fbgs_end_Volume_1').AsString;
   if query.FieldByName('fbgs_end_Volume_1').AsString='' then
    fbgsendvol1:=0
   else
    fbgsendvol1:=query.FieldByName('fbgs_end_Volume_1').Asinteger;
   panel58.Caption:=query.FieldByName('fbgs_end_p_1').AsString;
   if query.FieldByName('fbgs_end_p_1').AsString='' then
    fbgsendp1:=0
   else
    fbgsendp1:=query.FieldByName('fbgs_end_p_1').Asfloat;
   panel59.Caption:=query.FieldByName('fbgs_end_temp_1').AsString;
   if query.FieldByName('fbgs_end_temp_1').AsString='' then
    fbgsendt1:=0
   else
    fbgsendt1:=query.FieldByName('fbgs_end_temp_1').Asfloat;
   panel60.Caption:=query.FieldByName('fbgs_end_m_1').AsString;
   if query.FieldByName('fbgs_end_m_1').AsString='' then
    fbgsendm1:=0
   else
    fbgsendm1:=query.FieldByName('fbgs_end_m_1').Asinteger;
   panel61.Caption:=query.FieldByName('fbgs_end_p20_1').AsString;
   if query.FieldByName('fbgs_end_p20_1').AsString='' then
    fbgsendp201:=0
   else
    fbgsendp201:=query.FieldByName('fbgs_end_p20_1').Asfloat;
   panel62.Caption:=query.FieldByName('fbgs_name_2').AsString;
   query_tank.Close;
   query_tank.SQL.Clear;
   query_tank.SQL.Add('select tank_id from dbo.tank_dic where tank_name=:tname');
   query_tank.Parameters[0].Value:=query.FieldByName('fbgs_name_2').AsString;
   query_tank.Open;
   query_tank.First;
   if query.FieldByName('fbgs_name_2').AsString='' then
     fbgstank2:=0
   else
     fbgstank2:=query_tank.FieldByName('tank_id').AsInteger;
   Panel63.Caption:=query.FieldByName('fbgs_end_Level_2').AsString;
   if query.FieldByName('fbgs_end_Level_2').AsString='' then
    fbgsendlevel2:=0
   else
    fbgsendlevel2:=query.FieldByName('fbgs_end_Level_2').Asinteger;
   Panel64.Caption:=query.FieldByName('fbgs_end_Volume_2').AsString;
   if query.FieldByName('fbgs_end_Volume_2').AsString='' then
    fbgsendvol2:=0
   else
    fbgsendvol2:=query.FieldByName('fbgs_end_Volume_2').Asinteger;
   panel65.Caption:=query.FieldByName('fbgs_end_p_2').AsString;
   if query.FieldByName('fbgs_end_p_2').AsString='' then
    fbgsendp2:=0
   else
    fbgsendp2:=query.FieldByName('fbgs_end_p_2').Asfloat;
   panel66.Caption:=query.FieldByName('fbgs_end_temp_2').AsString;
   if query.FieldByName('fbgs_end_temp_2').AsString='' then
    fbgsendt2:=0
   else
    fbgsendt2:=query.FieldByName('fbgs_end_temp_2').Asfloat;
   panel67.Caption:=query.FieldByName('fbgs_end_m_2').AsString;
   if query.FieldByName('fbgs_end_m_2').AsString='' then
    fbgsendm2:=0
   else
    fbgsendm2:=query.FieldByName('fbgs_end_m_2').Asinteger;
   panel68.Caption:=query.FieldByName('fbgs_end_p20_2').AsString;
   if query.FieldByName('fbgs_end_p20_2').AsString='' then
    fbgsendp202:=0
   else
    fbgsendp202:=query.FieldByName('fbgs_end_p20_2').Asfloat;
   panel69.Caption:=query.FieldByName('adt_name_0').AsString;
   query_tank.Close;
   query_tank.SQL.Clear;
   query_tank.SQL.Add('select tank_id from dbo.tank_dic where tank_name=:tname');
   query_tank.Parameters[0].Value:=query.FieldByName('adt_name_0').AsString;
   query_tank.Open;
   query_tank.First;
   if query.FieldByName('adt_name_0').AsString='' then
     adttank0:=0
   else
     adttank0:=query_tank.FieldByName('tank_id').AsInteger;
   Panel70.Caption:=query.FieldByName('adt_end_Level_0').AsString;
   if query.FieldByName('adt_end_Level_0').AsString='' then
    adtendlevel0:=0
   else
    adtendlevel0:=query.FieldByName('adt_end_Level_0').Asinteger;
   Panel71.Caption:=query.FieldByName('adt_end_Volume_0').AsString;
   if query.FieldByName('adt_end_volume_0').AsString='' then
    adtendvol0:=0
   else
    adtendvol0:=query.FieldByName('adt_end_volume_0').Asinteger;
   panel72.Caption:=query.FieldByName('adt_end_p_0').AsString;
   if query.FieldByName('adt_end_p_0').AsString='' then
    adtendp0:=0
   else
    adtendp0:=query.FieldByName('adt_end_p_0').Asinteger;
   panel73.Caption:=query.FieldByName('adt_end_temp_0').AsString;
   if query.FieldByName('adt_end_temp_0').AsString='' then
    adtendt0:=0
   else
    adtendt0:=query.FieldByName('adt_end_temp_0').Asinteger;
   panel74.Caption:=query.FieldByName('adt_end_m_0').AsString;
   if query.FieldByName('adt_end_m_0').AsString='' then
    adtendm0:=0
   else
    adtendm0:=query.FieldByName('adt_end_m_0').Asinteger;
   panel75.Caption:=query.FieldByName('adt_end_p20_0').AsString;
   if query.FieldByName('adt_end_p20_0').AsString='' then
    adtendp200:=0
   else
    adtendp200:=query.FieldByName('adt_end_p20_0').Asinteger;
   panel76.Caption:=query.FieldByName('adt_name_1').AsString;
   query_tank.Close;
   query_tank.SQL.Clear;
   query_tank.SQL.Add('select tank_id from dbo.tank_dic where tank_name=:tname');
   query_tank.Parameters[0].Value:=query.FieldByName('adt_name_1').AsString;
   query_tank.Open;
   query_tank.First;
   if query.FieldByName('adt_name_1').AsString='' then
     adttank1:=0
   else
     adttank1:=query_tank.FieldByName('tank_id').AsInteger;//
   Panel77.Caption:=query.FieldByName('adt_end_Level_1').AsString;
   if query.FieldByName('adt_end_Level_1').AsString='' then
    adtendlevel1:=0
   else
    adtendlevel1:=query.FieldByName('adt_end_Level_1').Asinteger;
   Panel78.Caption:=query.FieldByName('adt_end_Volume_1').AsString;
   if query.FieldByName('adt_end_volume_1').AsString='' then
    adtendvol1:=0
   else
    adtendvol1:=query.FieldByName('adt_end_volume_1').Asinteger;
   panel79.Caption:=query.FieldByName('adt_end_p_1').AsString;
   if query.FieldByName('adt_end_p_1').AsString='' then
    adtendp1:=0
   else
    adtendp1:=query.FieldByName('adt_end_p_1').Asinteger;
   panel80.Caption:=query.FieldByName('adt_end_temp_1').AsString;
   if query.FieldByName('adt_end_temp_1').AsString='' then
    adtendt1:=0
   else
    adtendt1:=query.FieldByName('adt_end_temp_1').Asinteger;
   panel81.Caption:=query.FieldByName('adt_end_m_1').AsString;
   if query.FieldByName('adt_end_m_1').AsString='' then
    adtendm1:=0
   else
    adtendm1:=query.FieldByName('adt_end_m_1').Asinteger;
   panel82.Caption:=query.FieldByName('adt_end_p20_1').AsString;
   if query.FieldByName('adt_end_p20_1').AsString='' then
    adtendp201:=0
   else
    adtendp201:=query.FieldByName('adt_end_p20_1').Asinteger;
   panel83.Caption:=query.FieldByName('otg_name_0').AsString;
   query_tank.Close;
   query_tank.SQL.Clear;
   query_tank.SQL.Add('select tank_id from dbo.tank_dic where tank_name=:tname');
   query_tank.Parameters[0].Value:=query.FieldByName('otg_name_0').AsString;
   query_tank.Open;
   query_tank.First;
   if query.FieldByName('otg_name_0').AsString='' then
     otgtank0:=0
   else
     otgtank0:=query_tank.FieldByName('tank_id').AsInteger;
   Panel84.Caption:=query.FieldByName('otg_end_Level_0').AsString;
   if query.FieldByName('otg_end_Level_0').AsString='' then
    otgendlevel0:=0
   else
    otgendlevel0:=query.FieldByName('otg_end_Level_0').Asinteger;
   Panel85.Caption:=query.FieldByName('otg_end_Volume_0').AsString;
   if query.FieldByName('otg_end_volume_0').AsString='' then
    otgendvol0:=0
   else
    otgendvol0:=query.FieldByName('otg_end_volume_0').Asinteger;
   panel86.Caption:=query.FieldByName('otg_end_p_0').AsString;
   if query.FieldByName('otg_end_p_0').AsString='' then
    otgendp0:=0
   else
    otgendp0:=query.FieldByName('otg_end_p_0').Asinteger;
   panel87.Caption:=query.FieldByName('otg_end_temp_0').AsString;
   if query.FieldByName('otg_end_temp_0').AsString='' then
    otgendt0:=0
   else
    otgendt0:=query.FieldByName('otg_end_temp_0').Asinteger;
   panel88.Caption:=query.FieldByName('otg_end_m_0').AsString;
   if query.FieldByName('otg_end_m_0').AsString='' then
    otgendm0:=0
   else
    otgendm0:=query.FieldByName('otg_end_m_0').Asinteger;
   panel89.Caption:=query.FieldByName('otg_end_p20_0').AsString;
   if query.FieldByName('otg_end_p20_0').AsString='' then
    otgendp200:=0
   else
    otgendp200:=query.FieldByName('otg_end_p20_0').Asinteger;
   panel90.Caption:=query.FieldByName('otg_name_1').AsString;
   query_tank.Close;
   query_tank.SQL.Clear;
   query_tank.SQL.Add('select tank_id from dbo.tank_dic where tank_name=:tname');
   query_tank.Parameters[0].Value:=query.FieldByName('otg_name_1').AsString;
   query_tank.Open;
   query_tank.First;
   if query.FieldByName('otg_name_1').AsString='' then
     otgtank1:=0
   else
     otgtank1:=query_tank.FieldByName('tank_id').AsInteger;
   Panel91.Caption:=query.FieldByName('otg_end_Level_1').AsString;
   if query.FieldByName('otg_end_Level_1').AsString='' then
    otgendlevel1:=0
   else
    otgendlevel1:=query.FieldByName('otg_end_Level_1').Asinteger;
   Panel92.Caption:=query.FieldByName('otg_end_Volume_1').AsString;
   if query.FieldByName('otg_end_volume_1').AsString='' then
    otgendvol1:=0
   else
    otgendvol1:=query.FieldByName('otg_end_volume_1').Asinteger;
   panel93.Caption:=query.FieldByName('otg_end_p_1').AsString;
   if query.FieldByName('otg_end_p_1').AsString='' then
    otgendp1:=0
   else
    otgendp1:=query.FieldByName('otg_end_p_1').Asinteger;
   panel94.Caption:=query.FieldByName('otg_end_temp_1').AsString;
   if query.FieldByName('otg_end_temp_1').AsString='' then
    otgendt1:=0
   else
    otgendt1:=query.FieldByName('otg_end_temp_1').Asinteger;
   panel95.Caption:=query.FieldByName('otg_end_m_1').AsString;
   if query.FieldByName('otg_end_m_1').AsString='' then
    otgendm1:=0
   else
    otgendm1:=query.FieldByName('otg_end_m_1').Asinteger;
   panel96.Caption:=query.FieldByName('otg_end_p20_1').AsString;
   if query.FieldByName('otg_end_p20_1').AsString='' then
    otgendp201:=0
   else
    otgendp201:=query.FieldByName('otg_end_p20_1').Asinteger;
   Panel98.Caption:=query.FieldByName('zp_end_Level_0').AsString;
   if query.FieldByName('zp_end_Level_0').AsString='' then
    zpendlevel0:=0
   else
    zpendlevel0:=query.FieldByName('zp_end_Level_0').Asinteger;
   Panel99.Caption:=query.FieldByName('zp_end_Volume_0').AsString;
   if query.FieldByName('zp_end_volume_0').AsString='' then
    zpendvol0:=0
   else
    zpendvol0:=query.FieldByName('zp_end_volume_0').Asinteger;
   panel100.Caption:=query.FieldByName('zp_end_p_0').AsString;
   if query.FieldByName('zp_end_p_0').AsString='' then
    zpendp0:=0
   else
    zpendp0:=query.FieldByName('zp_end_p_0').Asinteger;
   panel101.Caption:=query.FieldByName('zp_end_temp_0').AsString;
   if query.FieldByName('zp_end_temp_0').AsString='' then
    zpendt0:=0
   else
    zpendt0:=query.FieldByName('zp_end_temp_0').Asinteger;
   panel102.Caption:=query.FieldByName('zp_end_m_0').AsString;
   if query.FieldByName('zp_end_m_0').AsString='' then
    zpendm0:=0
   else
    zpendm0:=query.FieldByName('zp_end_m_0').Asinteger;
   panel103.Caption:=query.FieldByName('zp_end_p20_0').AsString;
   if query.FieldByName('zp_end_p20_0').AsString='' then
    zpendp200:=0
   else
    zpendp200:=query.FieldByName('zp_end_p20_0').Asinteger;
   Panel126.Caption:=query.FieldByName('e3_end_Level_0').AsString;
   if query.FieldByName('e3_end_Level_0').AsString='' then
    e3endlevel0:=0
   else
    e3endlevel0:=query.FieldByName('e3_end_Level_0').Asinteger;
   Panel127.Caption:=query.FieldByName('e3_end_Volume_0').AsString;
   if query.FieldByName('e3_end_volume_0').AsString='' then
    e3endvol0:=0
   else
    e3endvol0:=query.FieldByName('e3_end_volume_0').Asinteger;
   panel128.Caption:=query.FieldByName('e3_end_p_0').AsString;
   if query.FieldByName('e3_end_p_0').AsString='' then
    e3endp0:=0
   else
    e3endp0:=query.FieldByName('e3_end_p_0').Asinteger;
   panel129.Caption:=query.FieldByName('e3_end_temp_0').AsString;
   if query.FieldByName('e3_end_temp_0').AsString='' then
    e3endt0:=0
   else
    e3endt0:=query.FieldByName('e3_end_temp_0').Asinteger;
   panel130.Caption:=query.FieldByName('e3_end_m_0').AsString;
   if query.FieldByName('e3_end_m_0').AsString='' then
    e3endm0:=0
   else
    e3endm0:=query.FieldByName('e3_end_m_0').Asinteger;
   panel131.Caption:=query.FieldByName('e3_end_p20_0').AsString;
   if query.FieldByName('e3_end_p20_0').AsString='' then
    e3endp200:=0
   else
    e3endp200:=query.FieldByName('e3_end_p20_0').Asinteger;
  query_tank.Free;
  end
 else
  begin

  end;
  inc(newaktnum);
end;


procedure TfrmAddUppgAkt.Button1Click(Sender: TObject);
begin
//
end;

procedure TfrmAddUppgAkt.Button2Click(Sender: TObject);
begin
//
end;

procedure TfrmAddUppgAkt.Button3Click(Sender: TObject);
var
 h,m,s,ms:word;
begin
try
 button3.Enabled:=false;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into dbo.akt_uppg(akt_num, aktdate, ');
 query.SQL.Add('akttime, stoper, oper1, oper2, sirie_id, work_task_id, in_work) values (');
 query.SQL.Add(':a,:b,:c,:d,:e,:f,:g,:h,:i)');
 query.Parameters[0].Value:=newaktnum;
 if length(datetostr(calendar.Date))=10 then
  query.Parameters[1].Value:=datetostr(calendar.Date)
 else
  query.Parameters[1].Value:='0'+datetostr(calendar.Date);
 query.Parameters[2].Value:=timer.text;
 query.Parameters[3].Value:=dblookupcombobox1.KeyValue;
 query.Parameters[4].Value:=dblookupcombobox2.KeyValue;
 if dblookupcombobox3.KeyValue=null then
  query.Parameters[5].Value:=100
 else
  query.Parameters[5].Value:=dblookupcombobox3.KeyValue;
 query.Parameters[6].Value:=procnum;
 query.Parameters[7].Value:=tasknum;
 query.Parameters[8].Value:=1;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into dbo.e1_work (akt_num, e1_start_time_0, e1_end_time_0,');
 query.SQL.Add('e1_start_level_0, e1_end_level_0, e1_start_volume_0, e1_end_volume_0,');
 query.SQL.Add('e1_start_temp_0, e1_end_temp_0, e1_start_p_0, e1_end_p_0,');
 query.SQL.Add('e1_start_m_0, e1_end_m_0, e1_start_p20_0, e1_end_p20_0) values (');
 query.SQL.Add(':a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o)');
 query.Parameters[0].Value:=newaktnum;
 query.Parameters[1].Value:=timer.text;
 decodetime(strtotime(timer.text), h, m, s, ms);
 if h=8 then
  query.Parameters[2].Value:='20:00'
 else
  query.Parameters[2].Value:='08:00';
 query.Parameters[3].Value:=e1endlevel0;
 query.Parameters[4].Value:=0;
 query.Parameters[5].Value:=e1endvol0;
 query.Parameters[6].Value:=0;
 query.Parameters[7].Value:=e1endt0;
 query.Parameters[8].Value:=0;
 query.Parameters[9].Value:=e1endp0;
 query.Parameters[10].Value:=0;
 query.Parameters[11].Value:=e1endm0;
 query.Parameters[12].Value:=0;
 query.Parameters[13].Value:=e1endp200;
 query.Parameters[14].Value:=0;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into dbo.p25_work (akt_num, p25_start_time_0, p25_end_time_0,');
 query.SQL.Add('p25_start_level_0, p25_end_level_0, p25_start_volume_0, p25_end_volume_0,');
 query.SQL.Add('p25_start_temp_0, p25_end_temp_0, p25_start_p_0, p25_end_p_0,');
 query.SQL.Add('p25_start_m_0, p25_end_m_0, p25_start_p20_0, p25_end_p20_0) values (');
 query.SQL.Add(':a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o)');
 query.Parameters[0].Value:=newaktnum;
 query.Parameters[1].Value:=timer.text;
 if h=8 then
  query.Parameters[2].Value:='20:00'
 else
  query.Parameters[2].Value:='08:00';
 query.Parameters[3].Value:=p25endlevel0;
 query.Parameters[4].Value:=0;
 query.Parameters[5].Value:=p25endvol0;
 query.Parameters[6].Value:=0;
 query.Parameters[7].Value:=p25endt0;
 query.Parameters[8].Value:=0;
 query.Parameters[9].Value:=p25endp0;
 query.Parameters[10].Value:=0;
 query.Parameters[11].Value:=p25endm0;
 query.Parameters[12].Value:=0;
 query.Parameters[13].Value:=p25endp200;
 query.Parameters[14].Value:=0;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into dbo.fbgs_work (akt_num, fbgs_start_time_0, fbgs_end_time_0, ');
 query.SQL.Add('fbgs_start_level_0, fbgs_end_level_0, fbgs_start_volume_0, fbgs_end_volume_0,');
 query.SQL.Add('fbgs_start_temp_0, fbgs_end_temp_0, fbgs_start_p_0, fbgs_end_p_0,');
 query.SQL.Add('fbgs_start_m_0, fbgs_end_m_0, fbgs_start_p20_0, fbgs_end_p20_0,');
 query.SQL.Add('fbgs_start_level_1, fbgs_end_level_1, fbgs_start_volume_1, fbgs_end_volume_1,');
 query.SQL.Add('fbgs_start_temp_1, fbgs_end_temp_1, fbgs_start_p_1, fbgs_end_p_1,');
 query.SQL.Add('fbgs_start_m_1, fbgs_end_m_1, fbgs_start_p20_1, fbgs_end_p20_1,');
 query.SQL.Add('fbgs_start_level_2, fbgs_end_level_2, fbgs_start_volume_2, fbgs_end_volume_2,');
 query.SQL.Add('fbgs_start_temp_2, fbgs_end_temp_2, fbgs_start_p_2, fbgs_end_p_2,');
 query.SQL.Add('fbgs_start_m_2, fbgs_end_m_2, fbgs_start_p20_2, fbgs_end_p20_2, ');
 query.SQL.Add('fbgs_tank_id_0, fbgs_tank_id_1, fbgs_tank_id_2');
 query.SQL.Add(') values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,');
 query.SQL.Add(':dd,:de,:df,:dg,:dh,:di,:dj,:dk,:dl,:dm,:dn,:do,');
 query.SQL.Add(':ddd,:dde,:ddf,:ddg,:ddh,:ddi,:ddj,:ddk,:ddl,:ddm,:ddn,:ddo,:dd0,:dd1,:dd2)');
 query.Parameters[0].Value:=newaktnum;
 query.Parameters[1].Value:=timer.text;
 if h=8 then
  query.Parameters[2].Value:='20:00'
 else
  query.Parameters[2].Value:='08:00';
 query.Parameters[3].Value:=fbgsendlevel0;
 query.Parameters[4].Value:=0;
 query.Parameters[5].Value:=fbgsendvol0;
 query.Parameters[6].Value:=0;
 query.Parameters[7].Value:=fbgsendt0;
 query.Parameters[8].Value:=0;
 query.Parameters[9].Value:=fbgsendp0;
 query.Parameters[10].Value:=0;
 query.Parameters[11].Value:=fbgsendm0;
 query.Parameters[12].Value:=0;
 query.Parameters[13].Value:=fbgsendp200;
 query.Parameters[14].Value:=0;
 query.Parameters[15].Value:=fbgsendlevel1;
 query.Parameters[16].Value:=0;
 query.Parameters[17].Value:=fbgsendvol1;
 query.Parameters[18].Value:=0;
 query.Parameters[19].Value:=fbgsendt1;
 query.Parameters[20].Value:=0;
 query.Parameters[21].Value:=fbgsendp1;
 query.Parameters[22].Value:=0;
 query.Parameters[23].Value:=fbgsendm1;
 query.Parameters[24].Value:=0;
 query.Parameters[25].Value:=fbgsendp201;
 query.Parameters[26].Value:=0;
 query.Parameters[27].Value:=fbgsendlevel2;
 query.Parameters[28].Value:=0;
 query.Parameters[29].Value:=fbgsendvol2;
 query.Parameters[30].Value:=0;
 query.Parameters[31].Value:=fbgsendt2;
 query.Parameters[32].Value:=0;
 query.Parameters[33].Value:=fbgsendp2;
 query.Parameters[34].Value:=0;
 query.Parameters[35].Value:=fbgsendm2;
 query.Parameters[36].Value:=0;
 query.Parameters[37].Value:=fbgsendp202;
 query.Parameters[38].Value:=0;
 query.Parameters[39].Value:=fbgstank0;
 query.Parameters[40].Value:=fbgstank1;
 query.Parameters[41].Value:=fbgstank2;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into dbo.adt_work (akt_num, adt_start_time_0, adt_end_time_0,');
 query.SQL.Add('adt_start_level_0, adt_end_level_0, adt_start_volume_0, adt_end_volume_0,');
 query.SQL.Add('adt_start_temp_0, adt_end_temp_0, adt_start_p_0, adt_end_p_0,');
 query.SQL.Add('adt_start_m_0, adt_end_m_0, adt_start_p20_0, adt_end_p20_0,');
 query.SQL.Add('adt_start_level_1, adt_end_level_1, adt_start_volume_1, adt_end_volume_1,');
 query.SQL.Add('adt_start_temp_1, adt_end_temp_1, adt_start_p_1, adt_end_p_1,');
 query.SQL.Add('adt_start_m_1, adt_end_m_1, adt_start_p20_1, adt_end_p20_1, adt_tank_id_0, adt_tank_id_1');
 query.SQL.Add(') values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,');
 query.SQL.Add(':dd,:de,:df,:dg,:dh,:di,:dj,:dk,:dl,:dm,:dn,:do,:d0,:d1)');
 query.Parameters[0].Value:=newaktnum;
 query.Parameters[1].Value:=timer.text;
 if h=8 then
  query.Parameters[2].Value:='20:00'
 else
  query.Parameters[2].Value:='08:00';
 query.Parameters[3].Value:=adtendlevel0;
 query.Parameters[4].Value:=0;
 query.Parameters[5].Value:=adtendvol0;
 query.Parameters[6].Value:=0;
 query.Parameters[7].Value:=adtendt0;
 query.Parameters[8].Value:=0;
 query.Parameters[9].Value:=adtendp0;
 query.Parameters[10].Value:=0;
 query.Parameters[11].Value:=adtendm0;
 query.Parameters[12].Value:=0;
 query.Parameters[13].Value:=adtendp200;
 query.Parameters[14].Value:=0;
 query.Parameters[15].Value:=adtendlevel1;
 query.Parameters[16].Value:=0;
 query.Parameters[17].Value:=adtendvol1;
 query.Parameters[18].Value:=0;
 query.Parameters[19].Value:=adtendt1;
 query.Parameters[20].Value:=0;
 query.Parameters[21].Value:=adtendp1;
 query.Parameters[22].Value:=0;
 query.Parameters[23].Value:=adtendm1;
 query.Parameters[24].Value:=0;
 query.Parameters[25].Value:=adtendp201;
 query.Parameters[26].Value:=0;
 query.Parameters[27].Value:=adttank0;
 query.Parameters[28].Value:=adttank1;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into dbo.otg_work (akt_num, otg_start_time_0, otg_end_time_0,');
 query.SQL.Add('otg_start_level_0, otg_end_level_0, otg_start_volume_0, otg_end_volume_0,');
 query.SQL.Add('otg_start_temp_0, otg_end_temp_0, otg_start_p_0, otg_end_p_0,');
 query.SQL.Add('otg_start_m_0, otg_end_m_0, otg_start_p20_0, otg_end_p20_0,');
 query.SQL.Add('otg_start_level_1, otg_end_level_1, otg_start_volume_1, otg_end_volume_1,');
 query.SQL.Add('otg_start_temp_1, otg_end_temp_1, otg_start_p_1, otg_end_p_1,');
 query.SQL.Add('otg_start_m_1, otg_end_m_1, otg_start_p20_1, otg_end_p20_1, otg_tank_id_0, otg_tank_id_1');
 query.SQL.Add(') values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,');
 query.SQL.Add(':dd,:de,:df,:dg,:dh,:di,:dj,:dk,:dl,:dm,:dn,:do,:d2,:d1)');
 query.Parameters[0].Value:=newaktnum;
 query.Parameters[1].Value:=timer.text;
 if h=8 then
  query.Parameters[2].Value:='20:00'
 else
  query.Parameters[2].Value:='08:00';
 query.Parameters[3].Value:=otgendlevel0;
 query.Parameters[4].Value:=0;
 query.Parameters[5].Value:=otgendvol0;
 query.Parameters[6].Value:=0;
 query.Parameters[7].Value:=otgendt0;
 query.Parameters[8].Value:=0;
 query.Parameters[9].Value:=otgendp0;
 query.Parameters[10].Value:=0;
 query.Parameters[11].Value:=otgendm0;
 query.Parameters[12].Value:=0;
 query.Parameters[13].Value:=otgendp200;
 query.Parameters[14].Value:=0;
 query.Parameters[15].Value:=otgendlevel1;
 query.Parameters[16].Value:=0;
 query.Parameters[17].Value:=otgendvol1;
 query.Parameters[18].Value:=0;
 query.Parameters[19].Value:=otgendt1;
 query.Parameters[20].Value:=0;
 query.Parameters[21].Value:=otgendp1;
 query.Parameters[22].Value:=0;
 query.Parameters[23].Value:=otgendm1;
 query.Parameters[24].Value:=0;
 query.Parameters[25].Value:=otgendp201;
 query.Parameters[26].Value:=0;
 query.Parameters[27].Value:=otgtank0;
 query.Parameters[28].Value:=otgtank1;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into dbo.zp_work (akt_num, zp_start_time_0, zp_end_time_0,');
 query.SQL.Add('zp_start_level_0, zp_end_level_0, zp_start_volume_0, zp_end_volume_0,');
 query.SQL.Add('zp_start_temp_0, zp_end_temp_0, zp_start_p_0, zp_end_p_0,');
 query.SQL.Add('zp_start_m_0, zp_end_m_0, zp_start_p20_0, zp_end_p20_0)');
 query.SQL.Add(' values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o)');
 query.Parameters[0].Value:=newaktnum;
 query.Parameters[1].Value:=timer.text;
 if h=8 then
  query.Parameters[2].Value:='20:00'
 else
  query.Parameters[2].Value:='08:00';
 query.Parameters[3].Value:=zpendlevel0;
 query.Parameters[4].Value:=0;
 query.Parameters[5].Value:=zpendvol0;
 query.Parameters[6].Value:=0;
 query.Parameters[7].Value:=zpendt0;
 query.Parameters[8].Value:=0;
 query.Parameters[9].Value:=zpendp0;
 query.Parameters[10].Value:=0;
 query.Parameters[11].Value:=zpendm0;
 query.Parameters[12].Value:=0;
 query.Parameters[13].Value:=zpendp200;
 query.Parameters[14].Value:=0;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into dbo.e3_work (akt_num, e3_start_time_0, e3_end_time_0,');
 query.SQL.Add('e3_start_level_0, e3_end_level_0, e3_start_volume_0, e3_end_volume_0,');
 query.SQL.Add('e3_start_temp_0, e3_end_temp_0, e3_start_p_0, e3_end_p_0,');
 query.SQL.Add('e3_start_m_0, e3_end_m_0, e3_start_p20_0, e3_end_p20_0) values (');
 query.SQL.Add(':a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o)');
 query.Parameters[0].Value:=newaktnum;
 query.Parameters[1].Value:=timer.text;
 if h=8 then
  query.Parameters[2].Value:='20:00'
 else
  query.Parameters[2].Value:='08:00';
 query.Parameters[3].Value:=e3endlevel0;
 query.Parameters[4].Value:=0;
 query.Parameters[5].Value:=e3endvol0;
 query.Parameters[6].Value:=0;
 query.Parameters[7].Value:=e3endt0;
 query.Parameters[8].Value:=0;
 query.Parameters[9].Value:=e3endp0;
 query.Parameters[10].Value:=0;
 query.Parameters[11].Value:=e3endm0;
 query.Parameters[12].Value:=0;
 query.Parameters[13].Value:=e3endp200;
 query.Parameters[14].Value:=0;
 query.ExecSQL;
 showmessage('акт создан успешно.');
 button3.Enabled:=true;
 close;
except
 showmessage('акт создан барыжно.');
 button3.Enabled:=true;
 exit;
end;
end;

procedure TfrmAddUppgAkt.Button4Click(Sender: TObject);
begin
 close;
end;

procedure TfrmAddUppgAkt.Button5Click(Sender: TObject);
begin
//
end;

procedure TfrmAddUppgAkt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=cafree;
end;

procedure TfrmAddUppgAkt.FormCreate(Sender: TObject);
var
 h,m,s,ms:word;
begin
 query:=tadoquery.Create(nil);
 query.Connection:=dm.alexpromcon;
 query_stop:=tadoquery.Create(nil);
 query_stop.Connection:=dm.alexpromcon;
 query_op:=tadoquery.Create(nil);
 query_op.Connection:=dm.alexpromcon;
 query_op1:=tadoquery.Create(nil);
 query_op1.Connection:=dm.alexpromcon;
 ds:=tdatasource.Create(nil);
 ds1:=tdatasource.Create(nil);
 ds2:=tdatasource.Create(nil);
 calendar.Date:=now;
 decodetime(now,h,m,s,ms);
 if h>8 then
   if h<20 then
     timer.text:='08:00'
 else
   timer.text:='20:00';
 initfrm;
end;

end.               

unit U_middleaktform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DB, ADODB, RpCon, RpConDS, RpDefine, RpRave,
  ComCtrls, DBCtrls, RpBase, RpSystem;

type
  TmiddleaktForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Panel2: TPanel;
    Label3: TLabel;
    Panel3: TPanel;
    Label4: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label6: TLabel;
    Panel6: TPanel;
    GroupBox2: TGroupBox;
    Panel7: TPanel;
    MaskEdit1: TMaskEdit;
    Label7: TLabel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    MaskEdit2: TMaskEdit;
    Label9: TLabel;
    MaskEdit3: TMaskEdit;
    Label10: TLabel;
    MaskEdit4: TMaskEdit;
    Label11: TLabel;
    MaskEdit5: TMaskEdit;
    Label12: TLabel;
    MaskEdit6: TMaskEdit;
    Label13: TLabel;
    MaskEdit7: TMaskEdit;
    Label14: TLabel;
    MaskEdit8: TMaskEdit;
    Label15: TLabel;
    MaskEdit9: TMaskEdit;
    Label16: TLabel;
    Panel17: TPanel;
    MaskEdit23: TMaskEdit;
    Panel18: TPanel;
    Edit1: TEdit;
    Panel19: TPanel;
    MaskEdit24: TMaskEdit;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    GroupBox4: TGroupBox;
    ADOQuery1: TADOQuery;
    Panel40: TPanel;
    Panel41: TPanel;
    MaskEdit21: TMaskEdit;
    MaskEdit22: TMaskEdit;
    GroupBox7: TGroupBox;
    Panel107: TPanel;
    Panel108: TPanel;
    Panel109: TPanel;
    Panel110: TPanel;
    Panel111: TPanel;
    Panel112: TPanel;
    MaskEdit100: TMaskEdit;
    MaskEdit101: TMaskEdit;
    MaskEdit102: TMaskEdit;
    MaskEdit103: TMaskEdit;
    MaskEdit104: TMaskEdit;
    MaskEdit105: TMaskEdit;
    GroupBox11: TGroupBox;
    Panel113: TPanel;
    Panel114: TPanel;
    Panel115: TPanel;
    Panel116: TPanel;
    Panel117: TPanel;
    Panel118: TPanel;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit17: TMaskEdit;
    MaskEdit18: TMaskEdit;
    MaskEdit19: TMaskEdit;
    MaskEdit20: TMaskEdit;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Panel20: TPanel;
    MaskEdit25: TMaskEdit;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    MaskEdit26: TMaskEdit;
    MaskEdit27: TMaskEdit;
    MaskEdit28: TMaskEdit;
    MaskEdit29: TMaskEdit;
    MaskEdit30: TMaskEdit;
    MaskEdit31: TMaskEdit;
    MaskEdit32: TMaskEdit;
    MaskEdit33: TMaskEdit;
    Panel42: TPanel;
    MaskEdit34: TMaskEdit;
    Panel43: TPanel;
    Edit2: TEdit;
    Panel44: TPanel;
    MaskEdit35: TMaskEdit;
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
    GroupBox5: TGroupBox;
    Panel55: TPanel;
    Panel56: TPanel;
    MaskEdit36: TMaskEdit;
    MaskEdit37: TMaskEdit;
    MaskEdit38: TMaskEdit;
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
    GroupBox6: TGroupBox;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Panel57: TPanel;
    MaskEdit49: TMaskEdit;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    Panel61: TPanel;
    Panel62: TPanel;
    Panel63: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    Panel66: TPanel;
    MaskEdit50: TMaskEdit;
    MaskEdit51: TMaskEdit;
    MaskEdit52: TMaskEdit;
    MaskEdit53: TMaskEdit;
    MaskEdit54: TMaskEdit;
    MaskEdit55: TMaskEdit;
    MaskEdit56: TMaskEdit;
    MaskEdit57: TMaskEdit;
    Panel67: TPanel;
    MaskEdit58: TMaskEdit;
    Panel68: TPanel;
    Edit3: TEdit;
    Panel69: TPanel;
    MaskEdit59: TMaskEdit;
    Panel79: TPanel;
    GroupBox8: TGroupBox;
    Panel80: TPanel;
    Panel81: TPanel;
    MaskEdit60: TMaskEdit;
    MaskEdit61: TMaskEdit;
    MaskEdit62: TMaskEdit;
    MaskEdit72: TMaskEdit;
    GroupBox9: TGroupBox;
    Label34: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Panel82: TPanel;
    MaskEdit73: TMaskEdit;
    Panel84: TPanel;
    Panel85: TPanel;
    Panel86: TPanel;
    Panel87: TPanel;
    Panel88: TPanel;
    Panel89: TPanel;
    Panel90: TPanel;
    Panel91: TPanel;
    MaskEdit75: TMaskEdit;
    MaskEdit76: TMaskEdit;
    MaskEdit77: TMaskEdit;
    MaskEdit78: TMaskEdit;
    MaskEdit79: TMaskEdit;
    MaskEdit80: TMaskEdit;
    MaskEdit81: TMaskEdit;
    Panel92: TPanel;
    MaskEdit82: TMaskEdit;
    Panel93: TPanel;
    Edit4: TEdit;
    Panel94: TPanel;
    MaskEdit83: TMaskEdit;
    Panel95: TPanel;
    Panel96: TPanel;
    Panel97: TPanel;
    Panel98: TPanel;
    Panel99: TPanel;
    Panel100: TPanel;
    Panel101: TPanel;
    Panel102: TPanel;
    Panel103: TPanel;
    Panel104: TPanel;
    GroupBox10: TGroupBox;
    Panel105: TPanel;
    Panel106: TPanel;
    MaskEdit84: TMaskEdit;
    MaskEdit85: TMaskEdit;
    MaskEdit86: TMaskEdit;
    MaskEdit87: TMaskEdit;
    MaskEdit88: TMaskEdit;
    MaskEdit89: TMaskEdit;
    MaskEdit90: TMaskEdit;
    MaskEdit91: TMaskEdit;
    MaskEdit92: TMaskEdit;
    MaskEdit93: TMaskEdit;
    MaskEdit94: TMaskEdit;
    MaskEdit95: TMaskEdit;
    MaskEdit96: TMaskEdit;
    Panel70: TPanel;
    Panel71: TPanel;
    GroupBox12: TGroupBox;
    Panel72: TPanel;
    Panel73: TPanel;
    Panel74: TPanel;
    MaskEdit63: TMaskEdit;
    MaskEdit64: TMaskEdit;
    Panel75: TPanel;
    MaskEdit65: TMaskEdit;
    MaskEdit66: TMaskEdit;
    Panel76: TPanel;
    Panel77: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    GroupBox13: TGroupBox;
    ListView1: TListView;
    MaskEdit67: TMaskEdit;
    MaskEdit68: TMaskEdit;
    MaskEdit69: TMaskEdit;
    Edit5: TEdit;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    Label53: TLabel;
    Label54: TLabel;
    Label55: TLabel;
    Label56: TLabel;
    Label57: TLabel;
    Label58: TLabel;
    Label59: TLabel;
    Label60: TLabel;
    Label61: TLabel;
    Label62: TLabel;
    Label63: TLabel;
    Label64: TLabel;
    Label65: TLabel;
    Label66: TLabel;
    Label67: TLabel;
    Label68: TLabel;
    Label69: TLabel;
    Label70: TLabel;
    Label71: TLabel;
    Label72: TLabel;
    Label73: TLabel;
    Label74: TLabel;
    Label75: TLabel;
    Label76: TLabel;
    Label77: TLabel;
    Label78: TLabel;
    Panel78: TPanel;
    Edit6: TEdit;
    Edit7: TEdit;
    RvProject1: TRvProject;
    RvDataSetConnection6: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    Label43: TLabel;
    DBLookupComboBox1: TDBLookupComboBox;
    RadioGroup1: TRadioGroup;
    Label35: TLabel;
    Label79: TLabel;
    Label5: TLabel;
    Label80: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    DBLookupComboBox3: TDBLookupComboBox;
    DBLookupComboBox4: TDBLookupComboBox;
    procedure Button3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit7Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure MaskEdit65Change(Sender: TObject);
    procedure MaskEdit63Change(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MaskEdit85Change(Sender: TObject);
    procedure MaskEdit84Change(Sender: TObject);
    procedure MaskEdit96Change(Sender: TObject);
    procedure MaskEdit95Change(Sender: TObject);
    procedure MaskEdit94Change(Sender: TObject);
    procedure MaskEdit93Change(Sender: TObject);
    procedure MaskEdit92Change(Sender: TObject);
    procedure MaskEdit91Change(Sender: TObject);
    procedure MaskEdit90Change(Sender: TObject);
    procedure MaskEdit89Change(Sender: TObject);
    procedure MaskEdit88Change(Sender: TObject);
    procedure MaskEdit87Change(Sender: TObject);
    procedure MaskEdit86Change(Sender: TObject);
    procedure MaskEdit81Change(Sender: TObject);
    procedure MaskEdit80Change(Sender: TObject);
    procedure MaskEdit79Change(Sender: TObject);
    procedure MaskEdit78Change(Sender: TObject);
    procedure MaskEdit77Change(Sender: TObject);
    procedure MaskEdit76Change(Sender: TObject);
    procedure MaskEdit75Change(Sender: TObject);
    procedure MaskEdit73Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
    procedure MaskEdit82Change(Sender: TObject);
    procedure MaskEdit69Change(Sender: TObject);
    procedure MaskEdit61Change(Sender: TObject);
    procedure MaskEdit60Change(Sender: TObject);
    procedure MaskEdit72Change(Sender: TObject);
    procedure MaskEdit62Change(Sender: TObject);
    procedure MaskEdit57Change(Sender: TObject);
    procedure MaskEdit56Change(Sender: TObject);
    procedure MaskEdit55Change(Sender: TObject);
    procedure MaskEdit54Change(Sender: TObject);
    procedure MaskEdit53Change(Sender: TObject);
    procedure MaskEdit52Change(Sender: TObject);
    procedure MaskEdit51Change(Sender: TObject);
    procedure MaskEdit50Change(Sender: TObject);
    procedure MaskEdit49Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure MaskEdit58Change(Sender: TObject);
    procedure MaskEdit68Change(Sender: TObject);
    procedure MaskEdit67Change(Sender: TObject);
    procedure MaskEdit37Change(Sender: TObject);
    procedure MaskEdit36Change(Sender: TObject);
    procedure MaskEdit48Change(Sender: TObject);
    procedure MaskEdit47Change(Sender: TObject);
    procedure MaskEdit46Change(Sender: TObject);
    procedure MaskEdit45Change(Sender: TObject);
    procedure MaskEdit44Change(Sender: TObject);
    procedure MaskEdit43Change(Sender: TObject);
    procedure MaskEdit42Change(Sender: TObject);
    procedure MaskEdit41Change(Sender: TObject);
    procedure MaskEdit40Change(Sender: TObject);
    procedure MaskEdit39Change(Sender: TObject);
    procedure MaskEdit38Change(Sender: TObject);
    procedure MaskEdit33Change(Sender: TObject);
    procedure MaskEdit32Change(Sender: TObject);
    procedure MaskEdit31Change(Sender: TObject);
    procedure MaskEdit30Change(Sender: TObject);
    procedure MaskEdit29Change(Sender: TObject);
    procedure MaskEdit28Change(Sender: TObject);
    procedure MaskEdit27Change(Sender: TObject);
    procedure MaskEdit26Change(Sender: TObject);
    procedure MaskEdit25Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure MaskEdit34Change(Sender: TObject);
    procedure MaskEdit22Change(Sender: TObject);
    procedure MaskEdit21Change(Sender: TObject);
    procedure MaskEdit20Change(Sender: TObject);
    procedure MaskEdit19Change(Sender: TObject);
    procedure MaskEdit18Change(Sender: TObject);
    procedure MaskEdit17Change(Sender: TObject);
    procedure MaskEdit16Change(Sender: TObject);
    procedure MaskEdit15Change(Sender: TObject);
    procedure MaskEdit14Change(Sender: TObject);
    procedure MaskEdit13Change(Sender: TObject);
    procedure MaskEdit12Change(Sender: TObject);
    procedure MaskEdit11Change(Sender: TObject);
    procedure MaskEdit10Change(Sender: TObject);
    procedure MaskEdit9Change(Sender: TObject);
    procedure MaskEdit8Change(Sender: TObject);
    procedure MaskEdit7Change(Sender: TObject);
    procedure MaskEdit6Change(Sender: TObject);
    procedure MaskEdit5Change(Sender: TObject);
    procedure MaskEdit4Change(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure MaskEdit2Change(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure MaskEdit23Change(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    function GetAktNum:longint;
    procedure initfrm;
    procedure updateform(aktnum:longint);
    procedure updateheader(aktnum:longint);
    procedure saveData(mode:byte; aktnum:longint);
    procedure save_fbgs(p_key:longint);
    procedure save_adt(p_key:longint);
    procedure save_otg(p_key:longint);
    procedure save_e1(p_key:longint);
    procedure save_middle(p_key:longint);
    procedure changeControls(a_type:byte);
  public
    { Public declarations ++++++++++}
  end;

var
  middleaktForm: TmiddleaktForm;
  query, qqq:tadoquery;
  pkey, fk_uppg:longint;
  fbgs_p,fbgs_p20,adt_p,adt_p20,otg_p,otg_p20,e1_p,e1_p20, middle_fbgs_p, middle_fbgs_p20, middle_adt_p, middle_adt_p20:real;
  fbgs_t, fbgs_tn, fbgs_t5, fbgs_t10, fbgs_t15, fbgs_t20, fbgs_t25, fbgs_t30, fbgs_t35, fbgs_t40:integer;
  fbgs_t45, fbgs_t50, fbgs_t55, fbgs_t60, fbgs_t65, fbgs_t70, fbgs_t75, fbgs_t80, fbgs_t85, fbgs_t90, fbgs_tkk, fbgs_ost, fbgs_lost:integer;
  adt_t, adt_tn, adt_t5, adt_t10, adt_t15, adt_t20, adt_t25, adt_t30, adt_t35, adt_t40:integer;
  adt_t45, adt_t50, adt_t55, adt_t60, adt_t65, adt_t70, adt_t75, adt_t80, adt_t85, adt_t90, adt_tkk, adt_ost, adt_lost, adt_flash, adt_pom:integer;
  otg_t, otg_tn, otg_t5, otg_t10, otg_t15, otg_t20, otg_t25, otg_t30, otg_t35, otg_t40:integer;
  otg_t45, otg_tkk, otg_ost, otg_lost, otg_flash, middle_adt_t, middle_adt_tpom, middle_fbgs_t:integer;
  e1_t, e1_fbgs_tn, e1_fbgs_t5, e1_fbgs_t10, e1_fbgs_t15, e1_fbgs_t20:integer;
  e1_fbgs_t25, e1_fbgs_t30, e1_fbgs_t35, e1_fbgs_t40, e1_fbgs_t45, e1_fbgs_t50:integer;
  e1_fbgs_tkk, e1_ost, e1_lost, e1_adt_tn, e1_adt_t5, e1_adt_t10, e1_adt_t15, e1_adt_t20:integer;
  e1_adt_t25, e1_adt_t30, e1_adt_t35, e1_adt_t40, e1_adt_tkk:integer;
  ds:TDataSource;
  q1,q2,q3:TADOQuery;
  ds1,ds2,ds3:TDataSource;
implementation

uses u_dm;

{$R *.dfm}

procedure TmiddleaktForm.changeControls(a_type: Byte);
var
 query:TADOQuery;
begin
case a_type of
0:begin
 updateHeader(GetAktNum);
 updateForm(GetAktNum);
end;
1:begin

end;
end;
end;

function TmiddleaktForm.GetAktNum:longint;
var
 Pk_query:TADOQuery;
 out_val:longint;
begin
 Pk_query:=TADOQuery.Create(nil);
 Pk_Query.Connection:=dm.alexpromCon;
 Pk_query.Close;
 Pk_query.SQL.Clear;
 Pk_query.SQL.Add('select max(aktnum) from dbo.akt_lab');
 Pk_query.Open;
 Pk_query.First;
 out_val:=Pk_query.Fields[0].AsInteger+1;
 Pk_query.Free;
 Result:=out_val;
end;

procedure tmiddleaktform.updateheader(aktnum:longint);
begin
qqq.Close;
qqq.SQL.Clear;
qqq.SQL.Add('select * from dbo.workers_lab');
qqq.Open;
qqq.First;
ds.DataSet:=qqq;
DBLookupComboBox1.ListSource:=ds;
DBLookupComboBox1.ListField:='fio';
DBLookupComboBox1.KeyField:='id';
DBLookupCombobox1.KeyValue:=query.FieldByName('lab_id').AsInteger;
case RadioGroup1.ItemIndex of
0:begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.v_aktLab where akt_num=:a');
 query.Parameters[0].Value:=aktnum;
 query.Open;
 query.First;
end;
1:begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.v_aktLab where fk_uppg=(select akt_num from dbo.v_uppgakts where akt_num=:a');
 query.Parameters[0].Value:=aktnum;
 query.Open;
 query.First;
end;
end;
 panel1.Caption:=IntToStr(GetAktNum);
 panel2.Caption:=query.FieldByName('aktdate').AsString;
 panel3.Caption:=query.FieldByName('akttime').AsString;
 panel4.Caption:=query.FieldByName('stopername').AsString;
 panel5.Caption:=query.FieldByName('oper1name').AsString;
 panel6.Caption:=query.FieldByName('oper2name').AsString;
end;

procedure tmiddleaktform.updateform(aktnum:longint);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.e1 where id=(select sirie_id from dbo.akt_uppg where akt_num=:an)');
 query.Parameters[0].Value:=pkey;
 query.Open;
 query.First;
 maskedit100.Text:=query.FieldByName('fbgs_perc').AsString;
 maskedit101.Text:=query.FieldByName('adt_perc').AsString;
 maskedit102.Text:=query.FieldByName('paraf_perc').AsString;
 maskedit103.Text:=query.FieldByName('otg_perc').AsString;
 maskedit104.Text:=query.FieldByName('h20_perc').AsString;
 maskedit105.Text:=query.FieldByName('lost').AsString;
 panel114.Caption:=query.FieldByName('fbgs_adt').AsString;
 panel116.Caption:=query.FieldByName('fbgs_adt_par').AsString;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.v_middleakt where akt_num=:an');
 query.Parameters[0].Value:=pkey;
 query.Open;
 query.First;
 try
  fbgs_p:=query.FieldByName('fbgs_p').AsFloat;
  maskedit23.Text:=FloatToStrF(fbgs_p, ffFixed, 4,3);
 except
  maskedit23.Text:=query.FieldByName('fbgs_p').AsString;
 end;
 edit1.Text:=query.FieldByName('fbgs_t').AsString;
 MaskEdit1.Text:=query.FieldByName('fbgs_tn').AsString;
 MaskEdit2.Text:=query.FieldByName('fbgs_t5').AsString;
 MaskEdit3.Text:=query.FieldByName('fbgs_t10').AsString;
 MaskEdit4.Text:=query.FieldByName('fbgs_t15').AsString;
 MaskEdit5.Text:=query.FieldByName('fbgs_t20').AsString;
 MaskEdit6.Text:=query.FieldByName('fbgs_t25').AsString;
 MaskEdit7.Text:=query.FieldByName('fbgs_t30').AsString;
 MaskEdit8.Text:=query.FieldByName('fbgs_t35').AsString;
 MaskEdit9.Text:=query.FieldByName('fbgs_t40').AsString;
 MaskEdit10.Text:=query.FieldByName('fbgs_t45').AsString;
 MaskEdit11.Text:=query.FieldByName('fbgs_t50').AsString;
 MaskEdit12.Text:=query.FieldByName('fbgs_t55').AsString;
 MaskEdit13.Text:=query.FieldByName('fbgs_t60').AsString;
 MaskEdit14.Text:=query.FieldByName('fbgs_t65').AsString;
 MaskEdit15.Text:=query.FieldByName('fbgs_t70').AsString;
 MaskEdit16.Text:=query.FieldByName('fbgs_t75').AsString;
 MaskEdit17.Text:=query.FieldByName('fbgs_t80').AsString;
 MaskEdit18.Text:=query.FieldByName('fbgs_t85').AsString;
 MaskEdit19.Text:=query.FieldByName('fbgs_t90').AsString;
 MaskEdit20.Text:=query.FieldByName('fbgs_tkk').AsString;
 MaskEdit21.Text:=query.FieldByName('fbgs_ost').AsString;
 MaskEdit22.Text:=query.FieldByName('fbgs_lost').AsString;
 try
  adt_p:=query.FieldByName('adt_p').AsFloat;
  maskedit34.Text:=trim(FloatToStrF(adt_p, ffFixed, 4, 3));
 except
  maskedit34.Text:=query.FieldByName('adt_p').AsString;
 end;
 edit2.Text:=query.FieldByName('adt_t').AsString;
 MaskEdit25.Text:=query.FieldByName('adt_tn').AsString;
 MaskEdit26.Text:=query.FieldByName('adt_t5').AsString;
 MaskEdit27.Text:=query.FieldByName('adt_t10').AsString;
 MaskEdit28.Text:=query.FieldByName('adt_t15').AsString;
 MaskEdit29.Text:=query.FieldByName('adt_t20').AsString;
 MaskEdit30.Text:=query.FieldByName('adt_t25').AsString;
 MaskEdit31.Text:=query.FieldByName('adt_t30').AsString;
 MaskEdit32.Text:=query.FieldByName('adt_t35').AsString;
 MaskEdit33.Text:=query.FieldByName('adt_t40').AsString;
 MaskEdit38.Text:=query.FieldByName('adt_t45').AsString;
 MaskEdit39.Text:=query.FieldByName('adt_t50').AsString;
 MaskEdit40.Text:=query.FieldByName('adt_t55').AsString;
 MaskEdit41.Text:=query.FieldByName('adt_t60').AsString;
 MaskEdit42.Text:=query.FieldByName('adt_t65').AsString;
 MaskEdit43.Text:=query.FieldByName('adt_t70').AsString;
 MaskEdit44.Text:=query.FieldByName('adt_t75').AsString;
 MaskEdit45.Text:=query.FieldByName('adt_t80').AsString;
 MaskEdit46.Text:=query.FieldByName('adt_t85').AsString;
 MaskEdit47.Text:=query.FieldByName('adt_t90').AsString;
 MaskEdit48.Text:=query.FieldByName('adt_tkk').AsString;
 MaskEdit36.Text:=query.FieldByName('adt_ost').AsString;
 MaskEdit37.Text:=query.FieldByName('adt_lost').AsString;
 MaskEdit67.Text:=query.FieldByName('adt_tflash').AsString;
 MaskEdit68.Text:=query.FieldByName('adt_tpom').AsString;
 try
  otg_p:=query.FieldByName('otg_p').AsFloat;
  maskedit58.Text:=trim(FloatToStrF(otg_p, ffFixed, 4, 3));
 except
  maskedit58.Text:=query.FieldByName('otg_p').AsString;
 end;
 edit3.Text:=query.FieldByName('otg_t').AsString;
 MaskEdit49.Text:=query.FieldByName('otg_tn').AsString;
 MaskEdit50.Text:=query.FieldByName('otg_t5').AsString;
 MaskEdit51.Text:=query.FieldByName('otg_t10').AsString;
 MaskEdit52.Text:=query.FieldByName('otg_t15').AsString;
 MaskEdit53.Text:=query.FieldByName('otg_t20').AsString;
 MaskEdit54.Text:=query.FieldByName('otg_t25').AsString;
 MaskEdit55.Text:=query.FieldByName('otg_t30').AsString;
 MaskEdit56.Text:=query.FieldByName('otg_t35').AsString;
 MaskEdit57.Text:=query.FieldByName('otg_t40').AsString;
 MaskEdit62.Text:=query.FieldByName('otg_t45').AsString;
 MaskEdit72.Text:=query.FieldByName('otg_tkk').AsString;
 MaskEdit60.Text:=query.FieldByName('otg_ost').AsString;
 MaskEdit61.Text:=query.FieldByName('otg_lost').AsString;
 MaskEdit69.Text:=query.FieldByName('otg_tflash').AsString;
 try
   e1_p:=query.FieldByName('e1_p').AsFloat;
   maskedit82.Text:=trim(FloatToStrF(e1_p, ffFixed, 4, 3));
 except
   maskedit82.Text:=query.FieldByName('e1_p').AsString;
 end;
 edit4.Text:=query.FieldByName('e1_t').AsString;
 MaskEdit73.Text:=query.FieldByName('e1_fbgs_tn').AsString;
 MaskEdit75.Text:=query.FieldByName('e1_fbgs_t10').AsString;
 MaskEdit76.Text:=query.FieldByName('e1_fbgs_t15').AsString;
 MaskEdit77.Text:=query.FieldByName('e1_fbgs_t20').AsString;
 MaskEdit78.Text:=query.FieldByName('e1_fbgs_t25').AsString;
 MaskEdit79.Text:=query.FieldByName('e1_fbgs_t30').AsString;
 MaskEdit80.Text:=query.FieldByName('e1_fbgs_t35').AsString;
 MaskEdit81.Text:=query.FieldByName('e1_fbgs_t40').AsString;
 MaskEdit86.Text:=query.FieldByName('e1_fbgs_t45').AsString;
 MaskEdit87.Text:=query.FieldByName('e1_fbgs_t50').AsString;
 MaskEdit88.Text:=query.FieldByName('e1_adt_tn').AsString;
 MaskEdit89.Text:=query.FieldByName('e1_adt_t10').AsString;
 MaskEdit90.Text:=query.FieldByName('e1_adt_t15').AsString;
 MaskEdit91.Text:=query.FieldByName('e1_adt_t20').AsString;
 MaskEdit92.Text:=query.FieldByName('e1_adt_t25').AsString;
 MaskEdit93.Text:=query.FieldByName('e1_adt_t30').AsString;
 MaskEdit94.Text:=query.FieldByName('e1_adt_t35').AsString;
 MaskEdit95.Text:=query.FieldByName('e1_adt_t40').AsString;
 MaskEdit96.Text:=query.FieldByName('e1_adt_tkk').AsString;
 MaskEdit84.Text:=query.FieldByName('e1_ost').AsString;
 MaskEdit84.Text:=query.FieldByName('e1_lost').AsString;
 try
  middle_fbgs_p:=query.FieldByName('middle_fbgs_p').AsFloat;
  MaskEdit63.Text:=trim(FloatToStrF(middle_fbgs_p, ffFixed, 4, 3));
 except
  MaskEdit63.Text:=query.FieldByName('middle_fbgs_p').AsString;
 end;
 try
  middle_adt_p:=query.FieldByName('middle_adt_p').AsFloat;
  MaskEdit65.Text:=Trim(FloatToStrF(middle_adt_p, ffFixed, 4, 3));
 except
  MaskEdit65.Text:=trim(query.FieldByName('middle_adt_p').AsString);
 end;
 edit6.Text:=query.FieldByName('middle_fbgs_t').AsString;
 edit7.Text:=query.FieldByName('middle_adt_t').AsString;
 edit5.Text:=query.FieldByName('middle_adt_tpom').AsString;
end;

procedure Tmiddleaktform.save_fbgs(p_key:longint);
begin
try
 query.Close;
 query.sql.Clear;
 query.SQL.Add('update dbo.middle_fbgs set p=:@p, t=:@t, p20=:@p20, tn=:@tn, ');
 query.SQL.Add('t5=:@t5, t10=:@t10, t15=:@t15, t20=:@t20, t25=:@t25, t30=:@t30, ');
 query.SQL.Add('t35=:@t35, t40=:@t40, t45=:@t45, t50=:@t50, t55=:@t55, t60=:@t60, ');
 query.SQL.Add('t65=:@t65, t70=:@t70, t75=:@t75, t80=:@t80, t85=:@t85, t90=:@t90, ');
 query.SQL.Add('tkk=:@tkk, ost=:@ost, lost=:@lost where aktnum=:an');
 if fbgs_p=0 then
  query.Parameters[0].Value:=null
 else
  query.Parameters[0].Value:=fbgs_p;
 if fbgs_t=-1000 then
  query.Parameters[1].Value:=null
 else
  query.Parameters[1].Value:=fbgs_t;
 if fbgs_p20=0 then
  query.Parameters[2].Value:=null
 else
  query.Parameters[2].Value:=fbgs_p20;
 if fbgs_tn=0 then
  query.Parameters[3].Value:=null
 else
  query.Parameters[3].Value:=fbgs_tn;
 if fbgs_t5=0 then
  query.Parameters[4].Value:=null
 else
  query.Parameters[4].Value:=fbgs_t5;
 if fbgs_t10=0 then
  query.Parameters[5].Value:=null
 else
  query.Parameters[5].Value:=fbgs_t10;
 if fbgs_t15=0 then
  query.Parameters[6].Value:=null
 else
  query.Parameters[6].Value:=fbgs_t15;
 if fbgs_t20=0 then
  query.Parameters[7].Value:=null
 else
  query.Parameters[7].Value:=fbgs_t20;
 if fbgs_t25=0 then
  query.Parameters[8].Value:=null
 else
  query.Parameters[8].Value:=fbgs_t25;
 if fbgs_t30=0 then
  query.Parameters[9].Value:=null
 else
  query.Parameters[9].Value:=fbgs_t30;
 if fbgs_t35=0 then
  query.Parameters[10].Value:=null
 else
  query.Parameters[10].Value:=fbgs_t35;
 if fbgs_t40=0 then
  query.Parameters[11].Value:=null
 else
  query.Parameters[11].Value:=fbgs_t40;
 if fbgs_t45=0 then
  query.Parameters[12].Value:=null
 else
  query.Parameters[12].Value:=fbgs_t45;
 if fbgs_t50=0 then
  query.Parameters[13].Value:=null
 else
  query.Parameters[13].Value:=fbgs_t50;
 if fbgs_t55=0 then
  query.Parameters[14].Value:=null
 else
  query.Parameters[14].Value:=fbgs_t55;
 if fbgs_t60=0 then
  query.Parameters[15].Value:=null
 else
  query.Parameters[15].Value:=fbgs_t60;
 if fbgs_t65=0 then
  query.Parameters[16].Value:=null
 else
  query.Parameters[16].Value:=fbgs_t65;
 if fbgs_t70=0 then
  query.Parameters[17].Value:=null
 else
  query.Parameters[17].Value:=fbgs_t70;
 if fbgs_t75=0 then
  query.Parameters[18].Value:=null
 else
  query.Parameters[18].Value:=fbgs_t75;
 if fbgs_t80=0 then
  query.Parameters[19].Value:=null
 else
  query.Parameters[19].Value:=fbgs_t80;
 if fbgs_t85=0 then
  query.Parameters[20].Value:=null
 else
  query.Parameters[20].Value:=fbgs_t85;
 if fbgs_t90=0 then
  query.Parameters[21].Value:=null
 else
  query.Parameters[21].Value:=fbgs_t90;
 if fbgs_tkk=0 then
  query.Parameters[22].Value:=null
 else
  query.Parameters[22].Value:=fbgs_tkk;
 if fbgs_ost=0 then
  query.Parameters[23].Value:=null
 else
  query.Parameters[23].Value:=fbgs_ost;
 if fbgs_lost=0 then
  query.Parameters[24].Value:=null
 else
  query.Parameters[24].Value:=fbgs_lost;
 query.Parameters[25].Value:=p_key;
 query.ExecSQL;
except

end;
end;

procedure Tmiddleaktform.save_adt(p_key:longint);
begin
try
 query.Close;
 query.sql.Clear;
 query.SQL.Add('update dbo.middle_adt set p=:@p, t=:@t, p20=:@p20, tn=:@tn, ');
 query.SQL.Add('t5=:@t5, t10=:@t10, t15=:@t15, t20=:@t20, t25=:@t25, t30=:@t30, ');
 query.SQL.Add('t35=:@t35, t40=:@t40, t45=:@t45, t50=:@t50, t55=:@t55, t60=:@t60, ');
 query.SQL.Add('t65=:@t65, t70=:@t70, t75=:@t75, t80=:@t80, t85=:@t85, t90=:@t90, ');
 query.SQL.Add('tkk=:@tkk, ost=:@ost, lost=:@lost, tflash=:@tfl, tpom=:@tpom where aktnum=:an');
 if adt_p=0 then
  query.Parameters[0].Value:=null
 else
  query.Parameters[0].Value:=adt_p;
 if adt_t=-1000 then
  query.Parameters[1].Value:=null
 else
  query.Parameters[1].Value:=adt_t;
 if adt_p20=0 then
  query.Parameters[2].Value:=null
 else
  query.Parameters[2].Value:=adt_p20;
 if adt_tn=0 then
  query.Parameters[3].Value:=null
 else
  query.Parameters[3].Value:=adt_tn;
 if adt_t5=0 then
  query.Parameters[4].Value:=null
 else
  query.Parameters[4].Value:=adt_t5;
 if adt_t10=0 then
  query.Parameters[5].Value:=null
 else
  query.Parameters[5].Value:=adt_t10;
 if adt_t15=0 then
  query.Parameters[6].Value:=null
 else
  query.Parameters[6].Value:=adt_t15;
 if adt_t20=0 then
  query.Parameters[7].Value:=null
 else
  query.Parameters[7].Value:=adt_t20;
 if adt_t25=0 then
  query.Parameters[8].Value:=null
 else
  query.Parameters[8].Value:=adt_t25;
 if adt_t30=0 then
  query.Parameters[9].Value:=null
 else
  query.Parameters[9].Value:=adt_t30;
 if adt_t35=0 then
  query.Parameters[10].Value:=null
 else
  query.Parameters[10].Value:=adt_t35;
 if adt_t40=0 then
  query.Parameters[11].Value:=null
 else
  query.Parameters[11].Value:=adt_t40;
 if adt_t45=0 then
  query.Parameters[12].Value:=null
 else
  query.Parameters[12].Value:=adt_t45;
 if adt_t50=0 then
  query.Parameters[13].Value:=null
 else
  query.Parameters[13].Value:=adt_t50;
 if adt_t55=0 then
  query.Parameters[14].Value:=null
 else
  query.Parameters[14].Value:=adt_t55;
 if adt_t60=0 then
  query.Parameters[15].Value:=null
 else
  query.Parameters[15].Value:=adt_t60;
 if adt_t65=0 then
  query.Parameters[16].Value:=null
 else
  query.Parameters[16].Value:=adt_t65;
 if adt_t70=0 then
  query.Parameters[17].Value:=null
 else
  query.Parameters[17].Value:=adt_t70;
 if adt_t75=0 then
  query.Parameters[18].Value:=null
 else
  query.Parameters[18].Value:=adt_t75;
 if adt_t80=0 then
  query.Parameters[19].Value:=null
 else
  query.Parameters[19].Value:=adt_t80;
 if adt_t85=0 then
  query.Parameters[20].Value:=null
 else
  query.Parameters[20].Value:=adt_t85;
 if adt_t90=0 then
  query.Parameters[21].Value:=null
 else
  query.Parameters[21].Value:=adt_t90;
 if adt_tkk=0 then
  query.Parameters[22].Value:=null
 else
  query.Parameters[22].Value:=adt_tkk;
 if adt_ost=0 then
  query.Parameters[23].Value:=null
 else
  query.Parameters[23].Value:=adt_ost;
 if adt_lost=0 then
  query.Parameters[24].Value:=null
 else
  query.Parameters[24].Value:=adt_lost;
 if adt_flash=0 then
  query.Parameters[25].Value:=null
 else
  query.Parameters[25].Value:=adt_flash;
 if adt_pom=0 then
  query.Parameters[26].Value:=null
 else
  query.Parameters[26].Value:=adt_pom;
 query.Parameters[27].Value:=p_key;
 query.ExecSQL;
except

end;
end;

procedure Tmiddleaktform.save_otg(p_key:longint);
begin
try
 query.Close;
 query.sql.Clear;
 query.SQL.Add('update dbo.middle_otg set p=:@p, t=:@t, p20=:@p20, tn=:@tn, ');
 query.SQL.Add('t5=:@t5, t10=:@t10, t15=:@t15, t20=:@t20, t25=:@t25, t30=:@t30, ');
 query.SQL.Add('t35=:@t35, t40=:@t40, t45=:@t45, tkk=:@tkk, ost=:@ost, lost=:@lost, ');
 query.SQL.Add('tflash=:@tfl where aktnum=:an');
 if otg_p=0 then
  query.Parameters[0].Value:=null
 else
  query.Parameters[0].Value:=otg_p;
 if otg_t=-1000 then
  query.Parameters[1].Value:=null
 else
  query.Parameters[1].Value:=otg_t;
 if otg_p20=0 then
  query.Parameters[2].Value:=null
 else
  query.Parameters[2].Value:=otg_p20;
 if otg_tn=0 then
  query.Parameters[3].Value:=null
 else
  query.Parameters[3].Value:=otg_tn;
 if otg_t5=0 then
  query.Parameters[4].Value:=null
 else
  query.Parameters[4].Value:=otg_t5;
 if otg_t10=0 then
  query.Parameters[5].Value:=null
 else
  query.Parameters[5].Value:=otg_t10;
 if otg_t15=0 then
  query.Parameters[6].Value:=null
 else
  query.Parameters[6].Value:=otg_t15;
 if otg_t20=0 then
  query.Parameters[7].Value:=null
 else
  query.Parameters[7].Value:=otg_t20;
 if otg_t25=0 then
  query.Parameters[8].Value:=null
 else
  query.Parameters[8].Value:=otg_t25;
 if otg_t30=0 then
  query.Parameters[9].Value:=null
 else
  query.Parameters[9].Value:=otg_t30;
 if otg_t35=0 then
  query.Parameters[10].Value:=null
 else
  query.Parameters[10].Value:=otg_t35;
 if otg_t40=0 then
  query.Parameters[11].Value:=null
 else
  query.Parameters[11].Value:=otg_t40;
 if otg_t45=0 then
  query.Parameters[12].Value:=null
 else
  query.Parameters[12].Value:=otg_t45;
 if otg_tkk=0 then
  query.Parameters[13].Value:=null
 else
  query.Parameters[13].Value:=otg_tkk;
 if otg_ost=0 then
  query.Parameters[14].Value:=null
 else
  query.Parameters[14].Value:=otg_ost;
 if otg_lost=0 then
  query.Parameters[15].Value:=null
 else
  query.Parameters[15].Value:=otg_lost;
 if otg_flash=0 then
  query.Parameters[16].Value:=null
 else
  query.Parameters[16].Value:=otg_flash;
 query.Parameters[17].Value:=p_key;
 query.ExecSQL;
except

end;
end;

procedure Tmiddleaktform.save_e1(p_key:longint);
begin
try
 query.Close;
 query.sql.Clear;
 query.SQL.Add('update dbo.middle_e1 ');
 query.SQL.Add('set p=:@p, ');
 query.SQL.Add('t=:@t, ');
 query.SQL.Add('p20=:@p20, ');
 query.SQL.Add('fbgs_tn=:@fbgs_tn, ');
 query.SQL.Add('fbgs_t10=:@fbgs_t10, ');
 query.SQL.Add('fbgs_t15=:@fbgs_t15, ');
 query.SQL.Add('fbgs_t20=:@fbgs_t20, ');
 query.SQL.Add('fbgs_t25=:@fbgs_t25, ');
 query.SQL.Add('fbgs_t30=:@fbgs_t30, ');
 query.SQL.Add('fbgs_t35=:@fbgs_t35, ');
 query.SQL.Add('fbgs_t40=:@fbgs_t40, ');
 query.SQL.Add('fbgs_t45=:@fbgs_t45, ');
 query.SQL.Add('fbgs_t50=:@fbgs_t50, ');
 query.SQL.Add('adt_tn=:@adt_tn, ');
 query.SQL.Add('adt_t10=:@adt_t10, ');
 query.SQL.Add('adt_t15=:@adt_t15, ');
 query.SQL.Add('adt_t20=:@adt_t20, ');
 query.SQL.Add('adt_t25=:@adt_t25, ');
 query.SQL.Add('adt_t30=:@adt_t30, ');
 query.SQL.Add('adt_t35=:@adt_t35, ');
 query.SQL.Add('adt_t40=:@adt_t40, ');
 query.SQL.Add('adt_tkk=:@adt_tkk, ');
 query.SQL.Add('ost=:@e1_ost, ');
 query.SQL.Add('lost=:@e1_lost ');
 query.SQL.Add('where aktnum=:@an');
 if e1_p=0 then
  query.Parameters[0].Value:=null
 else
  query.Parameters[0].Value:=e1_p;
 if e1_t=-1000 then
  query.Parameters[1].Value:=null
 else
  query.Parameters[1].Value:=e1_t;
 if e1_p20=0 then
  query.Parameters[2].Value:=null
 else
  query.Parameters[2].Value:=e1_p20;
 if e1_fbgs_tn=0 then
  query.Parameters[3].Value:=null
 else
  query.Parameters[3].Value:=e1_fbgs_tn;
 if e1_fbgs_t10=0 then
  query.Parameters[4].Value:=null
 else
  query.Parameters[4].Value:=e1_fbgs_t10;
 if e1_fbgs_t15=0 then
  query.Parameters[5].Value:=null
 else
  query.Parameters[5].Value:=e1_fbgs_t15;
 if e1_fbgs_t20=0 then
  query.Parameters[6].Value:=null
 else
  query.Parameters[6].Value:=e1_fbgs_t20;
 if e1_fbgs_t25=0 then
  query.Parameters[7].Value:=null
 else
  query.Parameters[7].Value:=e1_fbgs_t25;
 if e1_fbgs_t30=0 then
  query.Parameters[8].Value:=null
 else
  query.Parameters[8].Value:=e1_fbgs_t30;
 if e1_fbgs_t35=0 then
  query.Parameters[9].Value:=null
 else
  query.Parameters[9].Value:=e1_fbgs_t35;
 if e1_fbgs_t40=0 then
  query.Parameters[10].Value:=null
 else
  query.Parameters[10].Value:=e1_fbgs_t40;
 if e1_fbgs_t45=0 then
  query.Parameters[11].Value:=null
 else
  query.Parameters[11].Value:=e1_fbgs_t45;
 if e1_fbgs_t50=0 then
  query.Parameters[12].Value:=null
 else
  query.Parameters[12].Value:=e1_fbgs_t50;
 if e1_adt_tn=0 then
  query.Parameters[13].Value:=null
 else
  query.Parameters[13].Value:=e1_adt_tn;
 if e1_adt_t10=0 then
  query.Parameters[14].Value:=null
 else
  query.Parameters[14].Value:=e1_adt_t10;
 if e1_adt_t15=0 then
  query.Parameters[15].Value:=null
 else
  query.Parameters[15].Value:=e1_adt_t15;
 if e1_adt_t20=0 then
  query.Parameters[16].Value:=null
 else
  query.Parameters[16].Value:=e1_adt_t20;
 if e1_adt_t25=0 then
  query.Parameters[17].Value:=null
 else
  query.Parameters[17].Value:=e1_adt_t25;
 if e1_adt_t30=0 then
  query.Parameters[18].Value:=null
 else
  query.Parameters[18].Value:=e1_adt_t30;
 if e1_adt_t35=0 then
  query.Parameters[19].Value:=null
 else
  query.Parameters[19].Value:=e1_adt_t35;
 if e1_adt_t40=0 then
  query.Parameters[20].Value:=null
 else
  query.Parameters[20].Value:=e1_adt_t40;
 if e1_adt_tkk=0 then
  query.Parameters[21].Value:=null
 else
  query.Parameters[21].Value:=e1_adt_tkk;
 if e1_ost=0 then
  query.Parameters[22].Value:=null
 else
  query.Parameters[22].Value:=e1_ost;
 if e1_lost=0 then
  query.Parameters[23].Value:=null
 else
  query.Parameters[23].Value:=e1_lost;
 query.Parameters[24].Value:=p_key;
 query.ExecSQL;
except

end;
end;

procedure TmiddleaktForm.save_middle(p_key:longint);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update dbo.middle_prod set fbgs_p=:fp, fbgs_p20=:fp20, adt_p=:ap, ');
 query.SQL.Add('adt_p20=:ap20, adt_t=:at, fbgs_t=:ft, adt_tpom=:atp where aktnum=:an');
 if middle_fbgs_p=0 then
  query.Parameters[0].Value:=null
 else
  query.Parameters[0].Value:=middle_fbgs_p;
 if middle_fbgs_p20=0 then
  query.Parameters[1].Value:=null
 else
  query.Parameters[1].Value:=middle_fbgs_p20;
 if middle_adt_p=0 then
  query.Parameters[2].Value:=null
 else
  query.Parameters[2].Value:=middle_adt_p;
 if middle_adt_p20=0 then
  query.Parameters[3].Value:=null
 else
  query.Parameters[3].Value:=middle_adt_p20;
 if middle_adt_t=-1000 then
  query.Parameters[4].Value:=null
 else
  query.Parameters[4].Value:=middle_adt_t;
 if middle_fbgs_t=-1000 then
  query.Parameters[5].Value:=null
 else
  query.Parameters[5].Value:=middle_fbgs_t;
 if middle_adt_tpom=-1000 then
  query.Parameters[6].Value:=null
 else
  query.Parameters[6].Value:=middle_adt_tpom;
 query.Parameters[7].Value:=p_key;
 query.ExecSQL;
end;

procedure TmiddleaktForm.saveData(mode: Byte; aktnum:longint);
begin
try
 button1.Enabled:=false;
 save_fbgs(aktnum);
 save_adt(aktnum);
 save_otg(aktnum);
 save_e1(aktnum);
 save_middle(aktnum);
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update dbo.akt_uppg set lab_id=:lid where akt_num=:an');
 query.Parameters[0].Value:=DBLookupComboBox1.KeyValue;
 query.Parameters[1].Value:=aktnum;
 query.ExecSQL;
 case mode of
0:begin
 showmessage('Данные успешно внесены.');
end;
1:begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update dbo.akt_uppg set in_work=0 where akt_num=:an');
 query.Parameters[0].Value:=aktnum;
 query.ExecSQL;
end;
end;
except

end;
 button1.Enabled:=true;
end;

procedure tmiddleaktform.initfrm;
var
 li:tlistitem;
begin
case RadioGroup1.ItemIndex of
0: begin
 q1.Close;
 q1.SQL.Clear;
 q1.SQL.Add('select * from dbo.workers_uppg where code=3');
 q1.Open;
 DBlookupComboBox2.ListSource:=ds1;
 DBLookupComboBox2.KeyField:='id';
 DBLookupComboBox2.ListField:='fio';
 q2.Close;
 q2.SQL.Clear;
 q2.SQL.Add('select * from dbo.workers_uppg where code=6');
 q2.Open;
 DBlookupComboBox3.ListSource:=ds2;
 DBLookupComboBox3.KeyField:='id';
 DBLookupComboBox3.ListField:='fio';
 q3.Close;
 q3.SQL.Clear;
 q3.SQL.Add('select * from dbo.workers_uppg where code=6');
 q3.Open;
 DBlookupComboBox4.ListSource:=ds3;
 DBLookupComboBox4.KeyField:='id';
 DBLookupComboBox4.ListField:='fio';
 DBLookupComboBox2.Enabled:=True;
 DBLookupComboBox3.Enabled:=True;
 DBLookupComboBox4.Enabled:=True;
 Panel1.Caption:=IntToStr(GetAktNum);
end;
1: begin
  DBLookupComboBox2.Enabled:=False;
  DBLookupComboBox3.Enabled:=False;
  DBLookupComboBox4.Enabled:=False;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.v_uppgakts where in_work=1');
  query.Open;
  query.Last;
  listview1.Clear;
  if query.RecordCount=0 then
   begin
    showmessage('нет ни одного активного акта переработки. повторите попытку позднее.');
    close;
   end
  else
   begin
    li:=listview1.Items.Add;
    li.Caption:=query.FieldByName('akt_num').AsString;
    li.SubItems.Add(query.FieldByName('aktdate').AsString);
    li.SubItems.Add(query.FieldByName('akttime').AsString);
    li.SubItems.Add(query.FieldByName('stopername').AsString);
    query.Next
   end;
    listview1.ItemIndex:=0;
end;
end;
end;

procedure TmiddleaktForm.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if selected then
 begin
  fk_uppg:=strtoint(item.Caption);
  updateheader(fk_uppg);
  updateform(fk_uppg);
 end
else
 fk_uppg:=-1;
end;

procedure TmiddleaktForm.MaskEdit10Change(Sender: TObject);
begin
try
 if MaskEdit10.text='' then
  fbgs_t45:=0
 else
  fbgs_t45:=strtoint(trim(MaskEdit10.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit11Change(Sender: TObject);
begin
try
 if MaskEdit11.text='' then
  fbgs_t50:=0
 else
  fbgs_t50:=strtoint(trim(MaskEdit11.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit12Change(Sender: TObject);
begin
try
 if MaskEdit12.text='' then
  fbgs_t55:=0
 else
  fbgs_t55:=strtoint(trim(MaskEdit12.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit13Change(Sender: TObject);
begin
try
 if MaskEdit13.text='' then
  fbgs_t60:=0
 else
  fbgs_t60:=strtoint(trim(MaskEdit13.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit14Change(Sender: TObject);
begin
try
 if MaskEdit14.text='' then
  fbgs_t65:=0
 else
  fbgs_t65:=strtoint(trim(MaskEdit14.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit15Change(Sender: TObject);
begin
try
 if MaskEdit15.text='' then
  fbgs_t70:=0
 else
  fbgs_t70:=strtoint(trim(MaskEdit15.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit16Change(Sender: TObject);
begin
try
 if MaskEdit16.text='' then
  fbgs_t75:=0
 else
  fbgs_t75:=strtoint(trim(MaskEdit16.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit17Change(Sender: TObject);
begin
try
 if MaskEdit17.text='' then
  fbgs_t80:=0
 else
  fbgs_t80:=strtoint(trim(MaskEdit17.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit18Change(Sender: TObject);
begin
try
 if MaskEdit18.text='' then
  fbgs_t85:=0
 else
  fbgs_t85:=strtoint(trim(MaskEdit18.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit19Change(Sender: TObject);
begin
try
 if MaskEdit19.text='' then
  fbgs_t90:=0
 else
  fbgs_t90:=strtoint(trim(MaskEdit19.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit1Change(Sender: TObject);
begin
try
 if MaskEdit1.text='' then
  fbgs_tn:=0
 else
  fbgs_tn:=strtoint(trim(MaskEdit1.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit20Change(Sender: TObject);
begin
try
 if MaskEdit20.text='' then
  fbgs_tkk:=0
 else
  fbgs_tkk:=strtoint(trim(MaskEdit20.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit21Change(Sender: TObject);
begin
try
 if MaskEdit21.text='' then
  fbgs_ost:=0
 else
  fbgs_ost:=strtoint(trim(MaskEdit21.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit22Change(Sender: TObject);
begin
try
 if MaskEdit22.text='' then
  fbgs_lost:=0
 else
  fbgs_lost:=strtoint(trim(MaskEdit22.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit23Change(Sender: TObject);
var
 qry:TADOQUery;
begin
try
 if MaskEdit23.text=' ,   ' then
  fbgs_p:=0
 else
  fbgs_p:=strtofloat(trim(MaskEdit23.text));
 if fbgs_p<>0 then
  if fbgs_t<>-1000 then
   begin
    qry:=TADOQuery.Create(nil);
    qry.Connection:=dm.alexpromCon;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
    qry.Parameters[0].Value:=inttostr(fbgs_t)+',0';
    qry.Parameters[1].Value:=fbgs_p;
    qry.Open;
    qry.First;
    fbgs_p20:=qry.FieldByName('plotn20').AsFloat;
    MaskEdit24.Text:=qry.FieldByName('plotn20').AsString;
    qry.Free;
   end;
except

end;
end;

procedure TmiddleaktForm.MaskEdit25Change(Sender: TObject);
begin
try
 if MaskEdit25.text='' then
  adt_tn:=0
 else
  adt_tn:=strtoint(trim(MaskEdit25.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit26Change(Sender: TObject);
begin
try
 if MaskEdit26.text='' then
  adt_t5:=0
 else
  adt_t5:=strtoint(trim(MaskEdit26.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit27Change(Sender: TObject);
begin
try
 if MaskEdit27.text='' then
  adt_t10:=0
 else
  adt_t10:=strtoint(trim(MaskEdit27.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit28Change(Sender: TObject);
begin
try
 if MaskEdit28.text='' then
  adt_t15:=0
 else
  adt_t15:=strtoint(trim(MaskEdit28.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit29Change(Sender: TObject);
begin
try
 if MaskEdit29.text='' then
  adt_t20:=0
 else
  adt_t20:=strtoint(trim(MaskEdit29.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit2Change(Sender: TObject);
begin
try
 if MaskEdit2.text='' then
  fbgs_t5:=0
 else
  fbgs_t5:=strtoint(trim(MaskEdit2.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit30Change(Sender: TObject);
begin
try
 if MaskEdit30.text='' then
  adt_t25:=0
 else
  adt_t25:=strtoint(trim(MaskEdit30.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit31Change(Sender: TObject);
begin
try
 if MaskEdit31.text='' then
  adt_t30:=0
 else
  adt_t30:=strtoint(trim(MaskEdit31.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit32Change(Sender: TObject);
begin
try
 if MaskEdit32.text='' then
  adt_t35:=0
 else
  adt_t35:=strtoint(trim(MaskEdit32.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit33Change(Sender: TObject);
begin
try
 if MaskEdit33.text='' then
  adt_t40:=0
 else
  adt_t40:=strtoint(trim(MaskEdit33.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit34Change(Sender: TObject);
var
 qry:TADOQuery;
begin
try
 if MaskEdit34.text=' ,   ' then
  adt_p:=0
 else
  adt_p:=strtofloat(trim(MaskEdit34.text));
  if adt_p<>0 then
  if adt_t<>-1000 then
   begin
    qry:=TADOQuery.Create(nil);
    qry.Connection:=dm.alexpromCon;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
    qry.Parameters[0].Value:=inttostr(adt_t)+',0';
    qry.Parameters[1].Value:=adt_p;
    qry.Open;
    qry.First;
    adt_p20:=qry.FieldByName('plotn20').AsFloat;
    MaskEdit35.Text:=qry.FieldByName('plotn20').AsString;
    qry.Free;
   end;
except

end;
end;

procedure TmiddleaktForm.MaskEdit36Change(Sender: TObject);
begin
try
 if MaskEdit36.text='' then
  adt_ost:=0
 else
  adt_ost:=strtoint(trim(MaskEdit36.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit37Change(Sender: TObject);
begin
try
 if MaskEdit37.text='' then
  adt_lost:=0
 else
  adt_lost:=strtoint(trim(MaskEdit37.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit38Change(Sender: TObject);
begin
try
 if MaskEdit38.text='' then
  adt_t45:=0
 else
  adt_t45:=strtoint(trim(MaskEdit38.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit39Change(Sender: TObject);
begin
try
 if MaskEdit39.text='' then
  adt_t50:=0
 else
  adt_t50:=strtoint(trim(MaskEdit39.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit3Change(Sender: TObject);
begin
try
 if MaskEdit3.text='' then
  fbgs_t10:=0
 else
  fbgs_t10:=strtoint(trim(MaskEdit3.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit40Change(Sender: TObject);
begin
try
 if MaskEdit40.text='' then
  adt_t55:=0
 else
  adt_t55:=strtoint(trim(MaskEdit40.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit41Change(Sender: TObject);
begin
try
 if MaskEdit41.text='' then
  adt_t60:=0
 else
  adt_t60:=strtoint(trim(MaskEdit41.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit42Change(Sender: TObject);
begin
try
 if MaskEdit42.text='' then
  adt_t65:=0
 else
  adt_t65:=strtoint(trim(MaskEdit42.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit43Change(Sender: TObject);
begin
try
 if MaskEdit43.text='' then
  adt_t70:=0
 else
  adt_t70:=strtoint(trim(MaskEdit43.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit44Change(Sender: TObject);
begin
try
 if MaskEdit44.text='' then
  adt_t75:=0
 else
  adt_t75:=strtoint(trim(MaskEdit44.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit45Change(Sender: TObject);
begin
try
 if MaskEdit45.text='' then
  adt_t80:=0
 else
  adt_t80:=strtoint(trim(MaskEdit45.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit46Change(Sender: TObject);
begin
try
 if MaskEdit46.text='' then
  adt_t85:=0
 else
  adt_t85:=strtoint(trim(MaskEdit46.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit47Change(Sender: TObject);
begin
try
 if MaskEdit47.text='' then
  adt_t90:=0
 else
  adt_t90:=strtoint(trim(MaskEdit47.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit48Change(Sender: TObject);
begin
try
 if MaskEdit48.text='' then
  adt_tkk:=0
 else
  adt_tkk:=strtoint(trim(MaskEdit48.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit49Change(Sender: TObject);
begin
try
 if MaskEdit49.text='' then
  otg_tn:=0
 else
  otg_tn:=strtoint(trim(MaskEdit49.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit4Change(Sender: TObject);
begin
try
 if MaskEdit4.text='' then
  fbgs_t15:=0
 else
  fbgs_t15:=strtoint(trim(MaskEdit4.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit50Change(Sender: TObject);
begin
try
 if MaskEdit50.text='' then
  otg_t5:=0
 else
  otg_t5:=strtoint(trim(MaskEdit50.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit51Change(Sender: TObject);
begin
try
 if MaskEdit51.text='' then
  otg_t10:=0
 else
  otg_t10:=strtoint(trim(MaskEdit51.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit52Change(Sender: TObject);
begin
try
 if MaskEdit52.text='' then
  otg_t15:=0
 else
  otg_t15:=strtoint(trim(MaskEdit52.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit53Change(Sender: TObject);
begin
try
 if MaskEdit53.text='' then
  otg_t20:=0
 else
  otg_t20:=strtoint(trim(MaskEdit53.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit54Change(Sender: TObject);
begin
try
 if MaskEdit54.text='' then
  otg_t25:=0
 else
  otg_t25:=strtoint(trim(MaskEdit54.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit55Change(Sender: TObject);
begin
try
 if MaskEdit55.text='' then
  otg_t30:=0
 else
  otg_t30:=strtoint(trim(MaskEdit55.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit56Change(Sender: TObject);
begin
try
 if MaskEdit56.text='' then
  otg_t35:=0
 else
  otg_t35:=strtoint(trim(MaskEdit56.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit57Change(Sender: TObject);
begin
try
 if MaskEdit57.text='' then
  otg_t40:=0
 else
  otg_t40:=strtoint(trim(MaskEdit57.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit58Change(Sender: TObject);
var
 qry:TADOQuery;
begin
try
 if MaskEdit58.text=' ,   ' then
  otg_p:=0
 else
  otg_p:=strtofloat(trim(MaskEdit58.text));
  if otg_p<>0 then
  if otg_t<>-1000 then
   begin
    qry:=TADOQuery.Create(nil);
    qry.Connection:=dm.alexpromCon;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
    qry.Parameters[0].Value:=inttostr(otg_t)+',0';
    qry.Parameters[1].Value:=otg_p;
    qry.Open;
    qry.First;
    otg_p20:=qry.FieldByName('plotn20').AsFloat;
    MaskEdit59.Text:=qry.FieldByName('plotn20').AsString;
    qry.Free;
   end;
except

end;
end;

procedure TmiddleaktForm.MaskEdit5Change(Sender: TObject);
begin
try
 if MaskEdit5.text='' then
  fbgs_t20:=0
 else
  fbgs_t20:=strtoint(trim(MaskEdit5.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit60Change(Sender: TObject);
begin
try
 if MaskEdit60.text='' then
  otg_ost:=0
 else
  otg_ost:=strtoint(trim(MaskEdit60.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit61Change(Sender: TObject);
begin
try
 if MaskEdit61.text='' then
  otg_lost:=0
 else
  otg_lost:=strtoint(trim(MaskEdit61.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit62Change(Sender: TObject);
begin
try
 if MaskEdit62.text='' then
  otg_t45:=0
 else
  otg_t45:=strtoint(trim(MaskEdit62.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit63Change(Sender: TObject);
var
 qry:TADOQuery;
begin
try
 if MaskEdit63.text='' then
  middle_fbgs_p:=0
 else
  middle_fbgs_p:=strtofloat(trim(MaskEdit63.text));
  if middle_fbgs_t<>-1000 then
   if middle_fbgs_p<>0 then
    begin
     qry:=TADOQuery.Create(nil);
     qry.Connection:=dm.alexpromCon;
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
     qry.Parameters[0].Value:=inttostr(middle_fbgs_t)+',0';
     qry.Parameters[1].Value:=middle_fbgs_p;
     qry.Open;
     qry.First;
     middle_fbgs_p20:=qry.FieldByName('plotn20').AsFloat;
     MaskEdit64.Text:=qry.FieldByName('plotn20').AsString;
     qry.Free;
    end;
except

end;
end;

procedure TmiddleaktForm.MaskEdit65Change(Sender: TObject);
var
 qry:TADOQuery;
begin
try
 if MaskEdit65.text='' then
  middle_adt_p:=0
 else
  middle_adt_p:=strtofloat(trim(MaskEdit65.text));
  if middle_adt_t<>-1000 then
   if middle_adt_p<>0 then
    begin
     qry:=TADOQuery.Create(nil);
     qry.Connection:=dm.alexpromCon;
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
     qry.Parameters[0].Value:=inttostr(middle_adt_t)+',0';
     qry.Parameters[1].Value:=middle_adt_p;
     qry.Open;
     qry.First;
     middle_adt_p20:=qry.FieldByName('plotn20').AsFloat;
     MaskEdit66.Text:=qry.FieldByName('plotn20').AsString;
     qry.Free;
    end;
except

end;
end;

procedure TmiddleaktForm.MaskEdit67Change(Sender: TObject);
begin
try
 if MaskEdit67.text='' then
  adt_flash:=0
 else
  adt_flash:=strtoint(trim(MaskEdit67.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit68Change(Sender: TObject);
begin
try
 if MaskEdit68.text='' then
  adt_pom:=0
 else
  adt_pom:=strtoint(trim(MaskEdit68.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit69Change(Sender: TObject);
begin
try
 if MaskEdit69.text='' then
  otg_flash:=0
 else
  otg_flash:=strtoint(trim(MaskEdit69.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit6Change(Sender: TObject);
begin
try
 if MaskEdit6.text='' then
  fbgs_t25:=0
 else
  fbgs_t25:=strtoint(trim(MaskEdit6.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit72Change(Sender: TObject);
begin
try
 if MaskEdit72.text='' then
  otg_tkk:=0
 else
  otg_tkk:=strtoint(trim(MaskEdit72.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit73Change(Sender: TObject);
begin
try
 if MaskEdit73.text='' then
  e1_fbgs_tn:=0
 else
  e1_fbgs_tn:=strtoint(trim(MaskEdit73.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit75Change(Sender: TObject);
begin
try
 if MaskEdit75.text='' then
  e1_fbgs_t10:=0
 else
  e1_fbgs_t10:=strtoint(trim(MaskEdit75.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit76Change(Sender: TObject);
begin
try
 if MaskEdit76.text='' then
  e1_fbgs_t15:=0
 else
  e1_fbgs_t15:=strtoint(trim(MaskEdit76.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit77Change(Sender: TObject);
begin
try
 if MaskEdit77.text='' then
  e1_fbgs_t20:=0
 else
  e1_fbgs_t20:=strtoint(trim(MaskEdit77.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit78Change(Sender: TObject);
begin
try
 if MaskEdit78.text='' then
  e1_fbgs_t25:=0
 else
  e1_fbgs_t25:=strtoint(trim(MaskEdit78.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit7Change(Sender: TObject);
begin
try
 if MaskEdit7.text='' then
  fbgs_t30:=0
 else
  fbgs_t30:=strtoint(trim(MaskEdit7.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit80Change(Sender: TObject);
begin
try
 if MaskEdit80.text='' then
  e1_fbgs_t35:=0
 else
  e1_fbgs_t35:=strtoint(trim(MaskEdit80.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit81Change(Sender: TObject);
begin
try
 if MaskEdit81.text='' then
  e1_fbgs_t40:=0
 else
  e1_fbgs_t40:=strtoint(trim(MaskEdit81.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit82Change(Sender: TObject);
var
 qry:TADOQuery;
begin
try
  if maskedit82.Text=' ,   ' then
   e1_p:=0
  else
   e1_p:=strtofloat(trim(maskedit82.Text));
 if e1_p<>0 then
  if e1_t<>-1000 then
   begin
    qry:=TADOQuery.Create(nil);
    qry.Connection:=dm.alexpromCon;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
    qry.Parameters[0].Value:=inttostr(e1_t)+',0';
    qry.Parameters[1].Value:=e1_p;
    qry.Open;
    qry.First;
    e1_p20:=qry.FieldByName('plotn20').AsFloat;
    MaskEdit83.Text:=qry.FieldByName('plotn20').AsString;
    qry.Free;
   end;
except

end;
end;

procedure TmiddleaktForm.MaskEdit84Change(Sender: TObject);
begin
try
 if MaskEdit84.text='' then
  e1_ost:=0
 else
  e1_ost:=strtoint(trim(MaskEdit84.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit85Change(Sender: TObject);
begin
try
 if MaskEdit85.text='' then
  e1_lost:=0
 else
  e1_lost:=strtoint(trim(MaskEdit85.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit86Change(Sender: TObject);
begin
try
 if MaskEdit86.text='' then
  e1_fbgs_t45:=0
 else
  e1_fbgs_t45:=strtoint(trim(MaskEdit86.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit87Change(Sender: TObject);
begin
try
 if MaskEdit87.text='' then
  e1_fbgs_t50:=0
 else
  e1_fbgs_t50:=strtoint(trim(MaskEdit87.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit88Change(Sender: TObject);
begin
try
 if MaskEdit88.text='' then
  e1_adt_tn:=0
 else
  e1_adt_tn:=strtoint(trim(MaskEdit88.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit89Change(Sender: TObject);
begin
try
 if MaskEdit89.text='' then
  e1_adt_t10:=0
 else
  e1_adt_t10:=strtoint(trim(MaskEdit89.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit8Change(Sender: TObject);
begin
try
 if MaskEdit8.text='' then
  fbgs_t35:=0
 else
  fbgs_t35:=strtoint(trim(MaskEdit8.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit90Change(Sender: TObject);
begin
try
 if MaskEdit90.text='' then
  e1_adt_t15:=0
 else
  e1_adt_t15:=strtoint(trim(MaskEdit90.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit91Change(Sender: TObject);
begin
try
 if MaskEdit91.text='' then
  e1_adt_t20:=0
 else
  e1_adt_t20:=strtoint(trim(MaskEdit91.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit92Change(Sender: TObject);
begin
try
 if MaskEdit92.text='' then
  e1_adt_t25:=0
 else
  e1_adt_t25:=strtoint(trim(MaskEdit92.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit93Change(Sender: TObject);
begin
try
 if MaskEdit93.text='' then
  e1_adt_t30:=0
 else
  e1_adt_t30:=strtoint(trim(MaskEdit93.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit94Change(Sender: TObject);
begin
try
 if MaskEdit94.text='' then
  e1_adt_t35:=0
 else
  e1_adt_t35:=strtoint(trim(MaskEdit94.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit95Change(Sender: TObject);
begin
try
 if MaskEdit95.text='' then
  e1_adt_t40:=0
 else
  e1_adt_t40:=strtoint(trim(MaskEdit95.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit96Change(Sender: TObject);
begin
try
 if MaskEdit96.text='' then
  e1_adt_tkk:=0
 else
  e1_adt_tkk:=strtoint(trim(MaskEdit96.text));
except

end;
end;

procedure TmiddleaktForm.MaskEdit9Change(Sender: TObject);
begin
try
 if MaskEdit9.text='' then
  fbgs_t40:=0
 else
  fbgs_t40:=strtoint(trim(MaskEdit9.text));
except

end;
end;

procedure TmiddleaktForm.RadioGroup1Click(Sender: TObject);
begin
 changeControls(RadioGroup1.ItemIndex);
end;

procedure TmiddleaktForm.Button1Click(Sender: TObject);
begin
 saveData(0, pkey);
end;

procedure TmiddleaktForm.Button2Click(Sender: TObject);
begin
if MessageDlg('После вывода на печать изменение данных будет невозможно!!! Подтвердите.', mtConfirmation, [mbOk, mbCancel], 0)=mrOk then
 begin
  saveData(1, pkey);
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.v_middleakt where akt_num=:an');
  query.Parameters[0].Value:=pkey;
  query.Open;
  query.First;
  RvDataSetConnection6.DataSet:=query;
  RvProject1.ExecuteReport('middleReport');
 end
end;

procedure TmiddleaktForm.Button3Click(Sender: TObject);
begin
 close;
end;

procedure TmiddleaktForm.Edit1Change(Sender: TObject);
var
 qry:TADOQuery;
begin
try
 if edit1.Text='' then
  fbgs_t:=-1000
 else
  fbgs_t:=strtoint(trim(edit1.Text));
  if fbgs_p<>0 then
  if fbgs_t<>-1000 then
   begin
    qry:=TADOQuery.Create(nil);
    qry.Connection:=dm.alexpromCon;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
    qry.Parameters[0].Value:=inttostr(fbgs_t)+',0';
    qry.Parameters[1].Value:=fbgs_p;
    qry.Open;
    qry.First;
    fbgs_p20:=qry.FieldByName('plotn20').AsFloat;
    MaskEdit24.Text:=qry.FieldByName('plotn20').AsString;
    qry.Free;
   end;
except

end;
end;

procedure TmiddleaktForm.Edit2Change(Sender: TObject);
var
 qry:TADOQuery;
begin
try
 if edit2.Text='' then
  adt_t:=-1000
 else
  adt_t:=strtoint(trim(edit2.Text));
  if adt_p<>0 then
  if adt_t<>-1000 then
   begin
    qry:=TADOQuery.Create(nil);
    qry.Connection:=dm.alexpromCon;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
    qry.Parameters[0].Value:=inttostr(adt_t)+',0';
    qry.Parameters[1].Value:=adt_p;
    qry.Open;
    qry.First;
    adt_p20:=qry.FieldByName('plotn20').AsFloat;
    MaskEdit35.Text:=qry.FieldByName('plotn20').AsString;
    qry.Free;
   end;
except

end;
end;

procedure TmiddleaktForm.Edit3Change(Sender: TObject);
var
 qry:TADOQuery;
begin
try
 if edit3.Text='' then
  otg_t:=-1000
 else
  otg_t:=strtoint(trim(edit3.Text));
  if otg_p<>0 then
  if otg_t<>-1000 then
   begin
    qry:=TADOQuery.Create(nil);
    qry.Connection:=dm.alexpromCon;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
    qry.Parameters[0].Value:=inttostr(otg_t)+',0';
    qry.Parameters[1].Value:=otg_p;
    qry.Open;
    qry.First;
    otg_p20:=qry.FieldByName('plotn20').AsFloat;
    MaskEdit59.Text:=qry.FieldByName('plotn20').AsString;
    qry.Free;
   end;
except

end;
end;

procedure TmiddleaktForm.Edit4Change(Sender: TObject);
var
 qry:TADOQUery;
begin
try
 if edit4.Text='' then
  e1_t:=-1000
 else
  e1_t:=strtoint(trim(edit4.Text));
 if e1_p<>0 then
  if e1_t<>-1000 then
   begin
    qry:=TADOQuery.Create(nil);
    qry.Connection:=dm.alexpromCon;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
    qry.Parameters[0].Value:=inttostr(e1_t)+',0';
    qry.Parameters[1].Value:=e1_p;
    qry.Open;
    qry.First;
    e1_p20:=qry.FieldByName('plotn20').AsFloat;
    MaskEdit83.Text:=qry.FieldByName('plotn20').AsString;
    qry.Free;
   end;
except

end;
end;

procedure TmiddleaktForm.Edit5Change(Sender: TObject);
begin
try
 if edit5.Text='' then
  begin
   middle_adt_tpom:=-1000;
   Panel115.Caption:='Бенз+АДТ+Пар()';
  end
 else
  begin
   middle_adt_tpom:=strtoint(trim(edit5.Text));
   Panel115.Caption:='Бенз+АДТ+Пар('+inttostr(middle_adt_tpom)+')';
  end;
except

end;
end;

procedure TmiddleaktForm.Edit6Change(Sender: TObject);
var
 qry:TADOQuery;
begin
try
if edit6.Text='' then
 middle_fbgs_t:=-1000
else
 middle_fbgs_t:=strtoint(edit6.Text);
 if middle_fbgs_t<>-1000 then
   if middle_fbgs_p<>0 then
    begin
     qry:=TADOQuery.Create(nil);
     qry.Connection:=dm.alexpromCon;
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
     qry.Parameters[0].Value:=inttostr(middle_fbgs_t)+',0';
     qry.Parameters[1].Value:=middle_fbgs_p;
     qry.Open;
     qry.First;
     middle_fbgs_p20:=qry.FieldByName('plotn20').AsFloat;
     MaskEdit64.Text:=qry.FieldByName('plotn20').AsString;
     qry.Free;
    end;
except

end;
end;

procedure TmiddleaktForm.Edit7Change(Sender: TObject);
var
 qry:TADOQuery;
begin
try
 if edit7.Text='' then
  middle_adt_t:=-1000
 else
  middle_adt_t:=strtoint(edit7.Text);
  if middle_adt_t<>-1000 then
   if middle_adt_p<>0 then
    begin
     qry:=TADOQuery.Create(nil);
     qry.Connection:=dm.alexpromCon;
     qry.Close;
     qry.SQL.Clear;
     qry.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name =:a and plotn like :b');
     qry.Parameters[0].Value:=inttostr(middle_adt_t)+',0';
     qry.Parameters[1].Value:=middle_adt_p;
     qry.Open;
     qry.First;
     middle_adt_p20:=qry.FieldByName('plotn20').AsFloat;
     MaskEdit66.Text:=qry.FieldByName('plotn20').AsString;
     qry.Free;
    end;
except

end;
end;

procedure TmiddleaktForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 qqq.Free;
 ds.Free;
 q1.Free;
 ds1.Free;
 q2.Free;
 ds2.Free;
 q3.Free;
 ds3.Free;
 Action:=caFree;
end;

procedure TmiddleaktForm.FormCreate(Sender: TObject);
begin
 query:=tadoquery.Create(nil);
 query.Connection:=dm.alexpromcon;
 qqq:=tadoquery.Create(nil);
 qqq.Connection:=dm.alexpromcon;
 ds:=TDataSource.Create(nil);
 q1:=TADOQuery.Create(nil);
 ds1:=TDataSource.Create(nil);
 q1.Connection:=dm.alexpromcon;
 ds1.DataSet:=q1;
 q2:=TADOQuery.Create(nil);
 q2.Connection:=dm.alexpromcon;
 ds2:=TDataSource.Create(nil);
 ds2.DataSet:=q2;
 q3:=TADOQuery.Create(nil);
 q3.Connection:=dm.alexpromcon;
 ds3:=TDataSource.Create(nil);
 ds3.DataSet:=q3;
 //ds.DataSet:=qqq;
 initfrm;
end;

procedure TmiddleaktForm.MaskEdit79Change(Sender: TObject);
begin
try
 if MaskEdit79.text='' then
  e1_fbgs_t30:=0
 else
  e1_fbgs_t30:=strtoint(trim(MaskEdit79.text));
except

end;
end;

end.

unit Usirieanalisreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, RpCon, RpConDS, RpDefine, RpRave, adodb,
  DB;

type
  Tsirieanalisreport = class(TForm)
    ListView1: TListView;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    Label1: TLabel;
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
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Panel21: TPanel;
    Label14: TLabel;
    Panel22: TPanel;
    Label15: TLabel;
    Panel23: TPanel;
    Label16: TLabel;
    Panel24: TPanel;
    Label17: TLabel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Label18: TLabel;
    Panel34: TPanel;
    Label19: TLabel;
    Panel35: TPanel;
    GroupBox3: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Panel36: TPanel;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
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
    GroupBox4: TGroupBox;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
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
    Button1: TButton;
    Button2: TButton;
    RvProject1: TRvProject;
    RvDataSetConnection1: TRvDataSetConnection;
    Button3: TButton;
    ADOQuery1: TADOQuery;
    ADOQuery1analisDate: TWideStringField;
    ADOQuery1analisTime: TWideStringField;
    ADOQuery1name_1: TWideStringField;
    ADOQuery1comp1percent: TBCDField;
    ADOQuery1name_2: TWideStringField;
    ADOQuery1comp2percent: TBCDField;
    ADOQuery1name_3: TWideStringField;
    ADOQuery1comp3percent: TBCDField;
    ADOQuery1name_4: TWideStringField;
    ADOQuery1comp4percent: TBCDField;
    ADOQuery1name_5: TWideStringField;
    ADOQuery1comp5percent: TBCDField;
    ADOQuery1name_6: TWideStringField;
    ADOQuery1comp6percent: TBCDField;
    ADOQuery1name_7: TWideStringField;
    ADOQuery1comp7percent: TBCDField;
    ADOQuery1name_8: TWideStringField;
    ADOQuery1comp8percent: TBCDField;
    ADOQuery1name_9: TWideStringField;
    ADOQuery1comp9percent: TBCDField;
    ADOQuery1name_10: TWideStringField;
    ADOQuery1comp10percent: TBCDField;
    ADOQuery1id: TLargeintField;
    ADOQuery1FBGS_perc: TWordField;
    ADOQuery1ADT_perc: TWordField;
    ADOQuery1OTG_perc: TWordField;
    ADOQuery1PARAF_perc: TWordField;
    ADOQuery1H20_perc: TWordField;
    ADOQuery1MAT_OUT: TWordField;
    ADOQuery1LOST: TWordField;
    ADOQuery1p: TBCDField;
    ADOQuery1t: TBCDField;
    ADOQuery1p20: TBCDField;
    ADOQuery1FBGS_perc_P25: TWordField;
    ADOQuery1ADT_perc_P25: TWordField;
    ADOQuery1OTG_perc_P25: TWordField;
    ADOQuery1PARAF_perc_P25: TWordField;
    ADOQuery1H20_perc_P25: TWordField;
    ADOQuery1MAT_OUT_P25: TWordField;
    ADOQuery1p_P25: TBCDField;
    ADOQuery1LOST_P25: TWordField;
    ADOQuery1t_P25: TBCDField;
    ADOQuery1p20_P25: TBCDField;
    ADOQuery1FBGS_perc_TD: TWordField;
    ADOQuery1ADT_perc_TD: TWordField;
    ADOQuery1OTG_perc_TD: TWordField;
    ADOQuery1PARAF_perc_TD: TWordField;
    ADOQuery1H20_perc_TD: TWordField;
    ADOQuery1MAT_OUT_TD: TWordField;
    ADOQuery1LOST_TD: TWordField;
    ADOQuery1p_TD: TBCDField;
    ADOQuery1t_TD: TBCDField;
    ADOQuery1p20_TD: TBCDField;
    Button4: TButton;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
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
    procedure Button4Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure showsirieanalisis(iid:longint);
    procedure deleteanalis(tbl:string;iid:longint);
    procedure initfrm;
  public
    { Public declarations }
  end;

var
  sirieanalisreport: Tsirieanalisreport;
  query:tadoquery;
  id:longint;
implementation

uses u_dm;

{$R *.dfm}

procedure Tsirieanalisreport.initfrm;
var
 li:tlistitem;
begin
 listview1.Clear;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select analisdate, analistime from dbo.v_allsirieanalisis');
 query.Open;
 while not query.Eof do
  begin
   li:=listview1.Items.Add;
   li.Caption := query.Fields[0].AsString;
   li.SubItems.Add(query.Fields[1].asstring);
   query.Next;
  end;
 listview1.ItemIndex:=query.RecordCount-1;
end;

procedure Tsirieanalisreport.deleteanalis(tbl:string;iid:longint);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('delete from ');
 query.SQL.Add(tbl);
 query.SQL.Add(' where id=:iid');
 query.Parameters[0].Value:=iid;
 query.ExecSQL;
end;

procedure Tsirieanalisreport.showsirieanalisis(iid:longint);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.v_allsirieanalisis where id=:ii');
 query.Parameters[0].Value:=iid;
 query.Open;
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
 panel21.Caption:=query.FieldByName('p_p25').AsString;
 panel22.Caption:=query.FieldByName('t_p25').AsString;
 panel23.Caption:=query.FieldByName('p20_p25').AsString;
 panel25.Caption:=query.FieldByName('fbgs_perc_p25').AsString;
 panel30.Caption:=query.FieldByName('adt_perc_p25').AsString;
 panel31.Caption:=query.FieldByName('otg_perc_p25').AsString;
 panel32.Caption:=query.FieldByName('paraf_perc_p25').AsString;
 panel33.Caption:=query.FieldByName('h20_perc_p25').AsString;
 panel34.Caption:=query.FieldByName('mat_out_p25').AsString;
 panel35.Caption:=query.FieldByName('lost_p25').AsString;
 panel36.Caption:=query.FieldByName('p').AsString;
 panel37.Caption:=query.FieldByName('t').AsString;
 panel38.Caption:=query.FieldByName('p20').AsString;
 panel40.Caption:=query.FieldByName('fbgs_perc').AsString;
 panel45.Caption:=query.FieldByName('adt_perc').AsString;
 panel46.Caption:=query.FieldByName('otg_perc').AsString;
 panel47.Caption:=query.FieldByName('paraf_perc').AsString;
 panel48.Caption:=query.FieldByName('h20_perc').AsString;
 panel49.Caption:=query.FieldByName('mat_out').AsString;
 panel50.Caption:=query.FieldByName('lost').AsString;
 panel51.Caption:=query.FieldByName('p_td').AsString;
 panel52.Caption:=query.FieldByName('t_td').AsString;
 panel53.Caption:=query.FieldByName('p20_td').AsString;
 panel55.Caption:=query.FieldByName('fbgs_perc_td').AsString;
 panel60.Caption:=query.FieldByName('adt_perc_td').AsString;
 panel61.Caption:=query.FieldByName('otg_perc_td').AsString;
 panel62.Caption:=query.FieldByName('paraf_perc_td').AsString;
 panel63.Caption:=query.FieldByName('h20_perc_td').AsString;
 panel64.Caption:=query.FieldByName('mat_out_td').AsString;
 panel65.Caption:=query.FieldByName('lost_td').AsString;
end;

procedure Tsirieanalisreport.Button1Click(Sender: TObject);
begin
try
 rvdatasetconnection1.DataSet:=query;
 rvproject1.ExecuteReport('procentovka');
except
 showmessage('ошибка при построении отчета.');
end;
end;

procedure Tsirieanalisreport.Button2Click(Sender: TObject);
begin
 close;
end;

procedure Tsirieanalisreport.Button4Click(Sender: TObject);
begin
if messagedlg('Вы уверены ?', mtconfirmation, [mbok,mbcancel],0)=mrok then
 begin
   deleteanalis('dbo.sirie_percent', id);
   deleteanalis('dbo.e1', id);
   deleteanalis('dbo.td', id);
   deleteanalis('dbo.p25', id);
   initfrm;
 end;

end;

procedure Tsirieanalisreport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 query.Free;
 Action:=cafree;
end;

procedure Tsirieanalisreport.FormCreate(Sender: TObject);

begin
 query:=tadoquery.Create(nil);
 query.Connection:=dm.alexpromcon;
 initfrm;
end;

procedure Tsirieanalisreport.ListView1SelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
if selected then
 begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select id from dbo.v_allsirieanalisis ');
  query.SQL.Add('where analisdate=:ad and analistime=:at');
  query.Parameters[0].Value:=item.Caption;
  query.Parameters[1].Value:=item.SubItems.Strings[0];
  query.Open;
  id:=query.Fields[0].asinteger;
  showsirieanalisis(id);
 end;
end;

end.

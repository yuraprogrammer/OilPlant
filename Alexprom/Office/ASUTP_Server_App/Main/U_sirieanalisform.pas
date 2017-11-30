unit U_sirieanalisform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, adodb;

type
  TsirieAnalisForm = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    compBox1: TComboBox;
    Label2: TLabel;
    percentBox1: TComboBox;
    GroupBox2: TGroupBox;
    Label3: TLabel;
    Label4: TLabel;
    compBox2: TComboBox;
    percentBox2: TComboBox;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Label6: TLabel;
    compBox3: TComboBox;
    percentBox3: TComboBox;
    GroupBox4: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    compBox4: TComboBox;
    percentBox4: TComboBox;
    GroupBox5: TGroupBox;
    Label9: TLabel;
    Label10: TLabel;
    compBox9: TComboBox;
    percentBox9: TComboBox;
    GroupBox6: TGroupBox;
    Label11: TLabel;
    Label12: TLabel;
    compBox5: TComboBox;
    percentBox5: TComboBox;
    GroupBox7: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    compBox10: TComboBox;
    percentBox10: TComboBox;
    GroupBox8: TGroupBox;
    Label15: TLabel;
    Label16: TLabel;
    compBox6: TComboBox;
    percentBox6: TComboBox;
    GroupBox9: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    compBox7: TComboBox;
    percentBox7: TComboBox;
    GroupBox10: TGroupBox;
    Label19: TLabel;
    Label20: TLabel;
    compBox8: TComboBox;
    percentBox8: TComboBox;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    procedure percentBox10Change(Sender: TObject);
    procedure percentBox9Change(Sender: TObject);
    procedure percentBox8Change(Sender: TObject);
    procedure percentBox7Change(Sender: TObject);
    procedure percentBox6Change(Sender: TObject);
    procedure percentBox5Change(Sender: TObject);
    procedure percentBox4Change(Sender: TObject);
    procedure percentBox3Change(Sender: TObject);
    procedure percentBox2Change(Sender: TObject);
    procedure compBox10Change(Sender: TObject);
    procedure compBox9Change(Sender: TObject);
    procedure compBox8Change(Sender: TObject);
    procedure compBox7Change(Sender: TObject);
    procedure compBox6Change(Sender: TObject);
    procedure compBox5Change(Sender: TObject);
    procedure compBox4Change(Sender: TObject);
    procedure compBox3Change(Sender: TObject);
    procedure compBox2Change(Sender: TObject);
    procedure percentBox1Change(Sender: TObject);
    procedure compBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure initfrm;
    function selectcode(item: string): byte;
  public
    { Public declarations }
  end;

var
  sirieAnalisForm: TsirieAnalisForm;
  query:tadoquery;
  comp1code, comp2code, comp3code, comp4code, comp5code, comp6code, comp7code, comp8code, comp9code, comp10code:byte;
  comp1p, comp2p, comp3p, comp4p, comp5p, comp6p, comp7p, comp8p, comp9p, comp10p:real;
implementation

uses u_dm;

{$R *.dfm}

function tsirieanalisform.selectcode(item: string): Byte;
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select id from dbo.sirie_dic where name=:n');
 query.Parameters[0].Value:=item;
 query.Open;
 query.First;
 result:=query.Fields[0].AsInteger;
end;

procedure  TsirieAnalisForm.initfrm;
begin
 compbox1.Clear;
 compbox2.Clear;
 compbox3.Clear;
 compbox4.Clear;
 compbox5.Clear;
 compbox6.Clear;
 compbox7.Clear;
 compbox8.Clear;
 compbox9.Clear;
 compbox10.Clear;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select name from dbo.sirie_dic where code=1');
 query.Open;
 query.First;
 while not query.Eof do
  begin
    compbox1.items.add(query.Fields[0].asstring);
    compbox2.items.add(query.Fields[0].asstring);
    compbox3.items.add(query.Fields[0].asstring);
    compbox4.items.add(query.Fields[0].asstring);
    compbox5.items.add(query.Fields[0].asstring);
    compbox6.items.add(query.Fields[0].asstring);
    compbox7.items.add(query.Fields[0].asstring);
    compbox8.items.add(query.Fields[0].asstring);
    compbox9.items.add(query.Fields[0].asstring);
    compbox10.items.add(query.Fields[0].asstring);
    query.Next;
  end;
 compbox1.ItemIndex:=0;
 compbox2.ItemIndex:=0;
 compbox3.ItemIndex:=0;
 compbox4.ItemIndex:=0;
 compbox5.ItemIndex:=0;
 compbox6.ItemIndex:=0;
 compbox7.ItemIndex:=0;
 compbox8.ItemIndex:=0;
 compbox9.ItemIndex:=0;
 compbox10.ItemIndex:=0;
 comp1p:=0;
 comp2p:=0;
 comp3p:=0;
 comp4p:=0;
 comp5p:=0;
 comp6p:=0;
 comp7p:=0;
 comp8p:=0;
 comp9p:=0;
 comp10p:=0;
 comp1code:=0;
 comp2code:=0;
 comp3code:=0;
 comp4code:=0;
 comp5code:=0;
 comp6code:=0;
 comp7code:=0;
 comp8code:=0;
 comp9code:=0;
 comp10code:=0;
end;

procedure TsirieAnalisForm.percentBox10Change(Sender: TObject);
begin
 comp10p:=strtofloat(percentbox10.items.strings[percentbox10.ItemIndex]);
end;

procedure TsirieAnalisForm.percentBox1Change(Sender: TObject);
begin
 comp1p:=strtofloat(percentbox1.items.strings[percentbox1.ItemIndex]);
end;

procedure TsirieAnalisForm.percentBox2Change(Sender: TObject);
begin
 comp2p:=strtofloat(percentbox2.items.strings[percentbox2.ItemIndex]);
end;

procedure TsirieAnalisForm.percentBox3Change(Sender: TObject);
begin
 comp3p:=strtofloat(percentbox3.items.strings[percentbox3.ItemIndex]);
end;

procedure TsirieAnalisForm.percentBox4Change(Sender: TObject);
begin
 comp4p:=strtofloat(percentbox4.items.strings[percentbox4.ItemIndex]);
end;

procedure TsirieAnalisForm.percentBox5Change(Sender: TObject);
begin
 comp5p:=strtofloat(percentbox5.items.strings[percentbox5.ItemIndex]);
end;

procedure TsirieAnalisForm.percentBox6Change(Sender: TObject);
begin
 comp6p:=strtofloat(percentbox6.items.strings[percentbox6.ItemIndex]);
end;

procedure TsirieAnalisForm.percentBox7Change(Sender: TObject);
begin
 comp7p:=strtofloat(percentbox7.items.strings[percentbox7.ItemIndex]);
end;

procedure TsirieAnalisForm.percentBox8Change(Sender: TObject);
begin
 comp8p:=strtofloat(percentbox8.items.strings[percentbox8.ItemIndex]);
end;

procedure TsirieAnalisForm.percentBox9Change(Sender: TObject);
begin
 comp9p:=strtofloat(percentbox9.items.strings[percentbox9.ItemIndex]);
end;

procedure TsirieAnalisForm.Button1Click(Sender: TObject);
var
 analisid:longint;
begin
if comp1p+comp2p+comp3p+comp4p+comp5p+comp6p+comp7p+comp8p+comp9p+comp10p=100 then
begin
 button1.Enabled:=false;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select max(id) from dbo.sirie_percent');
 query.Open;
 query.First;
 analisid:=query.Fields[0].AsInteger;
 inc(analisid);
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into dbo.sirie_percent (id, analisdate, analistime,');
 query.SQL.Add('comp1code, comp2code, comp3code, comp4code, comp5code,');
 query.SQL.Add('comp6code, comp7code, comp8code, comp9code, comp10code,');
 query.SQL.Add('comp1percent, comp2percent, comp3percent, comp4percent, comp5percent,');
 query.SQL.Add('comp6percent, comp7percent, comp8percent, comp9percent, comp10percent) ');
 query.SQL.Add('values (:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:n,:o,:p,:q,:r,:s,:t,:u,:v,:w)');
 query.Parameters[0].Value:=analisid;
 if length(datetostr(now))=10 then
  query.Parameters[1].Value:=datetostr(now)
 else
  query.Parameters[1].Value:='0'+datetostr(now);
 if length(timetostr(now))=8 then
  query.Parameters[2].Value:=timetostr(now)
 else
  query.Parameters[2].Value:='0'+timetostr(now);
 query.Parameters[3].Value:=comp1code;
 query.Parameters[4].Value:=comp2code;
 query.Parameters[5].Value:=comp3code;
 query.Parameters[6].Value:=comp4code;
 query.Parameters[7].Value:=comp5code;
 query.Parameters[8].Value:=comp6code;
 query.Parameters[9].Value:=comp7code;
 query.Parameters[10].Value:=comp8code;
 query.Parameters[11].Value:=comp9code;
 query.Parameters[12].Value:=comp10code;
 query.Parameters[13].Value:=comp1p;
 query.Parameters[14].Value:=comp2p;
 query.Parameters[15].Value:=comp3p;
 query.Parameters[16].Value:=comp4p;
 query.Parameters[17].Value:=comp5p;
 query.Parameters[18].Value:=comp6p;
 query.Parameters[19].Value:=comp7p;
 query.Parameters[20].Value:=comp8p;
 query.Parameters[21].Value:=comp9p;
 query.Parameters[22].Value:=comp10p;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into e1 (id) values (:iid)');
 query.Parameters[0].Value:=analisid;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into p25 (id) values (:iid)');
 query.Parameters[0].Value:=analisid;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into td (id) values (:iid)');
 query.Parameters[0].Value:=analisid;
 query.ExecSQL;
 showmessage('данные успешно внесены.');
end
else
 begin
  showmessage('Cумма содержания всех компонент должна быть равна 100.');
  exit;
 end;
 button1.Enabled:=true;
end;

procedure TsirieAnalisForm.Button2Click(Sender: TObject);
begin
 initfrm;
end;

procedure TsirieAnalisForm.Button3Click(Sender: TObject);
begin
 close;
end;

procedure TsirieAnalisForm.compBox10Change(Sender: TObject);
begin
 comp10code:=selectcode(compbox10.Items.Strings[compbox10.ItemIndex]);
end;

procedure TsirieAnalisForm.compBox1Change(Sender: TObject);
begin
 comp1code:=selectcode(compbox1.Items.Strings[compbox1.ItemIndex]);
end;

procedure TsirieAnalisForm.compBox2Change(Sender: TObject);
begin
 comp2code:=selectcode(compbox2.Items.Strings[compbox2.ItemIndex]);
end;

procedure TsirieAnalisForm.compBox3Change(Sender: TObject);
begin
 comp3code:=selectcode(compbox3.Items.Strings[compbox3.ItemIndex]);
end;

procedure TsirieAnalisForm.compBox4Change(Sender: TObject);
begin
 comp4code:=selectcode(compbox4.Items.Strings[compbox4.ItemIndex]);
end;

procedure TsirieAnalisForm.compBox5Change(Sender: TObject);
begin
 comp5code:=selectcode(compbox5.Items.Strings[compbox5.ItemIndex]);
end;

procedure TsirieAnalisForm.compBox6Change(Sender: TObject);
begin
 comp6code:=selectcode(compbox6.Items.Strings[compbox6.ItemIndex]);
end;

procedure TsirieAnalisForm.compBox7Change(Sender: TObject);
begin
 comp7code:=selectcode(compbox7.Items.Strings[compbox7.ItemIndex]);
end;

procedure TsirieAnalisForm.compBox8Change(Sender: TObject);
begin
 comp8code:=selectcode(compbox8.Items.Strings[compbox8.ItemIndex]);
end;

procedure TsirieAnalisForm.compBox9Change(Sender: TObject);
begin
 comp9code:=selectcode(compbox9.Items.Strings[compbox9.ItemIndex]);
end;

procedure TsirieAnalisForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure TsirieAnalisForm.FormCreate(Sender: TObject);
begin
 query:=tadoquery.Create(nil);
 query.Connection:=dm.alexpromcon;
 initfrm;
end;

end.

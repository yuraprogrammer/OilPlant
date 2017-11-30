unit tsp_zay;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, QCCom32, ComCtrls, ADODB, Buttons, DB, Mask, PortUnit;

type
  StandartProc = function:boolean;
type
  TfrmTSP1 = class(TForm)
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    inputString: TLabel;
    GroupBox3: TGroupBox;
    GroupBox5: TGroupBox;
    Timer3: TTimer;
    Label10: TLabel;
    Label11: TLabel;
    Button1: TButton;
    ListView1: TListView;
    ADOStoredProc1: TADOStoredProc;
    Label21: TLabel;
    Edit7: TMaskEdit;
    Button3: TButton;
    ADOStoredProc2: TADOStoredProc;
    Label23: TLabel;
    Label24: TLabel;
    Button2: TButton;
    Button4: TButton;
    Label22: TLabel;
    Label9: TLabel;
    MaskEdit1: TMaskEdit;
    Timer2: TTimer;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    ListView2: TListView;
    procedure MaskEdit1Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);


    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListView2SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initForm;
    procedure disableControls(en:boolean);
  end;

var
  frmTSP1: TfrmTSP1;
  //rcvStr:string;
  temper,netto,brutto:longint;
  oldweightnumber, lastweighting, newweighting:word;
  query:TADOQuery;
  storedProc:TADOStoredProc;
  oldweighting, zakupka:boolean;
  p_key:longint;
  startWeight:boolean;
  DllHandle:THandle;
  show_org_dic:StandartProc;
  show_loader_form:StandartProc;
  w1,w2,netto_,brutto_,tara_, netto_kalib, volume_plotn, kalibr:longint;
  plotn:real;
  hPort:longint;
  dcbPort:TDCB;
  sInTerminator: String;
implementation

uses u_dm, main;

{$R *.dfm}

procedure TfrmTSP1.Button1Click(Sender: TObject);
begin
 startWeight:=true;
 listview1.RowSelect :=false;
 listview2.RowSelect :=false;
 Timer1.Enabled:=true;
  Timer2.Enabled:=false;
  Button1.Enabled:=False;
 Button2.Enabled:=true;
 Button3.Enabled:=True;
 Button4.Enabled:=True;
 Label22.Visible:=true;
 Label22.Caption:='Начата процедура взвешивания';
 if not oldweighting then
   Label11.Caption:='0 кг';
 Label24.Caption:='0 кг';
 Label20.Caption:='0 кг';
 Label26.Caption:='0 кг';
 Label17.Caption:='0 кг';
end;

procedure TfrmTSP1.initForm;
var
  li:TListItem;
begin
   button1.Enabled:=false;
   button2.Enabled:=false;
   button3.Enabled:=false;
   button4.Enabled:=false;
  ListView1.ItemIndex:=-1;
    ListView1.Items.Clear;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select * from dbo.zay where sost<3 order by nomerzay');
    query.Open;
    while not query.Eof do
      begin
        li:=ListView1.Items.Add;
        li.Caption:=query.FieldValues['nomerzay'];
        li.SubItems.Add(query.FieldValues['data']);
        li.SubItems.Add(query.FieldValues['kontr']);
        li.SubItems.Add(query.FieldValues['tmc']);
        li.SubItems.Add(query.FieldValues['kol']);
        li.SubItems.Add(query.FieldValues['w2']);
        li.SubItems.Add(query.FieldValues['temp']);
        li.SubItems.Add(query.FieldValues['plotn']);
        li.SubItems.Add(query.FieldValues['netto']);
        li.SubItems.Add(query.FieldValues['pogr']);
        li.SubItems.Add(query.FieldValues['remark_tsp']);
        li.SubItems.Add(query.FieldValues['plan_time']);
        query.Next;
      end;
     ListView2.ItemIndex:=-1;
    ListView2.Items.Clear;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select * from dbo.zakup where w2=0 and vid=0 order by nomer');
    query.Open;
    while not query.Eof do
      begin
        li:=ListView2.Items.Add;
        li.Caption:=query.FieldValues['nomer'];
        li.SubItems.Add(query.FieldValues['data']);
        li.SubItems.Add(query.FieldValues['time']);
        li.SubItems.Add(query.FieldValues['kontr']);
        li.SubItems.Add(query.FieldValues['tmc']);
        li.SubItems.Add(query.FieldValues['kol']);
        li.SubItems.Add(query.FieldValues['transport']);
        li.SubItems.Add(query.FieldValues['remark']);
        query.Next;
      end;
end;

procedure TfrmTSP1.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if Selected then
 begin
  zakupka:=false;
  p_key:=StrToInt(Item.Caption);
  query.Close;
    query.SQL.Clear;
    query.SQL.Add('select * from dbo.zay where nomerzay=:nz');
    query.Parameters[0].Value:=p_key;
    query.Open;
    Label11.Caption:=query.FieldByName('w1').AsString+' кг';
    if query.FieldValues['w1']>0 then begin Label11.Caption:=IntToStr(query.FieldValues['w1'])+' кг';  oldWeighting:=true end else oldWeighting:=false;
  if query.FieldValues['sost']=2 then button1.Enabled:=true else button1.Enabled:=false;
    kalibr:=query.FieldValues['w2'];
   end;
end;

procedure TfrmTSP1.ListView2SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if Selected then
 begin
  zakupka:=true;
  p_key:=StrToInt(Item.Caption);
  query.Close;
    query.SQL.Clear;
    query.SQL.Add('select * from dbo.zakup where nomer=:nz');
    query.Parameters[0].Value:=p_key;
    query.Open;
    Label11.Caption:=query.FieldByName('w1').AsString+' кг';
    if query.FieldValues['w1']>0 then begin Label11.Caption:=IntToStr(query.FieldValues['w1'])+' кг';  oldWeighting:=true end else oldWeighting:=false;
  button1.Enabled:=true ;
    kalibr:=query.FieldValues['kol'];
   end;
end;

procedure TfrmTSP1.MaskEdit1Change(Sender: TObject);
begin
try
 if MaskEdit1.Text<>',' then
  begin
   plotn:=StrToFloat(MaskEdit1.Text);
  end
 else
  plotn:=1;
 netto_kalib:=Round(kalibr*plotn);
 volume_plotn:=Round(netto_/plotn);
 Label28.Caption:=IntToStr(netto_kalib)+' кг';
 Label30.Caption:=IntToStr(volume_plotn)+' л';
except
  exit
end;
end;

procedure TfrmTSP1.Button2Click(Sender: TObject);
var
 qry:TADOQuery;
begin
 button4.Enabled:=true;
 button3.Enabled:=true;
 netto_:=0;
 brutto_:=0;
 tara_:=0;
if not oldweighting then
 begin
  Label11.Caption:=IntToStr(weight)+' кг';
  w1:=weight;
 end
else
 begin
  Label24.Caption:=IntToStr(weight)+' кг';
  w2:=weight;
  if zakupka then begin
  qry:=TADOQuery.Create(nil);
  qry.Connection:=dm.alexpromCon;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select w1 from dbo.zakup where nomer=:num');
  qry.Parameters[0].Value:=p_key;
  qry.Open;
  qry.First;
  w1:=qry.FieldValues['w1'];
  qry.Free;
  end else begin
    qry:=TADOQuery.Create(nil);
  qry.Connection:=dm.alexpromCon;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select w1 from dbo.zay where nomerzay=:num');
  qry.Parameters[0].Value:=p_key;
  qry.Open;
  qry.First;
  w1:=qry.FieldValues['w1'];
  qry.Free;
  end;
  if w1>w2 then
    begin
      brutto_:=w1;
      netto_:=w1-w2;
      tara_:=w2;
    end;
  if w1<w2 then
    begin
      brutto_:=w2;
      netto_:=w2-w1;
      tara_:=w1;
    end;
  netto_kalib:=Round(kalibr*plotn);
  volume_plotn:=Round(netto_/plotn);
  Label20.Caption:=IntToStr(brutto_)+' кг';
  Label17.Caption:=IntToStr(netto_)+' кг';
  Label26.Caption:=IntToStr(tara_)+' кг';
  Label28.Caption:=IntToStr(netto_kalib)+' кг';
  Label30.Caption:=IntToStr(volume_plotn)+' л';

 end;
end;

procedure TfrmTSP1.Button3Click(Sender: TObject);
begin
 timer1.Enabled:=false;
 timer2.Enabled:=true;
 Button3.Enabled:=False;
 Button1.Enabled:=True;
 Button2.Enabled:=False;
 startWeight:=False;
 listview1.RowSelect :=true;
 listview2.RowSelect :=true;
 Label22.Caption:='';
end;

procedure TfrmTsp1.disableControls(en:boolean);
begin
if en=true then
  begin
    Edit7.Enabled:=false;
  end
else
  begin
    Edit7.Enabled:=true;
  end;
end;

procedure TfrmTSP1.Edit7Change(Sender: TObject);
begin
try
 if Edit7.Text<>'' then
  temper:=StrToInt(Edit7.Text)
 else
  temper:=0;
except

end;
end;

procedure TfrmTSP1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 Timer2.Enabled:=false;
 Timer2.Enabled:=false;
 KillComm;
 Action:=caFree;
end;

procedure TfrmTSP1.FormCreate(Sender: TObject);
begin
query:=TADOQuery.Create(nil);
  query.Connection:=dm.alexpromCon;
  PortInit;
  Timer2.Enabled:=true;
  initForm;
end;

procedure TfrmTSP1.Timer1Timer(Sender: TObject);
begin
 inputstring.caption:=rcvStr;
 label3.Caption:=IntToStr(weight)+' кг.';
end;

procedure TfrmTSP1.Timer2Timer(Sender: TObject);
begin
 initform;
end;

procedure TfrmTSP1.Timer3Timer(Sender: TObject);
var
  qry:TADOQuery;
begin
 timer1.Enabled:=false;
 timer2.Enabled:=true;
 KillComm;
  if not oldweighting then
  begin
  if zakupka then begin qry:=TADOQuery.Create(nil);
   qry.Connection:=dm.alexpromCon;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('update dbo.zakup set w1=:@w1, date1=:@id, time1=:@t1 where nomer=:@id');
   qry.Parameters[0].Value:=w1;
   qry.Parameters[1].Value:=datetostr(now);
    if length(TimeToStr(now))=8 then
     qry.Parameters[2].Value:=TimeToStr(now)
   else
     qry.Parameters[2].Value:='0'+TimeToStr(now);
   qry.Parameters[3].Value:=p_key;
   qry.ExecSQL;
   qry.Close;
   qry.Free;
  end else begin
    qry:=TADOQuery.Create(nil);
   qry.Connection:=dm.alexpromCon;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('update dbo.zay set w1=:@w1, in_date=:@id where nomerzay=:@id');
   qry.Parameters[0].Value:=w1;
   qry.Parameters[1].Value:=datetostr(now);
   qry.Parameters[2].Value:=p_key;
   qry.ExecSQL;
   qry.Close;
   qry.Free;
  end;
  end
 else
  begin
   if zakupka then begin qry:=TADOQuery.Create(nil);
    qry.Connection:=dm.alexpromCon;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('update dbo.zakup set netto=:@netto,npk=:@nk, fakt=:@vp,');
    qry.SQL.Add('temp=:@temp, plotn=:@plotn, w2=:@w2, date2=:@od, time2=:@t2 where nomer=:@id');
    qry.Parameters[0].Value:=netto_;
    qry.Parameters[1].Value:=netto_kalib;
    qry.Parameters[2].Value:=volume_plotn;
    qry.Parameters[3].Value:=edit7.Text;
    qry.Parameters[4].Value:=maskedit1.Text;
    qry.Parameters[5].Value:=w2;
    qry.Parameters[6].Value:=datetostr(now);
    if length(TimeToStr(now))=8 then
     qry.Parameters[7].Value:=TimeToStr(now)
   else
     qry.Parameters[7].Value:='0'+TimeToStr(now);
    qry.Parameters[8].Value:=p_key;
    qry.ExecSQL;
    qry.Close;
    qry.Free;
   end else begin
     qry:=TADOQuery.Create(nil);
    qry.Connection:=dm.alexpromCon;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('update dbo.zay set netto=:@netto,netto_kalibr=:@nk, fakt=:@vp,');
    qry.SQL.Add('temp=:@temp, plotn=:@plotn, temp2=:@t2, plotn2=:@p2, kalibr=:@w2, out_date=:@od where nomerzay=:@id');
    qry.Parameters[0].Value:=netto_;
    qry.Parameters[1].Value:=netto_kalib;
    qry.Parameters[2].Value:=volume_plotn;
    qry.Parameters[3].Value:=edit7.Text;
    qry.Parameters[4].Value:=maskedit1.Text;
    qry.Parameters[5].Value:=edit7.Text;
    qry.Parameters[6].Value:=maskedit1.Text;
    qry.Parameters[7].Value:=w2;
    qry.Parameters[8].Value:=datetostr(now);
    qry.Parameters[9].Value:=p_key;
    qry.ExecSQL;
    qry.Close;
    qry.Free;
   end;
  end;

 Button1.Enabled:=True;
 Button2.Enabled:=False;
 Button3.Enabled:=False;
 Button4.Enabled:=False;
 Label22.Caption:='Взвешивание окончено.';
 Listview1.RowSelect:=true;
 Listview2.RowSelect:=true;
 Edit7.Text:='';
 oldweighting:=false;
 startWeight:=False;
 initForm;
end;

end.

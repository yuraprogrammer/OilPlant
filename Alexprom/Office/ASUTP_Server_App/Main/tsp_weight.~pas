unit tsp_weight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, QCCom32, ComCtrls, ADODB, Buttons, DB, Mask, PortUnit;

type
  StandartProc = function:boolean;
type
  TfrmTSP = class(TForm)
    Timer1: TTimer;
    GroupBox1: TGroupBox;
    Label4: TLabel;
    Edit1: TEdit;
    Label5: TLabel;
    Edit2: TEdit;
    Label6: TLabel;
    Edit3: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    inputString: TLabel;
    GroupBox3: TGroupBox;
    Label7: TLabel;
    ComboBox1: TComboBox;
    Label8: TLabel;
    ComboBox2: TComboBox;
    GroupBox5: TGroupBox;
    Timer3: TTimer;
    Label10: TLabel;
    Label11: TLabel;
    Button1: TButton;
    Label13: TLabel;
    Edit4: TEdit;
    Label14: TLabel;
    Edit5: TEdit;
    Label15: TLabel;
    ListView1: TListView;
    SpeedButton1: TSpeedButton;
    Label16: TLabel;
    GroupBox4: TGroupBox;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    ADOStoredProc1: TADOStoredProc;
    Label21: TLabel;
    Edit7: TMaskEdit;
    Edit6: TMaskEdit;
    Button3: TButton;
    ADOStoredProc2: TADOStoredProc;
    Label25: TLabel;
    Label26: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    addFirm: TButton;
    addMat: TButton;
    Button2: TButton;
    Button4: TButton;
    Label22: TLabel;
    Label9: TLabel;
    MaskEdit1: TMaskEdit;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label12: TLabel;
    Edit8: TEdit;
    procedure MaskEdit1Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure addMatClick(Sender: TObject);
    procedure addFirmClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
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
  frmTSP: TfrmTSP;
  //rcvStr:string;
  netto,brutto:longint;
  oldweightnumber, lastweighting, newweighting:word;
  query:TADOQuery;
  storedProc:TADOStoredProc;
  oldweighting:boolean;
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

procedure TfrmTSP.addFirmClick(Sender: TObject);
begin
 DllHandle:=SafeLoadLibrary('lib\org_dic.dll');
 if DLLHandle = 0 then
    begin
      if GetLastError = ERROR_DLL_NOT_FOUND then
        ShowMessage('Ошибка загрузки DLL');
        Close;
  end;
 show_org_dic:=GetProcAddress(DllHandle,'show_org_dic');
 if show_org_dic=true then
    FreeLibrary(DllHandle);
    InitForm;
end;

procedure TfrmTSP.addMatClick(Sender: TObject);
begin
 DllHandle:=SafeLoadLibrary('lib\input_mat.dll');
 if DLLHandle = 0 then
    begin
      if GetLastError = ERROR_DLL_NOT_FOUND then
        ShowMessage('Ошибка загрузки DLL');
        Close;
    end;
 show_loader_form:=GetProcAddress(DllHandle,'show_loader_form');
 if show_loader_form=true then
  FreeLibrary(DllHandle);
  InitForm;
end;

procedure TfrmTSP.Button1Click(Sender: TObject);
begin
 startWeight:=true;
 Button1.Enabled:=False;
 Button2.Enabled:=true;
 Button3.Enabled:=True;
 Button4.Enabled:=True;
 Label22.Visible:=true;
 Label22.Caption:='Начата процедура взвешивания';
 SpeedButton1.Enabled:=False;
 ListView1.Enabled:=False;
 if not oldweighting then
   Label11.Caption:='0 кг';
 Label24.Caption:='0 кг';
 Label20.Caption:='0 кг';
 Label26.Caption:='0 кг';
 Label17.Caption:='0 кг';
end;

procedure TfrmTSP.initForm;
begin
  PortInit;
  query:=TADOQuery.Create(nil);
  query.Connection:=dm.alexpromCon;
  query.SQL.Clear;
  query.SQL.Add('select max(weightNumber) from dbo.weightings');
  query.Open;
  query.First;
  lastweighting:=query.Fields[0].AsInteger;
  newweighting:=lastweighting+1;
  edit3.Text:=IntToStr(newweighting);
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select name from dbo.organizations order by id');
  query.Open;
  query.First;
  ComboBox1.Clear;
  while not query.Eof do
    begin
      ComboBox1.Items.Add(query.Fields[0].AsString);
      query.Next;
    end;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select mat_name from dbo.mat_dic order by mat_id');
  query.Open;
  combobox2.Clear;
  while not query.eof do
    begin
      ComboBox2.Items.Add(query.Fields[0].AsString);
      query.Next;
    end;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select fio from dbo.dutyoperator where a_l=2 order by op_id');
  query.Open;
  edit1.Text:=datetostr(now);
  edit2.Text:=timetostr(now);
  Edit6.Text:='';
  Edit7.Text:='';
  oldWeighting:=False;
end;

procedure TfrmTSP.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if Selected then
 begin
  p_key:=StrToInt(Item.Caption);
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.presenttrucks where weightingNumber=:wn');
  query.Parameters[0].Value:=p_key;
  query.Open;
  query.First;
  Edit1.Text:=query.FieldByName('in_date').AsString;
  Edit2.Text:=query.FieldByName('in_time').AsString;
  Edit3.Text:=IntToStr(p_key);
  Edit6.Text:=query.FieldByName('truckNumber').AsString;
  kalibr:=query.FieldByName('truckCode').AsInteger;
  Edit7.Text:=IntToStr(kalibr);
  Label11.Caption:=query.FieldByName('weighting_1').AsString+' кг';
  Label24.Caption:='0 кг';
  ComboBox1.ItemIndex:=query.FieldByName('org_id').AsInteger;
  ComboBox2.ItemIndex:=query.FieldByName('load_id').AsInteger;
  Edit8.Text:=query.FieldByName('Remark').AsString;
 end;
end;

procedure TfrmTSP.MaskEdit1Change(Sender: TObject);
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

procedure TfrmTSP.Button2Click(Sender: TObject);
var
 qry:TADOQuery;
begin
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
  qry:=TADOQuery.Create(nil);
  qry.Connection:=dm.alexpromCon;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select weighting_1 from dbo.trucks where weightingNumber=:num');
  qry.Parameters[0].Value:=p_key;
  qry.Open;
  qry.First;
  w1:=qry.FieldValues['weighting_1'];
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
  qry.Free;
 end; 
end;

procedure TfrmTSP.Button3Click(Sender: TObject);
begin
 Button3.Enabled:=False;
 Button1.Enabled:=True;
 Button2.Enabled:=False;
 startWeight:=False;
 SpeedButton1.Enabled:=True;
 ListView1.Enabled:=True;
 Label22.Caption:='';
end;

procedure TfrmTsp.disableControls(en:boolean);
begin
if en=true then
  begin
    Edit6.Enabled:=false;
    Edit7.Enabled:=false;
  end
else
  begin
    Edit6.Enabled:=true;
    Edit7.Enabled:=true;
  end;
end;

procedure TfrmTSP.Edit7Change(Sender: TObject);
begin
try
 if Edit7.Text<>'' then
  kalibr:=StrToInt(Edit7.Text)
 else
  kalibr:=0; 
except

end;
end;

procedure TfrmTSP.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 KillComm;
 Action:=caFree;
end;

procedure TfrmTSP.FormCreate(Sender: TObject);
begin
if not dm.alexpromCon.Connected then
  begin
     try
       dm.alexpromCon.Connected:=true;
       initForm;
      except
        ShowMessage('Нет соединения с сервером базы данных!!! Обратитесь к администратору и повторите попытку позже.');
      end;
  end
else
  initForm;
end;

procedure TfrmTSP.SpeedButton1Click(Sender: TObject);
var
  li:TListItem;
begin
 if ListView1.Visible=true then
  begin
    ListView1.Visible:=false;
    oldweighting:=false;
    Edit1.Text:='';
    Edit2.Text:='';
    Edit3.Text:=IntToStr(newweighting);
    Edit4.Text:='';
    Edit5.Text:='';
    Edit6.Text:='';
    Edit7.Text:='';
    ComboBox1.ItemIndex:=-1;
    ComboBox2.ItemIndex:=-1;
    Label11.Caption:='0 кг';
  end
 else
  begin
    ListView1.Visible:=true;
    oldweighting:=true;
    ListView1.ItemIndex:=-1;
    ListView1.Items.Clear;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select * from presenttrucks where present=1');
    query.Open;
    while not query.Eof do
      begin
        li:=ListView1.Items.Add;
        li.Caption:=query.FieldValues['weightingNumber'];
        li.SubItems.Add(query.FieldValues['org_name']);
        li.SubItems.Add(query.FieldValues['weighting_1']);
        query.Next;
      end;
  end;
  disableControls(oldweighting);
end;

procedure TfrmTSP.Timer1Timer(Sender: TObject);
begin
if not oldweighting then
  begin
   Edit1.Text:=mainForm.curDate;
   Edit2.Text:=TimeToStr(now);
  end
else
  begin
   Edit4.Text:=mainForm.curDate;
   Edit5.Text:=TimeToStr(now);
  end;
 inputstring.caption:=rcvStr;
 label3.Caption:=IntToStr(weight)+' кг.';
end;

procedure TfrmTSP.Timer3Timer(Sender: TObject);
var
  qry:TADOQuery;
begin
 KillComm;
 lastweighting:=newweighting;
 newweighting:=lastweighting+1;
 adostoredProc1.Connection:=dm.alexpromCon;
 adostoredProc2.Connection:=dm.alexpromCon;
 if dm.alexpromCon.Connected=false then
    dm.alexpromCon.Connected:=true;
 if not oldweighting then
  begin
   adostoredProc1.ProcedureName:='addWeightings;1';
   adostoredProc1.Parameters[1].Value:=2;
   if length(TimeToStr(now))=8 then
     adostoredProc1.Parameters[2].Value:=TimeToStr(now)
   else
     adostoredProc1.Parameters[2].Value:='0'+TimeToStr(now);
   adostoredProc1.Parameters[3].Value:=lastweighting;
   adostoredProc1.Parameters[4].Value:=0;
   adostoredProc1.Parameters[5].Value:=mainForm.curDate;
   if length(TimeToStr(now))=8 then
     adostoredProc1.Parameters[6].Value:=TimeToStr(now)
   else
     adostoredProc1.Parameters[6].Value:='0'+TimeToStr(now);
   adostoredProc1.Parameters[7].Value:=w1;
   adostoredProc1.Parameters[8].Value:=0;
   adostoredProc1.Parameters[9].Value:=1;
   adostoredProc1.Parameters[10].Value:=Edit6.Text;
   adostoredProc1.Parameters[11].Value:=ComboBox1.ItemIndex;
   adostoredProc1.Parameters[12].Value:=ComboBox2.ItemIndex;
   adostoredProc1.Parameters[13].Value:=Edit7.Text;
   adostoredProc1.ExecProc;
   qry:=TADOQuery.Create(nil);
   qry.Connection:=dm.alexpromCon;
   qry.Close;
   qry.SQL.Clear;
   qry.SQL.Add('update dbo.trucks set remark=:@n where weightingNumber=:@id');
   qry.Parameters[0].Value:=Edit8.Text;
   qry.Parameters[1].Value:=lastweighting;
   qry.ExecSQL;
   qry.Close;
   qry.Free;
  end
 else
  begin
    adostoredProc2.ProcedureName:='updateWeightings;1';
    adostoredProc2.Parameters[1].Value:=p_key;
    adostoredProc2.Parameters[2].Value:=w2;
    adostoredProc2.Parameters[3].Value:=brutto_;
    adostoredProc2.Parameters[4].Value:=mainForm.curDate;
    if length(TimeToStr(now))=8 then
     adostoredProc2.Parameters[5].Value:=TimeToStr(now)
   else
     adostoredProc2.Parameters[5].Value:='0'+TimeToStr(now);
    adostoredProc2.Parameters[6].Value:=0;
    adostoredProc2.ExecProc;
    qry:=TADOQuery.Create(nil);
    qry.Connection:=dm.alexpromCon;
    qry.Close;
    qry.SQL.Clear;
    qry.SQL.Add('update dbo.trucks set netto_1=:@netto, brutto_1=:@brutto, tara=:@tara, org_id=:oid, ');
    qry.SQL.Add('netto_kalibr=:nk, volume_plotn=:vp, Remark=:r where weightingNumber=:@id');
    qry.Parameters[0].Value:=netto_;
    qry.Parameters[1].Value:=brutto_;
    qry.Parameters[2].Value:=tara_;
    qry.Parameters[3].Value:=ComboBox1.ItemIndex;
    qry.Parameters[4].Value:=netto_kalib;
    qry.Parameters[5].Value:=volume_plotn;
    qry.Parameters[6].Value:=Edit8.Text;
    qry.Parameters[7].Value:=p_key;
    qry.ExecSQL;
    qry.Close;
    qry.Free;
  end;

 Button1.Enabled:=True;
 Button2.Enabled:=False;
 Button3.Enabled:=False;
 Button4.Enabled:=False;
 Label22.Caption:='Взвешивание окончено.';
 Edit1.Text:='';
 Edit2.Text:='';
 Edit3.Text:=IntToStr(newweighting);
 Edit4.Text:='';
 Edit5.Text:='';
 Edit6.Text:='';
 Edit7.Text:='';
 ComboBox1.ItemIndex:=-1;
 ComboBox2.ItemIndex:=-1;
 SpeedButton1.Enabled:=True;
 ListView1.Enabled:=True;
 ListView1.Visible:=False;
 oldweighting:=false;
 initForm;
 startWeight:=False;
end;

end.

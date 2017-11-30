unit viewZay;

interface



uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, RpDefine, RpRave, RpRender, RpRenderHTML,
  RpCon, RpConDS, DB, RpBase, RpSystem, ExtCtrls, mainfunctions, Mask;

type
  TViewZayForm = class(TForm)
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label12: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    ComboBox2: TComboBox;
    Edit13: TEdit;
    Edit14: TEdit;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Edit15: TEdit;
    Edit16: TEdit;
    Edit17: TEdit;
    Edit18: TEdit;
    Edit19: TEdit;
    Edit20: TEdit;
    Edit21: TEdit;
    Edit22: TEdit;
    Edit23: TEdit;
    Edit24: TEdit;
    ComboBox5: TComboBox;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    GroupBox6: TGroupBox;
    Label23: TLabel;
    Label29: TLabel;
    Button1: TButton;
    GroupBox4: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
    GroupBox3: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Edit3: TEdit;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label28: TLabel;
    Edit1: TEdit;
    Label35: TLabel;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Key(Sender: TObject; var Key: Char);


  private
    procedure initForm;
  public


  end;

var
  ViewZayForm: TViewZayForm;
  query,query_s:TADOQuery;
  e,r:integer;


implementation

uses
  u_dm, main, zay_view;



{$R *.dfm}


procedure TViewZayForm.FormCreate(Sender: TObject);
begin
 query_s:=TADOQuery.Create(nil);
 query_s.Connection:=dm.alexpromCon;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 if User='olga' then begin edit8.Enabled:=true; edit9.Enabled:=true; edit10.Enabled:=true; edit11.Enabled:=true; end else begin edit8.Enabled:=false; edit9.Enabled:=false; edit10.Enabled:=false; edit11.Enabled:=false; end;

 InitForm;
end;

procedure TViewZayForm.Key(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
begin
Key:=#0;
PostMessage(Application.ActiveFormHandle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TViewZayForm.Button2Click(Sender: TObject);
begin
    //PrintDialog1.Execute;
    ViewZayForm.Print;
end;

procedure TViewZayForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
 end;

//procedure TfrmTSP.addMatClick(Sender: TObject);
//begin
// DllHandle:=SafeLoadLibrary('lib\input_mat.dll');
// if DLLHandle = 0 then
//    begin
//      if GetLastError = ERROR_DLL_NOT_FOUND then
//        ShowMessage('Ошибка загрузки DLL');
//        Close;
//    end;
// show_loader_form:=GetProcAddress(DllHandle,'show_loader_form');
// if show_loader_form=true then
//  FreeLibrary(DllHandle);
//  InitForm;
//end;

procedure TViewZayForm.Button1Click(Sender: TObject);
var q1: TADOQuery;
begin
 Wrong:=false;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.AlexpromCon;
 //dm.AlexpromCon.BeginTrans;
query.Close;
query.SQL.Clear;
query.SQL.Add('update dbo.zay set w2=:@w2,  temp2=:@t2, plotn2=:@p2, netto_kalibr=:@nk where nomerzay=:@nz');
 query.Parameters[0].Value:=Edit8.Text;
  query.Parameters[1].Value:=Edit9.Text;
  query.Parameters[2].Value:=Edit10.Text;
  query.Parameters[3].Value:=Edit11.Text;
   query.Parameters[4].Value:=ZayNumber;
  query.ExecSQL;
  query.Close;
  close;
end;

procedure TViewZayForm.initForm;
begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.zay where nomerzay=:nz order by nomerzay');
  query.Parameters[0].Value:=ZayNumber;
  query.Open;
  query.First;

  Label28.Caption:=inttostr(ZayNumber);
  datetimepicker1.Date:=strtodate(query.FieldByName('data').AsString);
  Edit13.Text:=query.FieldByName('kontr').AsString;
  Edit14.Text:=query.FieldByName('tmc').AsString;
  Edit15.Text:=query.FieldByName('kol').AsString;
  Edit16.Text:=query.FieldByName('cena').AsString;
  Edit17.Text:=query.FieldByName('dostavka').AsString;
  Edit15.Text:=query.FieldByName('w2').AsString;
  Edit26.Text:=query.FieldByName('kurator').AsString;
  Edit27.Text:=query.FieldByName('n_trans').AsString;
  Edit18.Text:=query.FieldByName('seriaDov').AsString;
  Edit19.Text:=query.FieldByName('nomerDov').AsString;
  Edit20.Text:=query.FieldByName('dataDov').AsString;
  Edit21.Text:=query.FieldByName('komuDov').AsString;
  Edit22.Text:=query.FieldByName('remarkDov').AsString;
  Edit23.Text:=query.FieldByName('schet').AsString;
  Edit2.Text:=query.FieldByName('in_time').AsString;
  Edit3.Text:=query.FieldByName('out_time').AsString;
  Edit4.Text:=query.FieldByName('fakt').AsString;
  Edit5.Text:=query.FieldByName('temp').AsString;
  Edit9.Text:=query.FieldByName('temp2').AsString;
  Edit6.Text:=query.FieldByName('plotn').AsString;
  Edit10.Text:=query.FieldByName('plotn2').AsString;
  Edit7.Text:=query.FieldByName('netto').AsString;
  Edit8.Text:=query.FieldByName('w2').AsString;
  Edit11.Text:=query.FieldByName('netto_kalibr').AsString;
  ComboBox4.Text:=query.FieldByName('pogr').AsString;
  Edit24.Text:=query.FieldByName('remark').AsString;
  Edit25.Text:=query.FieldByName('w2').AsString;
  Label29.Caption:=query.FieldByName('podalZay').AsString+' '+query.FieldByName('create_date').AsString;
  Edit1.Text:=datetostr(now);
  ComboBox2.text:=query.FieldByName('m_cena').AsString;
  ComboBox3.text:=query.FieldByName('m_dostavka').AsString;
  ComboBox5.text:=query.FieldByName('m_kol').AsString;
  Edit26.Text:=query.FieldByName('kurator').AsString;
  Edit27.Text:=query.FieldByName('n_trans').AsString;
  Edit28.Text:=query.FieldByName('remark_tsp').AsString;
  Edit29.Text:=query.FieldByName('remark_lab').AsString;
  Edit30.Text:=query.FieldByName('plan_time').AsString;
  Label35.Caption:=query.FieldByName('change').AsString;
end;



end.

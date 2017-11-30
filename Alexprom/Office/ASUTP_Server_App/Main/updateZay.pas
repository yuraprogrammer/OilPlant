unit updatezay;

interface



uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, RpDefine, RpRave, RpRender, RpRenderHTML,
  RpCon, RpConDS, DB, RpBase, RpSystem, ExtCtrls, mainfunctions, Mask;

type
  TUpdateZayForm = class(TForm)
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    GroupBox5: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Edit4: TEdit;
    Edit5: TEdit;
    Edit6: TEdit;
    Edit7: TEdit;
    Edit8: TEdit;
    Edit9: TEdit;
    Edit10: TEdit;
    Edit11: TEdit;
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
    Button1: TButton;
    GroupBox6: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
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
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    ComboBox5: TComboBox;
    Label30: TLabel;
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Label31: TLabel;
    Label32: TLabel;
    Label12: TLabel;
    Label33: TLabel;
    Edit28: TEdit;
    Edit29: TEdit;
    Label34: TLabel;
    Edit30: TEdit;
    DateTimePicker1: TDateTimePicker;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure obyom(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Key (Sender: TObject; var Key: char);


  private
    procedure initForm;
  public


  end;

var
  UpdateZayForm: TUpdateZayForm;
  query,query_s:TADOQuery;
  e,r:integer;


implementation

uses
  u_dm, main, zay_view;



{$R *.dfm}

procedure TUpdateZayForm.Key(Sender: TObject; var Key: Char);
begin
  if Key = #13  then
   begin
     Key := #0;
     Perform(WM_NEXTDLGCTL, 0, 0);
   end;
end;
procedure TUpdateZayForm.FormCreate(Sender: TObject);
begin
 query_s:=TADOQuery.Create(nil);
 query_s.Connection:=dm.alexpromCon;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 InitForm;
end;



procedure TUpdateZayForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 if Wrong then begin
   query.Close;
query.SQL.Clear;
query.SQL.Add('delete from dbo.zay where nomerzay=:id');
query.Parameters[0].Value:=ZayNumber;
  query.ExecSQL;
 end;
 Wrong:=false;
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
procedure TUpdateZayForm.obyom(Sender: TObject);
begin
  if Combobox5.Text='кг' then begin Edit25.Visible:=true; Label30.Visible:=true;
  end
  else begin Edit25.Visible:=false; Label30.Visible:=false; end;

end;


procedure TUpdateZayForm.Button1Click(Sender: TObject);
var q1: TADOQuery;
begin

 query:=TADOQuery.Create(nil);
 query.Connection:=dm.AlexpromCon;
 //dm.AlexpromCon.BeginTrans;
query.Close;
query.SQL.Clear;
query.SQL.Add('update dbo.zay set data=:@data,  kontr=:@kontr, tmc=:@tmc, kol=:@kol, kurator=:@kur, n_trans=:@nt,');
query.SQL.Add('cena=:@cena, dostavka=:@dostavka, seriaDov=:@sd, nomerDov=:@nd, dataDov=:@dd, komuDov=:@kd,');
query.SQL.Add('plan_time=:@pt, remark_tsp=:@rt, remark_lab=:@rl, change=:@ch,');
query.SQL.Add('remarkDov=:@rd, schet=:@schet, pogr=:@pogr, remark=:@r, m_cena=:@mc, m_dostavka=:@md, w2=:w2, m_kol=:@mk where nomerzay=:@id');

  query.Parameters[0].Value:=datetostr(datetimepicker1.Date);
  query.Parameters[1].Value:=Edit13.Text;
  query.Parameters[2].Value:=Edit14.Text;
  query.Parameters[3].Value:=strtoint(Edit15.Text);
  query.Parameters[4].Value:=Edit26.Text;
  query.Parameters[5].Value:=Edit27.Text;
  query.Parameters[6].Value:=strtofloat(Edit16.Text);
  query.Parameters[7].Value:=strtofloat(Edit17.Text);
  query.Parameters[8].Value:=Edit18.Text+' ';
  query.Parameters[9].Value:=Edit19.Text+' ';
  query.Parameters[10].Value:=Edit20.Text+' ';
  query.Parameters[11].Value:=Edit21.Text+' ';
  query.Parameters[12].Value:=Edit30.Text+' ';
  query.Parameters[13].Value:=Edit28.Text+' ';
  query.Parameters[14].Value:=Edit29.Text+' ';
  if Wrong then query.Parameters[15].Value:=' ' else query.Parameters[15].Value:='Изменена в '+timetostr(now)+' пользователем '+User;
  query.Parameters[16].Value:=Edit22.Text;
  query.Parameters[17].Value:=Edit23.Text;
  query.Parameters[18].Value:=ComboBox4.Text;
  query.Parameters[19].Value:=Edit24.Text+' ';
  query.Parameters[20].Value:=ComboBox2.Text;
  query.Parameters[21].Value:=ComboBox3.Text;
  if Combobox5.Text='кг' then query.Parameters[22].Value:=strtoint(Edit25.Text) else query.Parameters[22].Value:=strtoint(Edit15.Text);
  query.Parameters[23].Value:=ComboBox5.Text;
  query.Parameters[24].Value:=ZayNumber;

  query.ExecSQL;
  query.Close;
  Wrong:=false;
  close;
end;

procedure TUpdateZayForm.initForm;
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
end;



end.

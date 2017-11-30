unit viewZak;

interface



uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, RpDefine, RpRave, RpRender, RpRenderHTML,
  RpCon, RpConDS, DB, RpBase, RpSystem, ExtCtrls, mainfunctions, Mask;

type
  TViewZakForm = class(TForm)
    GroupBox5: TGroupBox;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label22: TLabel;
    Label32: TLabel;
    Label34: TLabel;
    Edit13: TEdit;
    Edit14: TEdit;
    Edit15: TEdit;
    Edit24: TEdit;
    Edit27: TEdit;
    Edit30: TEdit;
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
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label35: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    DateTimePicker1: TDateTimePicker;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure Key1(Sender: TObject; var Key: Char);


  private
    procedure initForm;
  public


  end;

var
  ViewZakForm: TViewZakForm;
  query,query_s:TADOQuery;
  e,r:integer;


implementation

uses
  u_dm, main, zak_view;



{$R *.dfm}


procedure TViewZakForm.FormCreate(Sender: TObject);
begin
 query_s:=TADOQuery.Create(nil);
 query_s.Connection:=dm.alexpromCon;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 if User='olga' then begin edit11.Enabled:=true; edit2.Enabled:=true; end else begin edit11.Enabled:=false; edit2.Enabled:=false; end;
 if mainform.accessLevel<>6 then begin datetimepicker1.Enabled:=false; checkbox1.Enabled:=false; edit13.Enabled:=false; edit14.Enabled:=false; edit15.Enabled:=false; edit30.Enabled:=false; edit27.Enabled:=false; edit24.Enabled:=false; end else begin datetimepicker1.Enabled:=true; checkbox1.Enabled:=true; edit13.Enabled:=true; edit14.Enabled:=true; edit15.Enabled:=true; edit30.Enabled:=true; edit27.Enabled:=true; edit24.Enabled:=true; end;

 InitForm;
end;

procedure TViewZakForm.Key1(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
begin
Key:=#0;
PostMessage(Application.ActiveFormHandle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TViewZakForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  if Wrong then begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('delete from dbo.zakup where nomer=:id');
    query.Parameters[0].Value:=ZayNumber;
    query.ExecSQL;
 end;
 Wrong:=false;
 Action:=caFree;
 end;

procedure TViewZakForm.Button1Click(Sender: TObject);
begin
 Wrong:=false;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.AlexpromCon;
query.Close;
query.SQL.Clear;
query.SQL.Add('update dbo.zakup set npk=:@npk, summ=:@s, data=:@d, kontr=:@kon, tmc=:@tmc, kol=:@kol, time=:@time, transport=:@t, remark=:@rem, vid=:@v where nomer=:@nz');
  query.Parameters[0].Value:=Edit11.Text;
  query.Parameters[1].Value:=strtofloat(Edit2.Text);
  query.Parameters[2].Value:=datetostr(datetimepicker1.Date);
  query.Parameters[3].Value:=Edit13.Text;
  query.Parameters[4].Value:=Edit14.Text;
  query.Parameters[5].Value:=strtoint(Edit15.Text);
  query.Parameters[6].Value:=Edit30.Text;
  query.Parameters[7].Value:=Edit27.Text;
  query.Parameters[8].Value:=Edit24.Text;
  if checkbox1.Checked then query.Parameters[9].Value:=true else query.Parameters[9].Value:=false;
  query.Parameters[10].Value:=ZayNumber;
  query.ExecSQL;
  query.Close;
  close;
end;

procedure TViewZakForm.initForm;
begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.zakup where nomer=:nz');
  query.Parameters[0].Value:=ZayNumber;
  query.Open;
  query.First;

  datetimepicker1.Date:=strtodate(query.FieldByName('data').AsString);
  Edit13.Text:=query.FieldByName('kontr').AsString;
  Edit14.Text:=query.FieldByName('tmc').AsString;
  Edit15.Text:=query.FieldByName('kol').AsString;
  Edit27.Text:=query.FieldByName('transport').AsString;
  Edit4.Text:=query.FieldByName('fakt').AsString;
  Edit5.Text:=query.FieldByName('temp').AsString;
  Edit9.Text:=query.FieldByName('temp').AsString;
  Edit6.Text:=query.FieldByName('plotn').AsString;
  Edit10.Text:=query.FieldByName('plotn').AsString;
  Edit7.Text:=query.FieldByName('netto').AsString;
  Edit8.Text:=query.FieldByName('kol').AsString;
  Edit11.Text:=query.FieldByName('npk').AsString;
  Edit24.Text:=query.FieldByName('remark').AsString;
  Edit2.Text:=query.FieldByName('summ').AsString;
  Edit1.Text:=datetostr(now);
  if query.FieldByName('vid').AsBoolean then checkbox1.Checked:=true;
  Edit30.Text:=query.FieldByName('time').AsString;

end;



end.

unit Razgonka;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, StdCtrls;

type
  TRazg = class(TForm)
    GroupBox1: TGroupBox;
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
    Edit12: TEdit;
    Edit13: TEdit;
    Edit14: TEdit;
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
    Edit25: TEdit;
    Edit26: TEdit;
    Edit27: TEdit;
    Edit28: TEdit;
    Edit29: TEdit;
    Edit30: TEdit;
    Edit31: TEdit;
    Edit32: TEdit;
    Edit33: TEdit;
    Edit34: TEdit;
    Edit35: TEdit;
    Edit36: TEdit;
    Edit37: TEdit;
    Edit38: TEdit;
    Edit39: TEdit;
    Edit40: TEdit;
    Edit41: TEdit;
    Edit42: TEdit;
    Edit43: TEdit;
    Edit44: TEdit;
    Label1: TLabel;
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
    Label12: TLabel;
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
    Label30: TLabel;
    Label31: TLabel;
    Label32: TLabel;
    Label33: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Button1: TButton;
    Button2: TButton;
    Edit45: TEdit;
    Edit46: TEdit;
    Edit47: TEdit;
    Label41: TLabel;
    Label42: TLabel;
    Label43: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Key1(Sender: TObject; var Key: Char);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edit30Change(Sender: TObject);
    procedure Edit32Change(Sender: TObject);
    procedure Edit34Change(Sender: TObject);
    procedure Edit36Change(Sender: TObject);
    procedure Edit38Change(Sender: TObject);
    procedure Edit47Change(Sender: TObject);
    procedure Button2Click(Sender: TObject);


  private
    procedure initForm;
  public
    { Public declarations }
  end;

var
  Razg: TRazg;
  q: TADOQuery;

implementation

uses
u_dm, main, zak_view;

{$R *.dfm}

procedure TRazg.FormCreate(Sender: TObject);
var
  i: integer;
  MyComponent: TComponent;
begin
  q:=TADOQuery.Create(nil);
  q.Connection:=dm.alexpromCon;
  if mainform.accessLevel<>2 then
  for I := 5 to 44 do Begin
      MyComponent := Razg.FindComponent('Edit'+IntToStr(i));
   if MyComponent <> nil then TEdit(MyComponent).Enabled:=false;
  End;
  Initform;
end;

procedure TRazg.Button2Click(Sender: TObject);
begin
  q.Close;
  q.SQL.Clear;
  q.SQL.Add('update dbo.zakup set p20=:@p, tn=:@tn, t10=:@t10, t15=:@t15, t20=:@t20, t25=:@t25, t30=:@t30, t35=:@t35, t40=:@t40, t45=:@t45, ');
  q.SQL.Add ('t50=:@t50, t55=:@t55, t60=:@t60, t65=:@t65, t70=:@t70, t75=:@t75, t80=:@t80, t85=:@t85, t90=:@t90, t95=:@t95, tkk=:@tkk, vih=:@vih,');
  q.SQL.Add ('ost=:@ost, pot=:@pot, voda=:@voda, blf_k=:@bk, blf_p=:@bp, adt_k=:@ak, adt_p=:@ap, otg=:@otg, vih_sv=:@vs, pot2=:@p2, ');
  q.SQL.Add ('voda2=:@v2, par=:@par, prim=:@prim, t1=:@t1, t2=:@t2, t3=:@t3, t4=:@t4, summa=:@su, blf_t=:@bt, tpom=:@tp, razg=:@ra where nomer=:wn');
  q.Parameters[0].Value:=strtofloat(Edit5.Text);
  q.Parameters[1].Value:=Edit6.Text;
  q.Parameters[2].Value:=Edit7.Text;
  q.Parameters[3].Value:=Edit8.Text;
  q.Parameters[4].Value:=Edit9.Text;
  q.Parameters[5].Value:=Edit10.Text;
  q.Parameters[6].Value:=Edit11.Text;
  q.Parameters[7].Value:=Edit12.Text;
  q.Parameters[8].Value:=Edit13.Text;
  q.Parameters[9].Value:=Edit14.Text;
  q.Parameters[10].Value:=Edit15.Text;
  q.Parameters[11].Value:=Edit16.Text;
  q.Parameters[12].Value:=Edit17.Text;
  q.Parameters[13].Value:=Edit18.Text;
  q.Parameters[14].Value:=Edit19.Text;
  q.Parameters[15].Value:=Edit20.Text;
  q.Parameters[16].Value:=Edit21.Text;
  q.Parameters[17].Value:=Edit22.Text;
  q.Parameters[18].Value:=Edit23.Text;
  q.Parameters[19].Value:=Edit24.Text;
  q.Parameters[20].Value:=Edit25.Text;
  q.Parameters[21].Value:=Edit26.Text;
  q.Parameters[22].Value:=Edit27.Text;
  q.Parameters[23].Value:=Edit28.Text;
  q.Parameters[24].Value:=Edit29.Text;
  q.Parameters[25].Value:=Edit30.Text;
  q.Parameters[26].Value:=strtofloat(Edit31.Text);
  q.Parameters[27].Value:=Edit32.Text;
  q.Parameters[28].Value:=strtofloat(Edit33.Text);
  q.Parameters[29].Value:=Edit34.Text;
  q.Parameters[30].Value:=Edit35.Text;
  q.Parameters[31].Value:=Edit36.Text;
  q.Parameters[32].Value:=Edit37.Text;
  q.Parameters[33].Value:=Edit38.Text;
  q.Parameters[34].Value:=Edit39.Text;
  q.Parameters[35].Value:=Edit40.Text;
  q.Parameters[36].Value:=Edit41.Text;
  q.Parameters[37].Value:=Edit42.Text;
  q.Parameters[38].Value:=Edit43.Text;
  q.Parameters[39].Value:=Edit44.Text;
  q.Parameters[40].Value:=Edit45.Text;
  q.Parameters[41].Value:=Edit46.Text;
  q.Parameters[42].Value:=1;
  q.Parameters[43].Value:=ZayNumber;
  q.ExecSQL;
  q.Close;
  close;
end;

procedure Trazg.Edit30Change(Sender: TObject);
begin
   if Edit30.Text='' then Edit30.Text:='0';
   Edit35.Text:=inttostr(strtoint(Edit30.Text)+strtoint(Edit32.Text));
   Edit44.Text:=inttostr(strtoint(Edit34.Text)+strtoint(Edit35.Text)+strtoint(Edit36.Text)+strtoint(Edit38.Text));
end;

procedure Trazg.Edit32Change(Sender: TObject);
begin
  if Edit32.Text='' then Edit32.Text:='0';
   Edit35.Text:=inttostr(strtoint(Edit30.Text)+strtoint(Edit32.Text));
   Edit44.Text:=inttostr(strtoint(Edit34.Text)+strtoint(Edit35.Text)+strtoint(Edit36.Text)+strtoint(Edit38.Text));
end;

procedure Trazg.Edit34Change(Sender: TObject);
begin
  if Edit34.Text='' then Edit34.Text:='0';
   Edit35.Text:=inttostr(strtoint(Edit30.Text)+strtoint(Edit32.Text));
   Edit44.Text:=inttostr(strtoint(Edit34.Text)+strtoint(Edit35.Text)+strtoint(Edit36.Text)+strtoint(Edit38.Text));
end;

procedure Trazg.Edit36Change(Sender: TObject);
begin
  if Edit36.Text='' then Edit36.Text:='0';
   Edit35.Text:=inttostr(strtoint(Edit30.Text)+strtoint(Edit32.Text));
   Edit44.Text:=inttostr(strtoint(Edit34.Text)+strtoint(Edit35.Text)+strtoint(Edit36.Text)+strtoint(Edit38.Text));
end;

procedure Trazg.Edit38Change(Sender: TObject);
begin
  if Edit38.Text='' then Edit38.Text:='0';
   Edit35.Text:=inttostr(strtoint(Edit30.Text)+strtoint(Edit32.Text));
   Edit44.Text:=inttostr(strtoint(Edit34.Text)+strtoint(Edit35.Text)+strtoint(Edit36.Text)+strtoint(Edit38.Text));
end;



procedure TRazg.Edit47Change(Sender: TObject);
begin
  Edit46.Text:=Edit47.Text;
end;

procedure TRazg.initForm;
begin
  q.Close;
  q.SQL.Clear;
  q.SQL.Add('select * from dbo.zakup where nomer=:wn');
  q.Parameters[0].Value:=ZayNumber;
  q.Open;
  q.First;
  Edit1.Text:=q.FieldByName('data').AsString;
  Edit2.Text:=q.FieldByName('tmc').AsString;
  Edit3.Text:=q.FieldByName('transport').AsString;
  Edit4.Text:=q.FieldByName('kol').AsString;
  if q.FieldValues['razg']<>0 then
  begin
    Edit5.Text:=q.FieldByName('p20').AsString;
    Edit6.Text:=q.FieldByName('tn').AsString;
    Edit7.Text:=q.FieldByName('t10').AsString;
    Edit8.Text:=q.FieldByName('t15').AsString;
    Edit9.Text:=q.FieldByName('t20').AsString;
    Edit10.Text:=q.FieldByName('t25').AsString;
    Edit11.Text:=q.FieldByName('t30').AsString;
    Edit12.Text:=q.FieldByName('t35').AsString;
    Edit13.Text:=q.FieldByName('t40').AsString;
    Edit14.Text:=q.FieldByName('t45').AsString;
    Edit15.Text:=q.FieldByName('t50').AsString;
    Edit16.Text:=q.FieldByName('t55').AsString;
    Edit17.Text:=q.FieldByName('t60').AsString;
    Edit18.Text:=q.FieldByName('t65').AsString;
    Edit19.Text:=q.FieldByName('t70').AsString;
    Edit20.Text:=q.FieldByName('t75').AsString;
    Edit21.Text:=q.FieldByName('t80').AsString;
    Edit22.Text:=q.FieldByName('t85').AsString;
    Edit23.Text:=q.FieldByName('t90').AsString;
    Edit24.Text:=q.FieldByName('t95').AsString;
    Edit25.Text:=q.FieldByName('tkk').AsString;
    Edit26.Text:=q.FieldByName('vih').AsString;
    Edit27.Text:=q.FieldByName('ost').AsString;
    Edit28.Text:=q.FieldByName('pot').AsString;
    Edit29.Text:=q.FieldByName('voda').AsString;
    Edit30.Text:=q.FieldByName('blf_k').AsString;
    Edit31.Text:=q.FieldByName('blf_p').AsString;
    Edit32.Text:=q.FieldByName('adt_k').AsString;
    Edit33.Text:=q.FieldByName('adt_p').AsString;
    Edit34.Text:=q.FieldByName('otg').AsString;
    Edit36.Text:=q.FieldByName('pot2').AsString;
    Edit37.Text:=q.FieldByName('voda2').AsString;
    Edit38.Text:=q.FieldByName('par').AsString;
    Edit39.Text:=q.FieldByName('prim').AsString;
    Edit40.Text:=q.FieldByName('t1').AsString;
    Edit41.Text:=q.FieldByName('t2').AsString;
    Edit42.Text:=q.FieldByName('t3').AsString;
    Edit43.Text:=q.FieldByName('t4').AsString;
    Edit45.Text:=q.FieldByName('blf_t').AsString;
    Edit46.Text:=q.FieldByName('tpom').AsString;
    Edit47.Text:=q.FieldByName('tpom').AsString;
    end;
    Edit35.Text:=inttostr(strtoint(Edit30.Text)+strtoint(Edit32.Text));
    Edit44.Text:=inttostr(strtoint(Edit34.Text)+strtoint(Edit35.Text)+strtoint(Edit36.Text)+strtoint(Edit38.Text));
end;

procedure TRazg.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TRazg.Key1(Sender: TObject; var Key: Char);
begin
  if (Key = #13) then
begin
Key:=#0;
PostMessage(Application.ActiveFormHandle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TRazg.Button1Click(Sender: TObject);
begin
   Razg.Print;
end;

end.

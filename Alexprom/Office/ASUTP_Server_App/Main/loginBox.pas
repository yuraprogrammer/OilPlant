unit loginBox;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ADODB;

type
  TloginForm = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Edit2: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
const connStr='Provider=MSDASQL.1;Persist Security Info=false;Data Source=alexprom';
var
  loginForm: TloginForm;
  query:TADOQuery;
implementation

uses u_dm, main;

{$R *.dfm}

procedure TloginForm.Button1Click(Sender: TObject);
begin
  dm.alexpromCon.ConnectionString:=dm.alexpromCon.ConnectionString+';Password='+edit2.Text;
  dm.alexpromCon.ConnectionString:=dm.alexpromCon.ConnectionString+';User ID='+edit1.Text;
  dm.alexpromCon.Connected:=true;
  query:=TADOQuery.Create(nil);
  query.Connection:=dm.alexpromCon;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select uaccesslevel, upurchased from dbo.alexpromusers where uname=:uname');
  query.Parameters[0].Value:=edit1.Text;
  query.Open;
  if query.RecordCount<>0 then
    begin
      mainForm.accessLevel:=query.fields[0].asinteger;
      mainForm.purchaseLevel:=query.fields[1].asinteger;
      mainForm.setAccess(mainForm.accessLevel, mainForm.purchaseLevel);
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('select accessDescr from dbo.v_users where uname=:uname');
      query.Parameters[0].Value:=edit1.Text;
      query.Open;
      mainForm.Ribbon1.Caption:='Пользователь '+edit1.text+', Уровень доступа '+query.Fields[0].AsString;
      User:=edit1.Text;
      Password:=edit2.Text;
      query.Free;
      close;
    end
  else
    ShowMessage('Неверный пароль!!!');
end;

procedure TloginForm.Button2Click(Sender: TObject);
begin
 mainForm.setAccess(mainForm.accessLevel, mainForm.purchaseLevel);
 close;
end;

procedure TloginForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  mainForm.setAccess(mainForm.accessLevel, mainForm.purchaseLevel);
  Action:=caFree;
end;

procedure TloginForm.FormCreate(Sender: TObject);
begin
 dm.alexpromCon.ConnectionString:=connStr;
end;

end.

unit U_userMonitor;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, ImgList, StdCtrls, ActnList, Menus, ComCtrls, DB, ADODB,
  Grids, DBGrids, WinProcs, WinTypes, IdContext, IdBaseComponent, IdComponent,
  IdCustomTCPServer, IdTCPServer, IdCmdTCPServer;

type
 monitorThread = class (TThread)
   procedure Execute;override;
end;

type
  TmainForm = class(TForm)
    TrayIcon1: TTrayIcon;
    BalloonHint1: TBalloonHint;
    ImageList1: TImageList;
    PopupMenu1: TPopupMenu;
    ActionList1: TActionList;
    toTray: TAction;
    appRestore: TAction;
    appExit: TAction;
    appRestore1: TMenuItem;
    N1: TMenuItem;
    appExit1: TMenuItem;
    Label1: TLabel;
    dbConn: TADOConnection;
    connQuery: TADOQuery;
    DataSource1: TDataSource;
    connQuerylogin_name: TWideStringField;
    connQueryConnCnt: TIntegerField;
    connQueryhost_name: TWideStringField;
    connQueryclient_net_address: TStringField;
    connQueryclient_interface_name: TWideStringField;
    Button1: TButton;
    DBGrid1: TDBGrid;
    connQueryconnect_time: TDateTimeField;
    procedure FormCreate(Sender: TObject);
    procedure TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure toTrayExecute(Sender: TObject);
    procedure appExitExecute(Sender: TObject);
    procedure appRestoreExecute(Sender: TObject);
  private
    { Private declarations }
    function dbConnected:boolean;
    procedure updateGridData;
    procedure brushDuplicateLogins(Rect:TRect; Column:TColumn);
  public
    { Public declarations }
  end;

var
  mainForm: TmainForm;
  i:longint;
implementation

{$R *.dfm}

procedure monitorThread.Execute;
begin
repeat
  i:=100000;
 while i>0 do
  begin
   i:=i-1;
   Synchronize(mainForm.updateGridData);
  end;
until terminated or not mainForm.dbConnected;
end;

procedure TmainForm.updateGridData;
begin
if i=0 then
 if mainForm.dbConnected then
   begin
    mainform.connQuery.Close;
    mainform.connQuery.Open;
   end
  else
   TrayIcon1.Hint:='Нет соединения с сервером БД.';
end;

function TmainForm.dbConnected:boolean;
begin
if not dbConn.Connected then
 begin
  try
   dbConn.Connected:=true;
  finally
   Result:=dbConn.Connected;
  end;
 end;
end;

procedure TmainForm.brushDuplicateLogins(Rect:TRect; Column:TColumn);
begin

end;

procedure TmainForm.appExitExecute(Sender: TObject);
begin
if MessageDlg('Вы действительно хотите завершить работу программы?', mtConfirmation, [mbOk, mbCancel], 0)=mrOk then
 close;
end;

procedure TmainForm.appRestoreExecute(Sender: TObject);
begin
 Show;
 Application.Restore;
 Application.BringToFront;
end;

procedure TmainForm.FormCreate(Sender: TObject);
var
 monitor:monitorThread;
begin
 TrayIcon1.Visible:=true;
 if mainForm.dbConnected then
   begin
    mainform.connQuery.Close;
    mainform.connQuery.Open;
   end
  else
   TrayIcon1.Hint:='Нет соединения с сервером БД.';
 monitor:=monitorThread.Create(true);
 monitor.FreeOnTerminate:=true;
 monitor.Priority:=tpIdle;
 monitor.Resume;
 Application.Minimize;
 Hide;
end;

procedure TmainForm.toTrayExecute(Sender: TObject);
begin
 Application.Minimize;
 Hide;
 TrayIcon1.BalloonHint:='Приложение свернуто в трей.';
 BalloonHint1.ShowHint;
end;

procedure TmainForm.TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
if dbConnected then
 begin
  if not connQuery.Active then connQuery.Open;
  TrayIcon1.Hint:='Количество подключенных пользователей: '+IntToStr(connQuery.RecordCount);
 end
else
  TrayIcon1.Hint:='Нет соединения с сервером БД.';
end;

end.

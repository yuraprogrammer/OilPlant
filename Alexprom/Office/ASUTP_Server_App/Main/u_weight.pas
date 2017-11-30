unit u_weight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls, ADODB, QCCom32;

type
  TweightApp = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    e_weightDate: TEdit;
    Label3: TLabel;
    e_weightTime: TEdit;
    Label4: TLabel;
    e_weightNumber: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    p_weightCur: TPanel;
    btn_acceptWeight: TButton;
    StatusBar1: TStatusBar;
    weightTimer: TTimer;
    e_autoNumber: TEdit;
    orgComboBox: TComboBoxEx;
    loaderComboBox: TComboBoxEx;
    Timer1: TTimer;
    Com1: T_QCCom32;
    acceptTimer: TTimer;
    procedure acceptTimerTimer(Sender: TObject);
    procedure weightTimerTimer(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    weight:integer;
    procedure showVal;

  end;

var
  weightApp: TweightApp;
  query:TADOQuery;
  i:integer;
  weight:word;
  rcvStr:string[8];
implementation

uses u_selectOrg, u_dm, mainFunctions;

{$R *.dfm}

procedure TweightApp.showVal;
begin
  p_weightCur.Caption:=intToStr(weight);
end;

procedure TweightApp.Timer1Timer(Sender: TObject);
begin
if Com1.Open then
 begin
  Timer1.Enabled:=False;
  weightTimer.Enabled:=True;
 end
else
  ShowMessage('Fuck!!!');
end;

procedure TweightApp.weightTimerTimer(Sender: TObject);
var
 intStr:string[6];
 j:byte;

begin
 rcvStr:=Com1.Read;
 if length(rcvStr)=8 then
   begin
     intStr:='';
     for j := 1 to 7 do
        intStr:=intStr+rcvStr[j];
     try
       weight:=StrToInt(intStr);
     except
       exit;
     end;
     label3.Caption:=rcvStr;
   end;
 Com1.Close;
 weightTimer.Enabled:=False;
 Timer1.Enabled:=True;
 if weight>100 then
   acceptTimer.Enabled:=true;
end;

function newWeightNumber:longint;
var
 query1:TADOQuery;
begin
 query1:=TADOQuery.Create(nil);
 query1.Connection:=dm.alexpromCon;
 query1.SQL.Clear;
 query1.SQL.Add('select max(weightnumber) from weightings');
 query1.Open;
 query1.First;
 newWeightNumber:=query1.Fields[0].AsInteger+1;
 query1.Free;
end;

procedure TweightApp.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action:=caFree;
end;

procedure TweightApp.acceptTimerTimer(Sender: TObject);
begin
//
end;

procedure TweightApp.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
 CanClose:=true;
end;

procedure TweightApp.FormCreate(Sender: TObject);

begin
  i:=0;
  orgComboBox.Clear;
  loaderComboBox.Clear;
  query:=TADOQuery.Create(nil);
  query.Connection:=dm.alexpromCOn;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.organizations order by id');
  query.Open;
  query.First;
  while not query.Eof do
    begin
     orgComboBox.Items.Add(query.FieldValues['name']);
     query.Next;
    end;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.loader order by id');
  query.Open;
  query.First;
  while not query.Eof do
    begin
     loaderComboBox.Items.Add(query.FieldValues['name']);
     query.Next;
    end;
  e_weightNUmber.Text:=IntToStr(newWeightNumber);  
end;

end.

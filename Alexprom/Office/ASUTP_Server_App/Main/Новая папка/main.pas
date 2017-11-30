unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, StdActns, ExtCtrls, ToolWin, ComCtrls, ADODB,
  OleCtrls, SHDocVw, RpDefine, RpRender, RpRenderHTML, HTTPApp, HTTPProd,
  StdCtrls, ActnMan, ActnCtrls, ActnMenus, RibbonActnMenus,
  RibbonLunaStyleActnCtrls, Ribbon, RibbonObsidianStyleActnCtrls,
  RibbonSilverStyleActnCtrls, ImgList, PlatformDefaultStyleActnCtrls, ActnPopup,
  Buttons, ScreenTips, jpeg, DB, RpBase, RpSystem, RpCon, RpConDS, RpRave;

type
  TfrmZayView = class(TForm)
    Label1: TLabel;
    ListView1: TListView;
    RvProject1: TRvProject;
    RvDataSetConnection2: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    ADOQuery1: TADOQuery;
    Button1: TButton;
    Label4: TLabel;
    Button3: TButton;
    Button4: TButton;
    Timer1: TTimer;

    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure calendarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);

  private
    { Private declarations }
    procedure InitFrm(Date:TDAte);
  public
    { Public declarations }
  end;

var
  frmZayView: TfrmZayView;
  query,qqq:TADOQuery;
   y,m,d:word;
   li:TListItem;
   Reg,p_key:integer;

implementation

uses u_dm;

{$R *.dfm}

procedure TfrmZayView.InitFrm(Date: TDate);
var

  date_str:string[10];
  dstr, mstr, ystr:string;
  i:byte;
begin
    ListView1.Items.Clear;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.zay where Data=:a and sost<3');
  query.Parameters[0].Value:=datetostr(date);
  query.Open;
    while not query.Eof do
      begin
        li:=ListView1.Items.Add;
        li.Caption:=query.FieldValues['nomerzay'];
        li.SubItems.Add(query.FieldValues['kontr']);
        li.SubItems.Add(query.FieldValues['tmc']);
        li.SubItems.Add(inttostr(query.FieldValues['kol'])+' '+query.FieldValues['m_kol']);
        li.SubItems.Add(query.FieldValues['n_trans']);
        li.SubItems.Add(query.FieldValues['komuDov']);
        li.SubItems.Add(query.FieldValues['in_time']);
        li.SubItems.Add(query.FieldValues['out_time']);

        query.Next;
        end;
 end;

procedure TfrmZayView.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if Selected then
 begin
  p_key:=StrToInt(Item.Caption);
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.zay where nomerzay=:wn');
  query.Parameters[0].Value:=p_key;
  query.Open;
  query.First;
  case query.FieldValues['sost'] of
  0:begin
      Button3.Enabled:=true;
      Button1.Enabled:=false;
      Button4.Enabled:=false;
  end;
  1:begin
      Button1.Enabled:=true;
      Button3.Enabled:=false;
      Button4.Enabled:=false;
  end;
  2:begin
      Button4.Enabled:=true;
      Button1.Enabled:=false;
      Button3.Enabled:=false;
  end;
  end;
 end;
 end;


procedure TfrmZayView.Button1Click(Sender: TObject);
begin
   query.SQL.Clear;
  query.SQL.Add('update dbo.zay set sost=:@sost, in_time=:@int where nomerzay=:id');
  query.Parameters[0].Value:=2;
  query.Parameters[1].Value:=timetostr(now);
  query.Parameters[2].Value:=p_key;
  query.ExecSQL;
InitFrm(now);
end;

procedure TfrmZayView.Button3Click(Sender: TObject);
begin
   query.SQL.Clear;
  query.SQL.Add('update dbo.zay set sost=:@sost where nomerzay=:id');
  query.Parameters[0].Value:=1;
  query.Parameters[1].Value:=p_key;
  query.ExecSQL;
  InitFrm(now);
end;

procedure TfrmZayView.Button4Click(Sender: TObject);

begin
  query.SQL.Clear;
  query.SQL.Add('update dbo.zay set sost=:@sost, out_time=:@out where nomerzay=:id');
  query.Parameters[0].Value:=3;
  query.Parameters[1].Value:=timetostr(now);
  query.Parameters[2].Value:=p_key;
  query.ExecSQL;
  InitFrm(now);
end;

procedure TfrmZayView.calendarChange(Sender: TObject);
begin
    InitFrm(now);
end;

procedure TfrmZayView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  query.Free;
  qqq.Free
end;

procedure TfrmZayView.FormCreate(Sender: TObject);

begin

 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
  //calendar.Date:=now;
 //decodedate(calendar.Date, y, m, d);


  InitFrm(now);
end;
  end.

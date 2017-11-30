unit U_frmResolveTransfers;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, mainfunctions;

type
  TfrmResolveTransfers = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Button1: TButton;
    Button2: TButton;
    GroupBox2: TGroupBox;
    ProgressBar1: TProgressBar;
    Label3: TLabel;
    Label4: TLabel;
    ProgressBar2: TProgressBar;
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmResolveTransfers: TfrmResolveTransfers;
  query:TADOQuery;
  y,m,d:word;
implementation

uses u_dm;

{$R *.dfm}

procedure TfrmResolveTransfers.Button1Click(Sender: TObject);
VAR
 i:byte;
 d_str, m_str, y_str, date_str:string;
 q_ins:TADOQuery;
begin
if MessageDlg('Программа некоторое время будет не доступна. Продолжить?', mtConfirmation, [mbOk, mbCancel], 0)=mrOk then
try
 q_ins:=TADOQuery.Create(nil);
 q_ins.Connection:=dm.alexpromCon;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from transfer_report where transfer_date=:td');
 for i := 1 to day_in_month(m-1, y) do
  begin
   d_str:=IntToStr(i);
   if length(d_str)<>2 then
    d_str:='0'+d_str;
   m_str:=IntToStr(ComboBox1.ItemIndex+1);
   if length(m_str)<>2 then
    m_str:='0'+m_str;
   y_str:=ComboBox2.Text;
   date_str:=d_str+'.'+m_str+'.'+y_str;
   query.Parameters[0].Value:=date_str;
   query.Open;
   query.First;
  end;
except

end;
end;

procedure TfrmResolveTransfers.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TfrmResolveTransfers.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure TfrmResolveTransfers.FormCreate(Sender: TObject);
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 DecodeDate(now, y,m,d);
 ComboBox1.ItemIndex:=m-1;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select yearNode from dbo.nodes group by yearNode');
 query.Open;
 query.First;
 ComboBox2.Clear;
 while not query.Eof do
  begin
   ComboBox2.Items.Add(query.Fields[0].asstring);
   query.Next
  end;
 ComboBox2.Text:=IntToStr(y);
end;

end.

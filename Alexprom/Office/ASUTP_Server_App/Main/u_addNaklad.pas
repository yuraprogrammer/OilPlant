unit u_addNaklad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ComCtrls, ADODB, DB;

type
  TfrmAddNaklad = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    Edit2: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label6: TLabel;
    MaskEdit3: TMaskEdit;
    Label7: TLabel;
    MaskEdit4: TMaskEdit;
    Label8: TLabel;
    Label9: TLabel;
    MaskEdit5: TMaskEdit;
    Label10: TLabel;
    truckView: TListView;
    saveNaklad: TButton;
    Button3: TButton;
    MaskEdit6: TMaskEdit;
    ADOStoredProc1: TADOStoredProc;
    Label11: TLabel;
    Label12: TLabel;
    calendar: TDateTimePicker;
    Label13: TLabel;
    Edit3: TEdit;
    MaskEdit7: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure truckViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure saveNakladClick(Sender: TObject);
  private
    { Private declarations }
    procedure frmInit;
    procedure saveNakladData;
  public
    { Public declarations }
  end;

var
  frmAddNaklad: TfrmAddNaklad;
  query: TADOQuery;
  p_key:longint;

implementation

uses u_dm;

{$R *.dfm}

procedure TfrmAddNaklad.frmInit;
var
  li:TListItem;
begin
 calendar.Date:=now;
 truckView.Clear;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.PresentTrucks where naklad_id = -1');
 query.Open;
 query.First;
 while not query.Eof do
  begin
    li:=truckView.Items.Add;
    li.Caption:=query.FieldValues['weightingNumber'];
    li.subItems.Add(query.FieldValues['weighting_1']);
    li.subItems.Add(query.FieldValues['org_name']);
    query.Next;
  end;
 Edit1.Text:='';
 Edit2.Text:='';
 MaskEdit1.Text:='';
 MaskEdit2.Text:='';
 MaskEdit3.Text:='';
 MaskEdit4.Text:='';
 MaskEdit5.Text:='';
 MaskEdit6.Text:='';
end;

procedure TfrmAddNaklad.saveNakladData;
var
 nakladDate:string[10];
 i:byte;
begin
  adoStoredProc1.Connection:=dm.alexpromCon;
  adoStoredProc1.Parameters[1].Value:=Edit1.Text;
  adoStoredProc1.Parameters[2].Value:=MaskEdit1.Text;
  adoStoredProc1.Parameters[3].Value:=MaskEdit2.Text;
  adoStoredProc1.Parameters[4].Value:=MaskEdit3.Text;
  adoStoredProc1.Parameters[5].Value:=MaskEdit4.Text;
  adoStoredProc1.Parameters[6].Value:=MaskEdit5.Text;
  adoStoredProc1.Parameters[7].Value:=p_key;
  adoStoredProc1.Parameters[8].Value:=Edit2.Text;
  adoStoredProc1.Parameters[9].Value:=StrToInt(MaskEdit7.Text);
  nakladDate:=DateToStr(calendar.Date);
  for i := 0 to length(nakladDate) - 1 do
    if nakladDate[i]='/' then
      nakladDate[i]:='.';
  adoStoredProc1.Parameters[10].Value:=nakladDate;
  adoStoredProc1.Parameters[11].Value:=Edit3.Text;
  adoStoredProc1.ExecProc;
end;

procedure TfrmAddNaklad.saveNakladClick(Sender: TObject);
begin
if not dm.alexpromCon.Connected then
  begin
    try
      dm.alexpromCon.Connected:=true;
      saveNakladData;
      saveNaklad.Enabled:=False;
      frmInit;
    except
      ShowMessage('Нет соединения с сервером базы данных!!! Обратитесь к администратору и повторите попытку позже.');
    end;
  end
else
 saveNakladData;
 saveNaklad.Enabled:=False;
 frmInit;
end;

procedure TfrmAddNaklad.Button3Click(Sender: TObject);
begin
 close;
end;

procedure TfrmAddNaklad.FormCreate(Sender: TObject);
begin
if not dm.alexpromCon.Connected then
  begin
    try
      dm.alexpromCon.Connected:=True;
      frmInit;
    except
      ShowMessage('Нет соединения с сервером базы данных!!! Обратитесь к администратору и повторите попытку позже.');
    end;
  end
else
  query:=TADOQuery.Create(nil);
  query.Connection:=dm.alexpromCon;
  frmInit;
end;

procedure TfrmAddNaklad.truckViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if Selected then
  begin
    saveNaklad.Enabled:=True;
    p_key:=StrToInt(Item.Caption);
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select truckCode from dbo.trucks where weightingNumber=:wn');
    query.Parameters[0].Value:=p_key;
    query.Open;
    MaskEdit6.Text:=query.fields[0].Value;
  end;
end;

end.

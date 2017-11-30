unit u_showNaklad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ADODB, Menus;

type
  TfrmShowNaklad = class(TForm)
    calendar: TDateTimePicker;
    nakladView: TListView;
    PopupMenu1: TPopupMenu;
    editCurrentNaklad: TMenuItem;
    deleteCurrentNaklad: TMenuItem;
    showCurrentNaklad: TMenuItem;
    printList: TMenuItem;
    previewList: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure calendarChange(Sender: TObject);
    procedure nakladViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initFrm;
  end;

var
  frmShowNaklad: TfrmShowNaklad;
  query: TADOQuery;
  p_key, f_key, t_key:string;
implementation

uses u_dm;

{$R *.dfm}

procedure TfrmShowNaklad.initFrm;
var
  li:TListItem;
  i:byte;
  date_str:string[10];
begin
  nakladView.Clear;
  query.Close;
  query.SQL.Add('select * from dbo.allNaklad where naklad_date=:in_date');
  date_str:=DateToStr(calendar.date);
  for I := 0 to length(date_str) - 1 do
   if date_str[i]='/' then
      date_str[i]:='.';
  if length(date_str)<>10 then
    query.Parameters[0].Value:='0'+date_str
  else
    query.Parameters[0].Value:=date_str;
  query.Open;
  query.First;
  while not query.Eof do
    begin
      li:=nakladView.Items.Add;
      li.Caption:=query.fieldvalues['naklad_num'];
      li.SubItems.Add(query.fieldvalues['org_name']);
      li.SubItems.Add(query.fieldvalues['mat_name']);
      li.SubItems.Add(query.fieldvalues['truckCode']);
      li.SubItems.Add(query.fieldvalues['in_Time']);
      li.SubItems.Add(query.fieldvalues['truckNumber']);
      li.SubItems.Add(query.fieldvalues['driverFIO']);
      li.SubItems.Add(query.fieldvalues['matLevel']);
      li.SubItems.Add(query.fieldvalues['Plotnost']);
      li.SubItems.Add(query.fieldvalues['Temperature']);
      li.SubItems.Add(query.fieldvalues['waterLevel_mm']);
      li.SubItems.Add(query.fieldvalues['waterLevel_kg']);
      li.SubItems.Add(query.fieldvalues['weight']);
      query.next;
    end;
end;

procedure TfrmShowNaklad.nakladViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if Selected then
  begin
    editCurrentNaklad.Enabled:=true;
    deleteCurrentNaklad.Enabled:=true;
    showCurrentNaklad.Enabled:=true;
    p_key:=Item.Caption;
    f_key:=Item.SubItems.Values['in_time'];
    t_key:=DateToStr(calendar.Date);
  end
else
  begin
    editCurrentNaklad.Enabled:=false;
    deleteCurrentNaklad.Enabled:=false;
    showCurrentNaklad.Enabled:=false;
    p_key:='';
    f_key:='';
    t_key:='';
  end;
end;

procedure TfrmShowNaklad.calendarChange(Sender: TObject);
begin
  initFrm;
end;

procedure TfrmShowNaklad.FormCreate(Sender: TObject);
begin
calendar.date:=now;
query:=TADOQuery.Create(nil);
if not dm.alexpromCon.Connected then
  begin
    try
      dm.alexpromCon.Connected:=true;
      query.Connection:=dm.alexpromCon;
      initFrm;
    except
      ShowMessage('Нет соединения с сервером базы данных!!! Обратитесь к администратору и повторите попытку позже.');
    end;
  end
else
  begin
    query.Connection:=dm.alexpromCon;
    initFrm;
  end;
end;

end.

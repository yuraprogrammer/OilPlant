unit U_newInventory;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, adodb, ExtCtrls;

type
  TnewInventory = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    monthbox: TComboBox;
    Label2: TLabel;
    yearbox: TComboBox;
    ListView1: TListView;
    Label3: TLabel;
    calendar: TDateTimePicker;
    TimePicker: TDateTimePicker;
    Label4: TLabel;
    RadioGroup1: TRadioGroup;
    procedure yearboxChange(Sender: TObject);
    procedure monthboxChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView1DblClick(Sender: TObject);
    procedure calendarChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
   p_key:byte;
   data_on:boolean;
   invMonth, invYear:word;
   invDate:string[10];
   invTime:string[8];
   procedure initfrm;
  end;

var
  newInventory: TnewInventory;
  query: tadoquery;
  y,m,d:word;

implementation

uses u_dm, U_invLevel;

{$R *.dfm}

procedure tnewinventory.initfrm;
var
 li:tlistitem;
 qry:tadoquery;
begin
try
 qry:=tadoquery.Create(nil);
 qry.Connection:=dm.alexpromCon;
 qry.Close;
 qry.SQL.Clear;
 qry.SQL.Add('select * from dbo.inventory where inv_month=:im and inv_year=:iy order by tank_id');
 qry.Parameters[0].Value:=invMonth;
 qry.Parameters[1].Value:=invYear;
 qry.Open;
 if qry.recordcount=0 then
   begin
    if messagedlg('подтвердите начало нового месяца.', mtconfirmation, [mbok, mbcancel], 0)=mrok then
      begin
       query.Close;
       query.SQL.Clear;
       query.SQL.Add('select * from dbo.inventory where inv_month=:im and inv_year=:iy order by tank_id');
       if (invMonth-1)<>0 then
        begin
         query.Parameters[0].Value:=invMonth-1;
         query.Parameters[1].Value:=invYear;
        end
       else
        begin
         query.Parameters[0].Value:=12;
         query.Parameters[1].Value:=invYear-1;
        end;
       query.Open;
       query.First;
       qry.Close;
       qry.SQL.Clear;
       qry.SQL.Add('insert into dbo.inventory (inv_month, inv_year, tank_id, ');
       qry.SQL.Add('start_level, end_level, start_volume, end_volume, ');
       qry.SQL.Add('start_kg, end_kg, start_plotn, end_plotn) values (:inv_month, :inv_year, :tank_id, ');
       qry.SQL.Add(':start_level, :end_level, :start_volume, :end_volume, ');
       qry.SQL.Add(':start_kg, :end_kg, :start_plotn, :end_plotn)');
       while not query.Eof do
        begin
         qry.Parameters[0].Value:=invMonth;
         qry.Parameters[1].Value:=invYear;
         qry.Parameters[2].Value:=query.Fieldbyname('tank_id').Asinteger;
         qry.Parameters[3].Value:=query.Fieldbyname('end_level').Asinteger;
         qry.Parameters[4].Value:=query.Fieldbyname('end_level').Asinteger;
         qry.Parameters[5].Value:=query.Fieldbyname('end_volume').Asinteger;
         qry.Parameters[6].Value:=query.Fieldbyname('end_volume').Asinteger;
         qry.Parameters[7].Value:=query.Fieldbyname('end_kg').Asinteger;
         qry.Parameters[8].Value:=query.Fieldbyname('end_kg').Asinteger;
         qry.ExecSQL;
         query.Next;
        end;
       qry.Free;
      end;
   end;

 listview1.Clear;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.inventory_report where inv_month=:im and inv_year=:iy order by tank_id');
 query.Parameters[0].Value:=invMonth;
 query.Parameters[1].Value:=invYear;
 query.Open;
 query.First;
 while not query.Eof do
  begin
   li:=listview1.Items.Add;
   li.Caption:=query.Fieldbyname('Tank_Name').AsString;
   li.SubItems.Add(query.Fieldbyname('start_level').AsString);
   li.SubItems.Add(query.Fieldbyname('start_volume').AsString);
   li.SubItems.Add(query.Fieldbyname('start_plotn').AsString);
   li.SubItems.Add(query.Fieldbyname('Start_kg').AsString);
   li.SubItems.Add(query.Fieldbyname('end_level').AsString);
   li.SubItems.Add(query.Fieldbyname('end_volume').AsString);
   li.SubItems.Add(query.Fieldbyname('end_plotn').AsString);
   li.SubItems.Add(query.Fieldbyname('end_kg').AsString);
   query.Next;
  end;
 except
 exit
end;
end;

procedure TnewInventory.ListView1DblClick(Sender: TObject);
begin
 Application.CreateForm(TfrmInvLevel, frmInvLevel);
 frmInvLevel.showModal;
end;

procedure TnewInventory.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if selected then
 begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select tank_id from dbo.tank_dic where tank_name=:tn');
  query.Parameters[0].Value:=Item.Caption;
  query.Open;
  query.First;
  p_key:=query.Fields[0].AsInteger;
 end
else
 p_key:=255;
end;

procedure TnewInventory.monthboxChange(Sender: TObject);
begin
 invMonth:=monthBox.ItemIndex+1;
 invYear:=StrToInt(yearBox.Text);
 initfrm;
end;

procedure TnewInventory.RadioGroup1Click(Sender: TObject);
begin
 if RadioGroup1.ItemIndex=0 then
  data_on:=false
 else
  data_on:=true;
end;

procedure TnewInventory.yearboxChange(Sender: TObject);
begin
 invMonth:=monthBox.ItemIndex+1;
 invYear:=StrToInt(yearBox.Text);
 initfrm;
end;

procedure TnewInventory.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TnewInventory.calendarChange(Sender: TObject);
begin
 invDate:=DatetoStr(calendar.Date);
 if length(invDate)<>10 then
  invDate:='0'+invDate;
end;

procedure TnewInventory.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=cafree;
end;

procedure TnewInventory.FormCreate(Sender: TObject);

begin
  query:=tadoquery.Create(nil);
  query.Connection:=dm.alexpromcon;
  yearbox.Clear;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select yearNode from dbo.Nodes group by yearNode');
  query.Open;
  query.First;
  while not query.Eof do
   begin
    yearBox.Items.Add(IntToStr(query.Fields[0].asInteger));
    query.Next;
   end;
  decodedate(now, y,m,d);
  monthbox.ItemIndex:=m-1;
  yearbox.itemindex:=yearbox.Items.Count-1;
  invMonth:=m;
  invYear:=y;
  invDate:=DateToStr(calendar.Date);
  if length(invDate)<>10 then
   invDate:='0'+invDate;
  invTime:=TimeToStr(TimePicker.Time);
  if length(invTime)<>8 then
   invTime:='0'+invTime;
  initfrm;
end;

end.

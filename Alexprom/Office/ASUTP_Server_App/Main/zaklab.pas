unit zaklab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, RpDefine, RpRave, RpRender, RpRenderHTML,
  RpCon, RpConDS, DB, RpBase, RpSystem,U_dm, ExtCtrls, mainfunctions, main, IniFiles;

type
  Tfrmzaklab = class(TForm)
    calendar: TDateTimePicker;
    Label1: TLabel;
    ListView1: TListView;
    RvProject1: TRvProject;
    RvDataSetConnection2: TRvDataSetConnection;
    RvSystem1: TRvSystem;
    Label2: TLabel;
    monthBox: TComboBox;
    Label3: TLabel;
    YearBox: TComboBox;
    ADOQuery1: TADOQuery;
    Timer1: TTimer;
    Button1: TButton;
    procedure MonthBoxChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
    procedure calendarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);

  private
    { Private declarations }
    procedure InitFrm(Date:TDAte);
  public
    { Public declarations }
  end;

var
  frmzaklab: Tfrmzaklab;
  query,qqq:TADOQuery;
   y,m,d:word;
   li:TListItem;
   Reg,p_key:integer;
   Ini:TIniFile;

implementation

uses razgonka;

{$R *.dfm}

procedure Tfrmzaklab.Timer1Timer(Sender: TObject);
begin
  InitFrm(calendar.Date);
end;

procedure Tfrmzaklab.InitFrm(Date: TDate);
var

  date_str:string[10];
  dstr, mstr, ystr:string;
  i:byte;
begin
 case Reg of
 0:begin
   ListView1.Items.Clear;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.zakup where Data=:a order by nomer');
  query.Parameters[0].Value:=datetostr(date);
  query.Open;
    while not query.Eof do
      begin
        li:=ListView1.Items.Add;
        li.Caption:=query.FieldValues['nomer'];
        li.SubItems.Add(query.FieldValues['tmc']);
        li.SubItems.Add(query.FieldValues['kol']);
        li.SubItems.Add(query.FieldValues['transport']);
        li.SubItems.Add(query.FieldValues['remark']);
        query.Next;
        end;
 end;

 1:begin
 ListView1.Items.Clear;
 for I := 2 to day_in_month(MonthBox.ItemIndex, strtoint(yearBox.Items.Strings[yearBox.ItemIndex])) do
     begin
      if length(IntToStr(i))=1 then
        dstr:='0'+IntToStr(i)
      else
        dstr:=IntToStr(i);
      if length(IntToStr(MonthBox.ItemIndex+1))=1 then
        mstr:='0'+IntToStr(MonthBox.ItemIndex+1)
      else
        mstr:=IntToStr(MonthBox.ItemIndex+1);
      ystr:=yearBox.Items.Strings[yearBox.ItemIndex];
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('select * from dbo.zakup where Data=:a order by nomer');
      query.Parameters[0].Value:=dstr+'.'+mstr+'.'+ystr;
        query.Open;
    while not query.Eof do
      begin
        li:=ListView1.Items.Add;
        li.Caption:=query.FieldValues['nomer'];
        li.SubItems.Add(query.FieldValues['tmc']);
        li.SubItems.Add(query.FieldValues['kol']);
        li.SubItems.Add(query.FieldValues['transport']);
        li.SubItems.Add(query.FieldValues['remark']);
        query.Next;
      end;
  end;

end;

end;

end;


procedure Tfrmzaklab.monthBoxChange(Sender: TObject);
begin
  Reg:=1;
  InitFrm(calendar.Date);
end;

procedure TfrmZaklab.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if Selected then
 begin
  p_key:=StrToInt(Item.Caption);
  Button1.enabled:=true;
 end
 else Button1.Enabled:=false;
end;

procedure Tfrmzaklab.Button1Click(Sender: TObject);
begin
  ZayNumber:=p_key;
  Application.CreateForm(TRazg, Razg);
  Razg.ShowModal;
  InitFrm(calendar.Date);
end;

procedure Tfrmzaklab.calendarChange(Sender: TObject);
begin
  Reg:=0;
  InitFrm(calendar.Date);
end;

procedure Tfrmzaklab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  Timer1.Enabled:=false;
  Ini := TIniFile.Create(ExtractFilePath(Application.Exename) + 'Test.ini');
   Ini.WriteString('Form info4','zaklab','zaklab');
   Ini.WriteInteger('Form info4','Width1',ListView1.Column[1].Width);
   Ini.WriteInteger('Form info4','Width2',ListView1.Column[2].Width);
   Ini.WriteInteger('Form info4','Width3',ListView1.Column[3].Width);
   Ini.WriteInteger('Form info4','Width4',ListView1.Column[4].Width);
   Ini.Free;
  query.Free;
  qqq.Free;
  mainform.WindowState:=wsnormal;
end;

procedure Tfrmzaklab.FormCreate(Sender: TObject);

begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 Ini := TIniFile.Create(ExtractFilePath(Application.Exename) + 'Test.ini');
 ListView1.Column[1].Width:=Ini.ReadInteger('Form info4','Width1',85);
 ListView1.Column[2].Width:=Ini.ReadInteger('Form info4','Width2',80);
 ListView1.Column[3].Width:=Ini.ReadInteger('Form info4','Width3',200);
 ListView1.Column[4].Width:=Ini.ReadInteger('Form info4','Width4',400);
 Ini.Free;
 Reg:=0;
 calendar.Date:=now;
 decodedate(calendar.Date, y, m, d);
 monthbox.ItemIndex:=m-1;
 yearbox.ItemIndex:=0;
 Timer1.Enabled:=true;
 InitFrm(calendar.Date);
end;
  end.

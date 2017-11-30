unit zlab;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, RpDefine, RpRave, RpRender, RpRenderHTML,
  RpCon, RpConDS, DB, RpBase, RpSystem,U_dm, ExtCtrls, mainfunctions, main, IniFiles;

type
  Tfrmzlab = class(TForm)
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
    procedure MonthBoxChange(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

    procedure FormClose(Sender: TObject; var Action: TCloseAction);

    procedure calendarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
    procedure InitFrm(Date:TDAte);
  public
    { Public declarations }
  end;

var
  frmzlab: Tfrmzlab;
  query,qqq:TADOQuery;
   y,m,d:word;
   li:TListItem;
   Reg,p_key:integer;
   Ini:TIniFile;

implementation

uses updateZay;

{$R *.dfm}

procedure Tfrmzlab.Timer1Timer(Sender: TObject);
begin
  InitFrm(calendar.Date);
end;

procedure Tfrmzlab.InitFrm(Date: TDate);
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
  query.SQL.Add('select * from dbo.zay where Data=:a and sost<5 order by nomerzay');
  query.Parameters[0].Value:=datetostr(date);
  query.Open;
    while not query.Eof do
      begin
        li:=ListView1.Items.Add;
        li.Caption:=query.FieldValues['nomerzay'];
        li.SubItems.Add(query.FieldValues['data']);
        li.SubItems.Add(query.FieldValues['kontr']);
        li.SubItems.Add(query.FieldValues['tmc']);
        li.SubItems.Add(inttostr(query.FieldValues['kol'])+' '+query.FieldValues['m_kol']);
        case query.FieldValues['sost'] of
        0: li.SubItems.Add('ожидается');
        1: li.SubItems.Add('прибыла');
        2: li.SubItems.Add('грузится');
        3: li.SubItems.Add('выехала');
        end;
        li.SubItems.Add(query.FieldValues['remark_lab']);
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
      query.SQL.Add('select * from dbo.zay where Data=:a and sost<5 order by nomerzay');
      query.Parameters[0].Value:=dstr+'.'+mstr+'.'+ystr;
        query.Open;
    while not query.Eof do
      begin
        li:=ListView1.Items.Add;
        li.Caption:=query.FieldValues['nomerzay'];
        li.SubItems.Add(query.FieldValues['data']);
        li.SubItems.Add(query.FieldValues['kontr']);
        li.SubItems.Add(query.FieldValues['tmc']);
        li.SubItems.Add(inttostr(query.FieldValues['kol'])+' '+query.FieldValues['m_kol']);
        case query.FieldValues['sost'] of
        0: li.SubItems.Add('ожидается');
        1: li.SubItems.Add('прибыла');
        2: li.SubItems.Add('грузится');
        3: li.SubItems.Add('выехала');
        end;
        li.SubItems.Add(query.FieldValues['remark_lab']);
        query.Next;
      end;
  end;

end;

end;

end;


procedure Tfrmzlab.monthBoxChange(Sender: TObject);
begin
  Reg:=1;
  InitFrm(calendar.Date);
end;

procedure Tfrmzlab.calendarChange(Sender: TObject);
begin
  Reg:=0;
  InitFrm(calendar.Date);
end;

procedure Tfrmzlab.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action:=caFree;
  Timer1.Enabled:=false;
  Ini := TIniFile.Create(ExtractFilePath(Application.Exename) + 'Test.ini');
   Ini.WriteString('Form info3','zlab','zlab');
   Ini.WriteInteger('Form info3','Width1',ListView1.Column[0].Width);
   Ini.WriteInteger('Form info3','Width2',ListView1.Column[1].Width);
   Ini.WriteInteger('Form info3','Width3',ListView1.Column[2].Width);
   Ini.WriteInteger('Form info3','Width4',ListView1.Column[3].Width);
   Ini.WriteInteger('Form info3','Width5',ListView1.Column[4].Width);
   Ini.WriteInteger('Form info3','Width6',ListView1.Column[5].Width);
   Ini.WriteInteger('Form info3','Width7',ListView1.Column[6].Width);
   Ini.Free;
  query.Free;
  qqq.Free;
  mainform.WindowState:=wsnormal;
end;

procedure Tfrmzlab.FormCreate(Sender: TObject);

begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 Ini := TIniFile.Create(ExtractFilePath(Application.Exename) + 'Test.ini');
 ListView1.Column[0].Width:=Ini.ReadInteger('Form info3','Width1',100);
 ListView1.Column[1].Width:=Ini.ReadInteger('Form info3','Width2',100);
 ListView1.Column[2].Width:=Ini.ReadInteger('Form info3','Width3',100);
 ListView1.Column[3].Width:=Ini.ReadInteger('Form info3','Width4',100);
 ListView1.Column[4].Width:=Ini.ReadInteger('Form info3','Width5',100);
 ListView1.Column[5].Width:=Ini.ReadInteger('Form info3','Width6',100);
 ListView1.Column[6].Width:=Ini.ReadInteger('Form info3','Width7',100);
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

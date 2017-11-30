unit zak_view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, RpDefine, RpRave, RpRender, RpRenderHTML,
  RpCon, RpConDS, DB, RpBase, RpSystem,U_dm, ExtCtrls, mainfunctions, main, IniFiles;

type
  TfrmZakView = class(TForm)
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
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Timer1: TTimer;
    Button5: TButton;
    procedure MonthBoxChange(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure calendarChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);

    procedure ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
     procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
    procedure InitFrm(Date:TDAte);
  public
    { Public declarations }
  end;

var
  frmZakView: TfrmZakView;
  query,qqq,query_s:TADOQuery;
   y,m,d:word;
   li:TListItem;
   Reg,p_key:integer;
   Ini:TIniFile;


implementation

uses updateZay, viewZak, Razgonka;

{$R *.dfm}


procedure TfrmZakView.Timer1Timer(Sender: TObject);
begin
   if not dm.alexpromCon.Connected then
  begin
     try
       dm.alexpromCon.Connected:=true;
       InitFrm(calendar.Date);
      except
        ShowMessage('Нет соединения с сервером базы данных!!! Обратитесь к администратору и повторите попытку позже.');
      end;
  end
else
  InitFrm(calendar.Date);

end;

procedure TfrmZakView.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
   with ListView1.Canvas.Brush do
   begin

         if Item.SubItems.Strings[18]='True' then Color := clGreen;

      end;
   end;


procedure TfrmZakView.InitFrm(Date: TDate);
var

  date_str:string[10];
  dstr, mstr, ystr:string;
  i:byte;
begin
//if Wrong then Timer1.Enabled:=false else Timer1.Enabled:=true;

 Button2.Enabled:=false;
 Button1.Enabled:=false;
 Button4.Enabled:=false;
 Button5.Enabled:=false;
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
        li.SubItems.Add(query.FieldValues['data']);
        li.SubItems.Add(query.FieldValues['time']);
        li.SubItems.Add(query.FieldValues['kontr']);
         li.SubItems.Add(query.FieldValues['tmc']);
        li.SubItems.Add(inttostr(query.FieldValues['kol']));
        li.SubItems.Add(query.FieldValues['transport']);
        li.SubItems.Add(query.FieldValues['in_date']);
        li.SubItems.Add(query.FieldValues['in_time']);
        li.SubItems.Add(query.FieldValues['remark']);
        li.SubItems.Add(query.FieldValues['fakt']);
        li.SubItems.Add(query.FieldValues['plotn']);
        li.SubItems.Add(query.FieldValues['temp']);
        li.SubItems.Add(query.FieldValues['netto']);
        li.SubItems.Add(query.FieldValues['npk']);
        if query.FieldValues['summ']=trunc(query.FieldValues['summ']) then li.SubItems.Add(floattostr(query.FieldValues['summ'])+',00') else if query.FieldValues['summ']*10=trunc(query.FieldValues['summ']*10) then li.SubItems.Add(floattostr(query.FieldValues['summ'])+'0') else li.SubItems.Add(floattostr(query.FieldValues['summ']));
        if query.FieldValues['cena']=trunc(query.FieldValues['cena']) then li.SubItems.Add(floattostr(query.FieldValues['cena'])+',00') else if query.FieldValues['cena']*10=trunc(query.FieldValues['cena']*10) then li.SubItems.Add(floattostr(query.FieldValues['cena'])+'0') else li.SubItems.Add(floattostr(query.FieldValues['cena']));
        li.SubItems.Add(query.FieldValues['nedostacha']);
        if query.FieldValues['nnt']=trunc(query.FieldValues['nnt']) then li.SubItems.Add(floattostr(query.FieldValues['nnt'])+',00') else if query.FieldValues['nnt']*10=trunc(query.FieldValues['nnt']*10) then li.SubItems.Add(floattostr(query.FieldValues['nnt'])+'0') else li.SubItems.Add(floattostr(query.FieldValues['nnt']));
        li.SubItems.Add(query.FieldValues['razg']);
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
        li.SubItems.Add(query.FieldValues['data']);
        li.SubItems.Add(query.FieldValues['time']);
        li.SubItems.Add(query.FieldValues['kontr']);
         li.SubItems.Add(query.FieldValues['tmc']);
        li.SubItems.Add(inttostr(query.FieldValues['kol']));
        li.SubItems.Add(query.FieldValues['transport']);
        li.SubItems.Add(query.FieldValues['in_date']);
        li.SubItems.Add(query.FieldValues['in_time']);
        li.SubItems.Add(query.FieldValues['remark']);
        li.SubItems.Add(query.FieldValues['fakt']);
        li.SubItems.Add(query.FieldValues['plotn']);
        li.SubItems.Add(query.FieldValues['temp']);
        li.SubItems.Add(query.FieldValues['netto']);
        li.SubItems.Add(query.FieldValues['npk']);
        if query.FieldValues['summ']=trunc(query.FieldValues['summ']) then li.SubItems.Add(floattostr(query.FieldValues['summ'])+',00') else if query.FieldValues['summ']*10=trunc(query.FieldValues['summ']*10) then li.SubItems.Add(floattostr(query.FieldValues['summ'])+'0') else li.SubItems.Add(floattostr(query.FieldValues['summ']));
        if query.FieldValues['cena']=trunc(query.FieldValues['cena']) then li.SubItems.Add(floattostr(query.FieldValues['cena'])+',00') else if query.FieldValues['cena']*10=trunc(query.FieldValues['cena']*10) then li.SubItems.Add(floattostr(query.FieldValues['cena'])+'0') else li.SubItems.Add(floattostr(query.FieldValues['cena']));
        li.SubItems.Add(query.FieldValues['nedostacha']);
        if query.FieldValues['nnt']=trunc(query.FieldValues['nnt']) then li.SubItems.Add(floattostr(query.FieldValues['nnt'])+',00') else if query.FieldValues['nnt']*10=trunc(query.FieldValues['nnt']*10) then li.SubItems.Add(floattostr(query.FieldValues['nnt'])+'0') else li.SubItems.Add(floattostr(query.FieldValues['nnt']));
        li.SubItems.Add(query.FieldValues['razg']);
        query.Next;
      end;
  end;

end;

end;

end;


procedure TfrmZakView.monthBoxChange(Sender: TObject);
begin
  Reg:=1;
  InitFrm(calendar.Date);
end;



procedure TfrmZakView.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if Selected then
 begin
  p_key:=StrToInt(Item.Caption);
  Button1.Enabled:=true;
  if mainForm.accessLevel=6 then begin Button2.Enabled:=true; Button4.Enabled:=true; end else begin Button2.Enabled:=false; Button4.Enabled:=false; end;

  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.zakup where nomer=:wn');
  query.Parameters[0].Value:=p_key;
  query.Open;
  query.First;
    if query.FieldValues['razg']<>0 then
      Button5.Enabled:=true else Button5.Enabled:=false;
 end;
 end;


procedure TfrmZakView.Button1Click(Sender: TObject);
begin
ZayNumber:=p_key;
Application.CreateForm(TViewZakForm, ViewZakForm);
ViewZakForm.ShowModal;
InitFrm(calendar.Date);
end;

procedure TfrmZakView.Button2Click(Sender: TObject);
var
  userResponse,r:integer;
begin

 userResponse :=  MessageDlg('Вы уверены что хотите скопировать форму?', mtInformation, [Dialogs.mbYes, Dialogs.mbNo], 0);;
    case userResponse of
      mrYes: begin

          Timer1.Enabled:=false;
          query_s:=TADOQuery.Create(nil);
 query_s.Connection:=dm.alexpromCon;
 qqq:=TADOQuery.Create(nil);
 qqq.Connection:=dm.alexpromCon;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
  query_s.Close;
  query_s.SQL.Clear;
  query_s.SQL.Add('select max(nomer) from dbo.zakup');
  query_s.Open;
  r:=query_s.Fields[0].AsInteger;
  ZayNumber:=r+1;
  qqq.Close;
      qqq.SQL.Clear;
      qqq.SQL.Add('select * from dbo.zakup where nomer=:p');
      qqq.Parameters[0].Value:=p_key;
      qqq.Open;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('insert into dbo.zakup(nomer, data, kontr, tmc, kol, time, transport, remark, vid) ');
  query.SQL.Add('values (:nz, :pz, :p, :s, :pt, :it, :ot, :f, :t)');
  query.Parameters[0].Value:=ZayNumber;
  query.Parameters[1].Value:=qqq.FieldValues['data'];
  query.Parameters[2].Value:=qqq.FieldValues['kontr'];
  query.Parameters[3].Value:=qqq.FieldValues['tmc'];
  query.Parameters[4].Value:=qqq.FieldValues['kol'];
  query.Parameters[5].Value:=qqq.FieldValues['time'];
  query.Parameters[6].Value:=qqq.FieldValues['transport'];
  query.Parameters[7].Value:=qqq.FieldValues['remark'];
  query.Parameters[8].Value:=qqq.FieldValues['vid'];
  query.ExecSQL;
  query.Close;
  query.SQL.Clear;
  Wrong:=true;
  Application.CreateForm(TViewZakForm, ViewZakForm);
  ViewZakForm.ShowModal;
   Timer1.Enabled:=true;
  InitFrm(calendar.Date);




      end;
      mrNo: ;
      {if the response is Cancel nothing will happen...}

    end;
end;

procedure TfrmZakView.Button3Click(Sender: TObject);
begin
Wrong:=true;
  Timer1.Enabled:=false;
  query_s:=TADOQuery.Create(nil);
 query_s.Connection:=dm.alexpromCon;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
  query_s.Close;
  query_s.SQL.Clear;
  query_s.SQL.Add('select max(nomer) from dbo.zakup');
  query_s.Open;
  r:=query_s.Fields[0].AsInteger;
  ZayNumber:=r+1;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('insert into dbo.zakup(nomer, data) ');
  query.SQL.Add('values (:nz, :data)');
  query.Parameters[0].Value:=ZayNumber;
  query.Parameters[1].Value:=datetostr(now);
  query.ExecSQL;
  query.Close;
  query.SQL.Clear;

  Application.CreateForm(TViewZakForm, ViewZakForm);
  ViewZakForm.ShowModal;
   Timer1.Enabled:=true;
  InitFrm(calendar.Date);
end;

procedure TfrmZakView.Button4Click(Sender: TObject);
var
  userResponse:integer;
begin
 userResponse :=  MessageDlg('Вы точно хотите удалить форму?', mtInformation, [Dialogs.mbYes, Dialogs.mbNo], 0);;
    case userResponse of
      mrYes: begin query.Close;
  query.SQL.Clear;
  query.SQL.Add('delete dbo.zakup where nomer=:id');
  query.Parameters[0].Value:=p_key;
  query.ExecSQL; end;
      mrNo: ;
      {if the response is Cancel nothing will happen...}

    end;

  InitFrm(calendar.Date);
end;

procedure TfrmZakView.Button5Click(Sender: TObject);
begin
ZayNumber:=p_key;
Application.CreateForm(TRazg, Razg);
Razg.ShowModal;
InitFrm(calendar.Date);
end;

procedure TfrmZakView.calendarChange(Sender: TObject);
begin
  Reg:=0;
  InitFrm(calendar.Date);
end;

procedure TfrmZakView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Ini := TIniFile.Create(ExtractFilePath(Application.Exename) + 'Test.ini');
   Ini.WriteString('Form info2','ViewZak','ViewZak');
   Ini.WriteInteger('Form info2','Width1',ListView1.Column[1].Width);
   Ini.WriteInteger('Form info2','Width2',ListView1.Column[2].Width);
   Ini.WriteInteger('Form info2','Width3',ListView1.Column[3].Width);
   Ini.WriteInteger('Form info2','Width4',ListView1.Column[4].Width);
   Ini.WriteInteger('Form info2','Width5',ListView1.Column[5].Width);
   Ini.WriteInteger('Form info2','Width6',ListView1.Column[6].Width);
   Ini.WriteInteger('Form info2','Width7',ListView1.Column[7].Width);
   Ini.WriteInteger('Form info2','Width8',ListView1.Column[8].Width);
   Ini.WriteInteger('Form info2','Width9',ListView1.Column[9].Width);
   Ini.WriteInteger('Form info2','Width10',ListView1.Column[10].Width);
   Ini.WriteInteger('Form info2','Width11',ListView1.Column[11].Width);
   Ini.WriteInteger('Form info2','Width12',ListView1.Column[12].Width);
   Ini.WriteInteger('Form info2','Width13',ListView1.Column[13].Width);
   if mainform.accessLevel>5 then begin
   Ini.WriteInteger('Form info2','Width14',ListView1.Column[14].Width);
   Ini.WriteInteger('Form info2','Width15',ListView1.Column[15].Width);
   Ini.WriteInteger('Form info2','Width16',ListView1.Column[16].Width);
   Ini.WriteInteger('Form info2','Width17',ListView1.Column[17].Width);
   Ini.WriteInteger('Form info2','Width18',ListView1.Column[18].Width);
   end;
   Ini.Free;
  Timer1.Enabled:=false;
  Action:=caFree;
  query.Free;
  qqq.Free;
  mainform.WindowState:=wsnormal;
end;


procedure TfrmZakView.FormCreate(Sender: TObject);

begin
 Ini := TIniFile.Create(ExtractFilePath(Application.Exename) + 'Test.ini');
 ListView1.Column[1].Width:=Ini.ReadInteger('Form info2','Width1',100);
 ListView1.Column[2].Width:=Ini.ReadInteger('Form info2','Width2',100);
 ListView1.Column[3].Width:=Ini.ReadInteger('Form info2','Width3',100);
 ListView1.Column[4].Width:=Ini.ReadInteger('Form info2','Width4',100);
 ListView1.Column[5].Width:=Ini.ReadInteger('Form info2','Width5',100);
 ListView1.Column[6].Width:=Ini.ReadInteger('Form info2','Width6',100);
 ListView1.Column[7].Width:=Ini.ReadInteger('Form info2','Width7',100);
 ListView1.Column[8].Width:=Ini.ReadInteger('Form info2','Width8',100);
 ListView1.Column[9].Width:=Ini.ReadInteger('Form info2','Width9',100);
 ListView1.Column[10].Width:=Ini.ReadInteger('Form info2','Width10',100);
 ListView1.Column[11].Width:=Ini.ReadInteger('Form info2','Width11',100);
 ListView1.Column[12].Width:=Ini.ReadInteger('Form info2','Width12',100);
 ListView1.Column[13].Width:=Ini.ReadInteger('Form info2','Width13',100);
 if mainform.accessLevel>5 then begin
 ListView1.Column[14].Width:=Ini.ReadInteger('Form info2','Width14',100);
 ListView1.Column[15].Width:=Ini.ReadInteger('Form info2','Width15',100);
 ListView1.Column[16].Width:=Ini.ReadInteger('Form info2','Width16',100);
 ListView1.Column[17].Width:=Ini.ReadInteger('Form info2','Width17',100);
 ListView1.Column[18].Width:=Ini.ReadInteger('Form info2','Width18',100);
 end
 else begin
   ListView1.Column[14].Width:=0; ListView1.Column[14].MaxWidth:=1;
   ListView1.Column[15].Width:=0; ListView1.Column[15].MaxWidth:=1;
   ListView1.Column[16].Width:=0; ListView1.Column[16].MaxWidth:=1;
   ListView1.Column[17].Width:=0; ListView1.Column[17].MaxWidth:=1;
   ListView1.Column[18].Width:=0; ListView1.Column[18].MaxWidth:=1;
 end;
 Ini.Free;
 Timer1.Enabled:=true;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 Reg:=0;
 calendar.Date:=now;
 decodedate(calendar.Date, y, m, d);
 monthbox.ItemIndex:=m-1;
 yearbox.ItemIndex:=0;
 if mainForm.accessLevel=6 then Button3.Enabled:=true else Button1.Caption:='Просмотр';
   InitFrm(calendar.Date);
end;
  end.

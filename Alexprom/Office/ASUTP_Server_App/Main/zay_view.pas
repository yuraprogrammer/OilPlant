unit Zay_view;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ADODB, RpDefine, RpRave, RpRender, RpRenderHTML,
  RpCon, RpConDS, DB, RpBase, RpSystem,U_dm, ExtCtrls, mainfunctions, main, IniFiles;

type
  TfrmZayView = class(TForm)
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
  frmZayView: TfrmZayView;
  query,qqq,query_s:TADOQuery;
   y,m,d:word;
   li:TListItem;
   Reg,p_key:integer;
   Ini:TIniFile;


implementation

uses updateZay, viewZay;

{$R *.dfm}


procedure TfrmZayView.Timer1Timer(Sender: TObject);
begin
   if not dm.alexpromCon.Connected then
  begin
     try
       dm.alexpromCon.Connected:=true;
       InitFrm(calendar.Date);
      except
        ShowMessage('Ќет соединени€ с сервером базы данных!!! ќбратитесь к администратору и повторите попытку позже.');
      end;
  end
else
  InitFrm(calendar.Date);

end;

procedure TfrmZayView.ListView1CustomDrawItem(Sender: TCustomListView;
  Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
begin
   with ListView1.Canvas.Brush do
   begin
      if Item.SubItems.Strings[27]='ожидаетс€' then Color := clYellow;
         if Item.SubItems.Strings[27]='прибыла' then Color := clGreen;
         if Item.SubItems.Strings[27]='грузитс€' then Color := clRed;
      end;
   end;


procedure TfrmZayView.InitFrm(Date: TDate);
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
         li.SubItems.Add(query.FieldValues['n_trans']);
        li.SubItems.Add(inttostr(query.FieldValues['kol'])+' '+query.FieldValues['m_kol']);
        if query.FieldValues['cena']=trunc(query.FieldValues['cena']) then li.SubItems.Add(floattostr(query.FieldValues['cena'])+',00 '+query.FieldValues['m_cena']) else if query.FieldValues['cena']*10=trunc(query.FieldValues['cena']*10) then li.SubItems.Add(floattostr(query.FieldValues['cena'])+'0 '+query.FieldValues['m_cena']) else li.SubItems.Add(floattostr(query.FieldValues['cena'])+' '+query.FieldValues['m_cena']);
        li.SubItems.Add(floattostr(query.FieldValues['dostavka'])+' '+query.FieldValues['m_dostavka']);
        li.SubItems.Add(query.FieldValues['seriaDov']);
        li.SubItems.Add(query.FieldValues['nomerDov']);
        li.SubItems.Add(query.FieldValues['dataDov']);
        li.SubItems.Add(query.FieldValues['komuDov']);
        li.SubItems.Add(query.FieldValues['remarkDov']);
        li.SubItems.Add(query.FieldValues['schet']);
        li.SubItems.Add(query.FieldValues['p_time']);
        li.SubItems.Add(query.FieldValues['in_time']);
        li.SubItems.Add(query.FieldValues['out_time']);
        li.SubItems.Add(query.FieldValues['fakt']);
        li.SubItems.Add(query.FieldValues['temp']);
        li.SubItems.Add(query.FieldValues['plotn']);
        li.SubItems.Add(query.FieldValues['netto']);
        li.SubItems.Add(query.FieldValues['w2']);
        li.SubItems.Add(query.FieldValues['temp2']);
        li.SubItems.Add(query.FieldValues['plotn2']);
        li.SubItems.Add(query.FieldValues['netto_kalibr']);
        li.SubItems.Add(query.FieldValues['pogr']);
        li.SubItems.Add(query.FieldValues['kurator']);
        li.SubItems.Add(query.FieldValues['remark']);
        case query.FieldValues['sost'] of
        0: li.SubItems.Add('ожидаетс€');
        1: li.SubItems.Add('прибыла');
        2: li.SubItems.Add('грузитс€');
        3: li.SubItems.Add('выехала');
        end;
        li.SubItems.Add(query.FieldValues['plan_time']);
        li.SubItems.Add(query.FieldValues['change']);

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
        li.SubItems.Add(query.FieldValues['n_trans']);
        li.SubItems.Add(inttostr(query.FieldValues['kol'])+' '+query.FieldValues['m_kol']);
        if query.FieldValues['cena']=trunc(query.FieldValues['cena']) then li.SubItems.Add(floattostr(query.FieldValues['cena'])+',00 '+query.FieldValues['m_cena']) else if query.FieldValues['cena']*10=trunc(query.FieldValues['cena']*10) then li.SubItems.Add(floattostr(query.FieldValues['cena'])+'0 '+query.FieldValues['m_cena']) else li.SubItems.Add(floattostr(query.FieldValues['cena'])+' '+query.FieldValues['m_cena']);
        li.SubItems.Add(floattostr(query.FieldValues['dostavka'])+' '+query.FieldValues['m_dostavka']);
        li.SubItems.Add(query.FieldValues['seriaDov']);
        li.SubItems.Add(query.FieldValues['nomerDov']);
        li.SubItems.Add(query.FieldValues['dataDov']);
        li.SubItems.Add(query.FieldValues['komuDov']);
        li.SubItems.Add(query.FieldValues['remarkDov']);
        li.SubItems.Add(query.FieldValues['schet']);
        li.SubItems.Add(query.FieldValues['p_time']);
        li.SubItems.Add(query.FieldValues['in_time']);
        li.SubItems.Add(query.FieldValues['out_time']);
        li.SubItems.Add(query.FieldValues['fakt']);
        li.SubItems.Add(query.FieldValues['temp']);
        li.SubItems.Add(query.FieldValues['plotn']);
        li.SubItems.Add(query.FieldValues['netto']);
        li.SubItems.Add(query.FieldValues['w2']);
        li.SubItems.Add(query.FieldValues['temp2']);
        li.SubItems.Add(query.FieldValues['plotn2']);
        li.SubItems.Add(query.FieldValues['netto_kalibr']);
        li.SubItems.Add(query.FieldValues['pogr']);
        li.SubItems.Add(query.FieldValues['kurator']);
        li.SubItems.Add(query.FieldValues['remark']);
         case query.FieldValues['sost'] of
        0: li.SubItems.Add('ожидаетс€');
        1: li.SubItems.Add('прибыла');
        2: li.SubItems.Add('грузитс€');
        3: li.SubItems.Add('выехала');
        end;
        li.SubItems.Add(query.FieldValues['plan_time']);
        li.SubItems.Add(query.FieldValues['change']);
        query.Next;
      end;
  end;

end;

end;

end;


procedure TfrmZayView.monthBoxChange(Sender: TObject);
begin
  Reg:=1;
  InitFrm(calendar.Date);
end;



procedure TfrmZayView.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if Selected then
 begin
 //label4.Caption:='!'+Item.SubItems.Strings[26]+'!';
  p_key:=StrToInt(Item.Caption);
  Button5.Enabled:=true;
  if mainForm.accessLevel<>4 then Button2.Enabled:=true else Button2.Enabled:=false;

  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.zay where nomerzay=:wn');
  query.Parameters[0].Value:=p_key;
  query.Open;
  query.First;
    if strtoint(query.FieldValues['sost'])<3 then
      if mainForm.accessLevel<>4 then begin Button1.Enabled:=true; Button4.Enabled:=true; end else begin Button1.Enabled:=false; Button4.Enabled:=false; end
      else begin Button1.Enabled:=false; Button4.Enabled:=false; end;
 end;
 end;


procedure TfrmZayView.Button1Click(Sender: TObject);
begin
ZayNumber:=p_key;
Application.CreateForm(TUpdateZayForm, UpdateZayForm);
UpdateZayForm.ShowModal;
InitFrm(calendar.Date);
end;

procedure TfrmZayView.Button2Click(Sender: TObject);
var
  userResponse,r:integer;
begin

 userResponse :=  MessageDlg('¬ы уверены что хотите скопировать за€вку?', mtInformation, [Dialogs.mbYes, Dialogs.mbNo], 0);;
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
  query_s.SQL.Add('select max(nomerzay) from dbo.zay');
  query_s.Open;
  r:=query_s.Fields[0].AsInteger;
  ZayNumber:=r+1;
  qqq.Close;
      qqq.SQL.Clear;
      qqq.SQL.Add('select * from dbo.zay where nomerzay=:p');
      qqq.Parameters[0].Value:=p_key;
      qqq.Open;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('insert into dbo.zay(nomerzay, podalZay, pogr, sost, p_time, in_time, out_time, fakt, temp, plotn, netto, kalibr, netto_kalibr, dostavka, m_kol, m_cena, m_dostavka,w2, temp2, plotn2, create_date, ');
  query.SQL.Add('data, kontr, tmc, kol, cena, kurator, n_trans, seriaDov, nomerDov, dataDov, komuDov, remarkDov, schet, remark, remark_tsp, remark_lab, plan_time) ');
  query.SQL.Add('values (:nz, :pz, :p, :s, :pt, :it, :ot, :f, :t, :pl, :n, :k, :nk, :dost, :mk, :mc, :md, :w2, :t2, :p2, :cd, :d, :ko, :tmc, :kol, :cena, :kur, :nt, :sd, :nd, :dd, :kd, :rd, :schet, :rem, :remt, :reml, :plt)');
  query.Parameters[0].Value:=ZayNumber;
  query.Parameters[1].Value:=User;
  query.Parameters[2].Value:=qqq.FieldValues['pogr'];
  query.Parameters[3].Value:=0;
  query.Parameters[4].Value:=' ';
  query.Parameters[5].Value:=' ';
  query.Parameters[6].Value:=' ';
  query.Parameters[7].Value:=0;
  query.Parameters[8].Value:=0;
  query.Parameters[9].Value:=0;
  query.Parameters[10].Value:=0;
  query.Parameters[11].Value:=0;
  query.Parameters[12].Value:=0;
  query.Parameters[13].Value:=qqq.FieldValues['dostavka'];
  query.Parameters[14].Value:=qqq.FieldValues['m_kol'];
  query.Parameters[15].Value:=qqq.FieldValues['m_cena'];
  query.Parameters[16].Value:=qqq.FieldValues['m_dostavka'];
  query.Parameters[17].Value:=qqq.FieldValues['w2'];
  query.Parameters[18].Value:=0;
  query.Parameters[19].Value:=0;
  query.Parameters[20].Value:=datetostr(now)+' в '+timetostr(now);
  query.Parameters[21].Value:=qqq.FieldValues['data'];
  query.Parameters[22].Value:=qqq.FieldValues['kontr'];
  query.Parameters[23].Value:=qqq.FieldValues['tmc'];
  query.Parameters[24].Value:=qqq.FieldValues['kol'];
  query.Parameters[25].Value:=qqq.FieldValues['cena'];
  query.Parameters[26].Value:=qqq.FieldValues['kurator'];
  query.Parameters[27].Value:=qqq.FieldValues['n_trans'];
  query.Parameters[28].Value:=qqq.FieldValues['seriaDov'];
  query.Parameters[29].Value:=qqq.FieldValues['nomerDov'];
  query.Parameters[30].Value:=qqq.FieldValues['dataDov'];
  query.Parameters[31].Value:=qqq.FieldValues['komuDov'];
  query.Parameters[32].Value:=qqq.FieldValues['remarkDov'];
  query.Parameters[33].Value:=qqq.FieldValues['schet'];
  query.Parameters[34].Value:=qqq.FieldValues['remark'];
  query.Parameters[35].Value:=qqq.FieldValues['remark_tsp'];
  query.Parameters[36].Value:=qqq.FieldValues['remark_lab'];
  query.Parameters[37].Value:=qqq.FieldValues['plan_time'];
  query.ExecSQL;
  query.Close;
  query.SQL.Clear;
  Wrong:=true;
  Application.CreateForm(TUpdateZayForm, UpdateZayForm);
  UpdateZayForm.ShowModal;
   Timer1.Enabled:=true;
  InitFrm(calendar.Date);




      end;
      mrNo: ;
      {if the response is Cancel nothing will happen...}

    end;
end;

procedure TfrmZayView.Button3Click(Sender: TObject);
begin
Wrong:=true;
  Timer1.Enabled:=false;
  query_s:=TADOQuery.Create(nil);
 query_s.Connection:=dm.alexpromCon;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
  query_s.Close;
  query_s.SQL.Clear;
  query_s.SQL.Add('select max(nomerzay) from dbo.zay');
  query_s.Open;
  r:=query_s.Fields[0].AsInteger;
  ZayNumber:=r+1;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('insert into dbo.zay(nomerzay, podalZay, pogr, sost, p_time, in_time, out_time, fakt, temp, plotn, netto, kalibr, netto_kalibr, dostavka, m_kol, m_cena, m_dostavka,w2, temp2, plotn2, create_date, data) ');
  query.SQL.Add('values (:nz, :pz, :p, :s, :pt, :it, :ot, :f, :t, :pl, :n, :k, :nk, :dost, :mk, :mc, :md, :w2, :t2, :p2, :cd, :data)');
  query.Parameters[0].Value:=ZayNumber;
  query.Parameters[1].Value:=User;
  query.Parameters[2].Value:='стоим, не грузим';
  query.Parameters[3].Value:=0;
  query.Parameters[4].Value:=' ';
  query.Parameters[5].Value:=' ';
  query.Parameters[6].Value:=' ';
  query.Parameters[7].Value:=0;
  query.Parameters[8].Value:=0;
  query.Parameters[9].Value:=0;
  query.Parameters[10].Value:=0;
  query.Parameters[11].Value:=0;
  query.Parameters[12].Value:=0;
  query.Parameters[13].Value:=0;
  query.Parameters[14].Value:='л';
  query.Parameters[15].Value:='грн/л';
  query.Parameters[16].Value:='грн/л';
  query.Parameters[17].Value:=0;
  query.Parameters[18].Value:=0;
  query.Parameters[19].Value:=0;
  query.Parameters[20].Value:=datetostr(now)+' в '+timetostr(now);
  query.Parameters[21].Value:=datetostr(now);
  query.ExecSQL;
  query.Close;
  query.SQL.Clear;

  Application.CreateForm(TUpdateZayForm, UpdateZayForm);
  UpdateZayForm.ShowModal;
   Timer1.Enabled:=true;
  InitFrm(calendar.Date);
end;

procedure TfrmZayView.Button4Click(Sender: TObject);
var
  userResponse:integer;
begin
 userResponse :=  MessageDlg('¬ы точно хотите удалить за€вку?', mtInformation, [Dialogs.mbYes, Dialogs.mbNo], 0);;
    case userResponse of
      mrYes: begin query.Close;
  query.SQL.Clear;
  query.SQL.Add('update dbo.zay set sost=:@sost where nomerzay=:id');
  query.Parameters[0].Value:=5;
  query.Parameters[1].Value:=p_key;
  query.ExecSQL; end;
      mrNo: ;
      {if the response is Cancel nothing will happen...}

    end;

  InitFrm(calendar.Date);
end;

procedure TfrmZayView.Button5Click(Sender: TObject);
begin
ZayNumber:=p_key;
Application.CreateForm(TViewZayForm, ViewZayForm);
ViewZayForm.ShowModal;
InitFrm(calendar.Date);
end;

procedure TfrmZayView.calendarChange(Sender: TObject);
begin
  Reg:=0;
  InitFrm(calendar.Date);
end;

procedure TfrmZayView.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   Ini := TIniFile.Create(ExtractFilePath(Application.Exename) + 'Test.ini');
   Ini.WriteString('Form info','ViewZay','ViewZay');
   Ini.WriteInteger('Form info','Width0',ListView1.Column[0].Width);
   Ini.WriteInteger('Form info','Width1',ListView1.Column[1].Width);
   Ini.WriteInteger('Form info','Width2',ListView1.Column[2].Width);
   Ini.WriteInteger('Form info','Width3',ListView1.Column[3].Width);
   Ini.WriteInteger('Form info','Width4',ListView1.Column[4].Width);
   Ini.WriteInteger('Form info','Width5',ListView1.Column[5].Width);
   Ini.WriteInteger('Form info','Width6',ListView1.Column[6].Width);
   Ini.WriteInteger('Form info','Width7',ListView1.Column[7].Width);
   Ini.WriteInteger('Form info','Width8',ListView1.Column[8].Width);
   Ini.WriteInteger('Form info','Width9',ListView1.Column[9].Width);
   Ini.WriteInteger('Form info','Width10',ListView1.Column[10].Width);
   Ini.WriteInteger('Form info','Width11',ListView1.Column[11].Width);
   Ini.WriteInteger('Form info','Width12',ListView1.Column[12].Width);
   Ini.WriteInteger('Form info','Width13',ListView1.Column[13].Width);
   Ini.WriteInteger('Form info','Width14',ListView1.Column[14].Width);
   Ini.WriteInteger('Form info','Width15',ListView1.Column[15].Width);
   Ini.WriteInteger('Form info','Width16',ListView1.Column[16].Width);
   Ini.WriteInteger('Form info','Width17',ListView1.Column[17].Width);
   Ini.WriteInteger('Form info','Width18',ListView1.Column[18].Width);
   Ini.WriteInteger('Form info','Width19',ListView1.Column[19].Width);
   Ini.WriteInteger('Form info','Width20',ListView1.Column[20].Width);
   Ini.WriteInteger('Form info','Width21',ListView1.Column[21].Width);
   Ini.WriteInteger('Form info','Width22',ListView1.Column[22].Width);
   Ini.WriteInteger('Form info','Width23',ListView1.Column[23].Width);
   Ini.WriteInteger('Form info','Width24',ListView1.Column[24].Width);
   Ini.WriteInteger('Form info','Width25',ListView1.Column[25].Width);
   Ini.WriteInteger('Form info','Width26',ListView1.Column[26].Width);
   Ini.WriteInteger('Form info','Width27',ListView1.Column[27].Width);
   Ini.WriteInteger('Form info','Width28',ListView1.Column[28].Width);
   Ini.WriteInteger('Form info','Width28',ListView1.Column[29].Width);
   Ini.WriteInteger('Form info','Width28',ListView1.Column[30].Width);
   Ini.Free;
  Timer1.Enabled:=false;
  Action:=caFree;
  query.Free;
  qqq.Free;
  mainform.WindowState:=wsnormal;
end;


procedure TfrmZayView.FormCreate(Sender: TObject);

begin
 Ini := TIniFile.Create(ExtractFilePath(Application.Exename) + 'Test.ini');
 ListView1.Column[0].Width:=Ini.ReadInteger('Form info','Width0',100);
 ListView1.Column[1].Width:=Ini.ReadInteger('Form info','Width1',100);
 ListView1.Column[2].Width:=Ini.ReadInteger('Form info','Width2',100);
 ListView1.Column[3].Width:=Ini.ReadInteger('Form info','Width3',100);
 ListView1.Column[4].Width:=Ini.ReadInteger('Form info','Width4',100);
 ListView1.Column[5].Width:=Ini.ReadInteger('Form info','Width5',100);
 ListView1.Column[6].Width:=Ini.ReadInteger('Form info','Width6',100);
 ListView1.Column[7].Width:=Ini.ReadInteger('Form info','Width7',100);
 ListView1.Column[8].Width:=Ini.ReadInteger('Form info','Width8',100);
 ListView1.Column[9].Width:=Ini.ReadInteger('Form info','Width9',100);
 ListView1.Column[10].Width:=Ini.ReadInteger('Form info','Width10',100);
 ListView1.Column[11].Width:=Ini.ReadInteger('Form info','Width11',100);
 ListView1.Column[12].Width:=Ini.ReadInteger('Form info','Width12',100);
 ListView1.Column[13].Width:=Ini.ReadInteger('Form info','Width13',100);
 ListView1.Column[14].Width:=Ini.ReadInteger('Form info','Width14',100);
 ListView1.Column[15].Width:=Ini.ReadInteger('Form info','Width15',100);
 ListView1.Column[16].Width:=Ini.ReadInteger('Form info','Width16',100);
 ListView1.Column[17].Width:=Ini.ReadInteger('Form info','Width17',100);
 ListView1.Column[18].Width:=Ini.ReadInteger('Form info','Width18',100);
 ListView1.Column[19].Width:=Ini.ReadInteger('Form info','Width19',100);
 ListView1.Column[20].Width:=Ini.ReadInteger('Form info','Width20',100);
 ListView1.Column[21].Width:=Ini.ReadInteger('Form info','Width21',100);
 ListView1.Column[22].Width:=Ini.ReadInteger('Form info','Width22',100);
 ListView1.Column[23].Width:=Ini.ReadInteger('Form info','Width23',100);
 ListView1.Column[24].Width:=Ini.ReadInteger('Form info','Width24',100);
 ListView1.Column[25].Width:=Ini.ReadInteger('Form info','Width25',100);
 ListView1.Column[26].Width:=Ini.ReadInteger('Form info','Width26',100);
 ListView1.Column[27].Width:=Ini.ReadInteger('Form info','Width27',100);
 ListView1.Column[28].Width:=Ini.ReadInteger('Form info','Width28',100);
 ListView1.Column[28].Width:=Ini.ReadInteger('Form info','Width29',100);
 ListView1.Column[28].Width:=Ini.ReadInteger('Form info','Width30',100);
 Ini.Free;
 Timer1.Enabled:=true;
 Button2.Enabled:=false;
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 Reg:=0;
 calendar.Date:=now;
 decodedate(calendar.Date, y, m, d);
 monthbox.ItemIndex:=m-1;
 yearbox.ItemIndex:=0;
 if mainForm.accessLevel=4 then
 begin
      Button1.Enabled:=false;
      Button3.Enabled:=false;
      Button4.Enabled:=false;
      Button2.Enabled:=false;
 end;

  InitFrm(calendar.Date);
end;
  end.

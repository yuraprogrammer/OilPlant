unit u_inputChemical;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, ExtCtrls, Mask, adodb;

type
  TinputChemicalData = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    analisDate: TEdit;
    Label2: TLabel;
    analisTime: TEdit;
    ListView1: TListView;
    Button1: TButton;
    GroupBox2: TGroupBox;
    Timer1: TTimer;
    Label3: TLabel;
    MaskEdit1: TMaskEdit;
    Label4: TLabel;
    MaskEdit2: TMaskEdit;
    Label5: TLabel;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Edit1: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Edit4: TEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    Button2: TButton;
    Label13: TLabel;
    Edit5: TEdit;
    Label14: TLabel;
    Edit6: TEdit;
    Label15: TLabel;
    Edit7: TEdit;
    Button3: TButton;
    procedure Edit4Change(Sender: TObject);
    procedure Edit7Change(Sender: TObject);
    procedure MaskEdit5Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit6Change(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure ListView1Exit(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure initfrm;
  public
    { Public declarations }
  end;

var
  inputChemicalData: TinputChemicalData;
  query:tadoquery;
  key1,key2:string;
  fbgs_plotn,fbgs_plotn20,adt_plotn,adt_plotn20,otg_plotn,otg_plotn20:real;
  fbgs_tkk, adt_tpom, adt_tflash, otg_tflash:real;
  fbgs_t, adt_t, otg_t:real;
implementation

uses u_dm;

{$R *.dfm}

procedure tinputchemicaldata.initfrm;
var
 li:tlistitem;
 timestr:string[8];
begin
 listview1.Clear;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select fbgs_p, fbgs_t, fbgs_p20, fbgs_tkk, adt_p, adt_t, adt_p20, adt_tdark, adt_tflash,');
 query.SQL.Add('otg_p, otg_t, otg_p20, otg_tflash, andate, antime from dbo.chemicalanalisis where andate=:ad and antime between :t1 and :t1');
 timestr:=timetostr(now);
 if length(timestr)=8 then

 else
  timestr:='0'+timestr;
 if timestr>'08:00:00' then
   begin
    query.Parameters[0].Value:=datetostr(now);
    query.Parameters[1].Value:='08:00:00';
    query.Parameters[2].Value:='23:59:59';
    query.Open;
    query.First;
    while not query.Eof do
     begin
      li:=listview1.Items.Add;
      li.Caption:=query.FieldByName('andate').AsString;
      li.SubItems.Add(query.FieldByName('antime').AsString);
      li.SubItems.Add(query.FieldByName('fbgs_p').AsString);
      li.SubItems.Add(query.FieldByName('fbgs_t').AsString);
      li.SubItems.Add(query.FieldByName('fbgs_p20').AsString);
      li.SubItems.Add(query.FieldByName('fbgs_tkk').AsString);
      li.SubItems.Add(query.FieldByName('adt_p').AsString);
      li.SubItems.Add(query.FieldByName('adt_t').AsString);
      li.SubItems.Add(query.FieldByName('adt_p20').AsString);
      li.SubItems.Add(query.FieldByName('adt_tdark').AsString);
      li.SubItems.Add(query.FieldByName('adt_tflash').AsString);
      li.SubItems.Add(query.FieldByName('otg_p').AsString);
      li.SubItems.Add(query.FieldByName('otg_t').AsString);
      li.SubItems.Add(query.FieldByName('otg_p20').AsString);
      li.SubItems.Add(query.FieldByName('otg_tflash').AsString);
      query.Next;
     end;
     query.Close;
     query.Parameters[0].Value:=datetostr(now+1);
     query.Parameters[1].Value:='00:00:00';
     query.Parameters[2].Value:='07:59:59';
     query.Open;
     query.First;
     while not query.Eof do
      begin
       li:=listview1.Items.Add;
       li.Caption:=query.FieldByName('andate').AsString;
       li.SubItems.Add(query.FieldByName('antime').AsString);
       li.SubItems.Add(query.FieldByName('fbgs_p').AsString);
       li.SubItems.Add(query.FieldByName('fbgs_t').AsString);
       li.SubItems.Add(query.FieldByName('fbgs_p20').AsString);
       li.SubItems.Add(query.FieldByName('fbgs_tkk').AsString);
       li.SubItems.Add(query.FieldByName('adt_p').AsString);
       li.SubItems.Add(query.FieldByName('adt_t').AsString);
       li.SubItems.Add(query.FieldByName('adt_p20').AsString);
       li.SubItems.Add(query.FieldByName('adt_tdark').AsString);
       li.SubItems.Add(query.FieldByName('adt_tflash').AsString);
       li.SubItems.Add(query.FieldByName('otg_p').AsString);
       li.SubItems.Add(query.FieldByName('otg_t').AsString);
       li.SubItems.Add(query.FieldByName('otg_p20').AsString);
       li.SubItems.Add(query.FieldByName('otg_tflash').AsString);
       query.Next;
      end;
   end
  else
   begin
    query.Parameters[0].Value:=datetostr(now-1);
    query.Parameters[1].Value:='08:00:00';
    query.Parameters[2].Value:='23:59:59';
    query.Open;
    query.First;
    while not query.Eof do
     begin
      li:=listview1.Items.Add;
      li.Caption:=query.FieldByName('andate').AsString;
      li.SubItems.Add(query.FieldByName('antime').AsString);
      li.SubItems.Add(query.FieldByName('fbgs_p').AsString);
      li.SubItems.Add(query.FieldByName('fbgs_t').AsString);
      li.SubItems.Add(query.FieldByName('fbgs_p20').AsString);
      li.SubItems.Add(query.FieldByName('fbgs_tkk').AsString);
      li.SubItems.Add(query.FieldByName('adt_p').AsString);
      li.SubItems.Add(query.FieldByName('adt_t').AsString);
      li.SubItems.Add(query.FieldByName('adt_p20').AsString);
      li.SubItems.Add(query.FieldByName('adt_tdark').AsString);
      li.SubItems.Add(query.FieldByName('adt_tflash').AsString);
      li.SubItems.Add(query.FieldByName('otg_p').AsString);
      li.SubItems.Add(query.FieldByName('otg_t').AsString);
      li.SubItems.Add(query.FieldByName('otg_p20').AsString);
      li.SubItems.Add(query.FieldByName('otg_tflash').AsString);
      query.Next;
     end;
     query.Close;
     query.Parameters[0].Value:=datetostr(now);
     query.Parameters[1].Value:='00:00:00';
     query.Parameters[2].Value:='07:59:59';
     query.Open;
     query.First;
     while not query.Eof do
      begin
       li:=listview1.Items.Add;
       li.Caption:=query.FieldByName('andate').AsString;
       li.SubItems.Add(query.FieldByName('antime').AsString);
       li.SubItems.Add(query.FieldByName('fbgs_p').AsString);
       li.SubItems.Add(query.FieldByName('fbgs_t').AsString);
       li.SubItems.Add(query.FieldByName('fbgs_p20').AsString);
       li.SubItems.Add(query.FieldByName('fbgs_tkk').AsString);
       li.SubItems.Add(query.FieldByName('adt_p').AsString);
       li.SubItems.Add(query.FieldByName('adt_t').AsString);
       li.SubItems.Add(query.FieldByName('adt_p20').AsString);
       li.SubItems.Add(query.FieldByName('adt_tdark').AsString);
       li.SubItems.Add(query.FieldByName('adt_tflash').AsString);
       li.SubItems.Add(query.FieldByName('otg_p').AsString);
       li.SubItems.Add(query.FieldByName('otg_t').AsString);
       li.SubItems.Add(query.FieldByName('otg_p20').AsString);
       li.SubItems.Add(query.FieldByName('otg_tflash').AsString);
       query.Next;
      end;
   end;
end;

procedure TinputChemicalData.ListView1Exit(Sender: TObject);
begin
 key1:='';
 key2:='';
// button3.Enabled:=true;
end;

procedure TinputChemicalData.ListView1SelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
try
if selected then
 begin
  key1:=item.Caption;
  key2:=item.SubItems.Strings[0];
  button3.Enabled:=false;
  button1.Enabled:=true;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select andate, antime, fbgs_p, fbgs_p20, fbgs_tkk, ');
  query.SQL.Add('adt_p, adt_p20, adt_tdark, adt_tflash, otg_p, otg_p20, ');
  query.SQL.Add('otg_tflash, fbgs_t, adt_t, otg_t from dbo.chemicalanalisis ');
  query.SQL.Add('where andate=:ad and antime=:at');
  query.Parameters[0].Value:=key1;
  query.Parameters[1].Value:=key2;
  query.Open;
  timer1.Enabled:=false;
  analisdate.Text:=query.FieldByName('andate').Asstring;
  analistime.Text:=query.FieldByName('antime').AsString;
  if query.FieldByName('fbgs_p').Asstring='' then
   fbgs_plotn:=-1000
  else
   fbgs_plotn:=strtofloat(query.FieldByName('fbgs_p').Asstring);
  if query.FieldByName('fbgs_t').Asstring='' then
   fbgs_t:=-1000
  else
   fbgs_t:=strtofloat(query.FieldByName('fbgs_t').Asstring);
  if query.FieldByName('fbgs_p20').Asstring='' then
    fbgs_plotn20:=-1000
  else
   fbgs_plotn20:=strtofloat(query.FieldByName('fbgs_p20').Asstring);
  if query.FieldByName('fbgs_tkk').Asstring='' then
    fbgs_tkk:=-1000
  else
    fbgs_tkk:=strtofloat(query.FieldByName('fbgs_tkk').Asstring);
  if query.FieldByName('adt_p').Asstring='' then
    adt_plotn:=-1000
  else
    adt_plotn:=strtofloat(query.FieldByName('adt_p').Asstring);
  if query.FieldByName('adt_t').Asstring='' then
    adt_t:=-1000
  else
    adt_t:=strtofloat(query.FieldByName('adt_t').Asstring);
  if query.FieldByName('adt_p20').Asstring='' then
    adt_plotn20:= -1000
  else
    adt_plotn20:=strtofloat(query.FieldByName('adt_p20').Asstring);
  if query.FieldByName('adt_tdark').Asstring='' then
    adt_tpom:=-1000
  else
    adt_tpom:=strtofloat(query.FieldByName('adt_tdark').Asstring);
  if query.FieldByName('adt_tflash').Asstring='' then
    adt_tflash:=-1000
  else
    adt_tflash:=strtofloat(query.FieldByName('adt_tflash').Asstring);
  if query.FieldByName('otg_p').Asstring='' then
    otg_plotn:=-1000
  else
    otg_plotn:=strtofloat(query.FieldByName('otg_p').Asstring);
  if query.FieldByName('otg_t').Asstring='' then
   otg_t:=-1000
  else
   otg_t:=strtofloat(query.FieldByName('otg_t').Asstring);
  if query.FieldByName('otg_p20').Asstring='' then
    otg_plotn20:=-1000
  else
    otg_plotn20:=strtofloat(query.FieldByName('otg_p20').Asstring);
  if query.FieldByName('otg_tflash').Asstring='' then
    otg_tflash:=-1000
  else
    otg_tflash:=strtofloat(query.FieldByName('otg_tflash').Asstring);
  if fbgs_plotn=-1000 then
    maskedit1.Text:=''
  else
    maskedit1.Text:=floattostrf(fbgs_plotn,fffixed, 5, 4);
  if fbgs_t=-1000 then
    edit5.Text:=''
  else
    edit5.Text:=floattostrf(fbgs_t,fffixed, 5, 4);
  if fbgs_plotn20=-1000 then
    maskedit2.Text:=''
  else
    maskedit2.Text:=floattostrf(fbgs_plotn20,fffixed, 5, 4);
  if fbgs_tkk=-1000 then
    edit1.Text:=''
  else
    edit1.Text:=floattostrf(fbgs_tkk,fffixed, 5, 4);
  if adt_plotn=-1000 then
    maskedit3.Text:=''
  else
    maskedit3.Text:=floattostrf(adt_plotn,fffixed, 5, 4);
  if adt_t=-1000 then
    edit6.Text:=''
  else
    edit6.Text:=floattostrf(adt_t,fffixed, 5, 4);
  if adt_plotn20=-1000 then
    maskedit4.Text:=''
  else
    maskedit4.Text:=floattostrf(adt_plotn20,fffixed, 5, 4);
  if adt_tpom=-1000 then
    edit2.Text:=''
  else
    edit2.Text:=floattostrf(adt_tpom,fffixed, 5, 4);
  if adt_tflash=-1000 then
    edit3.Text:=''
  else
    edit3.Text:=floattostrf(adt_tflash,fffixed, 5, 4);
  if otg_plotn=-1000 then
    maskedit5.Text:=''
  else
    maskedit5.Text:=floattostrf(otg_plotn,fffixed, 5, 4);
  if otg_t=-1000 then
    edit7.Text:=''
  else
    edit7.Text:=floattostrf(otg_t,fffixed, 5, 4);
  if otg_plotn20=-1000 then
    maskedit6.Text:=''
  else
    maskedit6.Text:=floattostrf(otg_plotn20,fffixed, 5, 4);
  if otg_tflash=-1000 then
    edit4.Text:=''
  else
    edit4.Text:=floattostrf(otg_tflash,fffixed, 5, 4);
 end;
except
 exit;
end;
end;

procedure TinputChemicalData.MaskEdit1Change(Sender: TObject);
begin
try
 fbgs_plotn:=strtofloat(maskedit1.text);
 if edit5.Text='' then

 else
  begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name=:a and plotn like :b');
    query.Parameters[0].Value:=fbgs_t;
    query.Parameters[1].Value:=fbgs_plotn;
    query.Open;
    if query.FieldByName('plotn20').Asstring='' then
      fbgs_plotn20:=-1000
    else
      fbgs_plotn20:=strtofloat(query.FieldByName('plotn20').Asstring);
    if fbgs_plotn20=-1000 then
      maskedit2.Text:=''
    else
      maskedit2.Text:=floattostrf(fbgs_plotn20, fffixed, 5,4);
  end;
except
 exit;
end;
end;

procedure TinputChemicalData.MaskEdit3Change(Sender: TObject);
begin
try
 if MaskEdit3.Text=' ,    ' then
   adt_plotn:=-1000
 else
   adt_plotn:=strtofloat(MaskEdit3.Text);
   if edit6.Text='' then

   else
    begin
     query.Close;
     query.SQL.Clear;
     query.SQL.add('select plotn20 from dbo.v_plotn20 where temper_name=:a and plotn like :b');
     query.Parameters[0].Value:=fbgs_t;
     query.Parameters[1].Value:=fbgs_plotn;
     query.Open;
     if query.FieldByName('plotn20').Asstring='' then
       adt_plotn20:=-1000
     else
       adt_plotn20:=strtofloat(query.FieldByName('plotn20').Asstring);
     if adt_plotn20=-1000 then
       maskedit4.Text:=''
     else
       maskedit4.Text:=floattostrf(adt_plotn20, fffixed, 5,4);
    end;
except
  exit;
end;
end;

procedure TinputChemicalData.MaskEdit5Change(Sender: TObject);
begin
try
 if MaskEdit5.Text=' ,    ' then
  otg_plotn:=-1000
 else
  otg_plotn:=strtofloat(MaskEdit5.Text);
 if edit7.Text='' then

 else
  begin
   query.Close;
   query.SQL.Clear;
   query.SQL.add('select plotn20 from dbo.v_plotn20 where temper_name=:a and plotn like :b');
   query.Parameters[0].Value:=otg_t;
   query.Parameters[1].Value:=otg_plotn;
   query.Open;
   if query.FieldByName('plotn20').Asstring='' then
     otg_plotn20:=-1000
   else
     otg_plotn20:=strtofloat(query.FieldByName('plotn20').Asstring);
   if otg_plotn20=-1000 then
     maskedit6.Text:=''
   else
     maskedit6.Text:=floattostrf(otg_plotn20, fffixed, 5,4);
  end;

except
 exit;
end;
end;

procedure TinputChemicalData.Button1Click(Sender: TObject);
var
 query_str:string;
begin
  query.Close;
  query.SQL.Clear;
  query_str:='update dbo.chemicalanalisis set fbgs_p=:fp, fbgs_t=:ft, fbgs_p20=:fp20, fbgs_tkk=:ftkk,';
  query_str:=query_str+'adt_p=:ap, adt_t=:at, adt_p20=:ap20, adt_tdark=:atdark, adt_tflash=:atflash, ';
  query_str:=query_str+'otg_p=:op, otg_t=:ot, otg_p20=:op20, otg_tflash=:otflash where andate=:ad and antime=:at';
  query.SQL.Add(query_str);
  if fbgs_plotn=-1000 then
   query.Parameters[0].Value:=null
  else
   query.Parameters[0].Value:=fbgs_plotn;
  if fbgs_t=-1000 then
   query.Parameters[1].Value:=null
  else
   query.Parameters[1].Value:=fbgs_t;
  if fbgs_plotn20=-1000 then
   query.Parameters[2].Value:=null
  else
   query.Parameters[2].Value:=fbgs_plotn20;
  if fbgs_tkk=-1000 then
   query.Parameters[3].Value:=null
  else
   query.Parameters[3].Value:=fbgs_tkk;
  if adt_plotn=-1000 then
   query.Parameters[4].Value:=null
  else
   query.Parameters[4].Value:=adt_plotn;
  if adt_t=-1000 then
   query.Parameters[5].Value:=null
  else
   query.Parameters[5].Value:=adt_t;
  if adt_plotn20=-1000 then
   query.Parameters[6].Value:=null
  else
   query.Parameters[6].Value:=adt_plotn20;
  if adt_tpom=-1000 then
   query.Parameters[7].Value:=null
  else
   query.Parameters[7].Value:=adt_tpom;
  if adt_tflash=-1000 then
   query.Parameters[8].Value:=null
  else
   query.Parameters[8].Value:=adt_tflash;
  if otg_plotn=-1000  then
   query.Parameters[9].Value:=null
  else
   query.Parameters[9].Value:=otg_plotn;
  if otg_t=-1000 then
   query.Parameters[10].Value:=null
  else
   query.Parameters[10].Value:=otg_t;
  if otg_plotn20=-1000 then
   query.Parameters[11].Value:=null
  else
   query.Parameters[11].Value:=otg_plotn20;
  if otg_tflash=-1000 then
   query.Parameters[12].Value:=null
  else
   query.Parameters[12].Value:=otg_tflash;
  if length(analisdate.Text)=10 then
   query.Parameters[13].Value:=analisdate.Text
  else
   query.Parameters[13].Value:='0'+analisdate.Text;
  if length(analistime.Text)<>8 then
   query.Parameters[14].Value:='0'+analistime.Text
  else
   query.Parameters[14].Value:=analistime.Text;
  query.ExecSQL;
 initfrm;
 button3.Enabled:=true;
 button1.Enabled:=false;
 timer1.Enabled:=true;
end;

procedure TinputChemicalData.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TinputChemicalData.Button3Click(Sender: TObject);
begin
 timer1.Enabled:=false;
 query.Close;
 query.SQL.Clear;
 query.sql.Add('insert into dbo.chemicalanalisis (andate, antime) values (:ad, :at)');
 if length(analisdate.Text)=10 then
  query.Parameters[0].Value:=analisdate.Text
 else
  query.Parameters[0].Value:=''+analisdate.Text;
 if length(analistime.Text)=8 then
  query.Parameters[1].Value:=analistime.Text
 else
  query.Parameters[1].Value:=''+analistime.Text;
 query.ExecSQL;
 button3.Enabled:=false;
 initfrm;
end;

procedure TinputChemicalData.Edit1Change(Sender: TObject);
begin
try
 if edit1.Text='' then
   fbgs_tkk:=-1000
 else
   fbgs_tkk:=strtofloat(edit1.Text);
except
 exit;
end;
end;

procedure TinputChemicalData.Edit2Change(Sender: TObject);
begin
try
 if edit2.Text='' then
  adt_tpom:=-1000
 else
  adt_tpom:=strtofloat(edit2.Text);
except
  exit;
end;
end;

procedure TinputChemicalData.Edit3Change(Sender: TObject);
begin
try
 if edit3.Text='' then
  adt_tflash:=-1000
 else
  adt_tflash:=strtofloat(edit3.Text);
except
  exit;
end;
end;

procedure TinputChemicalData.Edit4Change(Sender: TObject);
begin
try
 if edit4.Text='' then
  otg_tflash:=-1000
 else
  otg_tflash:=strtofloat(edit4.Text);
except

end;
end;

procedure TinputChemicalData.Edit5Change(Sender: TObject);
begin
try
 if edit5.text='' then
  fbgs_t:=-1000
 else
  fbgs_t:=strtofloat(edit5.text);
 if maskedit1.Text='' then

 else
  begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name=:a and plotn like :b');
    query.Parameters[0].Value:=fbgs_t;
    query.Parameters[1].Value:=fbgs_plotn;
    query.Open;
    if query.FieldByName('plotn20').Asstring='' then
      fbgs_plotn20:=-1000
    else
      fbgs_plotn20:=strtofloat(query.FieldByName('plotn20').Asstring);
    if fbgs_plotn20=-1000 then
      maskedit2.Text:=''
    else
      maskedit2.Text:=floattostrf(fbgs_plotn20, fffixed, 5, 4);
  end;
except
 exit;
end;
end;

procedure TinputChemicalData.Edit6Change(Sender: TObject);
begin
try
 if edit6.Text='' then
  adt_t:=-1000
 else
  adt_t:=strtofloat(edit6.Text);
 if adt_plotn=-1000 then

 else
  begin
   query.Close;
   query.SQL.Clear;
   query.SQL.add('select plotn20 from dbo.v_plotn20 where temper_name=:a and plotn like :b');
   query.Parameters[0].Value:=fbgs_t;
   query.Parameters[1].Value:=fbgs_plotn;
   query.Open;
   if query.FieldByName('plotn20').Asstring='' then
     adt_plotn20:=-1000
   else
     adt_plotn20:=strtofloat(query.FieldByName('plotn20').Asstring);
   if adt_plotn20=-1000 then
     maskedit4.Text:=''
   else
     maskedit4.Text:=floattostrf(adt_plotn20, fffixed, 5,4);
  end;
 
except

end;
end;

procedure TinputChemicalData.Edit7Change(Sender: TObject);
begin
try
 if edit7.Text='' then
   otg_t:=-1000
 else
   otg_t:=strtofloat(edit7.Text);
 if maskedit5.Text=' ,    ' then

 else
  begin
   query.Close;
   query.SQL.Clear;
   query.SQL.add('select plotn20 from dbo.v_plotn20 where temper_name=:a and plotn like :b');
   query.Parameters[0].Value:=otg_t;
   query.Parameters[1].Value:=otg_plotn;
   query.Open;
   if query.FieldByName('plotn20').Asstring='' then
     otg_plotn20:=-1000
   else
     otg_plotn20:=strtofloat(query.FieldByName('plotn20').Asstring);
   if otg_plotn20=-1000 then
     maskedit6.Text:=''
   else
     maskedit6.Text:=floattostrf(otg_plotn20, fffixed, 5,4);
  end;

except
 exit;
end;
end;

procedure TinputChemicalData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 query.Free;
 Action:=cafree;
end;

procedure TinputChemicalData.FormCreate(Sender: TObject);
begin
query:=tadoquery.Create(nil);
query.Connection:=dm.alexpromcon;
initfrm;
end;

procedure TinputChemicalData.Timer1Timer(Sender: TObject);
begin
 analisdate.Text:=datetostr(now);
 analistime.Text:=timetostr(now);
end;

end.

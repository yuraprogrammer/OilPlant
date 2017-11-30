unit U_newLabAkt;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, Mask, adodb, DB, RpCon, RpConDS,
  RpDefine, RpRave;

type
  TfrmNewLabAkt = class(TForm)
    Label1: TLabel;
    ListView1: TListView;
    Label2: TLabel;
    GroupBox1: TGroupBox;
    Panel1: TPanel;
    MaskEdit1: TMaskEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    GroupBox2: TGroupBox;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit17: TMaskEdit;
    MaskEdit18: TMaskEdit;
    GroupBox3: TGroupBox;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel28: TPanel;
    GroupBox4: TGroupBox;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    Panel37: TPanel;
    MaskEdit19: TMaskEdit;
    MaskEdit20: TMaskEdit;
    MaskEdit21: TMaskEdit;
    MaskEdit22: TMaskEdit;
    MaskEdit23: TMaskEdit;
    MaskEdit24: TMaskEdit;
    MaskEdit25: TMaskEdit;
    MaskEdit26: TMaskEdit;
    MaskEdit27: TMaskEdit;
    Panel27: TPanel;
    MaskEdit28: TMaskEdit;
    MaskEdit29: TMaskEdit;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    MaskEdit30: TMaskEdit;
    MaskEdit31: TMaskEdit;
    MaskEdit32: TMaskEdit;
    MaskEdit33: TMaskEdit;
    MaskEdit34: TMaskEdit;
    MaskEdit35: TMaskEdit;
    MaskEdit36: TMaskEdit;
    MaskEdit37: TMaskEdit;
    MaskEdit38: TMaskEdit;
    RvProject1: TRvProject;
    RvDataSetConnection5: TRvDataSetConnection;
    ADOQuery1: TADOQuery;
    procedure MaskEdit26Change(Sender: TObject);
    procedure MaskEdit25Change(Sender: TObject);
    procedure MaskEdit22Change(Sender: TObject);
    procedure MaskEdit21Change(Sender: TObject);
    procedure MaskEdit20Change(Sender: TObject);
    procedure MaskEdit19Change(Sender: TObject);
    procedure MaskEdit17Change(Sender: TObject);
    procedure MaskEdit16Change(Sender: TObject);
    procedure MaskEdit13Change(Sender: TObject);
    procedure MaskEdit12Change(Sender: TObject);
    procedure MaskEdit11Change(Sender: TObject);
    procedure MaskEdit10Change(Sender: TObject);
    procedure MaskEdit38Change(Sender: TObject);
    procedure MaskEdit37Change(Sender: TObject);
    procedure MaskEdit36Change(Sender: TObject);
    procedure MaskEdit35Change(Sender: TObject);
    procedure MaskEdit34Change(Sender: TObject);
    procedure MaskEdit33Change(Sender: TObject);
    procedure MaskEdit32Change(Sender: TObject);
    procedure MaskEdit31Change(Sender: TObject);
    procedure MaskEdit30Change(Sender: TObject);
    procedure MaskEdit9Change(Sender: TObject);
    procedure MaskEdit8Change(Sender: TObject);
    procedure MaskEdit7Change(Sender: TObject);
    procedure MaskEdit6Change(Sender: TObject);
    procedure MaskEdit5Change(Sender: TObject);
    procedure MaskEdit4Change(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure MaskEdit2Change(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure ListView1Click(Sender: TObject);
  private
    { Private declarations }
    procedure initfrm;
    procedure savedata(id:longint;mode:byte);
    procedure selectakt(aktnum:longint);
    function checklost(fbgs, adt, otg, water, paraf :integer):integer;
    function checklights(fbgs, adt, paraf :integer):integer;
  public
    { Public declarations }
  end;

var
  frmNewLabAkt: TfrmNewLabAkt;
  query:tadoquery;
  pkey:longint;
  fbgs_tn, fbgs_t10, fbgs_t15, fbgs_t20, fbgs_t25, fbgs_t30, fbgs_t35, fbgs_t40, fbgs_t45:integer;
  adt_tn, adt_t10, adt_t15, adt_t20, adt_t25, adt_t30, adt_t35, adt_t40, adt_tkk:integer;
  p20, p20task, fbgs_p20, adt_p20:real;
  fbgs_perc, adt_perc, otg_perc, light_perc, lost_perc, water_perc, paraf_perc, cl_perc:integer;
  fbgs_task, adt_task, otg_task, light_task, lost_task, water_task, paraf_task, cl_task:integer;
implementation

uses u_dm;

{$R *.dfm}

function TfrmNewLabAkt.checklost(fbgs: Integer; adt: Integer; otg: Integer; water: Integer; paraf: Integer): Integer;
begin
result:=100-fbgs-adt-otg-paraf-water;
end;

function TfrmNewLabAkt.checklights(fbgs: Integer; adt: Integer; paraf: Integer): Integer;
begin
result:=abs(-fbgs-adt-paraf);
end;

procedure TfrmNewLabAkt.initfrm;
var
 li:tlistitem;
begin
  listview1.Clear;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.v_aktlab order by aktnum ');
  query.Open;
  query.First;
  while not query.Eof do
   begin
     li:=listview1.Items.Add;
     li.Caption:=query.FieldByName('aktnum').AsString;
     li.SubItems.Add(query.FieldByName('aktdate').AsString);
     li.SubItems.Add(query.FieldByName('mat_name').AsString);
     li.SubItems.Add(query.FieldByName('a_matlevel').AsString);
     li.SubItems.Add(query.FieldByName('a_plotn').AsString);
     li.SubItems.Add(query.FieldByName('a_temper').AsString);
     query.Next;
   end;
end;

procedure TfrmNewLabAkt.selectakt(aktnum: Integer);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.v_aktlab where aktnum=:an');
 query.Parameters[0].Value:=aktnum;
 query.Open;
 query.First;
 if query.FieldByName('fbgs_tn').AsString='' then
  fbgs_tn:=-1000
 else
  fbgs_tn:=query.FieldByName('fbgs_tn').Asinteger;
 maskedit1.Text:=query.FieldByName('fbgs_tn').AsString;
 if query.FieldByName('fbgs_t10').AsString='' then
  fbgs_t10:=-1000
 else
  fbgs_t10:=query.FieldByName('fbgs_t10').Asinteger;
 maskedit2.Text:=query.FieldByName('fbgs_t10').AsString;
 if query.FieldByName('fbgs_t15').AsString='' then
  fbgs_t15:=-1000
 else
  fbgs_t15:=query.FieldByName('fbgs_t15').Asinteger;
 maskedit3.Text:=query.FieldByName('fbgs_t15').AsString;
 if query.FieldByName('fbgs_t20').AsString='' then
  fbgs_t20:=-1000
 else
  fbgs_t20:=query.FieldByName('fbgs_t20').Asinteger;
 maskedit4.Text:=query.FieldByName('fbgs_t20').AsString;
 if query.FieldByName('fbgs_t25').AsString='' then
  fbgs_t25:=-1000
 else
  fbgs_t25:=query.FieldByName('fbgs_t25').Asinteger;
 maskedit5.Text:=query.FieldByName('fbgs_t25').AsString;
 if query.FieldByName('fbgs_t30').AsString='' then
  fbgs_t30:=-1000
 else
  fbgs_t30:=query.FieldByName('fbgs_t30').Asinteger;
 maskedit6.Text:=query.FieldByName('fbgs_t30').AsString;
 if query.FieldByName('fbgs_t35').AsString='' then
  fbgs_t35:=-1000
 else
  fbgs_t35:=query.FieldByName('fbgs_t35').Asinteger;
 maskedit7.Text:=query.FieldByName('fbgs_t35').AsString;
 if query.FieldByName('fbgs_t40').AsString='' then
  fbgs_t40:=-1000
 else
  fbgs_t40:=query.FieldByName('fbgs_t40').Asinteger;
 maskedit8.Text:=query.FieldByName('fbgs_t40').AsString;
 if query.FieldByName('fbgs_t45').AsString='' then
  fbgs_t45:=-1000
 else
  fbgs_t45:=query.FieldByName('fbgs_t45').Asinteger;
 maskedit9.Text:=query.FieldByName('fbgs_t45').AsString;
 if query.FieldByName('adt_tn').AsString='' then
  adt_tn:=-1000
 else
  adt_tn:=query.FieldByName('adt_tn').Asinteger;
 maskedit30.Text:=query.FieldByName('adt_tn').AsString;
 if query.FieldByName('adt_t10').AsString='' then
  adt_t10:=-1000
 else
  adt_t10:= query.FieldByName('adt_t10').Asinteger;
 maskedit31.Text:=query.FieldByName('adt_t10').AsString;
 if query.FieldByName('adt_t15').AsString='' then
  adt_t15:=-1000
 else
  adt_t15:=query.FieldByName('adt_t15').Asinteger;
 maskedit32.Text:=query.FieldByName('adt_t15').AsString;
 if query.FieldByName('adt_t20').AsString='' then
  adt_t20:=1000
 else
  adt_t20:=query.FieldByName('adt_t20').Asinteger;
 maskedit33.Text:=query.FieldByName('adt_t20').AsString;
 if query.FieldByName('adt_t25').AsString='' then
  adt_t25:=-1000
 else
  adt_t25:=query.FieldByName('adt_t25').Asinteger;
 maskedit34.Text:=query.FieldByName('adt_t25').AsString;
 if query.FieldByName('adt_t30').AsString='' then
  adt_t30:=-1000
 else
  adt_t30:=query.FieldByName('adt_t30').Asinteger;
 maskedit35.Text:=query.FieldByName('adt_t30').AsString;
 if query.FieldByName('adt_t35').AsString='' then
  adt_t35:=-1000
 else
  adt_t35:=query.FieldByName('adt_t35').Asinteger;
 maskedit36.Text:=query.FieldByName('adt_t35').AsString;
 if query.FieldByName('adt_t40').AsString='' then
  adt_t40:=-1000
 else
  adt_t40:=query.FieldByName('adt_t40').Asinteger;
 maskedit37.Text:=query.FieldByName('adt_t40').AsString;
 if query.FieldByName('adt_tkk').AsString='' then
  adt_tkk:=-1000
 else
  adt_tkk:=query.FieldByName('adt_tkk').Asinteger;
 maskedit38.Text:=query.FieldByName('adt_tkk').AsString;
 if query.FieldByName('p20').AsString='' then
  p20:=0
 else
  p20:=query.FieldByName('p20').Asfloat;
 maskedit10.Text:=query.FieldByName('p20').AsString;
 if query.FieldByName('p20_task').AsString='' then
  p20task:=0
 else
  p20task:= query.FieldByName('p20_task').Asfloat;
 maskedit19.Text:=query.FieldByName('p20_task').AsString;
 if query.FieldByName('fbgs_p20').AsString='' then
  fbgs_p20:=0
 else
  fbgs_p20:=query.FieldByName('fbgs_p20').Asfloat;
 maskedit28.Text:=query.FieldByName('fbgs_p20').AsString;
 if query.FieldByName('adt_p20').AsString='' then
  adt_p20:=0
 else
  adt_p20:=query.FieldByName('adt_p20').Asfloat;
 maskedit29.Text:=query.FieldByName('adt_p20').AsString;
 if query.FieldByName('fbgs_perc').AsString='' then
  fbgs_perc:=0
 else
  fbgs_perc:=query.FieldByName('fbgs_perc').Asinteger;
 maskedit11.Text:=query.FieldByName('fbgs_perc').AsString;
 if query.FieldByName('adt_perc').AsString='' then
  adt_perc:=0
 else
  adt_perc:=query.FieldByName('adt_perc').Asinteger;
 maskedit12.Text:=query.FieldByName('adt_perc').AsString;
 if query.FieldByName('otg_perc').AsString='' then
  otg_perc:=0
 else
  otg_perc:=query.FieldByName('otg_perc').Asinteger;
 maskedit13.Text:=query.FieldByName('otg_perc').AsString;
 if query.FieldByName('light_perc').AsString='' then
  light_perc:=0
 else
  light_perc:=query.FieldByName('light_perc').Asinteger;
 maskedit14.Text:=query.FieldByName('light_perc').AsString;
 if query.FieldByName('lost_perc').AsString='' then
  lost_perc:=0
 else
  lost_perc:=query.FieldByName('lost_perc').Asinteger;
 maskedit15.Text:=query.FieldByName('lost_perc').AsString;
 if query.FieldByName('water_perc').AsString='' then
  water_perc:=0
 else
  water_perc:=query.FieldByName('water_perc').Asinteger;
 maskedit16.Text:=query.FieldByName('water_perc').AsString;
 if query.FieldByName('paraf_perc').AsString='' then
  paraf_perc:=0
 else
  paraf_perc:=query.FieldByName('paraf_perc').Asinteger;
 maskedit17.Text:=query.FieldByName('paraf_perc').AsString;
 if query.FieldByName('cl_perc').AsString='' then
  cl_perc:=0
 else
  cl_perc:=query.FieldByName('cl_perc').Asinteger;
 maskedit18.Text:=query.FieldByName('cl_perc').AsString;
 if query.FieldByName('fbgs_perc_task').AsString='' then
  fbgs_task:=0
 else
  fbgs_task:=query.FieldByName('fbgs_perc_task').Asinteger;
 maskedit20.Text:=query.FieldByName('fbgs_perc_task').AsString;
 if query.FieldByName('adt_perc_task').AsString='' then
  adt_task:=0
 else
  adt_task:=query.FieldByName('adt_perc_task').Asinteger;
 maskedit21.Text:=query.FieldByName('adt_perc_task').AsString;
 if query.FieldByName('otg_perc_task').AsString='' then
  otg_task:=0
 else
  otg_task:=query.FieldByName('otg_perc_task').Asinteger;
 maskedit22.Text:=query.FieldByName('otg_perc_task').AsString;
 if query.FieldByName('light_perc_task').AsString='' then
  light_task:=0
 else
  light_task:=query.FieldByName('light_perc_task').Asinteger;
 maskedit23.Text:=query.FieldByName('light_perc_task').AsString;
 if query.FieldByName('lost_perc_task').AsString='' then
  lost_task:=0
 else
  lost_task:=query.FieldByName('lost_perc_task').Asinteger;
 maskedit24.Text:=query.FieldByName('lost_perc_task').AsString;
 if query.FieldByName('water_perc_task').AsString='' then
  water_task:=0
 else
  water_task:=query.FieldByName('water_perc_task').Asinteger;
 maskedit25.Text:=query.FieldByName('water_perc_task').AsString;
 if query.FieldByName('paraf_perc_task').AsString='' then
  paraf_task:=0
 else
  paraf_task:=query.FieldByName('paraf_perc_task').Asinteger;
 maskedit26.Text:=query.FieldByName('paraf_perc_task').AsString;
 if query.FieldByName('cl_perc_task').AsString='' then
  cl_task:=0
 else
  cl_task:=query.FieldByName('cl_perc_task').Asinteger;
 maskedit27.Text:=query.FieldByName('cl_perc_task').AsString;
end;

procedure TfrmNewLabAkt.savedata(id:longint; mode:byte);
begin
try
 case mode of
 0:begin
 
 button1.Enabled:=false;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update dbo.akt_lab ');
 query.SQL.Add(' set fbgs_tn=:a, ');
 query.SQL.Add(' fbgs_t10=:b, ');
 query.SQL.Add(' fbgs_t15=:c, ');
 query.SQL.Add(' fbgs_t20=:d, ');
 query.SQL.Add(' fbgs_t25=:e, ');
 query.SQL.Add(' fbgs_t30=:f, ');
 query.SQL.Add(' fbgs_t35=:g, ');
 query.SQL.Add(' fbgs_t40=:h, ');
 query.SQL.Add(' fbgs_t45=:i, ');
 query.SQL.Add(' adt_tn=:j, ');
 query.SQL.Add(' adt_t10=:k, ');
 query.SQL.Add(' adt_t15=:l, ');
 query.SQL.Add(' adt_t20=:m, ');
 query.SQL.Add(' adt_t25=:n, ');
 query.SQL.Add(' adt_t30=:o, ');
 query.SQL.Add(' adt_t35=:p, ');
 query.SQL.Add(' adt_t40=:q, ');
 query.SQL.Add(' adt_tkk=:r ');
 query.SQL.Add(' where aktnum=:s ');
 query.Parameters[0].Value:=fbgs_tn;
 query.Parameters[1].Value:=fbgs_t10;
 query.Parameters[2].Value:=fbgs_t15;
 query.Parameters[3].Value:=fbgs_t20;
 query.Parameters[4].Value:=fbgs_t25;
 query.Parameters[5].Value:=fbgs_t30;
 query.Parameters[6].Value:=fbgs_t35;
 query.Parameters[7].Value:=fbgs_t40;
 query.Parameters[8].Value:=fbgs_t45;
 query.Parameters[9].Value:=adt_tn;
 query.Parameters[10].Value:=adt_t10;
 query.Parameters[11].Value:=adt_t15;
 query.Parameters[12].Value:=adt_t20;
 query.Parameters[13].Value:=adt_t25;
 query.Parameters[14].Value:=adt_t30;
 query.Parameters[15].Value:=adt_t35;
 query.Parameters[16].Value:=adt_t40;
 query.Parameters[17].Value:=adt_tkk;
 query.Parameters[18].Value:=pkey;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update dbo.frc_sirie ');
 query.SQL.Add(' set p20=:a, ');
 query.SQL.Add(' fbgs_perc=:b, ');
 query.SQL.Add(' adt_perc=:c, ');
 query.SQL.Add(' otg_perc=:d, ');
 query.SQL.Add(' light_perc=:e, ');
 query.SQL.Add(' lost_perc=:f, ');
 query.SQL.Add(' water_perc=:g, ');
 query.SQL.Add(' paraf_perc=:h, ');
 query.SQL.Add(' cl_perc=:i ');
 query.SQL.Add(' where aktnum=:s ');
 query.Parameters[0].Value:=p20;
 query.Parameters[1].Value:=fbgs_perc;
 query.Parameters[2].Value:=adt_perc;
 query.Parameters[3].Value:=otg_perc;
 query.Parameters[4].Value:=light_perc;
 query.Parameters[5].Value:=lost_perc;
 query.Parameters[6].Value:=water_perc;
 query.Parameters[7].Value:=paraf_perc;
 query.Parameters[8].Value:=cl_perc;
 query.Parameters[9].Value:=pkey;
 query.ExecSQL;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update dbo.frc_sirie_task ');
 query.SQL.Add(' set p20=:a, ');
 query.SQL.Add(' fbgs_perc=:b, ');
 query.SQL.Add(' fbgs_p20=:j, ');
 query.SQL.Add(' adt_perc=:c, ');
 query.SQL.Add(' adt_p20=:k, ');
 query.SQL.Add(' otg_perc=:d, ');
 query.SQL.Add(' light_perc=:e, ');
 query.SQL.Add(' lost_perc=:f, ');
 query.SQL.Add(' water_perc=:g, ');
 query.SQL.Add(' paraf_perc=:h, ');
 query.SQL.Add(' cl_perc=:i ');
 query.SQL.Add(' where aktnum=:s ');
 query.Parameters[0].Value:=p20task;
 query.Parameters[1].Value:=fbgs_task;
 query.Parameters[2].Value:=fbgs_p20;
 query.Parameters[3].Value:=adt_task;
 query.Parameters[4].Value:=adt_p20;
 query.Parameters[5].Value:=otg_task;
 query.Parameters[6].Value:=light_task;
 query.Parameters[7].Value:=lost_task;
 query.Parameters[8].Value:=water_task;
 query.Parameters[9].Value:=paraf_task;
 query.Parameters[10].Value:=cl_task;
 query.Parameters[11].Value:=pkey;
 query.ExecSQL;
 showmessage('ok');
 end;
 1:begin
   query.Close;
   query.SQL.Clear;
   query.SQL.Add('update dbo.akt_lab set in_use=0 where aktnum=:an');
   query.Parameters[0].Value:=pkey;
   query.ExecSQL;
 end;
 end;
 button1.Enabled:=true;
 initfrm;
except
 showmessage('ooooooo');
 exit;
 button1.Enabled:=true;
end;
end;

procedure TfrmNewLabAkt.ListView1Click(Sender: TObject);
begin
pkey:=strtoint(ListView1.Items.Item[ListView1.ItemIndex].Caption);
button1.Enabled:=true;
selectakt(pkey);
end;

procedure TfrmNewLabAkt.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if selected then
 begin
  pkey:=strtoint(item.Caption);
  button1.Enabled:=true;
  selectakt(pkey);
 end
else
 begin
  pkey:=-1;
  button1.Enabled:=false
 end; 

end;

procedure TfrmNewLabAkt.MaskEdit10Change(Sender: TObject);
begin
try
if maskedit10.Text=',' then
 p20:=0
else
 p20:=strtofloat(trim(maskedit10.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit11Change(Sender: TObject);
begin
try
if maskedit11.Text='' then
 fbgs_perc:=0
else
 fbgs_perc:=strtoint(trim(maskedit11.text));
 lost_perc:=checklost(fbgs_perc, adt_perc, otg_perc, water_perc, paraf_perc);
 maskedit15.Text:=inttostr(lost_perc);
 light_perc:=checklights(fbgs_perc, adt_perc, paraf_perc);
 maskedit14.Text:=inttostr(light_perc);

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit12Change(Sender: TObject);
begin
try
if maskedit12.Text='' then
 adt_perc:=0
else
 adt_perc:=strtoint(trim(maskedit12.text));
 lost_perc:=checklost(fbgs_perc, adt_perc, otg_perc, water_perc, paraf_perc);
 maskedit15.Text:=inttostr(lost_perc);
 light_perc:=checklights(fbgs_perc, adt_perc, paraf_perc);
 maskedit14.Text:=inttostr(light_perc);

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit13Change(Sender: TObject);
begin
try
if maskedit13.Text='' then
 otg_perc:=0
else
 otg_perc:=strtoint(trim(maskedit13.text));
 lost_perc:=checklost(fbgs_perc, adt_perc, otg_perc, water_perc, paraf_perc);
 maskedit15.Text:=inttostr(lost_perc);
 light_perc:=checklights(fbgs_perc, adt_perc, paraf_perc);
 maskedit14.Text:=inttostr(light_perc);

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit16Change(Sender: TObject);
begin
try
if maskedit16.Text='' then
 water_perc:=0
else
 water_perc:=strtoint(trim(maskedit16.text));
 lost_perc:=checklost(fbgs_perc, adt_perc, otg_perc, water_perc, paraf_perc);
 maskedit15.Text:=inttostr(lost_perc);
 light_perc:=checklights(fbgs_perc, adt_perc, paraf_perc);
 maskedit14.Text:=inttostr(light_perc);

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit17Change(Sender: TObject);
begin
try
if maskedit17.Text='' then
 paraf_perc:=0
else
 paraf_perc:=strtoint(trim(maskedit17.text));
 lost_perc:=checklost(fbgs_perc, adt_perc, otg_perc, water_perc, paraf_perc);
 maskedit15.Text:=inttostr(lost_perc);
 light_perc:=checklights(fbgs_perc, adt_perc, paraf_perc);
 maskedit14.Text:=inttostr(light_perc);

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit19Change(Sender: TObject);
begin
try
if maskedit19.Text=',' then
 p20task:=0
else
 p20task:=strtofloat(trim(maskedit19.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit1Change(Sender: TObject);
begin
try
if maskedit1.text='' then
 fbgs_tn:=-1000
else
 fbgs_tn:=strtoint(trim(maskedit1.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit20Change(Sender: TObject);
begin
try
if maskedit20.Text='' then
 fbgs_task:=0
else
 fbgs_task:=strtoint(trim(maskedit20.text));
 lost_task:=checklost(fbgs_task, adt_task, otg_task, water_task, paraf_task);
 maskedit24.Text:=inttostr(lost_task);
 light_task:=checklights(fbgs_task, adt_task, paraf_task);
 maskedit23.Text:=inttostr(light_task);

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit21Change(Sender: TObject);
begin
try
if maskedit21.Text='' then
 adt_task:=0
else
 adt_task:=strtoint(trim(maskedit21.text));
 lost_task:=checklost(fbgs_task, adt_task, otg_task, water_task, paraf_task);
 maskedit24.Text:=inttostr(lost_task);
 light_task:=checklights(fbgs_task, adt_task, paraf_task);
 maskedit23.Text:=inttostr(light_task);

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit22Change(Sender: TObject);
begin
try
if maskedit22.Text='' then
 otg_task:=0
else
 otg_task:=strtoint(trim(maskedit22.text));
 lost_task:=checklost(fbgs_task, adt_task, otg_task, water_task, paraf_task);
 maskedit24.Text:=inttostr(lost_task);
 light_task:=checklights(fbgs_task, adt_task, paraf_task);
 maskedit23.Text:=inttostr(light_task);

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit25Change(Sender: TObject);
begin
try
if maskedit25.Text='' then
 water_task:=0
else
 water_task:=strtoint(trim(maskedit25.text));
 lost_task:=checklost(fbgs_task, adt_task, otg_task, water_task, paraf_task);
 maskedit24.Text:=inttostr(lost_task);
 light_task:=checklights(fbgs_task, adt_task, paraf_task);
 maskedit23.Text:=inttostr(light_task);

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit26Change(Sender: TObject);
begin
try
if maskedit26.Text='' then
 paraf_task:=0
else
 paraf_task:=strtoint(trim(maskedit26.text));
 lost_task:=checklost(fbgs_task, adt_task, otg_task, water_task, paraf_task);
 maskedit24.Text:=inttostr(lost_task);
 light_task:=checklights(fbgs_task, adt_task, paraf_task);
 maskedit23.Text:=inttostr(light_task);

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit2Change(Sender: TObject);
begin
try
if maskedit2.text='' then
 fbgs_t10:=-1000
else
 fbgs_t10:=strtoint(trim(maskedit2.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit30Change(Sender: TObject);
begin
try
if maskedit30.text='' then
 adt_tn:=-1000
else
 adt_tn:=strtoint(trim(maskedit30.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit31Change(Sender: TObject);
begin
try
if maskedit31.text='' then
 adt_t10:=-1000
else
 adt_t10:=strtoint(trim(maskedit31.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit32Change(Sender: TObject);
begin
try
if maskedit32.text='' then
 adt_t15:=-1000
else
 adt_t15:=strtoint(trim(maskedit32.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit33Change(Sender: TObject);
begin
try
if maskedit33.text='' then
 adt_t20:=-1000
else
 adt_t20:=strtoint(trim(maskedit33.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit34Change(Sender: TObject);
begin
try
if maskedit34.text='' then
 adt_t25:=-1000
else
 adt_t25:=strtoint(trim(maskedit34.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit35Change(Sender: TObject);
begin
try
if maskedit35.text='' then
 adt_t30:=-1000
else
 adt_t30:=strtoint(trim(maskedit35.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit36Change(Sender: TObject);
begin
try
if maskedit36.text='' then
 adt_t35:=-1000
else
 adt_t35:=strtoint(trim(maskedit36.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit37Change(Sender: TObject);
begin
try
if maskedit37.text='' then
 adt_t40:=-1000
else
 adt_t40:=strtoint(trim(maskedit37.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit38Change(Sender: TObject);
begin
try
if maskedit38.text='' then
 adt_tkk:=-1000
else
 adt_tkk:=strtoint(trim(maskedit38.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit3Change(Sender: TObject);
begin
try
if maskedit3.text='' then
 fbgs_t15:=-1000
else
 fbgs_t15:=strtoint(trim(maskedit3.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit4Change(Sender: TObject);
begin
try
if maskedit4.text='' then
 fbgs_t20:=-1000
else
 fbgs_t20:=strtoint(trim(maskedit4.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit5Change(Sender: TObject);
begin
try
if maskedit5.text='' then
 fbgs_t25:=-1000
else
 fbgs_t25:=strtoint(trim(maskedit5.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit6Change(Sender: TObject);
begin
try
if maskedit6.text='' then
 fbgs_t30:=-1000
else
 fbgs_t30:=strtoint(trim(maskedit6.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit7Change(Sender: TObject);
begin
try
if maskedit7.text='' then
 fbgs_t35:=-1000
else
 fbgs_t35:=strtoint(trim(maskedit7.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit8Change(Sender: TObject);
begin
try
if maskedit8.text='' then
 fbgs_t40:=-1000
else
 fbgs_t40:=strtoint(trim(maskedit8.text));

except

end;
end;

procedure TfrmNewLabAkt.MaskEdit9Change(Sender: TObject);
begin
try
if maskedit9.text='' then
 fbgs_t45:=-1000
else
 fbgs_t45:=strtoint(trim(maskedit9.text));

except

end;
end;

procedure TfrmNewLabAkt.Button1Click(Sender: TObject);
begin
 savedata(pkey, 0);
 button2.Enabled:=true;
end;

procedure TfrmNewLabAkt.Button2Click(Sender: TObject);
begin
if messagedlg('После вывода на печать изменение данных будет невозможно. подтверждите.', mtconfirmation, [mbok, mbcancel], 0)=mrok then
 begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.v_aktlab where aktnum=:an');
  query.Parameters[0].Value:=pkey;
  query.Open;
  query.First;
  rvdatasetconnection5.DataSet:=query;
  rvproject1.ExecuteReport('aktlab');
  savedata(pkey, 1);
 end
 else
  savedata(pkey, 0);
end;

procedure TfrmNewLabAkt.Button3Click(Sender: TObject);
begin
 close;
end;

procedure TfrmNewLabAkt.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=cafree;
end;

procedure TfrmNewLabAkt.FormCreate(Sender: TObject);
begin
 query:=tadoquery.Create(nil);
 query.Connection:=dm.alexpromcon;
 initfrm;
end;

end.

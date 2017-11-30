unit U_e1analisis;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ADODB;

type
  Tfrm_e1analisis = class(TForm)
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label4: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Label5: TLabel;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    Panel9: TPanel;
    Panel10: TPanel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    Button1: TButton;
    Button3: TButton;
    procedure FormShow(Sender: TObject);
    procedure MaskEdit5Change(Sender: TObject);
    procedure MaskEdit4Change(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure MaskEdit2Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button3Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tblname:string;
    function getlost:byte;
    function getout:byte;
  end;

var
  frm_e1analisis: Tfrm_e1analisis;
  query:TADOQuery;
  p,t,p20:real;
  fbgs,adt,otg,paraf,h20,outp,lost:integer;
implementation

uses u_dm;

{$R *.dfm}

function tfrm_e1analisis.getlost:byte;
begin
 if fbgs=-1000 then
 lost:=100-fbgs;
 if adt=-1000 then
 else
  lost:=100-fbgs-adt;
 if otg=-1000 then
 else
  lost:=100-fbgs-adt-otg;
 if paraf=-1000 then
 else
  lost:=100-fbgs-adt-otg-paraf;
 result:=lost;
end;

function tfrm_e1analisis.getout:byte;
begin
 if fbgs=-1000 then
 else
 outp:=-fbgs;
 if adt=-1000 then
 else
  outp:=-fbgs-adt;
 if paraf=-1000 then
 else
  outp:=-fbgs-adt-paraf;
 result:=abs(outp);
end;

procedure Tfrm_e1analisis.Button1Click(Sender: TObject);
var
 id:longint;
begin
try
if lost=0 then
 showmessage('потери не могут принимать отрицательное значение.')
else
begin
 button1.Enabled:=false;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select max(id) from ');
 query.SQL.Add(tblname);
 query.Open;
 query.First;
 id:=query.Fields[0].AsInteger;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update ');
 query.SQL.Add(tblname);
 query.SQL.Add(' set p=:@p, t=:@t, p20=:@p20, fbgs_perc=:@fbgs, adt_perc=:@adt,');
 query.SQL.Add('otg_perc=:@otg, paraf_perc=:@paraf, h20_perc=:@h20, lost=:@lost where id=:id');
 if p=-1000 then
  begin
   query.Parameters[0].Value:=null;
  end
 else
  begin
   query.Parameters[0].Value:=p;
  end;
 if t=-1000 then
   query.Parameters[1].Value:=null
 else
   query.Parameters[1].Value:=t;
 if p20=-1000 then
   query.Parameters[2].Value:=null
 else
   query.Parameters[2].Value:=p20;
 if fbgs=-1000 then
  begin
   query.Parameters[3].Value:=null;
  end
 else
  begin
   query.Parameters[3].Value:=fbgs;
  end;
 if otg=-1000 then
  begin
   query.Parameters[4].Value:=null;
  end
 else
  begin
   query.Parameters[4].Value:=adt;
  end;
 if otg=-1000 then
   query.Parameters[5].Value:=null
 else
   query.Parameters[5].Value:=otg;
 if paraf=-1000 then
   query.Parameters[6].Value:=null
 else
   query.Parameters[6].Value:=paraf;
 if h20=-1000 then
   query.Parameters[7].Value:=null
 else
   query.Parameters[7].Value:=h20;
 query.Parameters[8].Value:=lost;
 query.Parameters[9].Value:=id;
 query.ExecSQL;
 showmessage('ok');
end
except
 exit;
end;
button1.Enabled:=true;
end;

procedure Tfrm_e1analisis.Button3Click(Sender: TObject);
begin
 close;
end;

procedure Tfrm_e1analisis.Edit1Change(Sender: TObject);
begin
try
 if edit1.Text='' then
  t:=-1000
 else
  t:=strtofloat(edit1.Text);
 if p=-1000 then

 else
  begin
   query.Close;
   query.SQL.Clear;
   query.SQL.Add('select plotn20 from v_plotn20 where temper_name=:tn and plotn like :p');
   query.Parameters[0].Value:=t;
   query.Parameters[1].Value:=p;
   query.Open;
   if query.Fields[0].Asstring='' then
    p20:=-1000
   else
    p20:=strtofloat(query.Fields[0].Asstring);
   if p20=-1000 then
    panel1.Caption:=''
   else
    panel1.Caption:=floattostrf(p20, fffixed, 5, 4);
  end;
except
 exit;
end;
end;

procedure Tfrm_e1analisis.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=cafree;
end;

procedure Tfrm_e1analisis.FormCreate(Sender: TObject);
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromcon;
 
end;

procedure Tfrm_e1analisis.FormShow(Sender: TObject);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from ');
 query.SQL.Add(tblname);
 query.SQL.Add(' where id=(select max(id) from ');
 query.SQL.Add(tblname);
 query.SQL.Add(')');
 query.Open;
 query.First;
 if query.FieldByName('p').AsString='' then
  p:=-1000
 else
  p:=strtofloat(query.FieldByName('p').AsString);
 if query.FieldByName('t').AsString='' then
  t:=-1000
 else
  t:=strtofloat(query.FieldByName('t').AsString);
 if query.FieldByName('p20').AsString='' then
  p20:=-1000
 else
  p20:=strtofloat(query.FieldByName('p20').AsString);
 if query.FieldByName('fbgs_perc').AsString='' then
  fbgs:=-1000
 else
  fbgs:=strtoint(query.FieldByName('fbgs_perc').AsString);
 if query.FieldByName('adt_perc').AsString='' then
  adt:=-1000
 else
  adt:=strtoint(query.FieldByName('adt_perc').AsString);
 if query.FieldByName('otg_perc').AsString='' then
  otg:=-1000
 else
  otg:=strtoint(query.FieldByName('otg_perc').AsString);
 if query.FieldByName('paraf_perc').AsString='' then
  paraf:=-1000
 else
  paraf:=strtoint(query.FieldByName('paraf_perc').AsString);
 if query.FieldByName('h20_perc').AsString='' then
  h20:=-1000
 else
  h20:=strtoint(query.FieldByName('h20_perc').AsString);
 if query.FieldByName('mat_out').AsString='' then
  outp:=-1000
 else
  outp:=strtoint(query.FieldByName('mat_out').AsString);
 if query.FieldByName('lost').AsString='' then
  lost:=-1000
 else
  lost:=strtoint(query.FieldByName('lost').AsString);
 if p=-1000 then
  maskedit1.Text:=' ,    '
 else
  maskedit1.Text:=floattostrf(p, fffixed, 5, 4);
 if t=-1000 then
  edit1.Text:=''
 else
  edit1.Text:=floattostrf(t, fffixed, 4, 1);
 if p20=-1000 then
  panel1.Caption:=''
 else
  panel1.Caption:=floattostrf(p20, fffixed, 5, 4);
 if fbgs=-1000 then
  maskedit2.Text:=''
 else
  maskedit2.Text:=inttostr(fbgs);
 if adt=-1000 then
  maskedit3.Text:=''
 else
  maskedit3.Text:=inttostr(adt);
 if otg=-1000 then
  maskedit4.Text:=''
 else
  maskedit4.Text:=inttostr(otg);
 if paraf=-1000 then
  maskedit5.Text:=''
 else
  maskedit5.Text:=inttostr(paraf);
 if h20=-1000 then
  maskedit6.Text:=''
 else
  maskedit6.Text:=inttostr(h20);
 if outp=-1000 then
  panel9.Caption:=''
 else
  panel9.Caption:=inttostr(outp);
 if lost=-1000 then
  panel10.Caption:=''
 else
  panel10.Caption:=inttostr(lost);
end;

procedure Tfrm_e1analisis.MaskEdit1Change(Sender: TObject);
begin
try
if maskedit1.Text=' ,    ' then
 p:=-1000
else
 p:=strtofloat(maskedit1.Text);
if t=-1000 then

else
 begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select plotn20 from v_plotn20 where temper_name=:tn and plotn like :p');
  query.Parameters[0].Value:=t;
  query.Parameters[1].Value:=p;
  query.Open;
  if query.Fields[0].Asstring='' then
   p20:=-1000
  else
   p20:=strtofloat(query.Fields[0].Asstring);
  if p20=-1000 then
    panel1.Caption:=''
  else
    panel1.Caption:=floattostrf(p20, fffixed, 5, 4);
 end;
except
 exit;
end;
end;

procedure Tfrm_e1analisis.MaskEdit2Change(Sender: TObject);
begin
try
 if maskedit2.Text='' then
  begin
   fbgs:=-1000;
  end
 else
  begin
   fbgs:=strtoint(trim(maskedit2.Text));
  end;
  panel10.Caption:=inttostr(getlost);
  panel9.Caption:=inttostr(getout);
except
 exit;
end;
end;

procedure Tfrm_e1analisis.MaskEdit3Change(Sender: TObject);
begin
try
 if maskedit3.Text='' then
  begin
   adt:=-1000;
  end
 else
  begin
   adt:=strtoint(trim(maskedit3.Text));
  end;
 panel10.Caption:=inttostr(getlost);
 panel9.Caption:=inttostr(getout);
except
 exit;
end;
end;

procedure Tfrm_e1analisis.MaskEdit4Change(Sender: TObject);
begin
try
 if maskedit4.Text='' then
  begin
   otg:=-1000;
  end
 else
  begin
   otg:=strtoint(trim(maskedit4.Text));
  end;
 panel10.Caption:=inttostr(getlost);
 panel9.Caption:=inttostr(getout);
except
 exit;
end;
end;

procedure Tfrm_e1analisis.MaskEdit5Change(Sender: TObject);
begin
try
 if maskedit5.Text='' then
  begin
   paraf:=-1000;
  end
 else
  begin
   paraf:=strtoint(trim(maskedit5.Text));
  end;
 panel10.Caption:=inttostr(getlost);
 panel9.Caption:=inttostr(getout);
except
 exit;
end;
end;

end.

unit U_calcform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Mask, StdCtrls, adodb, geometricsolution;

type
  Tfrmplotncalc = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    Panel1: TPanel;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Edit2: TEdit;
    Label5: TLabel;
    Panel2: TPanel;
    procedure Edit2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmplotncalc: Tfrmplotncalc;
  query:tadoquery;
  plotn,plotn20,temp,temper_correct, plotnNew:real;
  tempnew:integer;

implementation

uses u_dm;

{$R *.dfm}

procedure Tfrmplotncalc.Edit1Change(Sender: TObject);
begin
try
 temp:=strtofloat(edit1.text);
 MaskEdit1.OnChange(self);
except
 exit;
end;
end;

procedure Tfrmplotncalc.Edit2Change(Sender: TObject);
var
 p20_str:string[5];
 qstr:string;
begin
try
 tempnew:=StrToInt(Edit2.Text);
 p20_str:=FloatToStr(plotn20);
 plotn20:=StrToFloat(p20_str);
except
 exit;
end;
 query.Close;
 query.SQL.Clear;
 qstr:='select * from dbo.v_plotn20 where plotn20 like '+''''+p20_str+'%'''+' and temper_name='+IntToStr(tempnew);
 query.SQL.Add(qstr);
 query.Open;
 query.First;
 plotnNew:=query.FieldByName('plotn').AsFloat;
 Panel2.Caption:=FloatToStrF(plotnNew, ffFixed, 5, 4);
end;

procedure Tfrmplotncalc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=cafree;
end;

procedure Tfrmplotncalc.FormCreate(Sender: TObject);
begin
query:=tadoquery.Create(nil);
query.Connection:=dm.alexpromcon;
end;

procedure Tfrmplotncalc.MaskEdit1Change(Sender: TObject);
begin
if edit1.Text='' then

else
 begin
   try
     plotn:=strtofloat(maskedit1.text);
     query.Close;
     query.SQL.Clear;
     query.SQL.Add('select plotn20 from dbo.v_plotn20 where temper_name=:a and plotn like :b');
     query.Parameters[0].Value:=floattostr(temp);
     query.Parameters[1].Value:=plotn;
     query.Open;
     plotn20:=query.Fields[0].AsFloat;
     panel1.Caption:=FloatToStrF(plotn20, ffFixed, 5,4);
   except
    exit;
   end;
 end;

end;

end.

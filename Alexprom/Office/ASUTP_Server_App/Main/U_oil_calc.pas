unit U_oil_calc;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Mask, DBCtrls, ADODB,DB, geometricsolution;

type
  Toil_calc = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit1: TMaskEdit;
    Label3: TLabel;
    Panel1: TPanel;
    tank_name: TDBLookupComboBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure MaskEdit1Change(Sender: TObject);
    procedure tank_nameCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  oil_calc: Toil_calc;
  query,qqq:TADOQuery;
  ds:TDataSource;
  tank_id:byte;
implementation

uses u_dm;

{$R *.dfm}

procedure Toil_calc.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 qqq.Free;
 ds.Free;
 action:=caFree;
end;

procedure Toil_calc.FormCreate(Sender: TObject);
begin
  query:=TADOQuery.Create(nil);
  query.Connection:=dm.alexpromCon;
  qqq:=TADOQuery.Create(nil);
  qqq.Connection:=dm.alexpromCon;
  qqq.Close;
  qqq.SQL.Clear;
  qqq.SQL.Add('select mat_Volume from grad_view where tank_id=:tid and mat_Level=:ml');
  query.SQL.Add('select * from dbo.tank_dic');
  query.Open;
  query.First;
  ds:=TDataSource.Create(nil);
  ds.DataSet:=query;
  tank_name.ListSource:=ds;
  tank_name.ListField:='tank_name';
  tank_name.KeyField:='tank_id';
end;

procedure Toil_calc.MaskEdit1Change(Sender: TObject);
begin
try
if MaskEdit1.Text<>''then
  begin
    qqq.Parameters[0].Value:=tank_name.KeyValue;
    qqq.Parameters[1].Value:=StrToInt(Trim(MaskEdit1.Text));
    qqq.Open;
    qqq.first;
    Panel1.Caption:=IntToStr(qqq.FieldValues['mat_Volume']);
    qqq.Close;
  end;
except
  exit;
end;
end;

procedure Toil_calc.tank_nameCloseUp(Sender: TObject);
begin
if tank_name.Text<>'-' then
  begin
    tank_id:=tank_name.KeyValue;
    MaskEdit1.Enabled:=true;
    qqq.Parameters[0].Value:=tank_name.KeyValue;
    qqq.Parameters[1].Value:=StrToInt(Trim(MaskEdit1.Text));
    qqq.Open;
    qqq.first;
    Panel1.Caption:=IntToStr(qqq.FieldValues['mat_Volume']);
    qqq.Close;
  end;
end;

end.

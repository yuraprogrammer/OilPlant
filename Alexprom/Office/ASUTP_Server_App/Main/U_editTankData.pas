unit U_editTankData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, StdCtrls, Mask, DBCtrls, DB;

type
  TeditTankData = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    GroupBox2: TGroupBox;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    ComboBox1: TComboBox;
    MaskEdit1: TMaskEdit;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure InitFrm;
  public
    { Public declarations }
  end;

var
  editTankData: TeditTankData;
  query_s,query_d,query:TADOQuery;
  ds_s:TDataSource;
implementation

uses u_dm, U_editTankMat;

{$R *.dfm}

procedure TeditTankData.InitFrm;
begin
  query_s.Close;
  query_s.SQL.Clear;
  query_s.SQL.Add('select * from dbo.mat_in_tank where tank_id=:tid');
  query_s.Parameters[0].Value:=editTankMat.tank_edit_id;
  query_s.Open;
  query_s.First;
  DBEdit1.DataField:='mat_name';
  DBEdit1.DataField:='plotn';
  DBEdit1.DataField:='t';
  ComboBox1.Clear;
  query:=TADOQuery.Create(nil);
  query.Connection:=dm.alexpromCon;
  query.Close;
  query.sql.Clear;
  query.sql.Add('select name from dbo.sirie_dic');
  query.Open;
  query.First;
  while not query.Eof do
    begin
      ComboBox1.Items.Add(query.FieldValues['name']);
      query.Next;
    end;
  query.Free;
end;

procedure TeditTankData.Button1Click(Sender: TObject);
var
  vol:longint;
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 query.Close;
 query.sql.Clear;
 query.sql.Add('update dbo.tank_mat set mat_id=:mid, plotn=:@p, t=:@t where tank_id=:tid');
 query.Parameters[0].Value:=ComboBox1.itemindex;
 query.Parameters[1].Value:=StrToFloat(MaskEdit1.Text);
 try
   query.Parameters[2].Value:=StrToFloat(Edit1.Text);
   query.Parameters[3].Value:=editTankMat.tank_edit_id;
   query.ExecSQL;
   query.SQL.Clear;
   query.SQL.Add('select matVolume from dbo.tank_dic where tank_id=:tid');
   query.Parameters[0].Value:=editTankMat.tank_edit_id;
   query.Open;
   query.First;
   vol:=query.Fields[0].AsInteger;
   query.Close;
   query.SQL.Clear;
   query.SQL.Add('updATE dbo.tank_mat set m=:@m where tank_id=:tid');
   query.Parameters[0].Value:=vol*StrToFloat(MaskEdit1.Text);
   query.Parameters[1].Value:=editTankMat.tank_edit_id;
   query.ExecSQL;
   ShowMessage('Данные успешно изменены!!!');
   query.Free;
 except
   ShowMessage('Проверьте введенные данные!!!');
   exit;
   query.Free;
 end;
 close;
end;

procedure TeditTankData.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TeditTankData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ds_s.Free;
  query_s.Free;
  try
    editTankMat.initFrm;
  except

  end;
  Action:=caFree;
end;

procedure TeditTankData.FormCreate(Sender: TObject);
begin
  query_s:=TADOQuery.Create(nil);
  query_s.Connection:=dm.alexpromCon;
  ds_s:=TDataSource.Create(nil);
  ds_s.DataSet:=query_s;
  DBEdit1.DataSource:=ds_s;
  DBEdit2.DataSource:=ds_s;
  DBEdit3.DataSource:=ds_s;
  InitFrm;
end;

end.

unit U_worktanks;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, adodb, GridsEh, DBGridEh, db, stdctrls;

type
  TfrmCheckWorkTank = class(TForm)
    ListView1: TListView;
    DBGridEh1: TDBGridEh;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure initfrm;
  public
    { Public declarations }
  end;

var
  frmCheckWorkTank: TfrmCheckWorkTank;
  query:tadoquery;
  ds:tdatasource;
implementation

uses u_dm;

{$R *.dfm}

procedure tfrmcheckworktank.initfrm;
var
 li:tlistitem;
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select tank_name, in_use from dbo.mat_in_tank order by tank_id');
 query.Open;
 query.First;
 ds.DataSet:=query;
 dbgrideh1.DataSource:=ds;
 if query.Fields[1].AsString='\' then
  dbgrideh1.Columns[0].CheckboxState:=cbchecked
 else
  dbgrideh1.Columns[0].CheckboxState:=cbunchecked;
 dbgrideh1.Columns[1].FieldName:='tank_name';
 while not query.Eof do
  begin
    li:=listview1.Items.Add;
    li.Caption:=query.FieldValues['tank_name'];
    query.Next;
  end;
end;

procedure TfrmCheckWorkTank.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('update dbo.tank_mat set in_use=:iu where tank_id=:tid');
 query.Parameters[0].Value:='\';
 query.Free;
 action:=cafree;
end;

procedure TfrmCheckWorkTank.FormCreate(Sender: TObject);
begin
 query:=tadoquery.Create(nil);
 query.Connection:=dm.alexpromcon;
 ds:=tdatasource.Create(nil);
 initfrm;
end;

end.

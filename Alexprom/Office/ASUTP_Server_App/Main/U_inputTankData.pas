unit U_inputTankData;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ADODB;

type
  TfrmInputTankData = class(TForm)
    ListView1: TListView;
    procedure ListView1DblClick(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    tank_edit_data_id:longint;
    procedure InitFrm;
  end;

var
  frmInputTankData: TfrmInputTankData;
  query:TADOQuery;
  p_key:longint;
implementation

uses u_dm, U_input_Tank_Data;

{$R *.dfm}

procedure TfrmInputTankData.InitFrm;
var
  li:TListItem;
begin
  ListView1.Clear;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.mat_in_tank order by tank_id');
  query.Open;
  query.First;
   while not query.Eof do
    begin
     li:=ListView1.Items.Add;
     li.Caption:=query.FieldValues['tank_name'];
     li.SubItems.add(query.FieldByName('Mat_Name').AsString);
     li.SubItems.add(query.FieldByName('MatLevel').AsString);
     li.SubItems.add(query.FieldByName('MatVolume').AsString);
     li.SubItems.add(query.FieldByName('plotn').AsString);
     li.SubItems.add(query.FieldByName('m').AsString);
     li.SubItems.add(query.FieldByName('t').AsString);
     query.Next;
  end;
end;

procedure TfrmInputTankData.ListView1DblClick(Sender: TObject);
begin
 tank_edit_data_id:=p_key;
 Application.CreateForm(Tinput_Tank_Data, input_Tank_Data);
 input_Tank_Data.Showmodal;
end;

procedure TfrmInputTankData.ListView1SelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
 if Selected then
  begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select tank_id from dbo.mat_in_tank where tank_name=:mn');
    query.Parameters[0].Value:=Item.Caption;
    query.Open;
    query.First;
    p_key:=query.FieldValues['tank_id'];
  end
 else
  p_key:=-1; 
end;

procedure TfrmInputTankData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 query.Free;
 Action:=cafREE;
end;

procedure TfrmInputTankData.FormCreate(Sender: TObject);
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 InitFrm;
end;

end.

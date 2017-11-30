unit U_inputchemtankdata;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ADODB, u_input_Tank_chem_Data;

type
  TfrmInputTankChemData = class(TForm)
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
  frmInputTankChemData: TfrmInputTankChemData;
  query:TADOQuery;
  p_key:longint;
implementation

uses u_dm, U_input_Tank_Data;

{$R *.dfm}

procedure TfrmInputTankChemData.InitFrm;
var
  li:TListItem;
begin
try
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
     li.SubItems.add(query.Fieldbyname('Mat_Name').asstring);
     li.SubItems.add(query.Fieldbyname('MatLevel').asstring);
     li.SubItems.add(query.Fieldbyname('MatVolume').asstring);
     li.SubItems.add(query.Fieldbyname('plotn').asstring);
     li.SubItems.add(query.Fieldbyname('m').asstring);
     li.SubItems.add(query.Fieldbyname('t').asstring);
     li.SubItems.add(query.Fieldbyname('t_flash').asstring);
     li.SubItems.add(query.Fieldbyname('t_pom').asstring);
     li.SubItems.add(query.Fieldbyname('end_of_kip').asstring);
     li.SubItems.add(query.Fieldbyname('filter').asstring);
     query.Next;
  end;

except

end;
end;

procedure TfrmInputTankChemData.ListView1DblClick(Sender: TObject);
begin
 tank_edit_data_id:=p_key;
 Application.CreateForm(Tinput_Tank_chem_Data, input_Tank_chem_Data);
 input_Tank_chem_Data.Showmodal;
end;

procedure TfrmInputTankChemData.ListView1SelectItem(Sender: TObject;
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

procedure TfrmInputTankChemData.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 query.Free;
 Action:=cafREE;
end;

procedure TfrmInputTankChemData.FormCreate(Sender: TObject);
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.alexpromCon;
 InitFrm;
end;

end.

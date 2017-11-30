unit U_showTasksUppg;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls, adodb;

type
  TfrmUppgTasks = class(TForm)
    ListView1: TListView;
    GroupBox1: TGroupBox;
    Button2: TButton;
    Button3: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Label1: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
    procedure initfrm;
  public
    { Public declarations }
  end;

var
  frmUppgTasks: TfrmUppgTasks;
  query:tadoquery;
implementation

uses u_dm;

{$R *.dfm}

procedure TfrmUppgTasks.initfrm;
var
 li:tlistitem;
begin
 listview1.Clear;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.uppgtasks');
 query.Open;
 query.First;
 while not query.Eof do
  begin
   li:=listview1.Items.Add;
   li.Caption:=query.FieldByName('id').AsString;
   li.SubItems.Add(query.FieldByName('taskdate').AsString);
   li.SubItems.Add(query.FieldByName('tasktime').AsString);
   query.Next;
  end;
 listview1.ItemIndex:=query.RecordCount-1;
end;

procedure TfrmUppgTasks.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
if selected then
 begin
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select * from dbo.uppgtasks where id=:iid');
  query.Parameters[0].Value:=item.Caption;
  query.Open;
  query.First;
  panel3.Caption:=query.FieldByName('fbgs_char').AsString+query.FieldByName('fbgs_tkk').AsString;
  panel7.Caption:=query.FieldByName('adt_char_0').AsString+query.FieldByName('adt_tflash').AsString;
  panel8.Caption:=query.FieldByName('adt_char_1').AsString+query.FieldByName('adt_tpom').AsString;
  panel9.Caption:=query.FieldByName('otg_char_0').AsString+query.FieldByName('otg_tflash').AsString;
  panel10.Caption:=query.FieldByName('otg_char_1').AsString+query.FieldByName('otg_out').AsString;
 end;
end;

procedure TfrmUppgTasks.Button3Click(Sender: TObject);
begin
 close;
end;

procedure TfrmUppgTasks.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=cafree;
end;

procedure TfrmUppgTasks.FormCreate(Sender: TObject);
begin
 query:=tadoquery.Create(nil);
 query.Connection:=dm.alexpromcon;
 initfrm;
end;

end.

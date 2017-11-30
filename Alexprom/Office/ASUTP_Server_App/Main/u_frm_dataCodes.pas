unit u_frm_dataCodes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ADODB;

type
  Tfrm_dataCodes = class(TForm)
    dataCodeView: TListView;
    btnAdd: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    btnClose: TButton;
    procedure dataCodeViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnCloseClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_dataCodes: Tfrm_dataCodes;
  query:TADOQuery;
implementation

uses u_dm;

{$R *.dfm}

procedure Tfrm_dataCodes.btnCloseClick(Sender: TObject);
begin
 close;
end;

procedure Tfrm_dataCodes.dataCodeViewSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
if selected then
  begin
   btnEdit.Enabled:=True;
   btnDelete.Enabled:=True;
  end
else
  begin
   btnEdit.Enabled:=False;
   btnDelete.Enabled:=False;
  end
end;

procedure Tfrm_dataCodes.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure Tfrm_dataCodes.FormCreate(Sender: TObject);
var
 li:TListItem;
begin
if not dm.alexpromCon.Connected then
  begin
     try
        dm.alexpromCon.Connected:=true;
        query:=TADOQuery.Create(nil);
        query.Connection:=dm.alexpromCOn;
        query.SQL.Clear;
        query.SQL.Add('select * from dbo.datacodes order by dataCode');
        query.Open;
        query.First;
        while not query.Eof do
          begin
           li:=dataCodeView.Items.Add;
           li.Caption:=query.FieldValues['dataCode'];
           li.SubItems.Add(query.FieldValues['dataDescr']);
           query.Next;
          end;
     except
        ShowMessage('Нет соединения с сервером базы данных!!! Обратитесь к администратору и повторите попытку позже.');
     end;
  end
else
  begin
        query:=TADOQuery.Create(nil);
        query.Connection:=dm.alexpromCOn;
        query.SQL.Clear;
        query.SQL.Add('select * from dbo.datacodes order by dataCode');
        query.Open;
        query.First;
        while not query.Eof do
          begin
           li:=dataCodeView.Items.Add;
           li.Caption:=query.FieldValues['dataCode'];
           li.SubItems.Add(query.FieldValues['dataDescr']);
           query.Next;
          end;
  end;
end;
end.

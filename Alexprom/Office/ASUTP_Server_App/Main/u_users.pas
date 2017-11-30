unit u_users;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ADODB, Grids, DBGrids, DB, StdCtrls;

type
  TeditUsers = class(TForm)
    usersView: TListView;
    addUser: TButton;
    editUser: TButton;
    deleteUser: TButton;
    btnClose: TButton;
    Edit1: TEdit;
    ComboBox1: TComboBox;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure usersViewSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure deleteUserClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure initFrm;
  end;

var
  editUsers: TeditUsers;
  query:TADOQuery;
  p_key:string;
implementation

uses u_dm;

{$R *.dfm}

procedure TeditUsers.btnCloseClick(Sender: TObject);
begin
 close;
end;

procedure TeditUsers.deleteUserClick(Sender: TObject);
begin
if messagedlg('Вы действительно хотите удалить выбранного пользователя?',mtConfirmation, [mbok,mbcancel],0)=mrok then
  begin
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('delete from dbo.alexpromusers where uname=:uname');
    query.Parameters[0].Value:=p_key;
    query.ExecSQL;
    initFrm;
  end;
end;

procedure TeditUsers.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=caFree;
end;

procedure TeditUsers.initFrm;
var
 li:TListItem;
begin
 query.Connection:=dm.alexpromCOn;
 query.SQL.Clear;
 query.SQL.Add('select * from sys.syslogins where dbname=Alexprom_ASUTP');
 query.Open;
 query.First;
 while not query.Eof do
  begin
   li:=usersView.Items.Add;
   li.Caption:=query.FieldValues['name'];
   li.SubItems.Add(query.FieldValues['accessDescr']);
   query.Next;
  end;

end;

procedure TeditUsers.usersViewSelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
 if Selected then
    begin
      p_key:=Item.Caption;
      editUser.Enabled:=True;
      deleteUser.Enabled:=True;
    end
 else
    begin
      p_key:='';
      editUser.Enabled:=False;
      deleteUser.Enabled:=False;
    end;
end;

procedure TeditUsers.FormCreate(Sender: TObject);
begin
query:=TADOQuery.Create(nil);
if not dm.alexpromCon.Connected then
  begin
    try
      dm.alexpromCon.Connected:=true;
      initFrm;
    except
      ShowMessage('Нет соединения с сервером базы данных!!! Обратитесь к администратору и повторите попытку позже.');
    end;
  end
else
  begin
    query.Connection:=dm.alexpromCOn;
    initFrm;
  end;

end;

end.

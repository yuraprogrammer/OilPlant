unit uClientBase;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, Grids, DBGrids, StdCtrls, Buttons, ActnList,
  CategoryButtons, CheckLst, ImgList, ADODB, ExtCtrls;

type
  TfrmClientBase = class(TForm)
    StatusBar1: TStatusBar;
    ActionList1: TActionList;
    actionFilter: TAction;
    actionSearch: TAction;
    actionNew: TAction;
    actionOpen: TAction;
    actionDelete: TAction;
    actionPrivate: TAction;
    actionBusiness: TAction;
    actionRegions: TAction;
    CategoryButtons1: TCategoryButtons;
    ImageList1: TImageList;
    gbClientFilter: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    regionsBox: TCheckListBox;
    productBox: TCheckListBox;
    GroupBox1: TGroupBox;
    cbNatural: TCheckBox;
    cbPotencial: TCheckBox;
    GroupBox2: TGroupBox;
    cbCustomers: TCheckBox;
    cbIntermediate: TCheckBox;
    GroupBox3: TGroupBox;
    lvClientList: TListView;
    actionRefresh: TAction;
    actionShowProductDic: TAction;
    leSearchName: TLabeledEdit;
    actionRefreshProducts: TAction;
    procedure actionFilterExecute(Sender: TObject);
    procedure actionSearchExecute(Sender: TObject);
    procedure actionNewExecute(Sender: TObject);
    procedure actionOpenExecute(Sender: TObject);
    procedure actionDeleteExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actionRegionsExecute(Sender: TObject);
    procedure actionPrivateExecute(Sender: TObject);
    procedure actionBusinessExecute(Sender: TObject);
    procedure lvClientListSelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure actionRefreshExecute(Sender: TObject);
    procedure actionShowProductDicExecute(Sender: TObject);
    procedure regionsBoxClickCheck(Sender: TObject);
    procedure cbNaturalClick(Sender: TObject);
    procedure cbPotencialClick(Sender: TObject);
    procedure cbCustomersClick(Sender: TObject);
    procedure cbIntermediateClick(Sender: TObject);
    procedure productBoxClickCheck(Sender: TObject);
    procedure actionRefreshProductsExecute(Sender: TObject);
    procedure lvClientListDrawItem(Sender: TCustomListView; Item: TListItem;
      Rect: TRect; State: TOwnerDrawState);
  private
    { Private declarations }
    procedure buildStatement;
    procedure fillListView(Stmt:String);
    procedure deleteClientData(Stmt:string);
    procedure fillRegions;
    procedure fillProducts;
  public
    { Public declarations }
  end;

var
  frmClientBase: TfrmClientBase;
  productFilterCondition: string;
  regionFilterCondition: string;
  priorityFilterCondition: string;
  typeFilterCondition: string;
  productFilterAct: boolean;
  regionFilterAct: boolean;
  priorityFilterAct: boolean;
  typeFilterAct: boolean;
  conditionCount:integer;
  p_key:TStringList;
  currentKey:longint;
  regionsID, productsID, regID, prodID:TStringList;
  ppp:TStringList;
  natural, potencial, customers, intermediate:boolean;
implementation

uses uClientCard, uDM, U_sirie_dic;

{$R *.dfm}

//Удалить карточку выбраного клиента
procedure TfrmClientBase.actionBusinessExecute(Sender: TObject);
begin
//
end;

procedure TfrmClientBase.actionDeleteExecute(Sender: TObject);
begin
if MessageDlg('Вы действительно хотите удалить выбраного клиента?',mtConfirmation, [mbYes, mbNo],0)=mrYes then
 try
  dm.ADOConnection1.BeginTrans;
  deleteClientData('dbo.apDeleteClients');
  deleteClientData('dbo.deleteClientAdditional');
  deleteClientData('dbo.deleteClientAddress');
  deleteClientData('dbo.deleteClientWork');
  DM.ADOConnection1.CommitTrans;
  actionRefreshExecute(Self);
  MessageDlg('Данные о клиенте успешно удалены!!!', mtConfirmation, [mbOk], 0);
 except
  dm.ADOConnection1.RollbackTrans;
  MessageDlg('Ошибка удаления данных!!!', mtError, [mbOk], 0);
 end;
// deleteClientData('dbo.DeleteClientAddress');
end;

procedure TfrmClientBase.deleteClientData(Stmt: string);
var
 query:TADOQuery;
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.ADOConnection1;
 query.SQL.Add('exec '+Stmt+' ');
 query.SQL.Add(IntToStr(currentKey));
 query.ExecSQL;
end;
//Применить фильтр к базе клиентов
procedure TfrmClientBase.actionFilterExecute(Sender: TObject);
begin
//
end;

//Создать карточку нового клиента
procedure TfrmClientBase.actionNewExecute(Sender: TObject);
begin
 Application.CreateForm(TfrmClientCard, frmClientCard);
 frmClientCard.crFlag:=false;
 frmClientCard.ShowModal;
end;

//Открыть карточку выбраного клиента
procedure TfrmClientBase.actionOpenExecute(Sender: TObject);
begin
if lvClientList.Items.Count=0 then
  MessageDlg('Список клиентов пуст!!!', mtError, [mbOk], 0)
else
  if lvClientList.Selected.Index<0 then
    MessageDlg('Не выбран клиент из списка!!!', mtError, [mbOk], 0)
  else
    begin
      currentKey:=StrToInt(p_key.Strings[lvClientList.Selected.Index]);
      Application.CreateForm(TfrmClientCard, frmClientCard);
      frmClientCard.crFlag:=true;
      frmClientCard.clID:=currentKey;
      frmClientCard.ShowModal;
    end;
end;

procedure TfrmClientBase.actionPrivateExecute(Sender: TObject);
begin
//
end;

procedure TfrmClientBase.actionRefreshExecute(Sender: TObject);
begin
 BuildStatement;
end;

procedure TfrmClientBase.actionRefreshProductsExecute(Sender: TObject);
var
 i,j:integer;
begin
 fillProducts;
 if ppp.Count<>0 then
  for j := 0 to ppp.Count - 1 do 
   for i := 0 to prodID.Count - 1 do
     if ppp.Strings[j]=prodID.Strings[i] then productBox.Checked[i]:=true;
end;

procedure TfrmClientBase.actionRegionsExecute(Sender: TObject);
begin
//
end;

//Запустить посик по базе клиентов
procedure TfrmClientBase.actionSearchExecute(Sender: TObject);
var
 stmt:string;
begin
 stmt:='select * from dbo.apClientCard where Name like N''%'+leSearchName.Text+'%''';
 FillListView(stmt);
end;

procedure TfrmClientBase.actionShowProductDicExecute(Sender: TObject);
begin
 Application.CreateForm(Tsirie_dic, sirie_dic);
 sirie_dic.ShowModal;
end;

//Добавление условия фильтрации по приоритету
procedure TfrmClientBase.cbCustomersClick(Sender: TObject);
begin
 customers:=cbCustomers.Checked;
 buildStatement;
end;

procedure TfrmClientBase.cbIntermediateClick(Sender: TObject);
begin
 intermediate:=cbIntermediate.Checked;
 buildStatement;
end;

procedure TfrmClientBase.cbNaturalClick(Sender: TObject);
begin
 natural:=cbNatural.Checked;
 buildStatement;
end;

procedure TfrmClientBase.cbPotencialClick(Sender: TObject);
begin
 potencial:=cbPotencial.Checked;
 buildStatement;
end;

procedure TfrmClientBase.FormCreate(Sender: TObject);
begin
 regID:=TStringList.Create;
 prodID:=TStringList.Create;
 ppp:=TStringList.Create;
 fillRegions;
 fillProducts;
 p_key:=TStringList.Create;
 regionsID:=TStringList.Create;
 productsID:=TStringList.Create;
 buildStatement;
end;

procedure TfrmClientBase.fillRegions;
var
 regions:TADOQuery;
 list:TStringList;
 i:integer;
begin
 list:=TStringList.Create;
 regions:=TADOQuery.Create(nil);
 regions.Connection:=DM.ADOConnection1;
 regID.Clear;
 regions.SQL.Add('select * from dbo.apRegionsDic where ID>0');
 try
   regions.Open;
   regions.First;
   while not regions.Eof do
    begin
      regID.Add(IntToStr(regions.Fields[0].AsInteger));
      list.Add(regions.Fields[1].AsString);
      regions.Next;
    end;
   regionsBox.Items.Clear;
   for i:= 0 to List.Count - 1 do
    begin
     regionsBox.Items.Add(list.Strings[i]);
    end;
 except

 end;
 regions.Free;
 list.Free;
end;

procedure TfrmClientBase.fillProducts;
var
 products:TADOQuery;
 list:TStringList;
 i:integer;
begin
 list:=TStringList.Create;
 products:=TADOQuery.Create(nil);
 products.Connection:=dm.ADOConnection1;
 list.Clear;
 prodID.Clear;
 products.SQL.Add('select * from dbo.apProductDic where ID>0');
 try
  products.Open;
  products.First;
  while not products.Eof do
    begin
      prodID.Add(products.Fields[0].AsString);
      list.Add(products.Fields[1].AsString);
      products.Next;
    end;
  productBox.Clear;
  for i:= 0 to List.Count - 1 do
    begin
     productBox.Items.Add(list.Strings[i]);
    end;
 finally
  list.Free;
  products.Free;
 end;
end;

procedure TfrmClientBase.lvClientListDrawItem(Sender: TCustomListView;
  Item: TListItem; Rect: TRect; State: TOwnerDrawState);
begin
//
end;

procedure TfrmClientBase.lvClientListSelectItem(Sender: TObject;
  Item: TListItem; Selected: Boolean);
begin
 if Selected then
  currentKey:=StrToInt(p_key.Strings[Item.Index]);
end;

procedure TfrmClientBase.productBoxClickCheck(Sender: TObject);
var
 i,j:integer;
 query:TADOQuery;
 Stmt:string;
begin
 productsID.Clear;
 ppp.Clear;
 i:=0;
 while i<productBox.Items.Count-1 do
  begin
    if productBox.Checked[i] then ppp.Add(prodID.Strings[i]);
    i:=i+1;
  end;
 if ppp.Count<>0 then
  begin 
   query:=TADOQuery.Create(nil);
   query.Connection:=dm.ADOConnection1;
   j:=0;
   if ppp.Count=1 then Stmt:=Stmt+'select clientID from dbo.apClientHistory where productID='+ppp.Strings[j];
   if ppp.Count>1 then
    begin
     Stmt:=Stmt+'select clientID from dbo.apClientHistory where (';
     while j<=ppp.Count-1 do
      begin
       Stmt:=Stmt+'productID='+ppp.Strings[j]+' OR ';
       j:=j+1;
      end;
     Delete(Stmt, Length(Stmt)-3, 3);
     Stmt:=Stmt+') group by clientID';
    end;
   try
    query.SQL.Add(Stmt);
    query.open;
    query.First;
    productsID.Clear;
    if query.RecordCount<>0 then
     while not query.Eof do
      begin
       productsID.Add('ID='+IntToStr(query.Fields[0].AsInteger));
       query.Next;
      end
    else productsID.Add('ID=0');
    buildStatement;
   finally
    query.free;
   end;
  end;
end;

procedure TfrmClientBase.regionsBoxClickCheck(Sender: TObject);
var
 i:integer;
begin
 regionsID.Clear;
 i:=0;
 while i<regionsBox.Items.Count-1 do
  begin
   if regionsBox.Checked[i] then
    regionsID.Add('regionID='+regID.Strings[i]);
    i:=i+1;
  end;
 buildStatement;
end;

procedure TfrmClientBase.buildStatement;
var
 i,j,k:integer;
 SQLStmt:String;
 naturalCondition, potencialCondition, customersCondition, intermediateCondition:string;
begin
 SQLStmt:='select * from dbo.apClientCard';
 naturalCondition:='clientMark=0';
 potencialCondition:='clientMark=1';
 customersCondition:='clientType=0';
 intermediateCondition:='clientType=1';
 i:=productsID.Count;
 j:=regionsID.Count;
 //динамическое построение запроса для фильтрации клиентов
 if j<>0 then //Если выбраны регионы сортировки
  begin
   SQLStmt:=SQLStmt+' where ';
   k:=0;
   if regionsID.Count=1 then SQLStmt:=SQLStmt+regionsID.Strings[k]
   else
    begin
     SQLStmt:=SQLStmt+'(';
     while k<=regionsID.Count-1 do
      begin
       SQLStmt:=SQLStmt+regionsID.Strings[k]+' OR ';
       k:=k+1;
      end;
     Delete(SQLStmt, Length(SQLStmt)-3, 3);
     SQLStmt:=SQLStmt+')';
    end;
  end;
 if natural and (j=0) then SQLStmt:=SQLStmt+' where '+naturalCondition;
 if natural and (j<>0) then SQLStmt:=SQLStmt+' AND '+naturalCondition;

 if potencial and (j=0) and not natural then SQLStmt:=SQLStmt+' where '+potencialCondition;
 if potencial and (j<>0) and not natural then SQLStmt:=SQLStmt+' AND '+potencialCondition;
 if potencial and natural then
  begin
   Delete(SQLStmt, Length(SQLStmt)-Length(naturalCondition)+1, Length(naturalCondition));
   SQLStmt:=SQLStmt+'('+naturalCondition+' OR '+potencialCondition+')';
  end;

 if customers and (j=0) and not natural and not potencial then SQLStmt:=SQLStmt+' where '+customersCondition;
 if customers and ((j<>0) or natural or potencial) then SQLStmt:=SQLStmt+' AND '+customersCondition;

 if intermediate and (j=0) and not natural and not potencial and not customers then
  SQLStmt:=SQLStmt+' where '+intermediateCOndition;
 if intermediate and ((j<>0) or natural or potencial) and not customers then SQLStmt:=SQLStmt+' AND '+intermediateCondition;
 if intermediate and customers then
  begin
   Delete(SQLStmt, Length(SQLStmt)-Length(customersCondition)+1, Length(customersCondition));
   SQLStmt:=SQLStmt+'('+customersCondition+' OR '+intermediateCondition+')';
  end;
 if i<>0 then
  begin
   if (j=0) and not natural and not potencial and not customers and not intermediate then
    SQLStmt:=SQLStmt+' where '
   else SQLStmt:=SQLStmt+' AND ';
   k:=0;
   if productsID.Count=1 then SQLStmt:=SQLStmt+productsID.Strings[k]
   else
    begin
     SQLStmt:=SQLStmt+'(';
     while k<=productsID.Count-1 do
      begin
       SQLStmt:=SQLStmt+productsID.Strings[k]+' OR ';
       k:=k+1;
      end;
     Delete(SQLStmt, Length(SQLStmt)-3, 3);
     SQLStmt:=SQLStmt+')';
    end;
  end;
 fillListView(SQLStmt);
end;

procedure TfrmClientBase.fillListView(Stmt:String);
var
 clientList:TADOQuery;
 li:TListItem;
 count:integer;
begin
 StatusBar1.Panels[0].Text:='Поиск...';
 StatusBar1.Panels[1].Text:='Обработка базы клиентов...';
 clientList:=TADOQuery.Create(nil);
 clientList.Connection:=dm.ADOConnection1;
 lvClientList.Items.Clear;
 clientList.SQL.Clear;
 clientList.SQL.Add(Stmt);
 clientList.Open;
 count:=0;
 p_key.Clear;
 while not clientList.Eof do
  begin
   p_key.Add(clientList.FieldByName('ID').AsString);
   li:=lvClientList.Items.Add;
   li.Caption:=clientList.FieldByName('Name').AsString;
   li.SubItems.Add(clientList.FieldByName('RegionName').AsString);
   li.SubItems.Add('');
   li.SubItems.Add(clientList.FieldByName('EMail').AsString);
   li.SubItems.Add(clientList.FieldByName('Phone').AsString);
   li.SubItems.Add(clientList.FieldByName('Fax').AsString);
   li.SubItems.Add(clientList.FieldByName('factCity').AsString);
   li.SubItems.Add(clientList.FieldByName('factStreet').AsString);
   li.SubItems.Add(clientList.FieldByName('factBuilding').AsString);
   li.SubItems.Add(clientList.FieldByName('factAddBuilding').AsString);
   li.SubItems.Add(clientList.FieldByName('factOffice').AsString);
   li.SubItems.Add(clientList.FieldByName('LastName').AsString);
   li.SubItems.Add(clientList.FieldByName('FirstName').AsString);
   li.SubItems.Add(clientList.FieldByName('SurName').AsString);
   clientList.Next;
   count:=count+1;
  end;
//  lvClientList.ItemIndex:=0;
 clientList.Free;
 StatusBar1.Panels[0].Text:='Найдено '+inttostr(count)+' клиентов';
 StatusBar1.Panels[1].Text:='Обработка базы завершена.';
end;

end.

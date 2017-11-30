unit uClientWork;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, DBCtrls, ComCtrls, ActnList, Buttons, ADODB, DB,
  ImgList;

type
  TfrmClientWork = class(TForm)
    GroupBox1: TGroupBox;
    leCallDate: TLabeledEdit;
    leCallPurpose: TLabeledEdit;
    cbProduct: TDBLookupComboBox;
    Label1: TLabel;
    leRequirements: TLabeledEdit;
    lePeriodic: TLabeledEdit;
    RadioGroup1: TRadioGroup;
    RadioGroup2: TRadioGroup;
    Label2: TLabel;
    leWorkResult: TMemo;
    GroupBox2: TGroupBox;
    ListView1: TListView;
    BitBtn1: TBitBtn;
    btnEdit: TBitBtn;
    btnSave: TBitBtn;
    btnDelete: TBitBtn;
    BitBtn5: TBitBtn;
    ActionList1: TActionList;
    actionNewWork: TAction;
    actionDeleteWork: TAction;
    actionEditWork: TAction;
    actionSaveWork: TAction;
    actionExit: TAction;
    ImageList1: TImageList;
    actionClear: TAction;
    btnClear: TBitBtn;
    procedure actionExitExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure leCallDateChange(Sender: TObject);
    procedure leCallPurposeChange(Sender: TObject);
    procedure leRequirementsChange(Sender: TObject);
    procedure lePeriodicChange(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure RadioGroup2Click(Sender: TObject);
    procedure cbProductCloseUp(Sender: TObject);
    procedure ListView1SelectItem(Sender: TObject; Item: TListItem;
      Selected: Boolean);
    procedure actionNewWorkExecute(Sender: TObject);
    procedure actionClearExecute(Sender: TObject);
    procedure actionSaveWorkExecute(Sender: TObject);
    procedure actionDeleteWorkExecute(Sender: TObject);
    procedure leWorkResultChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure actionEditWorkExecute(Sender: TObject);
    procedure cbProductKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure ClearFields;
    procedure FillWorkTable(clID:longint);
    procedure FillFields(id:longint);
    procedure InitData;
    procedure ExecuteClientWorkProc(sp_name:string);
  public
    { Public declarations }
    clID:longint;
  end;
type
 WorkData = record
   ID:longint;
   clientID:longint;
   callDate:string;
   callPurpose:string;
   Requirements:string;
   Product:integer;
   Periodic:string;
   SupplyType:integer;
   SupplyConditions:integer;
   Result:string;
 end;
var
  frmClientWork: TfrmClientWork;
  work:WorkData;
  productQuery:TADOQuery;
  productDS:TDataSource;
  p_key:longint;
  workID:TStringList;
  mode:boolean; //1-edit, 0-new
implementation

uses uDM;

{$R *.dfm}

procedure TfrmClientWork.actionClearExecute(Sender: TObject);
begin
 ClearFields;
end;

procedure TfrmClientWork.actionDeleteWorkExecute(Sender: TObject);
var
 query:TADOQuery;
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.ADOConnection1;
 if MessageDlg('Вы действительно хотите удалить текущую запись?', mtConfirmation, [mbYes, mbNo], 0)=mrYes then
  try
   dm.ADOConnection1.BeginTrans;
   query.SQL.Add('exec dbo.deleteClientWork '+IntToStr(p_key));
   query.ExecSQL;
   dm.ADOConnection1.CommitTrans;
   FillWorkTable(clID);
   ClearFields;
   GroupBox1.Enabled:=False;
   btnEdit.Enabled:=False;
   ClearFields;
   btnDelete.Enabled:=False;
   MessageDlg('Текущая запись успешно удалена.',mtInformation, [mbOk], 0);
  except
   dm.ADOConnection1.RollbackTrans;
   MessageDlg('Текущая запись не удалена.',mtError, [mbOk], 0);
  end;
 query.Free;
end;

procedure TfrmClientWork.actionEditWorkExecute(Sender: TObject);
begin
 GroupBox1.Enabled:=True;
 mode:=true;
 btnSave.Enabled:=True;
end;

procedure TfrmClientWork.actionExitExecute(Sender: TObject);
begin
 close;
end;

//Запуск процедур вставки-обновления таблицы клиентов (работа)
procedure TfrmClientWork.actionNewWorkExecute(Sender: TObject);
var
 query:TADOQuery;
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.ADOConnection1;
 query.SQL.Add('select max(ID) from dbo.apClientWork');
 query.Open;
 if query.RecordCount<>0 then work.ID:=query.Fields[0].AsInteger+1
 else work.ID:=0;
 ClearFields;
 mode:=false;
 GroupBox1.Enabled:=True;
 btnSave.Enabled:=true;
 query.Free;
end;

procedure TfrmClientWork.actionSaveWorkExecute(Sender: TObject);
begin
 if not mode then
  ExecuteClientWorkProc('dbo.addClientWork')
 else
 ExecuteClientWorkProc('dbo.updateClientWork');
 FillWorkTable(clID);
 GroupBox1.Enabled:=False;
end;


procedure TfrmClientWork.cbProductCloseUp(Sender: TObject);
begin
 work.Product:=cbProduct.KeyValue;
end;

procedure TfrmClientWork.cbProductKeyPress(Sender: TObject; var Key: Char);
begin
 cbProductCloseUp(Sender);
end;

procedure TfrmClientWork.ExecuteClientWorkProc(sp_name: string);
var
 sp:TADOQuery;
begin
 sp:=TADOQuery.Create(nil);
 sp.Connection:=dm.ADOConnection1;
 try
  dm.ADOConnection1.BeginTrans;
  sp.SQL.Add('exec '+sp_name+' ');
  sp.SQL.Add(IntToStr(work.ID)+',');
  sp.SQL.Add(IntToStr(work.clientID)+',');
  sp.SQL.Add('"'+work.callDate+'",');
  sp.SQL.Add('"'+work.callPurpose+'",');
  sp.SQL.Add(IntToStr(work.Product)+',');
  sp.SQL.Add('"'+work.Requirements+'",');
  sp.SQL.Add('"'+work.Periodic+'",');
  sp.SQL.Add(IntToStr(work.SupplyType)+',');
  sp.SQL.Add(IntToStr(work.SupplyConditions)+',');
  sp.SQL.Add('"'+work.Result+'"');
  sp.ExecSQL;
  dm.ADOConnection1.CommitTrans;
  MessageDlg('Данные о работе с клиентом успешно сохранены.',mtInformation, [mbOk], 0);
 except
  MessageDlg('Данные о работе с клиентом не сохранены.',mtError, [mbOk], 0);
  dm.ADOConnection1.RollbackTrans;
 end;
 sp.free;
end;

procedure TfrmClientWork.FormCreate(Sender: TObject);
begin
 productQuery:=TADOQuery.Create(nil);
 productQuery.Connection:=dm.ADOConnection1;
 productQuery.SQL.Add('select * from dbo.apProductDic');
 productQuery.Open;
 productDS:=TDataSource.Create(nil);
 productDS.DataSet:=productQuery;
 cbProduct.ListSource:=productDS;
 cbProduct.ListField:='name';
 cbProduct.KeyField:='id';
 cbProduct.KeyValue:=0;
 workID:=TStringList.Create;
 GroupBox1.Enabled:=False;
end;

procedure TfrmClientWork.FormShow(Sender: TObject);
begin
 work.clientID:=clID;
 FillWorkTable(clID);
end;

procedure TfrmClientWork.FillWorkTable(clID: Integer);
var
 qqq:TADOQuery;
 li:TListItem;
begin
 qqq:=TADOQuery.Create(nil);
 qqq.Connection:=dm.ADOConnection1;
 qqq.SQL.Add('select * from dbo.apClientHistory where clientID=:a');
 qqq.Parameters[0].Value:=clID;
 qqq.Open;
 qqq.First;
 ListView1.Clear;
 workID.Clear;
 if qqq.RecordCount<>0 then
  while not qqq.Eof do
    begin
     li:=ListView1.Items.Add;
     workID.Add(qqq.FieldByName('ID').AsString);
     li.Caption:=qqq.FieldByName('Name').AsString;
     li.SubItems.Add(qqq.FieldByName('callDate').AsString);
     li.SubItems.Add(qqq.FieldByName('callPurpose').AsString);
     li.SubItems.Add(qqq.FieldByName('mat_name').AsString);
     li.SubItems.Add(qqq.FieldByName('Requirement').AsString);
     li.SubItems.Add(qqq.FieldByName('Periodic').AsString);
     if qqq.FieldByName('SupplyType').AsInteger=0 then li.SubItems.Add('СВ')
     else li.SubItems.Add('ЖД');
     if qqq.FieldByName('SupplyCondition').AsInteger=0 then li.SubItems.Add('EXW')
     else li.SubItems.Add('CPT');
     qqq.Next;
    end;
end;

procedure TfrmClientWork.ClearFields;
begin
 leCallDate.Text:='_';
 leCallPurpose.Text:='_';
 cbProduct.KeyValue:=0;
 leRequirements.Text:='_';
 lePeriodic.Text:='_';
 RadioGroup1.ItemIndex:=0;
 RadioGroup1.ItemIndex:=1;
 leWorkResult.Lines.Clear;
 leWorkResult.Lines.Add('_');
 InitData;
end;

procedure TfrmClientWork.InitData;
begin
 leCallDateChange(Self);
 leCallPurposeChange(Self);
 cbProductCloseUp(Self);
 leRequirementsChange(Self);
 lePeriodicChange(Self);
 RadioGroup1.ItemIndex:=0;
 RadioGroup2.ItemIndex:=0;
 leWorkResultChange(Self);
end;

procedure TfrmClientWork.FillFields(id: Integer);
var
 query:TADOQuery;
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.ADOConnection1;
 query.SQL.Add('select * from dbo.apClientHistory where ID=:a');
 query.Parameters[0].Value:=id;
 query.Open;
 query.First;
 leCallDate.Text:=query.FieldByName('CallDate').AsString;
 leCallPurpose.Text:=query.FieldByName('CallPurpose').AsString;
 cbProduct.KeyValue:=query.FieldByName('productID').AsInteger;
 work.Product:=cbProduct.KeyValue;
 leRequirements.Text:=query.FieldByName('Requirement').AsString;
 lePeriodic.Text:=query.FieldByName('Periodic').AsString;
 leWorkResult.Lines.Clear;
 leWorkResult.Lines.Add(query.FieldByName('WorkResult').AsString);
end;

procedure TfrmClientWork.leCallPurposeChange(Sender: TObject);
begin
 if leCallPurpose.text<>'' then work.callPurpose:=leCallPurpose.Text
 else work.callPurpose:='_';

end;

procedure TfrmClientWork.lePeriodicChange(Sender: TObject);
begin
 if lePeriodic.Text<>'' then work.Periodic:=lePeriodic.Text
 else work.Periodic:='_';
end;

procedure TfrmClientWork.leRequirementsChange(Sender: TObject);
begin
 if leRequirements.Text<>'' then work.Requirements:=leRequirements.Text
 else work.Requirements:='_';
end;

procedure TfrmClientWork.leWorkResultChange(Sender: TObject);
begin
 if leWorkResult.Lines.Text<>'' then work.Result:=leWorkResult.Lines.Text
 else work.Result:='_';
end;

procedure TfrmClientWork.ListView1SelectItem(Sender: TObject; Item: TListItem;
  Selected: Boolean);
begin
 if Selected then
  begin
   p_key:=StrToInt(workID.Strings[Item.Index]);
   work.ID:=p_key;
   FillFields(p_key);
   btnEdit.Enabled:=True;
   btnDelete.Enabled:=True;
  end;
end;

procedure TfrmClientWork.RadioGroup1Click(Sender: TObject);
begin
 work.SupplyType:=RadioGroup1.ItemIndex;
end;

procedure TfrmClientWork.RadioGroup2Click(Sender: TObject);
begin
 work.SupplyConditions:=RadioGroup2.ItemIndex;
end;

procedure TfrmClientWork.leCallDateChange(Sender: TObject);
begin
 if leCallDate.Text<>'' then work.callDate:=leCallDate.Text
 else work.CallDate:='_';
end;

end.

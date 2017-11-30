unit U_frmLoadGradTable;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ADODB, StdCtrls, Gauges, geometricsolution, DB, u_dm, CheckLst;

type
  progress1 = class (TThread)
    procedure Execute;override;
  end;

type
  Tgrad_table_load_form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Gauge1: TGauge;
    Gauge2: TGauge;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Button1: TButton;
    Button2: TButton;
    Label7: TLabel;
    CheckListBox1: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure updateProgress1;
  end;

var
  grad_table_load_form: Tgrad_table_load_form;
  query:TADOQuery;
  tankCount,i:longint;
  j,currentDiameter:longint;
implementation

{$R *.dfm}

procedure progress1.Execute;
begin
end;

procedure Tgrad_table_load_form.updateProgress1;
begin

end;

procedure Tgrad_table_load_form.Button1Click(Sender: TObject);
const
  str='Вы подтверждаете загрузку калибровочных таблиц?';
var
  qqq:TADOQuery;
  qqqq:TADOQuery;
  tanks:array[1..255] of byte;
  k,cnt:byte;
  j:integer;
begin
if MessageDlg(str,mtConfirmation,[mbOk,mbCancel],0)=mrOk then
 begin
  button1.Enabled:=false;
  button2.Enabled:=false;
  cnt:=0;
  k:=0;
  for j := 0 to checklistbox1.Items.Count - 1 do
   begin
    if checklistbox1.Checked[j]=true then
     begin
      tanks[k]:=j;
      inc(cnt);
      inc(k);
     end;
   end;
  Gauge1.Progress:=0;
  Gauge2.Progress:=0;
  Label3.Caption:='Выполняется очистка для';
  for i := 0 to cnt-1 do
   begin
    if tanks[i]<>34 then
     if tanks[i]<>44 then
      if tanks[i]<>45 then
       if tanks[i]<>46 then
        begin
         query.Close;
         query.SQL.Clear;
         query.SQL.Add('delete from dbo.grad_tank where tank_id=:tid');
         query.Parameters[0].Value:=tanks[i];
         query.ExecSQL;
        end;
   end;
  Label3.Caption:='Выполняется загрузка для';
  qqqq:=TADOQuery.Create(nil);
  qqqq.Connection:=dm.Alexpromcon;
  qqq:=TADOQuery.Create(nil);
  qqq.Connection:=dm.alexpromcon;
  if cnt<>0 then
   begin
    for k := 0 to cnt - 1 do
     begin
      qqqq.close;
      qqqq.sql.clear;
      qqqq.SQL.Add('select tank_id, Inside_Diameter, Cylinder_Length, Conus_Height from dbo.tank_dic where tank_id=:a');
      qqqq.Parameters[0].Value:=tanks[k];
      qqqq.Open;
      qqqq.First;
      qqq:=TADOquery.Create(nil);
      qqq.Connection:=dm.Alexpromcon;
      qqq.Close;
      qqq.SQL.Clear;
      qqq.SQL.Add('insert into dbo.grad_tank(tank_id,mat_Level,mat_Volume) values (:a,:b,:c)');
      if qqqq.Fields[0].AsInteger<>34 then
       if qqqq.Fields[0].AsInteger<>44 then
        if qqqq.Fields[0].AsInteger<>45 then
         if qqqq.Fields[0].AsInteger<>46 then
          begin
           currentDiameter:=qqqq.Fields[1].AsInteger;
           i:=qqqq.Fields[0].AsInteger;
           for j := 0 to currentDiameter do
            begin
             Label4.Caption:=IntToStr(i);
             Label6.Caption:=IntToStr(cnt);
             Gauge1.Progress:=Round(j*100/currentDiameter);
             Gauge2.Progress:=Round(i*100/cnt);
             qqq.Parameters[0].Value:=qqqq.Fields[0].AsInteger;
             qqq.Parameters[1].Value:=j;
             qqq.Parameters[2].Value:=volumeSolve(qqqq.Fields[2].asInteger, qqqq.Fields[1].asInteger,qqqq.Fields[3].asInteger,j);
             qqq.ExecSQL;
            end;
          end;
   end;
  qqq.Free;
  qqqq.Free;
  ShowMessage('Загрузка калибровочных данных завершена!!!');
  grad_table_load_form.button1.Enabled:=true;
  grad_table_load_form.button2.Enabled:=true;
 end;
end;
end;

procedure Tgrad_table_load_form.Button2Click(Sender: TObject);
begin
  close;
end;

procedure Tgrad_table_load_form.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  query.Free;
  Action:=caFree;
end;

procedure Tgrad_table_load_form.FormCreate(Sender: TObject);
begin
 query:=TADOQuery.Create(nil);
 query.Connection:=dm.Alexpromcon;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select tank_name from dbo.tank_dic order by tank_id');
 query.Open;
 checklistbox1.Clear;
 while not query.Eof do
  begin
   checklistbox1.Items.Add(query.Fields[0].asstring);
   query.Next;
  end;
end;

end.

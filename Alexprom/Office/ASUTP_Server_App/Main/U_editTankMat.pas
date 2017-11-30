unit U_editTankMat;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBCtrls, StdCtrls, Mask, DBCGrids, ADODB, DB, ComCtrls, RpCon,
  RpConDS, RpDefine, RpRave, Menus, ExtCtrls;

type
  TeditTankMat = class(TForm)
    ListView1: TListView;
    RvProject1: TRvProject;
    RvDataSetConnection1: TRvDataSetConnection;
    RadioGroup1: TRadioGroup;
    Button1: TButton;
    Button2: TButton;
    RvDataSetConnection4: TRvDataSetConnection;
    ADOQuery1: TADOQuery;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }

    tank_edit_id:longint;
    procedure InitFrm;
  end;

var
  editTankMat: TeditTankMat;
  query_s,query_d,query:TADOQuery;
  ds_s,ds_d:TDataSource;
  p_key:longint;
implementation

uses U_editTankData, u_dm;

{$R *.dfm}

procedure TeditTankMat.InitFrm;
var
  li:TListItem;
begin
 ListView1.Clear;
 query_s.Close;
 query_s.SQL.Clear;
 query_s.SQL.Add('select * from dbo.mat_in_tank order by tank_id');
 query_s.Open;
 query_s.First;
 while not query_s.Eof do
  begin
     li:=ListView1.Items.Add;
     li.Caption:=query_s.FieldByName('tank_name').AsString;
     li.SubItems.add(query_s.FieldByName('Mat_Name').AsString);
     li.SubItems.add(query_s.FieldByName('MatLevel').AsString);
     li.SubItems.add(query_s.FieldByName('MatVolume').AsString);
     li.SubItems.add(query_s.FieldByName('plotn').AsString);
     li.SubItems.add(query_s.FieldByName('m').AsString);
     li.SubItems.add(query_s.FieldByName('t').AsString);
     li.SubItems.add(query_s.FieldByName('to_out').AsString);
     li.SubItems.Add(query_s.FieldByName('matOst').AsString);
     query_s.Next;
  end;
end;

procedure TeditTankMat.Button1Click(Sender: TObject);
var
  query_ins:TADOQuery;
begin
 if RadioGroup1.ItemIndex=0 then
   begin
    RvDataSetConnection1.DataSet:=query_s;
    RvProject1.ExecuteReport('report_by_tank_buh');
   end;
 if RadioGroup1.ItemIndex=1 then
   begin
    RvDataSetConnection1.DataSet:=query_s;
    RvProject1.ExecuteReport('report_by_tank_anton');
   end;
 if RadioGroup1.ItemIndex=2 then
   begin
    RvDataSetConnection1.DataSet:=query_s;
    query_ins:=TADOQuery.Create(nil);
    query_ins.Connection:=dm.alexpromCon;
    query_ins.Close;
    query_ins.SQL.Clear;
    query_ins.SQL.Add('delete from dbo.all_mat_report');
    query_ins.ExecSQL;
    query_ins.Close;
    query_ins.SQL.Clear;
    query_ins.SQL.Add('insert into dbo.all_mat_report (name,all_volume, all_m, all_to_out, all_to_in) ');
    query_ins.SQL.Add('values (:n,:av,:am:,:ao ,:ai)');
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from dbo.main_oil_volume');
    ADOQuery1.Active:=True;
    ADOQuery1.First;
    while not ADOQuery1.Eof do
      begin
        query_ins.Parameters[0].Value:=ADOQuery1.FieldValues['name'];
        query_ins.Parameters[1].Value:=ADOQuery1.FieldValues['sum_volume'];
        query_ins.Parameters[2].Value:=ADOQuery1.FieldValues['sum_m'];
        if ADOQuery1.FieldValues['sum_out']<0 then
           query_ins.Parameters[3].Value:=0
        else
           query_ins.Parameters[3].Value:=ADOQuery1.FieldValues['sum_out'];
        query_ins.Parameters[4].Value:=ADOQuery1.FieldValues['sum_in'];
        query_ins.ExecSQL;
        ADOQuery1.Next;
      end;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOquery1.SQL.Add('select sum(sum_volume) as sum_volume, sum(sum_m) as sum_m, ');
    ADOquery1.SQL.Add('sum(sum_out) as sum_out, sum(sum_in) as sum_in from dbo.main_oil_volume ');
    ADOquery1.SQL.Add('where id IN (8, 9, 10, 12, 14, 15, 17, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 35)');
    ADOQuery1.Open;
    ADOQuery1.First;
    query_ins.Parameters[0].Value:='Ñûנüו';
    query_ins.Parameters[1].Value:=ADOQuery1.Fields[0].AsInteger;
    query_ins.Parameters[2].Value:=ADOQuery1.Fields[1].AsInteger;
    query_ins.Parameters[3].Value:=ADOQuery1.Fields[2].AsInteger;
    query_ins.Parameters[4].Value:=ADOQuery1.Fields[3].AsInteger;
    query_ins.ExecSQL;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select sum(sum_volume),sum(sum_m),sum(sum_out),sum(sum_in) from dbo.main_oil_volume');
    ADOQuery1.Open;
    ADOQuery1.First;
    query_ins.Parameters[0].Value:='Èעמדמ';
    query_ins.Parameters[1].Value:=ADOQuery1.Fields[0].AsInteger;
    query_ins.Parameters[2].Value:=ADOQuery1.Fields[1].AsInteger;
    query_ins.Parameters[3].Value:=ADOQuery1.Fields[2].AsInteger;
    query_ins.Parameters[4].Value:=ADOQuery1.Fields[3].AsInteger;
    query_ins.ExecSQL;
    ADOQuery1.Close;
    ADOQuery1.SQL.Clear;
    ADOQuery1.SQL.Add('select * from dbo.all_mat_report');
    RvDataSetConnection4.DataSet:=ADOQuery1;
    RvProject1.ExecuteReport('main_oil_report');
    query_ins.Free;
   end;
end;

procedure TeditTankMat.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TeditTankMat.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query_s.Free;
 Action:=caFree;
end;

procedure TeditTankMat.FormCreate(Sender: TObject);
begin
 query_s:=TADOQuery.Create(nil);
 query_s.Connection:=dm.alexpromCon;
 adoquery1.Connection:=dm.alexpromCon;
 InitFrm;
end;

end.

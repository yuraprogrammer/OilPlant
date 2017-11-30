unit U_analisisreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, adodb;

type
  Tanalisisreport = class(TForm)
    DateTimePicker1: TDateTimePicker;
    ListView1: TListView;
    procedure DateTimePicker1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure updatereport(rd:tdate);
  public
    { Public declarations }
  end;

var
  analisisreport: Tanalisisreport;
  query:tadoquery;
implementation

uses u_dm;

{$R *.dfm}

procedure tanalisisreport.updatereport(rd: TDate);
var
 li:tlistitem;
begin
  listview1.Clear;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add('select fbgs_p, fbgs_t, fbgs_p20, fbgs_tkk, adt_p, adt_t, adt_p20, adt_tdark, adt_tflash,');
  query.SQL.Add('otg_p, otg_t, otg_p20, otg_tflash, andate, antime from dbo.chemicalanalisis where andate=:ad and antime between :t1 and :t1');
  query.Parameters[0].Value:=datetostr(rd);
  query.Parameters[1].Value:='08:00:00';
  query.Parameters[2].Value:='23:59:59';
  query.Open;
  query.First;
  while not query.Eof do
   begin
    li:=listview1.Items.Add;
    li.Caption:=query.FieldByName('andate').AsString;
    li.SubItems.Add(query.FieldByName('antime').AsString);
    li.SubItems.Add(query.FieldByName('fbgs_p').AsString);
    li.SubItems.Add(query.FieldByName('fbgs_t').AsString);
    li.SubItems.Add(query.FieldByName('fbgs_p20').AsString);
    li.SubItems.Add(query.FieldByName('fbgs_tkk').AsString);
    li.SubItems.Add(query.FieldByName('adt_p').AsString);
    li.SubItems.Add(query.FieldByName('adt_t').AsString);
    li.SubItems.Add(query.FieldByName('adt_p20').AsString);
    li.SubItems.Add(query.FieldByName('adt_tdark').AsString);
    li.SubItems.Add(query.FieldByName('adt_tflash').AsString);
    li.SubItems.Add(query.FieldByName('otg_p').AsString);
    li.SubItems.Add(query.FieldByName('otg_t').AsString);
    li.SubItems.Add(query.FieldByName('otg_p20').AsString);
    li.SubItems.Add(query.FieldByName('otg_tflash').AsString);
    query.Next;
   end;
   query.Close;
   query.Parameters[0].Value:=datetostr(rd+1);
   query.Parameters[1].Value:='00:00:00';
   query.Parameters[2].Value:='07:59:59';
   query.Open;
   query.First;
   while not query.Eof do
    begin
     li:=listview1.Items.Add;
     li.Caption:=query.FieldByName('andate').AsString;
     li.SubItems.Add(query.FieldByName('antime').AsString);
     li.SubItems.Add(query.FieldByName('fbgs_p').AsString);
     li.SubItems.Add(query.FieldByName('fbgs_t').AsString);
     li.SubItems.Add(query.FieldByName('fbgs_p20').AsString);
     li.SubItems.Add(query.FieldByName('fbgs_tkk').AsString);
     li.SubItems.Add(query.FieldByName('adt_p').AsString);
     li.SubItems.Add(query.FieldByName('adt_t').AsString);
     li.SubItems.Add(query.FieldByName('adt_p20').AsString);
     li.SubItems.Add(query.FieldByName('adt_tdark').AsString);
     li.SubItems.Add(query.FieldByName('adt_tflash').AsString);
     li.SubItems.Add(query.FieldByName('otg_p').AsString);
     li.SubItems.Add(query.FieldByName('otg_t').AsString);
     li.SubItems.Add(query.FieldByName('otg_p20').AsString);
     li.SubItems.Add(query.FieldByName('otg_tflash').AsString);
     query.Next;
    end;
end;

procedure Tanalisisreport.DateTimePicker1Change(Sender: TObject);
begin
updatereport(datetimepicker1.Date);
end;

procedure Tanalisisreport.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 query.Free;
 Action:=cafree;
end;

procedure Tanalisisreport.FormCreate(Sender: TObject);
begin

 query:=tadoquery.Create(nil);
 query.Connection:=dm.alexpromcon;
 datetimepicker1.Date:=now;
 updatereport(datetimepicker1.Date);
end;

end.

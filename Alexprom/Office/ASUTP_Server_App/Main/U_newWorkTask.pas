unit U_newWorkTask;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, adodb;

type
  TfrmNewWorkTask = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Panel3: TPanel;
    Panel4: TPanel;
    ComboBox2: TComboBox;
    Label2: TLabel;
    Panel5: TPanel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    Panel6: TPanel;
    Panel7: TPanel;
    Label3: TLabel;
    Label4: TLabel;
    Button1: TButton;
    Button2: TButton;
    Panel8: TPanel;
    ComboBox5: TComboBox;
    Label5: TLabel;
    MaskEdit5: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    procedure MaskEdit5Change(Sender: TObject);
    procedure MaskEdit4Change(Sender: TObject);
    procedure MaskEdit3Change(Sender: TObject);
    procedure MaskEdit2Change(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmNewWorkTask: TfrmNewWorkTask;
  query:tadoquery;
  fbgs_tkk, adt_tflash, adt_tpom, otg_tflash, otg_out:integer;
implementation

uses u_dm;

{$R *.dfm}

procedure TfrmNewWorkTask.Button1Click(Sender: TObject);
var
 id:longint;
begin
try
 button1.Enabled:=false;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select max(id) from dbo.uppgtasks');
 query.Open;
 id:=query.Fields[0].AsInteger;
 inc(id);
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('insert into dbo.uppgtasks (id, taskdate, tasktime, ');
 query.SQL.Add('fbgs_tkk, adt_tflash, adt_tpom, otg_tflash, otg_out, ');
 query.SQL.Add('fbgs_char, adt_char_0, adt_char_1, otg_char_0, otg_char_1) values (');
 query.SQL.Add(':a, :b, :c, :d, :e, :f, :g, :h, :i, :j, :k, :l, :m)');
 query.Parameters[0].Value:=id;
 if length(datetostr(now))=10 then
  query.Parameters[1].Value:=datetostr(now)
 else
  query.Parameters[1].Value:='0'+datetostr(now);
 if length(timetostr(now))=8 then
  query.Parameters[2].Value:=timetostr(now)
 else
  query.Parameters[2].Value:='0'+timetostr(now);
 if fbgs_tkk=-1000 then
  query.Parameters[3].Value:=null
 else
  query.Parameters[3].Value:=fbgs_tkk;
 if adt_tflash=-1000 then
  query.Parameters[4].Value:=null
 else
  query.Parameters[4].Value:=adt_tflash;
 if adt_tpom=-1000 then
  query.Parameters[5].Value:=null
 else
  query.Parameters[5].Value:=adt_tpom;
 if otg_tflash=-1000 then
  query.Parameters[6].Value:=null
 else
  query.Parameters[6].Value:=otg_tflash;
 if otg_out=-1000 then
  query.Parameters[7].Value:=null
 else
  query.Parameters[7].Value:=otg_out;
 query.Parameters[8].Value:=combobox1.Items.Strings[combobox1.ItemIndex];
 query.Parameters[9].Value:=combobox2.Items.Strings[combobox2.ItemIndex];
 query.Parameters[10].Value:=combobox3.Items.Strings[combobox3.ItemIndex];
 query.Parameters[11].Value:=combobox4.Items.Strings[combobox4.ItemIndex];
 query.Parameters[12].Value:=combobox5.Items.Strings[combobox5.ItemIndex];
 query.ExecSQL;
 showmessage('задание успешно создано.');
 button1.Enabled:=true;
except
 showmessage('че-то не то...');
 button1.Enabled:=true;
 exit;
end;
end;

procedure TfrmNewWorkTask.Button2Click(Sender: TObject);
begin
 close;
end;

procedure TfrmNewWorkTask.FormCreate(Sender: TObject);
begin
 query:=tadoquery.Create(nil);
 query.Connection:=dm.alexpromcon;
 query.Close;
 query.SQL.Clear;
 query.SQL.Add('select * from dbo.uppgtasks where id=(select max(id) from dbo.uppgtasks)');
 query.Open;
 query.First;
 if query.RecordCount=0 then
 else
  begin
   maskedit1.Text:=query.FieldByName('fbgs_tkk').AsString;
   maskedit2.Text:=query.FieldByName('adt_tflash').AsString;
   maskedit3.Text:=query.FieldByName('adt_tpom').AsString;
   maskedit4.Text:=query.FieldByName('otg_tflash').AsString;
   maskedit5.Text:=query.FieldByName('otg_out').AsString;
   combobox1.Text:=query.FieldByName('fbgs_char').AsString;
   combobox2.Text:=query.FieldByName('adt_char_0').AsString;
   combobox3.Text:=query.FieldByName('adt_char_1').AsString;
   combobox4.Text:=query.FieldByName('otg_char_0').AsString;
   combobox5.Text:=query.FieldByName('otg_char_1').AsString;
  end;
end;

procedure TfrmNewWorkTask.MaskEdit1Change(Sender: TObject);
begin
try
if maskedit1.Text='' then
 fbgs_tkk:=-1000
else
 fbgs_tkk:=strtoint(trim(maskedit1.Text));
except
 exit;
end;
end;

procedure TfrmNewWorkTask.MaskEdit2Change(Sender: TObject);
begin
try
if maskedit2.Text='' then
 adt_tflash:=-1000
else
 adt_tflash:=strtoint(trim(maskedit2.Text));
except
 exit;
end;
end;

procedure TfrmNewWorkTask.MaskEdit3Change(Sender: TObject);
begin
try
if maskedit3.Text='' then
 adt_tpom:=-1000
else
 adt_tpom:=strtoint(trim(maskedit3.Text));
except
 exit;
end;
end;

procedure TfrmNewWorkTask.MaskEdit4Change(Sender: TObject);
begin
try
if maskedit4.Text='' then
 otg_tflash:=-1000
else
 otg_tflash:=strtoint(trim(maskedit4.Text));
except
 exit;
end;
end;

procedure TfrmNewWorkTask.MaskEdit5Change(Sender: TObject);
begin
try
if maskedit5.Text='' then
 otg_out:=-1000
else
 otg_out:=strtoint(trim(maskedit5.Text));
except
 exit;
end;
end;

end.

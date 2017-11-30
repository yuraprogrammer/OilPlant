unit u_newcompound;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Mask, DBCtrls, ComCtrls;

type
  Tnew_compound_form = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    ComboBox1: TComboBox;
    GroupBox2: TGroupBox;
    DBLookupComboBox1: TDBLookupComboBox;
    Label4: TLabel;
    Label5: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    Label6: TLabel;
    Label7: TLabel;
    Panel3: TPanel;
    GroupBox3: TGroupBox;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    DBLookupComboBox2: TDBLookupComboBox;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    Panel4: TPanel;
    GroupBox4: TGroupBox;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    DBLookupComboBox3: TDBLookupComboBox;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    Panel5: TPanel;
    GroupBox5: TGroupBox;
    Label16: TLabel;
    Label17: TLabel;
    Label18: TLabel;
    Label19: TLabel;
    DBLookupComboBox4: TDBLookupComboBox;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    Panel6: TPanel;
    GroupBox6: TGroupBox;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    DBLookupComboBox5: TDBLookupComboBox;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    Panel7: TPanel;
    GroupBox7: TGroupBox;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label27: TLabel;
    DBLookupComboBox6: TDBLookupComboBox;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    Panel8: TPanel;
    GroupBox8: TGroupBox;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    DBLookupComboBox7: TDBLookupComboBox;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    Panel9: TPanel;
    GroupBox9: TGroupBox;
    Label32: TLabel;
    Panel10: TPanel;
    Label33: TLabel;
    Panel11: TPanel;
    Label34: TLabel;
    Panel12: TPanel;
    Label35: TLabel;
    MaskEdit15: TMaskEdit;
    Label36: TLabel;
    Panel13: TPanel;
    Label37: TLabel;
    MaskEdit16: TMaskEdit;
    Label38: TLabel;
    Panel14: TPanel;
    Label39: TLabel;
    MaskEdit17: TMaskEdit;
    Label40: TLabel;
    Panel15: TPanel;
    Label41: TLabel;
    MaskEdit18: TMaskEdit;
    Label42: TLabel;
    Panel16: TPanel;
    Label43: TLabel;
    MaskEdit19: TMaskEdit;
    Label44: TLabel;
    Panel17: TPanel;
    Label45: TLabel;
    MaskEdit20: TMaskEdit;
    Label46: TLabel;
    Panel18: TPanel;
    Label47: TLabel;
    MaskEdit21: TMaskEdit;
    Label48: TLabel;
    Panel19: TPanel;
    Label49: TLabel;
    MaskEdit22: TMaskEdit;
    Label50: TLabel;
    Panel20: TPanel;
    Button1: TButton;
    Button2: TButton;
    DateTimePicker1: TDateTimePicker;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    comp_date:TDate;
    comp_num:Longint;
  end;

var
  new_compound_form: Tnew_compound_form;

implementation

{$R *.dfm}

procedure Tnew_compound_form.Button2Click(Sender: TObject);
begin
 close;
end;

end.

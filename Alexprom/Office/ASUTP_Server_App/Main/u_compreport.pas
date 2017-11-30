unit u_compreport;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, DB, ADODB, RpCon, RpConDS, RpDefine, RpRave;

type
  Tcompreport = class(TForm)
    GroupBox1: TGroupBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Label2: TLabel;
    ComboBox2: TComboBox;
    ListView1: TListView;
    RvProject1: TRvProject;
    RvDataSetConnection9: TRvDataSetConnection;
    ADOQuery1: TADOQuery;
    RvDataSetConnection10: TRvDataSetConnection;
    ADOQuery2: TADOQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  compreport: Tcompreport;

implementation

{$R *.dfm}

end.

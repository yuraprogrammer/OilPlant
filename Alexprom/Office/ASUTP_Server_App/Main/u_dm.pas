unit u_dm;

interface

uses
  SysUtils, Classes, DB, ADODB, Messages, Dialogs, main;

type
  Tdm = class(TDataModule)
    alexpromCon: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.

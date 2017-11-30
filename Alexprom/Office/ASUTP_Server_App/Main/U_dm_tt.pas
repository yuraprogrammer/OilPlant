unit U_dm_tt;

interface

uses
  SysUtils, Classes, DB, ADODB;

type
  Tdm_tt = class(TDataModule)
    ADO_tt: TADOConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm_tt: Tdm_tt;

implementation

{$R *.dfm}

end.

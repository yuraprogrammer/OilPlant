unit uDM;

interface

uses
  SysUtils, Classes, DB, ADODB, Messages, Dialogs;

type
  TDM = class(TDataModule)
    ADOConnection1: TADOConnection;
    procedure ADOConnection1InfoMessage(Connection: TADOConnection;
      const Error: Error; var EventStatus: TEventStatus);
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{$R *.dfm}

procedure TDM.ADOConnection1InfoMessage(Connection: TADOConnection;
  const Error: Error; var EventStatus: TEventStatus);
begin
 MessageDlg(Error.Description,mtInformation,[mbok],0);
end;

procedure TDM.DataModuleCreate(Sender: TObject);
begin
 ADOConnection1.Connected:=true;
end;

end.

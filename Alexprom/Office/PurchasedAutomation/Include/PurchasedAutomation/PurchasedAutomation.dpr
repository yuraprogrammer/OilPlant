library PurchasedAutomation;

uses
  Forms,
  SysUtils,
  Classes,
  Dialogs,
  uClientBase in 'uClientBase.pas' {frmClientBase},
  uClientCard in 'uClientCard.pas' {frmClientCard},
  uDM in 'uDM.pas' {DM: TDataModule};

{$R *.res}


function show_purchased(accessLevel:integer):boolean;stdcall;
begin
try
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfrmClientBase, frmClientBase);
  frmClientBase.clAccessLevel:=accessLevel;
  frmClientBase.ShowModal;
  frmClientBase.Free;
  DM.Free;
  Result:=True;
except
  Result:=False;
end;
end;

exports show_purchased;

begin
end.

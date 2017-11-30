library startNewInventarization;


uses
  SysUtils,
  forms,
  Classes,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_newInventory in 'U_newInventory.pas' {newInventory},
  U_invLevel in 'U_invLevel.pas' {frmInvLevel};

{$R *.res}

function startnewinventory:boolean;
begin
try
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TnewInventory, newInventory);
  newinventory.ShowModal;
  newinventory.Free;
  dm.Free;
  result:=true;
except
  result:=false;
end;
end;

exports
  startnewinventory;
begin
end.

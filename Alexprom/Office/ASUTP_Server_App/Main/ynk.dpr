library ynk;

uses
  SysUtils,
  Classes,
  windows,
  variants,
  controls,forms,
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}

function expired:boolean;
begin
if '18.03.2010'<datetostr(now) then
 result:=true
else
 result:=false;
end;

exports
 expired;
begin

end.

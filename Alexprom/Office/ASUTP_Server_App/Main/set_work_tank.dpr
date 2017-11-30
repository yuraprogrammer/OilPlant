library set_work_tank;

uses
  SysUtils,
  Classes,forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_worktanks in 'U_worktanks.pas' {frmCheckWorkTank};

{$R *.res}

function setworktank:boolean;
begin
try
 application.CreateForm(tdm, dm);
 application.CreateForm(tfrmCheckWorkTank, frmCheckWorkTank);
 frmCheckWorkTank.ShowModal;
 frmCheckWorkTank.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 setworktank;
begin
end.

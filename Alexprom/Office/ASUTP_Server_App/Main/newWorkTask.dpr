library newWorkTask;

uses
  SysUtils,
  Classes,
  forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_newWorkTask in 'U_newWorkTask.pas' {frmNewWorkTask};

{$R *.res}

function addworktask:boolean;
begin
try
 application.CreateForm(tdm, dm);
 application.CreateForm(tfrmNewWorkTask, frmNewWorkTask);
 frmNewWorkTask.ShowModal;
 frmNewWorkTask.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 addworktask;
begin
end.

library show_uppg_tasks;

uses
  SysUtils,
  Classes,
  forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_showTasksUppg in 'U_showTasksUppg.pas' {frmUppgTasks};

{$R *.res}

function showuppgtasks(al:byte):boolean;
begin
try
 application.CreateForm(tdm, dm);
 application.CreateForm(tfrmuppgtasks, frmuppgtasks);
 if ((al=0) or (al=1)) then
  begin
   frmuppgtasks.button2.enabled:=true;
  end
 else
   frmuppgtasks.button2.enabled:=false;
 frmuppgtasks.ShowModal;
 frmuppgtasks.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 showuppgtasks;
begin
end.

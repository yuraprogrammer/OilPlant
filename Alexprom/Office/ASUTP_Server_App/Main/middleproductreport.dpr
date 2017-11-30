library middleproductreport;


uses
  SysUtils,
  Classes,
  forms,
  u_dm in 'u_dm.pas' {dm: TDataModule},
  U_middleaktform in 'U_middleaktform.pas' {middleaktForm};

{$R *.res}

function showmiddlereport:boolean;
begin
try
 application.CreateForm(tdm, dm);
 application.CreateForm(tmiddleaktForm, middleaktForm);
 middleaktForm.ShowModal;
 middleaktForm.Free;
 dm.Free;
 result:=true;
except
 result:=false;
end;
end;

exports
 showmiddlereport;
begin
end.

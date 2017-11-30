library middleReportsForm;

uses
  SysUtils,
  Classes,
  Forms,
  Messages,
  U_midRepForm in 'U_midRepForm.pas' {frmMidRep},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}

function show_middle_reports:boolean;
begin
try
 Application.CreateForm(Tdm, dm);
 Application.CReateForm(TfrmMidRep, frmMidRep);
 frmMidRep.ShowModal;
 frmMidRep.Free;
 dm.Free;
 Result:=true;
except
 Result:=false;
end;

end;

exports
 show_middle_reports;
begin
end.

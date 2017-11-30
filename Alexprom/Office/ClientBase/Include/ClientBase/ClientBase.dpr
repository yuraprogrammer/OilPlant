library ClientBase;

uses
  Forms,
  SysUtils,
  Classes,
  Dialogs,
  uClientBase in 'uClientBase.pas' {frmClientBase},
  uClientCard in 'uClientCard.pas' {frmClientCard},
  uClientWork in 'uClientWork.pas' {frmClientWork},
  U_sirie_dic in 'U_sirie_dic.pas' {sirie_dic},
  udm in 'udm.pas';

{$R *.res}


//Application.Initialize;
function show_client_base:boolean;
begin
try
    Application.CreateForm(TDM, DM);
    Application.CreateForm(TfrmClientBase, frmClientBase);
    frmClientBase.ShowModal;
    frmClientBase.Free;
    DM.Free;
    Result:=True;
except
	Result:=False;
end;

end;
exports show_client_base;
begin
end.

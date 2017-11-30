library sirie_transfer_form;

uses
  SysUtils,
  Classes,
  Forms,
  Types,
  Messages,
  Dialogs,
  Windows,
  U_tmc_transfer in 'U_tmc_transfer.pas' {sirie_transfer},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
  function show_sirie_transfer_form:boolean;
  begin
   try
     Application.CreateForm(Tdm,dm);
     Application.CreateForm(Tsirie_transfer, sirie_transfer);
     sirie_transfer.ShowModal;
     sirie_transfer.Free;
     dm.Free;
     Result:=true;
   except
     Result:=False;
   end;
  end;

  exports
    show_sirie_transfer_form;
begin
end.

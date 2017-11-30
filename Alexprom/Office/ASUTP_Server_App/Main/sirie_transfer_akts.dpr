library sirie_transfer_akts;

{ Important note about DLL memory management: ShareMem must be the
  first unit in your library's USES clause AND your project's (select
  Project-View Source) USES clause if your DLL exports any procedures or
  functions that pass strings as parameters or function results. This
  applies to all strings passed to and from your DLL--even those that
  are nested in records and classes. ShareMem is the interface unit to
  the BORLNDMM.DLL shared memory manager, which must be deployed along
  with your DLL. To avoid using BORLNDMM.DLL, pass string information
  using PChar or ShortString parameters. }

uses
  SysUtils,
  Classes,
  Forms,
  U_sirie_transfer_akt in 'U_sirie_transfer_akt.pas' {sirie_transfer_akt},
  u_dm in 'u_dm.pas' {dm: TDataModule};

{$R *.res}
function sirie_transfer_akt_form:boolean;
begin
try
  Application.CreateForm(Tdm,dm);
  Application.CreateForm(Tsirie_transfer_akt, sirie_transfer_akt);
  sirie_transfer_akt.ShowModal;
  sirie_transfer_akt.Free;
  dm.Free;
  Result:=true;
except
  Result:=False;
end;
end;

exports
  sirie_transfer_akt_form;
begin
end.

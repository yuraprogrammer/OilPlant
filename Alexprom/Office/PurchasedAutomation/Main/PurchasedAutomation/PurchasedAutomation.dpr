program PurchasedAutomation;

uses
  Forms,
  uClientBase in 'uClientBase.pas' {frmClientBase},
  uClientCard in 'uClientCard.pas' {frmClientCard},
  uDM in 'uDM.pas' {DM: TDataModule},
  U_sirie_dic in 'U_sirie_dic.pas' {sirie_dic};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmClientBase, frmClientBase);
  Application.CreateForm(TDM, DM);
  Application.Run;
end.

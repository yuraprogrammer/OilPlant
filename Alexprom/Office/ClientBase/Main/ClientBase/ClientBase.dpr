program ClientBase;

uses
  Forms,
  uClientBase in 'uClientBase.pas' {frmClientBase},
  uClientCard in 'uClientCard.pas' {frmClientCard},
  uDM in 'uDM.pas' {DM: TDataModule},
  uClientWork in 'uClientWork.pas' {frmClientWork},
  U_sirie_dic in 'U_sirie_dic.pas' {sirie_dic},
  uReport in 'uReport.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmClientBase, frmClientBase);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

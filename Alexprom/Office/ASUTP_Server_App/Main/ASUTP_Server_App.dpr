program ASUTP_Server_App;

uses
  Forms,
  main in 'main.pas' {mainForm},
  ABOUT in 'ABOUT.pas' {AboutBox},
  loginBox in 'loginBox.pas' {loginForm},
  u_dm in 'u_dm.pas' {dm: TDataModule},
  u_users in 'u_users.pas' {editUsers},
  u_frm_dataCodes in 'u_frm_dataCodes.pas' {frm_dataCodes},
  mainFunctions in 'mainFunctions.pas',
  geometricsolution in 'geometricsolution.pas',
  tsp_weight in 'tsp_weight.pas' {frmTSP},
  PortUnit in 'PortUnit.pas',
  viewZay in 'viewZay.pas' {Form1},
  zay_view in 'zay_view.pas' {Form2},
  zlab in 'zlab.pas' {Form3},
  tsp_zay in 'tsp_zay.pas' {Form4},
  updateZay in 'updateZay.pas' {UpdateZayForm},
  viewZak in 'viewZak.pas' {Form5},
  zak_view in 'zak_view.pas' {Form6},
  zaklab in 'zaklab.pas' {Form8};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TmainForm, mainForm);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TViewZayForm, ViewZayForm);
  Application.CreateForm(TfrmZayView, frmZayView);
  Application.CreateForm(Tfrmzlab, frmzlab);
  Application.CreateForm(TfrmTSP1, frmTSP1);
  Application.CreateForm(TUpdateZayForm, UpdateZayForm);
  Application.CreateForm(TViewZakForm, ViewZakForm);
  Application.CreateForm(TfrmZakView, frmZakView);
  Application.CreateForm(Tfrmzaklab, frmzaklab);
  Application.Run;
end.

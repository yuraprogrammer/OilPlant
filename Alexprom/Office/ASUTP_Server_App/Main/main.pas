unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, ActnList, StdActns, ExtCtrls, ToolWin, ComCtrls, ADODB,
  OleCtrls, SHDocVw, RpDefine, RpRender, RpRenderHTML, HTTPApp, HTTPProd,
  StdCtrls, ActnMan, ActnCtrls, ActnMenus, RibbonActnMenus,
  RibbonLunaStyleActnCtrls, Ribbon, RibbonObsidianStyleActnCtrls,
  RibbonSilverStyleActnCtrls, ImgList, PlatformDefaultStyleActnCtrls, ActnPopup,
  Buttons, ScreenTips, jpeg;

type
  StandartProc = function: boolean;

type
  paramproc = function(al: integer): boolean;stdcall;

type
  stringproc = function: tdate;

type
  TmainForm = class(TForm)
    ActionList1: TActionList;
    labzay: TAction;
    tspzay: TAction;
    addZay: TAction;
    FileExit1: TFileExit;
    Login: TAction;
    inputChemical: TAction;
    sirie_analis: TAction;
    viewChemical: TAction;
    deleteChemical: TAction;
    showAbout: TAction;
    showUsers: TAction;
    weighting: TAction;
    show_orgs: TAction;
    show_loaders: TAction;
    editDataCodes: TAction;
    edit_tanks: TAction;
    edit_TMC: TAction;
    addNaklad: TAction;
    addAkt: TAction;
    editAkt: TAction;
    showAkts: TAction;
    showNaklad: TAction;
    customers: TAction;
    inputPoverDataGeom: TAction;
    showPoverDocs: TAction;
    frmAddWeightingReport: TAction;
    showCalc: TAction;
    show_sirie_dic: TAction;
    tmc_transfer: TAction;
    setTankMat: TAction;
    sirie_transfer_history: TAction;
    inputTankData: TAction;
    load_grad_table_data: TAction;
    backupDB: TAction;
    newInvMonth: TAction;
    showInvReports: TAction;
    tank_chem_data: TAction;
    plotn_calc: TAction;
    show_sirie_analis: TAction;
    p25_analis: TAction;
    E1_Analis: TAction;
    TD_Analis: TAction;
    newUppgAkt: TAction;
    changeLastAktUppg: TAction;
    showAktsUppg: TAction;
    work_task: TAction;
    showUppgTasks: TAction;
    aktLab: TAction;
    lightsOutput: TAction;
    middleProduct: TAction;
    viewLabAkt: TAction;
    midProdForm: TAction;
    reSolveTransfers: TAction;
    ActionManager1: TActionManager;
    Image1: TImage;
    ScreenTipsManager1: TScreenTipsManager;
    Ribbon1: TRibbon;
    RibbonApplicationMenuBar1: TRibbonApplicationMenuBar;
    RibbonPage1: TRibbonPage;
    RibbonPage2: TRibbonPage;
    g_weightingsTSP: TRibbonGroup;
    g_tanksLab: TRibbonGroup;
    ImageList1: TImageList;
    g_tanksTSP: TRibbonGroup;
    g_aktsTSP: TRibbonGroup;
    g_ProbesLab: TRibbonGroup;
    g_sirieLab: TRibbonGroup;
    g_incomLab: TRibbonGroup;
    g_middleLab: TRibbonGroup;
    g_lightsLab: TRibbonGroup;
    RibbonPage3: TRibbonPage;
    ImageList2: TImageList;
    checkConnection: TAction;
    newLabAkt: TAction;
    ZayView: TAction;
    ViewZak:TAction;
    labzak: TAction;
    ClientBase: TAction;
    purchaseAuto: TAction;

    procedure middleProductExecute(Sender: TObject);
    procedure lightsOutputExecute(Sender: TObject);

    procedure newUppgAktExecute(Sender: TObject);
    procedure p25_analisExecute(Sender: TObject);
      procedure labzayExecute(Sender: TObject);
    procedure plotn_calcExecute(Sender: TObject);
      procedure tspzayExecute(Sender: TObject);
    procedure newInvMonthExecute(Sender: TObject);

    procedure load_grad_table_dataExecute(Sender: TObject);
    procedure inputTankDataExecute(Sender: TObject);

    procedure setTankMatExecute(Sender: TObject);
    procedure addZayExecute(Sender: TObject);
    procedure tmc_transferExecute (Sender: TObject);
    procedure frmAddWeightingReportExecute(Sender: TObject);
    procedure edit_TMCExecute(Sender: TObject);
    procedure edit_tanksExecute(Sender: TObject);
    procedure editDataCodesExecute(Sender: TObject);
    procedure weightingExecute(Sender: TObject);

    procedure FormCreate(Sender: TObject);

    procedure inputChemicalExecute(Sender: TObject);
    procedure LoginExecute(Sender: TObject);

    procedure inputPoverDataGeomExecute(Sender: TObject);

    procedure midProdFormExecute(Sender: TObject);
    procedure reSolveTransfersExecute(Sender: TObject);
    procedure labzakExecute (Sender: TObject);
    procedure newLabAktExecute(Sender: TObject);
    procedure zayviewexecute(Sender: TObject);
    procedure ViewZakExecute(Sender: TObject);
    procedure tank_chem_dataExecute(Sender: TObject);
    procedure sirie_transfer_historyExecute(Sender: TObject);
    procedure clientBaseExecute(Sender: TObject);
    procedure purchaseAutoExecute(Sender: TObject);



  private

  public
    currentuser: string;
    accessLevel, purchaseLevel: integer;
    curDate: string[10];
    procedure setAccess(level, pl: integer);
  end;

var
  Wrong: boolean;
  ZayNumber, r: integer;
  User,Password: string[10];
  mainForm: TmainForm;
  DllHandle: THandle;
  alnew: byte;
  show_frm_weight_report1: StandartProc;
  show_calc_form: StandartProc;
  //show_sirie_transfer: StandartProc;
  show_loader_form: StandartProc;
  show_naklad_form: StandartProc;
  showGradTableLoading: StandartProc;
  show_frm_weight_report: StandartProc;
  show_form_tank_data: StandartProc;
  show_sirie_transfer_form: StandartProc;
  sirie_transfer_akt_form: StandartProc;
  show_edit_tank_data: StandartProc;
  show_add_naklad_form: StandartProc;
  show_org_dic: StandartProc;
  show_add_akt_form: StandartProc;
  show_akts_form: StandartProc;
  show_tmc_form: StandartProc;
  show_weighting_form: StandartProc;
  show_geometric_data: StandartProc;
  showBackupForm: StandartProc;
  startNewInventarization: StandartProc;
  showInventarizationRep: StandartProc;
  inptankchemdata: StandartProc;
  plotncalcform: StandartProc;
  inputprobeanalysis: StandartProc;
  showanalisreport: StandartProc;
  sirieanalisform: StandartProc;
  sirieanalisreport: paramproc;
  e1analisis: paramproc;
  add_akt_uppg: StandartProc;
  adduppgtask: StandartProc;
  showuppgtask: paramproc;
  show_expired: StandartProc;
  uppg_akts_form: StandartProc;
  new_lab_akt: StandartProc;
  showlightsreport: StandartProc;
  showmiddleakt: StandartProc;
  CreateZay: StandartProc;
  show_tank_dic: StandartProc;
  show_lab_akt: StandartProc;
  showmiddlereports: StandartProc;
  show_resolve_form: StandartProc;
  add_akt_lab: StandartProc;
  client_base: StandartProc;
  purchasedAutomation:paramproc;
  query_s, query: TADOQuery;

implementation

uses ABOUT, loginBox, u_users, u_frm_dataCodes, u_tankdic, u_dm, tsp_weight,
  updateZay, zay_view, zlab, tsp_zay, viewZak, zak_view, zaklab;
{$R *.dfm}

procedure TmainForm.setAccess(level, pl: integer);
begin
  case level of
    0:
      begin
        Ribbon1.HideTabs := false;
        Login.Enabled := true;
        labzay.Enabled :=true;
        tspzay.Enabled := true;
        ZayView.Enabled := true;
        addZay.Enabled := true;
        inputChemical.Enabled := true;
        sirie_analis.Enabled := true;
        deleteChemical.Enabled := true;
        showAbout.Enabled := true;
        tmc_transfer.Enabled:=true;
        showUsers.Enabled := true;
        weighting.Enabled := true;
        show_orgs.Enabled := true;
        show_loaders.Enabled := true;
        editDataCodes.Enabled := true;
        edit_tanks.Enabled := true;
        edit_TMC.Enabled := true;
        addNaklad.Enabled := true;
        addAkt.Enabled := true;
        editAkt.Enabled := true;
        showAkts.Enabled := true;
        showNaklad.Enabled := true;
        customers.Enabled := true;
        inputPoverDataGeom.Enabled := true;
        showPoverDocs.Enabled := true;
        frmAddWeightingReport.Enabled := true;
        showCalc.Enabled := true;
        show_sirie_dic.Enabled := true;
        tmc_transfer.Enabled := true;
        setTankMat.Enabled := true;
        sirie_transfer_history.Enabled := true;
        inputTankData.Enabled := true;
        load_grad_table_data.Enabled := true;
        backupDB.Enabled := true;
        newInvMonth.Enabled := true;
        showInvReports.Enabled := true;
        tank_chem_data.Enabled := true;
        plotn_calc.Enabled := true;
        show_sirie_analis.Enabled := true;
        p25_analis.Enabled := true;
        E1_Analis.Enabled := true;
        TD_Analis.Enabled := true;
        newUppgAkt.Enabled := true;
        showAktsUppg.Enabled := true;
        aktLab.Enabled := true;
        work_task.Enabled := true;
        showUppgTasks.Enabled := true;
        aktLab.Enabled := true;
        lightsOutput.Enabled := true;
        middleProduct.Enabled := true;
        viewLabAkt.Enabled := true;
        midProdForm.Enabled := true;
        reSolveTransfers.Enabled := true;
        checkConnection.Enabled := true;
        clientBase.Enabled:=true;
      end;
    1:
      begin
        Ribbon1.HideTabs := false;
        Login.Enabled := true;
        ZayView.Enabled := true;
        addZay.Enabled := true;
        inputChemical.Enabled := false;
        sirie_analis.Enabled := true;
        deleteChemical.Enabled := false;
        showAbout.Enabled := true;
        showUsers.Enabled := false;
        weighting.Enabled := false;
        show_orgs.Enabled := false;
        show_loaders.Enabled := false;
        editDataCodes.Enabled := false;
        edit_tanks.Enabled := false;
        edit_TMC.Enabled := false;
        addNaklad.Enabled := false;
        addAkt.Enabled := false;
        editAkt.Enabled := false;
        showAkts.Enabled := false;
        showNaklad.Enabled := false;
        customers.Enabled := false;
        inputPoverDataGeom.Enabled := false;
        showPoverDocs.Enabled := false;
        frmAddWeightingReport.Enabled := false;
        showCalc.Enabled := true;
        show_sirie_dic.Enabled := false;
        tmc_transfer.Enabled := false;
        setTankMat.Enabled := true;
        sirie_transfer_history.Enabled := true;
        inputTankData.Enabled := false;
        load_grad_table_data.Enabled := false;
        backupDB.Enabled := false;
        newInvMonth.Enabled := false;
        showInvReports.Enabled := false;
        tank_chem_data.Enabled := false;
        plotn_calc.Enabled := true;
        show_sirie_analis.Enabled := true;
        p25_analis.Enabled := false;
        E1_Analis.Enabled := false;
        TD_Analis.Enabled := false;
        newUppgAkt.Enabled := true;
        showAktsUppg.Enabled := true;
        aktLab.Enabled := true;
        work_task.Enabled := false;
        showUppgTasks.Enabled := true;
        aktLab.Enabled := false;
        lightsOutput.Enabled := true;
        middleProduct.Enabled := true;
        viewLabAkt.Enabled := true;
        midProdForm.Enabled := true;
        reSolveTransfers.Enabled := false;
        checkConnection.Enabled := true;
        clientBase.Enabled:=false;
      end;
    2:
      begin
        Ribbon1.HideTabs := false;
        Login.Enabled := true;
        labzay.Enabled := true;
        tspzay.Enabled := false;
        ZayView.Enabled := false;
        addZay.Enabled := false;
        inputChemical.Enabled := false;
        sirie_analis.Enabled := false;
        deleteChemical.Enabled := false;
        showAbout.Enabled := false;
        showUsers.Enabled := false;
        weighting.Enabled := false;
        show_orgs.Enabled := false;
        show_loaders.Enabled := false;
        editDataCodes.Enabled := false;
        edit_tanks.Enabled := false;
        edit_TMC.Enabled := false;
        addNaklad.Enabled := false;
        addAkt.Enabled := false;
        editAkt.Enabled := false;
        showAkts.Enabled := false;
        showNaklad.Enabled := false;
        customers.Enabled := false;
        inputPoverDataGeom.Enabled := false;
        showPoverDocs.Enabled := false;
        frmAddWeightingReport.Enabled := false;
        showCalc.Enabled := false;
        show_sirie_dic.Enabled := false;
        tmc_transfer.Enabled := false;
        setTankMat.Enabled := false;
        sirie_transfer_history.Enabled := false;
        inputTankData.Enabled := false;
        load_grad_table_data.Enabled := false;
        backupDB.Enabled := false;
        newInvMonth.Enabled := false;
        showInvReports.Enabled := false;
        tank_chem_data.Enabled := false;
        plotn_calc.Enabled := true;
        show_sirie_analis.Enabled := false;
        p25_analis.Enabled := false;
        E1_Analis.Enabled := false;
        TD_Analis.Enabled := false;
        newUppgAkt.Enabled := false;
        showAktsUppg.Enabled := false;
        aktLab.Enabled := false;
        work_task.Enabled := false;
        showUppgTasks.Enabled := false;
        aktLab.Enabled := false;
        lightsOutput.Enabled := false;
        middleProduct.Enabled := false;
        viewLabAkt.Enabled := false;
        midProdForm.Enabled := false;
        reSolveTransfers.Enabled := false;
        checkConnection.Enabled := false;
        clientBase.Enabled:=false;

      end;
    3:
      begin
        Ribbon1.HideTabs := false;
        ViewZak.Enabled:=false;
        Login.Enabled := true;
        labzay.Enabled :=false;
        tspzay.Enabled := true;
        ZayView.Enabled := false;
        addZay.Enabled := false;
        inputChemical.Enabled := false;
        sirie_analis.Enabled := false;
        deleteChemical.Enabled := false;
        showAbout.Enabled := false;
        showUsers.Enabled := false;
        weighting.Enabled := false;
        show_orgs.Enabled := false;
        show_loaders.Enabled := false;
        editDataCodes.Enabled := false;
        edit_tanks.Enabled := false;
        edit_TMC.Enabled := false;
        addNaklad.Enabled := false;
        addAkt.Enabled := false;
        editAkt.Enabled := false;
        showAkts.Enabled := false;
        showNaklad.Enabled := false;
        customers.Enabled := false;
        inputPoverDataGeom.Enabled := false;
        showPoverDocs.Enabled := false;
        frmAddWeightingReport.Enabled := true;
        showCalc.Enabled := false;
        show_sirie_dic.Enabled := false;
        tmc_transfer.Enabled := true;
        setTankMat.Enabled := true;
        sirie_transfer_history.Enabled := false;
        inputTankData.Enabled := true;
        load_grad_table_data.Enabled := false;
        backupDB.Enabled := false;
        newInvMonth.Enabled := false;
        showInvReports.Enabled := false;
        tank_chem_data.Enabled := false;
        plotn_calc.Enabled := false;
        show_sirie_analis.Enabled := false;
        p25_analis.Enabled := false;
        E1_Analis.Enabled := false;
        TD_Analis.Enabled := false;
        newUppgAkt.Enabled := false;
        showAktsUppg.Enabled := false;
        aktLab.Enabled := false;
        work_task.Enabled := false;
        showUppgTasks.Enabled := false;
        aktLab.Enabled := false;
        lightsOutput.Enabled := false;
        middleProduct.Enabled := false;
        viewLabAkt.Enabled := false;
        midProdForm.Enabled := false;
        reSolveTransfers.Enabled := false;
        checkConnection.Enabled := false;
        clientBase.Enabled:=false;
      end;

    4:
      begin
        Ribbon1.HideTabs := false;
        Login.Enabled := true;
        labzay.Enabled :=false;
        tspzay.Enabled := false;
        ZayView.Enabled := true;
        addZay.Enabled := false;
        inputChemical.Enabled := false;
        sirie_analis.Enabled := false;
        deleteChemical.Enabled := false;
        showAbout.Enabled := false;
        showUsers.Enabled := false;
        weighting.Enabled := false;
        show_orgs.Enabled := false;
        show_loaders.Enabled := false;
        editDataCodes.Enabled := false;
        edit_tanks.Enabled := false;
        edit_TMC.Enabled := false;
        addNaklad.Enabled := false;
        addAkt.Enabled := false;
        editAkt.Enabled := false;
        showAkts.Enabled := false;
        showNaklad.Enabled := false;
        customers.Enabled := false;
        inputPoverDataGeom.Enabled := false;
        showPoverDocs.Enabled := false;
        frmAddWeightingReport.Enabled := true;
        showCalc.Enabled := false;
        show_sirie_dic.Enabled := false;
        tmc_transfer.Enabled := false;
        setTankMat.Enabled := true;
        sirie_transfer_history.Enabled := false;
        inputTankData.Enabled := false;
        load_grad_table_data.Enabled := false;
        backupDB.Enabled := false;
        newInvMonth.Enabled := false;
        showInvReports.Enabled := false;
        tank_chem_data.Enabled := false;
        plotn_calc.Enabled := false;
        show_sirie_analis.Enabled := false;
        p25_analis.Enabled := false;
        E1_Analis.Enabled := false;
        TD_Analis.Enabled := false;
        newUppgAkt.Enabled := false;
        showAktsUppg.Enabled := false;
        aktLab.Enabled := false;
        work_task.Enabled := false;
        showUppgTasks.Enabled := false;
        aktLab.Enabled := false;
        lightsOutput.Enabled := false;
        middleProduct.Enabled := false;
        viewLabAkt.Enabled := false;
        midProdForm.Enabled := false;
        reSolveTransfers.Enabled := false;
        checkConnection.Enabled := false;
        if pl<>1 then clientBase.Enabled:=false
        else clientBase.Enabled:=true;
      end;
    5:
      begin
        Ribbon1.HideTabs := false;
        Login.Enabled := true;
        ZayView.Enabled := true;
        labzay.Enabled :=false;
        tspzay.Enabled := false;
        addZay.Enabled := false;
        inputChemical.Enabled := false;
        sirie_analis.Enabled := false;
        deleteChemical.Enabled := false;
        showAbout.Enabled := false;
        showUsers.Enabled := false;
        weighting.Enabled := false;
        show_orgs.Enabled := false;
        show_loaders.Enabled := false;
        editDataCodes.Enabled := false;
        edit_tanks.Enabled := false;
        edit_TMC.Enabled := false;
        addNaklad.Enabled := false;
        addAkt.Enabled := false;
        editAkt.Enabled := false;
        showAkts.Enabled := false;
        showNaklad.Enabled := false;
        customers.Enabled := false;
        inputPoverDataGeom.Enabled := false;
        showPoverDocs.Enabled := false;
        frmAddWeightingReport.Enabled := false;
        showCalc.Enabled := false;
        show_sirie_dic.Enabled := false;
        tmc_transfer.Enabled := false;
        setTankMat.Enabled := false;
        sirie_transfer_history.Enabled := false;
        inputTankData.Enabled := false;
        load_grad_table_data.Enabled := false;
        backupDB.Enabled := false;
        newInvMonth.Enabled := false;
        showInvReports.Enabled := false;
        tank_chem_data.Enabled := false;
        plotn_calc.Enabled := false;
        show_sirie_analis.Enabled := false;
        p25_analis.Enabled := false;
        E1_Analis.Enabled := false;
        TD_Analis.Enabled := false;
        newUppgAkt.Enabled := false;
        showAktsUppg.Enabled := false;
        aktLab.Enabled := false;
        work_task.Enabled := false;
        showUppgTasks.Enabled := false;
        aktLab.Enabled := false;
        lightsOutput.Enabled := false;
        middleProduct.Enabled := false;
        viewLabAkt.Enabled := false;
        midProdForm.Enabled := false;
        reSolveTransfers.Enabled := false;
        checkConnection.Enabled := false;
         clientBase.Enabled:=false;
      end;
    6:
      begin
        Ribbon1.HideTabs:=false;
              end;
    100:
      begin
        Ribbon1.HideTabs := true;
        ViewZak.Enabled:=false;
        labzak.Enabled:=false;
        Login.Enabled := true;
        labzay.Enabled :=false;
        tspzay.Enabled := false;
        ZayView.Enabled := false;
        addZay.Enabled := false;
        inputChemical.Enabled := false;
        sirie_analis.Enabled := false;
        deleteChemical.Enabled := false;
        showAbout.Enabled := false;
        showUsers.Enabled := false;
        weighting.Enabled := false;
        show_orgs.Enabled := false;
        show_loaders.Enabled := false;
        editDataCodes.Enabled := false;
        edit_tanks.Enabled := false;
        edit_TMC.Enabled := false;
        addNaklad.Enabled := false;
        addAkt.Enabled := false;
        editAkt.Enabled := false;
        showAkts.Enabled := false;
        showNaklad.Enabled := false;
        customers.Enabled := false;
        inputPoverDataGeom.Enabled := false;
        showPoverDocs.Enabled := false;
        frmAddWeightingReport.Enabled := false;
        showCalc.Enabled := false;
        show_sirie_dic.Enabled := false;
        tmc_transfer.Enabled := false;
        setTankMat.Enabled := false;
        sirie_transfer_history.Enabled := false;
        inputTankData.Enabled := false;
        load_grad_table_data.Enabled := false;
        backupDB.Enabled := false;
        newInvMonth.Enabled := false;
        showInvReports.Enabled := false;
        tank_chem_data.Enabled := false;
        plotn_calc.Enabled := false;
        show_sirie_analis.Enabled := false;
        p25_analis.Enabled := false;
        E1_Analis.Enabled := false;
        TD_Analis.Enabled := false;
        newUppgAkt.Enabled := false;
        showAktsUppg.Enabled := false;
        aktLab.Enabled := false;
        work_task.Enabled := false;
        showUppgTasks.Enabled := false;
        aktLab.Enabled := false;
        lightsOutput.Enabled := false;
        middleProduct.Enabled := false;
        viewLabAkt.Enabled := false;
        midProdForm.Enabled := false;
        reSolveTransfers.Enabled := false;
        checkConnection.Enabled := false;
        clientBase.Enabled:=false;
      end;
  end;
end;

procedure TmainForm.setTankMatExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\show_cur_tank_data.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  show_form_tank_data := GetProcAddress(DllHandle, 'show_form_tank_data');
  if show_form_tank_data = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.sirie_transfer_historyExecute(Sender: TObject);
begin
DllHandle:=SafeLoadLibrary('lib\sirie_transfer_akts.dll');
  if DLLHandle = 0 then
    begin
      if GetLastError = ERROR_DLL_NOT_FOUND then
        ShowMessage('Ошибка загрузки DLL');
        Close;
  end;
  sirie_transfer_akt_form:=GetProcAddress(DllHandle,'sirie_transfer_akt_form');
 if sirie_transfer_akt_form=true then
  FreeLibrary(DllHandle);
end;

procedure TmainForm.frmAddWeightingReportExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\show_weight_report.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  show_frm_weight_report := GetProcAddress(DllHandle, 'show_frm_weight_report');
  if show_frm_weight_report = true then
    FreeLibrary(DllHandle);
end;

// procedure TmainForm.weightingExecute(Sender: TObject);
// begin
// DllHandle:=SafeLoadLibrary('lib\weighting_form.dll');
// if DllHandle = 0 then
// begin
// if GetLastError = ERROR_DLL_NOT_FOUND then
// ShowMessage('Ошибка загрузки DLL');
// Close;
// end;
// show_weighting_form:=GetProcAddress(DllHandle,'show_weighting_form');
// if show_weighting_form=true then
// FreeLibrary(DllHandle);
// end;

procedure TmainForm.p25_analisExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\e1analisis_form.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  e1analisis := GetProcAddress(DllHandle, 'e1analisis');
  if e1analisis(1) = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.plotn_calcExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\plotncalc.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  plotncalcform := GetProcAddress(DllHandle, 'plotncalcform');
  if plotncalcform = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.purchaseAutoExecute(Sender: TObject);
begin
DllHandle := LoadLibrary('lib\PurchasedAutomation.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  @purchasedAutomation := GetProcAddress(DllHandle, 'show_purchased');
  if purchasedAutomation(purchaseLevel) = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.reSolveTransfersExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\transfer_resolve.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  show_resolve_form := GetProcAddress(DllHandle, 'resolve_form');
  if show_resolve_form = true then
    FreeLibrary(DllHandle);
end;



procedure TmainForm.clientBaseExecute(Sender: TObject);
begin
 DllHandle := SafeLoadLibrary('lib\ClientBase.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  client_base := GetProcAddress(DllHandle, 'show_client_base');
  if client_base = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.editDataCodesExecute(Sender: TObject);
begin
  Application.CreateForm(Tfrm_dataCodes, frm_dataCodes);
  frm_dataCodes.ShowModal
end;

procedure TmainForm.labzayExecute(Sender: TObject);
begin
  Application.CreateForm(Tfrmzlab, frmzlab);
  frmzlab.Show;
  mainform.WindowState:=wsminimized;
end;

procedure TmainForm.labzakExecute(Sender: TObject);
begin
  Application.CreateForm(Tfrmzaklab, frmzaklab);
  frmzaklab.Show;
  mainform.WindowState:=wsminimized;
end;

procedure TmainForm.tspzayExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmTSP1, frmTSP1);
  frmTSP1.ShowModal;
end;

procedure TmainForm.edit_tanksExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\tank_dic.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  show_tank_dic := GetProcAddress(DllHandle, 'tank_dic_show');
  if show_tank_dic = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.edit_TMCExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\tmc_dic.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  show_tmc_form := GetProcAddress(DllHandle, 'show_tmc_form');
  if show_tmc_form = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.tank_chem_dataExecute(Sender: TObject);
begin
DllHandle:=SafeLoadLibrary('lib\tank_chem_data.dll');
  if DLLHandle = 0 then
    begin
      if GetLastError = ERROR_DLL_NOT_FOUND then
        ShowMessage('Ошибка загрузки DLL');
        Close;
  end;
  inptankchemdata:=GetProcAddress(DllHandle,'inptankchemdata');
if inptankchemdata=true then
  FreeLibrary(DllHandle);
end;

procedure TmainForm.tmc_transferExecute(Sender: TObject);
begin
   DllHandle := SafeLoadLibrary('lib\sirie_transfer_form.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
 show_sirie_transfer_form := GetProcAddress(DllHandle, 'show_sirie_transfer_form');
  if show_sirie_transfer_form = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.FormCreate(Sender: TObject);
begin
  accessLevel := 100;
  Wrong:=false;
end;

procedure TmainForm.ViewZakExecute(Sender: TObject);
begin
   Application.CreateForm(TfrmZakView, frmZakView);
  frmZakView.Show;
  mainform.WindowState:=wsminimized;
end;

procedure TmainForm.addZayExecute(Sender: TObject);
begin
  query_s := TADOQuery.Create(nil);
  query_s.Connection := dm.alexpromCon;
  query := TADOQuery.Create(nil);
  query.Connection := dm.alexpromCon;
  query_s.Close;
  query_s.SQL.Clear;
  query_s.SQL.Add('select max(nomerzay) from dbo.zay');
  query_s.Open;
  r := query_s.Fields[0].AsInteger;
  ZayNumber := r + 1;
  query.Close;
  query.SQL.Clear;
  query.SQL.Add(
    'insert into dbo.zay(nomerzay, podalZay, vid, pogr, sost, in_time, out_time, fakt, temp, plotn, netto, kalibr, netto_kalibr) values (:nz, :pz, :v, :p, :s, :it, :ot, :f, :t, :pl, :n, :k, :nk)');
  query.Parameters[0].Value := ZayNumber;
  query.Parameters[1].Value := User;
  query.Parameters[2].Value := 'док';
  query.Parameters[3].Value := 'стоим, не грузим';
  query.Parameters[4].Value := 0;
  query.Parameters[5].Value := ' ';
  query.Parameters[6].Value := ' ';
  query.Parameters[7].Value := 0;
  query.Parameters[8].Value := 0;
  query.Parameters[9].Value := 0;
  query.Parameters[10].Value := 0;
  query.Parameters[11].Value := 0;
  query.Parameters[12].Value := 0;
  query.ExecSQL;
  Application.CreateForm(TUpdateZayForm, UpdateZayForm);
  UpdateZayForm.ShowModal;


end;

procedure TmainForm.inputChemicalExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\probeanalysisinput.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  inputprobeanalysis := GetProcAddress(DllHandle, 'inputprobeanalysis');
  if inputprobeanalysis = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.inputPoverDataGeomExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\geometric_data.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  show_geometric_data := GetProcAddress(DllHandle, 'geometric_data');
  if show_geometric_data = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.inputTankDataExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\edit_tank_data.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  show_edit_tank_data := GetProcAddress(DllHandle, 'show_edit_tank_data');
  if show_edit_tank_data = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.lightsOutputExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\lightsoutputreport.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  showlightsreport := GetProcAddress(DllHandle, 'showlightsoutputreport');
  if showlightsreport = true then
    FreeLibrary(DllHandle); //
end;

procedure TmainForm.load_grad_table_dataExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\load_grad_table.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  showGradTableLoading := GetProcAddress(DllHandle, 'showGradTableLoading');
  if showGradTableLoading = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.LoginExecute(Sender: TObject);
begin
  Ribbon1.HideTabs := true;
  dm.alexpromCon.Connected := false;
  Application.CreateForm(TLoginForm, loginForm);
  loginForm.ShowModal;
  Ribbon1.HideTabs := false;
end;

procedure TmainForm.weightingExecute(Sender: TObject);
begin
  Application.CreateForm(TfrmTSP, frmTSP);
  frmTSP.ShowModal;
end;

procedure TmainForm.zayviewexecute(Sender: TObject);
begin
  Application.CreateForm(TfrmZayView, frmZayView);
  frmZayView.Show;
  mainform.WindowState:=wsminimized;
end;

procedure TmainForm.middleProductExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\middleproductreport.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  showmiddleakt := GetProcAddress(DllHandle, 'showmiddlereport');
  if showmiddleakt = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.midProdFormExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\middleReportsForm.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  showmiddlereports := GetProcAddress(DllHandle, 'show_middle_reports');
  if showmiddlereports = true then
    FreeLibrary(DllHandle);

end;

procedure TmainForm.newInvMonthExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\startNewInventarization.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  startNewInventarization := GetProcAddress(DllHandle, 'startnewinventory');
  if startNewInventarization = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.newLabAktExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\add_lab_akt.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  add_akt_lab := GetProcAddress(DllHandle, 'add_akt_lab');
  if add_akt_lab = true then
    FreeLibrary(DllHandle);
end;

procedure TmainForm.newUppgAktExecute(Sender: TObject);
begin
  DllHandle := SafeLoadLibrary('lib\new_uppg_akt.dll');
  if DllHandle = 0 then
  begin
    if GetLastError = ERROR_DLL_NOT_FOUND then
      ShowMessage('Ошибка загрузки DLL');
    Close;
  end;
  add_akt_uppg := GetProcAddress(DllHandle, 'add_uppg_akt');
  if add_akt_uppg = true then
    FreeLibrary(DllHandle);
end;

end.

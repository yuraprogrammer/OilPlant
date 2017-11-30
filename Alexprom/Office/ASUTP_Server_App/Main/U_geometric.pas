unit U_geometric;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Mask, ExtCtrls,geometricsolution, ADODB, Grids,
  Spin;

type
  TGeometricData = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    TabSheet6: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    Panel10: TPanel;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Panel14: TPanel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    Label1: TLabel;
    Label2: TLabel;
    MaskEdit6: TMaskEdit;
    Button1: TButton;
    Button3: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    Label3: TLabel;
    StringGrid1: TStringGrid;
    Panel15: TPanel;
    Panel16: TPanel;
    Panel17: TPanel;
    Panel18: TPanel;
    Panel19: TPanel;
    Panel20: TPanel;
    Panel21: TPanel;
    Panel22: TPanel;
    Panel23: TPanel;
    Panel24: TPanel;
    Panel25: TPanel;
    Panel26: TPanel;
    Panel27: TPanel;
    Panel28: TPanel;
    Panel29: TPanel;
    Panel30: TPanel;
    Panel31: TPanel;
    Panel32: TPanel;
    Panel33: TPanel;
    Panel34: TPanel;
    Panel35: TPanel;
    Panel36: TPanel;
    SpinEdit1: TSpinEdit;
    Label4: TLabel;
    StringGrid2: TStringGrid;
    Panel37: TPanel;
    Panel38: TPanel;
    Panel39: TPanel;
    Panel40: TPanel;
    Panel41: TPanel;
    Panel42: TPanel;
    Panel43: TPanel;
    Panel44: TPanel;
    Panel45: TPanel;
    Panel46: TPanel;
    Panel47: TPanel;
    Panel48: TPanel;
    Panel49: TPanel;
    Panel50: TPanel;
    Panel51: TPanel;
    Panel52: TPanel;
    Panel53: TPanel;
    Panel54: TPanel;
    Panel55: TPanel;
    Panel56: TPanel;
    Panel57: TPanel;
    Panel58: TPanel;
    Panel59: TPanel;
    Panel60: TPanel;
    Panel64: TPanel;
    Panel65: TPanel;
    Panel66: TPanel;
    StringGrid3: TStringGrid;
    Panel61: TPanel;
    GroupBox1: TGroupBox;
    Panel62: TPanel;
    Panel69: TPanel;
    Panel72: TPanel;
    Panel63: TPanel;
    Panel67: TPanel;
    Panel68: TPanel;
    Panel71: TPanel;
    Panel73: TPanel;
    Panel70: TPanel;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    Panel83: TPanel;
    MaskEdit15: TMaskEdit;
    MaskEdit16: TMaskEdit;
    MaskEdit17: TMaskEdit;
    MaskEdit18: TMaskEdit;
    Panel84: TPanel;
    MaskEdit19: TMaskEdit;
    MaskEdit20: TMaskEdit;
    MaskEdit21: TMaskEdit;
    MaskEdit22: TMaskEdit;
    GroupBox2: TGroupBox;
    Panel74: TPanel;
    Panel75: TPanel;
    Panel76: TPanel;
    Panel77: TPanel;
    Panel78: TPanel;
    Panel79: TPanel;
    Panel80: TPanel;
    Panel81: TPanel;
    Panel82: TPanel;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    Panel85: TPanel;
    MaskEdit23: TMaskEdit;
    MaskEdit24: TMaskEdit;
    MaskEdit25: TMaskEdit;
    MaskEdit26: TMaskEdit;
    Panel86: TPanel;
    MaskEdit27: TMaskEdit;
    MaskEdit28: TMaskEdit;
    MaskEdit29: TMaskEdit;
    MaskEdit30: TMaskEdit;
    Panel87: TPanel;
    MaskEdit31: TMaskEdit;
    MaskEdit32: TMaskEdit;
    MaskEdit33: TMaskEdit;
    MaskEdit34: TMaskEdit;
    Panel88: TPanel;
    MaskEdit35: TMaskEdit;
    MaskEdit36: TMaskEdit;
    MaskEdit37: TMaskEdit;
    MaskEdit38: TMaskEdit;
    GroupBox3: TGroupBox;
    Panel89: TPanel;
    Panel90: TPanel;
    Panel91: TPanel;
    Panel97: TPanel;
    MaskEdit39: TMaskEdit;
    MaskEdit40: TMaskEdit;
    MaskEdit41: TMaskEdit;
    MaskEdit42: TMaskEdit;
    Panel92: TPanel;
    Panel98: TPanel;
    Panel99: TPanel;
    Panel102: TPanel;
    Panel103: TPanel;
    Panel104: TPanel;
    Panel93: TPanel;
    Panel94: TPanel;
    Panel95: TPanel;
    Panel96: TPanel;
    Panel100: TPanel;
    Panel101: TPanel;
    MaskEdit43: TMaskEdit;
    MaskEdit44: TMaskEdit;
    MaskEdit45: TMaskEdit;
    MaskEdit46: TMaskEdit;
    MaskEdit47: TMaskEdit;
    MaskEdit48: TMaskEdit;
    MaskEdit49: TMaskEdit;
    MaskEdit50: TMaskEdit;
    MaskEdit51: TMaskEdit;
    MaskEdit52: TMaskEdit;
    MaskEdit53: TMaskEdit;
    MaskEdit54: TMaskEdit;
    MaskEdit55: TMaskEdit;
    MaskEdit56: TMaskEdit;
    MaskEdit57: TMaskEdit;
    MaskEdit58: TMaskEdit;
    MaskEdit59: TMaskEdit;
    MaskEdit60: TMaskEdit;
    MaskEdit61: TMaskEdit;
    MaskEdit62: TMaskEdit;
    MaskEdit63: TMaskEdit;
    MaskEdit64: TMaskEdit;
    MaskEdit65: TMaskEdit;
    MaskEdit66: TMaskEdit;
    MaskEdit67: TMaskEdit;
    MaskEdit68: TMaskEdit;
    MaskEdit69: TMaskEdit;
    MaskEdit70: TMaskEdit;
    procedure MaskEdit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SpinEdit1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure updateNaklonRealTime;
    procedure updateNaklonData(H11,H12,H21,H22,L1,L2:word;Naklon:real);
    procedure selectNaklonData;
    procedure selectInsideDiameter;
    procedure updateInsideDiameter;
    procedure selectOutsideMeasure(Tank_Id:byte);
    procedure updateOutsideMeasure(Tank_Id:byte);
    procedure saveData;
  end;

var
  GeometricData: TGeometricData;
  query_emk, query_nakl:TADOQuery;
  band_count:byte;
implementation

uses u_dm;

{$R *.dfm}

procedure TGeometricData.selectInsideDiameter;
var
  qry:TADOQuery;
  i: Integer;
  j: Integer;
begin
  qry:=TADOQuery.Create(nil);
  qry.Connection:=dm.alexpromCon;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select band_count from dbo.tank_dic where tank_id=:tid');
  qry.Parameters[0].Value:=ComboBox1.ItemIndex;
  qry.Open;
  qry.First;
  band_count:=qry.FieldValues['band_count'];
  SpinEdit1.Value:=band_count;
  SpinEdit1.OnChange(self);
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('select * from dbo.tank_inside_diameter_band where tank_id=:tid');
  qry.Parameters[0].Value:=ComboBox1.ItemIndex;
  qry.Open;
  qry.First;
  i:=1;
  if qry.RecordCount<>0 then
    begin
      while not qry.Eof do
        begin
         for j := 1 to qry.FieldCount-1 do
           begin
            StringGrid1.Cells[j,i-1]:=qry.Fields[j].AsString;
           end;
          inc(i);
          qry.Next;
        end;
    end
  else
   for I := 0 to band_Count - 1 do
      for j := 1 to 13 do
        begin
          StringGrid1.Cells[j,i]:=IntToStr(0);
        end;
end;

procedure TGeometricData.updateInsideDiameter;
var
  DLH, DLV, DCH, DCV, DRH, DRV:array [0..1,0..23] of word;
  DHL, DVL, DHC, DVC, DHR, DVR, DH, DV, D: array [0..23] of real;
  i,j:byte;
  qry:TADOQuery;
begin
if ComboBox1.ItemIndex<>0 then
 begin
  qry:=TADOQuery.Create(nil);
  qry.Connection:=dm.alexpromCon;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('delete from dbo.tank_inside_diameter_band where tank_id=:tid');
  qry.Parameters[0].Value:=ComboBox1.ItemIndex;
  qry.ExecSQL;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('insert into dbo.tank_inside_diameter_band (tank_id,DLH1,DLH2,DLV1,DLV2,DCH1,DCH2,DCV1,DCV2,DRH1,DRH2,DRV1,DRV2,D) ');
  qry.SQL.Add('values (:@tid,:dlh1,:dlh2,:dlv1,:dlv2,:dch1,:dch2,:dcv1,:dcv2,:drh1,:drh2,:drv1,:drv2,:d)');
  for i := 0 to 1 do
    for j := 0 to band_count-1 do
      begin
       try
        DLH[i,j]:=StrToInt(StringGrid1.Cells[i+1,j]);
        DLV[i,j]:=StrToInt(StringGrid1.Cells[i+3,j]);
        DCH[i,j]:=StrToInt(StringGrid1.Cells[i+5,j]);
        DCV[i,j]:=StrToInt(StringGrid1.Cells[i+7,j]);
        DRH[i,j]:=StrToInt(StringGrid1.Cells[i+9,j]);
        DRV[i,j]:=StrToInt(StringGrid1.Cells[i+11,j]);
       except
        ShowMessage('Проверьте правильность ввода данных!!!');
        qry.Free;
        exit;
       end;
      end;
  for i := 0 to band_count-1 do
    begin
      DHL[i]:=(DLH[0,i]+DLH[1,i])/2;
      DVL[i]:=(DLV[0,i]+DLV[1,i])/2;
      DHC[i]:=(DCH[0,i]+DCH[1,i])/2;
      DVC[i]:=(DCV[0,i]+DCV[1,i])/2;
      DHR[i]:=(DRH[0,i]+DRH[1,i])/2;
      DVR[i]:=(DRV[0,i]+DRV[1,i])/2;
      DH[i]:=(DHL[i]+DHC[i]+DHR[i])/3;
      DV[i]:=(DVL[i]+DVC[i]+DVR[i])/3;
      D[i]:=(DH[i]+DV[i])/2;
      qry.Parameters[0].Value:=ComboBox1.ItemIndex;
      qry.Parameters[1].Value:=DLH[0,i];
      qry.Parameters[2].Value:=DLH[1,i];
      qry.Parameters[3].Value:=DLV[0,i];
      qry.Parameters[4].Value:=DLV[1,i];
      qry.Parameters[5].Value:=DCH[0,i];
      qry.Parameters[6].Value:=DCH[1,i];
      qry.Parameters[7].Value:=DCV[0,i];
      qry.Parameters[8].Value:=DCV[1,i];
      qry.Parameters[9].Value:=DRH[0,i];
      qry.Parameters[10].Value:=DRH[1,i];
      qry.Parameters[11].Value:=DRV[0,i];
      qry.Parameters[12].Value:=DRV[1,i];
      qry.Parameters[13].Value:=D[i];
      qry.ExecSQL;
    end;
 end
else
 begin
  ShowMessage('Не выбран резервуар!!!');
  exit;
 end;
 PageControl1.SelectNextPage(true,true);
 qry.Free;
end;

procedure TGeometricData.saveData;
var
  activePage:byte;
begin
activePage:=PageControl1.ActivePageIndex;
case activePage of
  0:begin
    if MessageDlg('Обновить данные измерений степени наклона?',mtConfirmation,[mbOk,mbCancel],0)=mrOk then
      begin
       updateNaklonData(StrToInt(Maskedit1.Text),StrToInt(MaskEdit2.Text),StrToInt(MaskEdit3.Text),StrToInt(MaskEdit4.Text),StrToInt(MaskEdit5.Text),StrToInt(MaskEdit6.Text),StrToFloat(Label2.Caption));
      end
    else
      begin

      end;
    end;
  1:begin
    if MessageDlg('Обновить данные замеров внутренних диаметров поясов?',mtConfirmation,[mbOk,mbCancel],0)=mrOk then
     begin
       updateInsideDiameter;
     end;
    end;
  2:begin
    if MessageDlg('Обновить данные наружных измерений поясов?',mtConfirmation,[mbOk, mbCancel],0)=mrOk then
     begin
       updateOutsideMeasure(ComboBox1.ItemIndex);
     end;
  end;
end;

end;

procedure TGeometricData.selectNaklonData;
var
  select_query:TADOQuery;
begin
 select_query:=TADOQuery.Create(nil);
 select_query.Connection:=dm.alexpromCon;
 select_query.Close;
 select_query.SQL.Clear;
 select_query.SQL.Add('select * from tank_naklon where tank_id=:tid');
 select_query.Parameters[0].Value:=ComboBox1.ItemIndex;
 select_query.Open;
 select_query.First;
 if select_query.RecordCount<>0 then
   begin
    MaskEdit1.Text:=select_query.FieldValues['H11'];
    MaskEdit2.Text:=select_query.FieldValues['H12'];
    MaskEdit3.Text:=select_query.FieldValues['H21'];
    MaskEdit4.Text:=select_query.FieldValues['H22'];
    MaskEdit5.Text:=select_query.FieldValues['L1'];
    MaskEdit6.Text:=select_query.FieldValues['L2'];
    Label2.Caption:=select_query.FieldValues['Naklon'];
   end;
 select_query.Free;
end;

procedure TGeometricData.selectOutsideMeasure(Tank_Id: byte);
begin
//
end;

procedure TGeometricData.SpinEdit1Change(Sender: TObject);
var
  cnt_query:TADOQuery;
  i:byte;
begin
  band_count:=SpinEdit1.Value;
  case PageControl1.ActivePageIndex of
  1:begin
    StringGrid1.RowCount:=band_count;
    for i := 1 to band_Count do
      StringGrid1.Cells[0,i-1]:=IntToStr(i);
  end;
  2:begin
    StringGrid2.RowCount:=band_count;
    for i := 1 to band_Count do
      StringGrid2.Cells[0,i-1]:=IntToStr(i);
  end;
  3:begin
    StringGrid3.RowCount:=band_count;
    for i := 1 to band_Count do
      StringGrid3.Cells[0,i-1]:=IntToStr(i);
  end;
  end;
  cnt_query:=TADOQuery.Create(nil);
  cnt_query.Connection:=dm.alexpromCon;
  cnt_query.Close;
  cnt_query.SQL.Clear;
  cnt_query.sql.Add('select band_count from dbo.tank_dic where tank_id=:@id');
  cnt_query.Parameters[0].Value:=ComboBox1.ItemIndex;
  cnt_query.Open;
  cnt_query.First;
  if cnt_query.FieldValues['band_count']<>band_count then
    begin
      cnt_query.Close;
      cnt_query.SQL.Clear;
      cnt_query.SQL.Add('update dbo.tank_dic set band_count=:band_count where tank_id=:id');
      cnt_query.Parameters[0].Value:=SpinEdit1.Value;
      cnt_query.Parameters[1].Value:=ComboBox1.ItemIndex;
      cnt_query.ExecSQL;
    end;
  cnt_query.Free;
end;

procedure TGeometricData.updateNaklonData(H11: Word; H12: Word; H21: Word; H22: Word; L1: Word; L2: Word; Naklon: Real);
var
  upd_query:TADOQuery;
begin
upd_query:=TADOQuery.Create(nil);
upd_query.Connection:=dm.alexpromCon;
if dm.alexpromCon.Connected then
  begin
   upd_query.Close;
   upd_query.SQL.Clear;
   upd_query.SQL.Add('delete from dbo.tank_naklon where tank_id=:tid');
   upd_query.Parameters[0].Value:=ComboBox1.ItemIndex;
   upd_query.ExecSQL;
   upd_query.Close;
   upd_query.SQL.Clear;
   upd_query.SQL.Add('insert into dbo.tank_naklon (H11,H12,H21,H22,L1,L2,Naklon,tank_id) values (:@h11,:@h12,:@h21,:@h22,:@l1,:@l2,:@Naklon,:@tid)');
   upd_query.Parameters[0].Value:=H11;
   upd_query.Parameters[1].Value:=H12;
   upd_query.Parameters[2].Value:=H21;
   upd_query.Parameters[3].Value:=H22;
   upd_query.Parameters[4].Value:=L1;
   upd_query.Parameters[5].Value:=L2;
   upd_query.Parameters[6].Value:=Naklon;
   upd_query.Parameters[7].Value:=ComboBox1.ItemIndex;
   upd_query.ExecSQL;
   upd_query.Close;
   upd_query.SQL.Clear;
   upd_query.SQL.Add('update dbo.tank_dic set Naklon=:naklon where tank_id=:tid');
   if ((Naklon>0) and (Naklon<0.0005)) then
     upd_query.Parameters[0].Value:=0;
   if ((Naklon>0.0005) and (Naklon<0.003)) then
     upd_query.Parameters[0].Value:=1;
   upd_query.Parameters[1].Value:=ComboBox1.ItemIndex;
   upd_query.ExecSQL;
   PageControl1.SelectNextPage(true,true);
  end;
upd_query.Free;
end;

procedure TGeometricData.updateNaklonRealTime;
var
  h11,h12,h21,h22,l1,l2:word;
  res:real;
begin
  h11:=StrToInt(Trim(MaskEdit1.Text));
  h12:=StrToInt(Trim(MaskEdit2.Text));
  h21:=StrToInt(Trim(MaskEdit3.Text));
  h22:=StrToInt(Trim(MaskEdit4.Text));
  l1:=StrToInt(Trim(MaskEdit5.Text));
  l2:=StrToInt(Trim(MaskEdit6.Text));
  res:=updateNaklon(h11,h12,h21,h22,l1,l2);
  Label2.Caption:=FloatToStrF(res,ffFixed,8,7);
  if (res>0) and (res<0.03) or (res=0) then
    Label2.Font.Color:=clGreen
  else
    Label2.Font.Color:=clRed
end;

procedure TGeometricData.updateOutsideMeasure(Tank_Id: byte);
var
  qry:TADOQuery;
begin
  qry:=TADOQuery.Create(nil);
  qry.Connection:=dm.alexpromCon;
  qry.Close;
  qry.SQL.Clear;
  qry.SQL.Add('delete from dbo.tank_outside_measurement where tank_id=:tid');
  qry.Parameters[0].Value:=Tank_Id;
  qry.ExecSQL;
end;

procedure TGeometricData.Button1Click(Sender: TObject);
begin
  saveData;
end;

procedure TGeometricData.Button2Click(Sender: TObject);
begin
  saveData;
  close;
end;

procedure TGeometricData.Button3Click(Sender: TObject);
begin
 close;
end;

procedure TGeometricData.ComboBox1Change(Sender: TObject);
var
  activePage:byte;
  qry:TADOQuery;
begin
activePage:=PageControl1.ActivePageIndex;
qry:=TADOQuery.Create(nil);
qry.Connection:=dm.alexpromCon;
if ComboBox1.ItemIndex<>0 then
  begin
    case activePage of
      0:selectNaklonData;
      1:selectInsideDiameter;
      2:selectOutsideMeasure(ComboBox1.ItemIndex);
    end;
  end;
end;

procedure TGeometricData.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  query_emk.Free;
  query_nakl.Free;
  Action:=caFree;
end;

procedure TGeometricData.FormCreate(Sender: TObject);
begin
  updateNaklonRealTime;
  query_emk:=TADOQuery.Create(nil);
  query_emk.Connection:=dm.alexpromCon;
  query_nakl:=TADOQuery.Create(nil);
  query_nakl.Connection:=dm.alexpromCon;
  query_emk.Close;
  query_emk.SQL.Clear;
  query_emk.SQL.Add('select tank_name from tank_dic');
  query_emk.Open;
  query_emk.First;
  ComboBox1.Clear;
  while not query_emk.Eof do
    begin
      ComboBox1.Items.Add(query_emk.Fields[0].asString);
      query_emk.Next;
    end;
  Combobox1.ItemIndex:=0;
end;

procedure TGeometricData.MaskEdit1Change(Sender: TObject);
begin
  if maskedit1.Text='' then
     maskedit1.Text:='0';
  if maskedit2.Text='' then
     maskedit2.Text:='0';
  if maskedit3.Text='' then
     maskedit3.Text:='0';
  if maskedit4.Text='' then
     maskedit4.Text:='0';
  if maskedit5.Text='' then
     maskedit5.Text:='0';
  if maskedit6.Text='' then
     maskedit6.Text:='0';
  updateNaklonRealTime;
end;

procedure TGeometricData.PageControl1Change(Sender: TObject);
var
  i:byte;
begin
if PageControl1.ActivePageIndex=1 then
  begin
    for i := 0 to band_count do
      StringGrid1.Cells[0,i]:=IntToStr(i+1);
      selectInsideDiameter;
  end;
end;

end.

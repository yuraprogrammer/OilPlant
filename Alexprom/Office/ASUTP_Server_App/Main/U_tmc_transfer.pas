unit U_tmc_transfer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, ExtCtrls, ADODB, DBCtrls,DB,geometricsolution, mainfunctions;

type
 StandartProc = function : boolean;

type
  Tsirie_transfer = class(TForm)
    GroupBox1: TGroupBox;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    Label2: TLabel;
    Label3: TLabel;
    MaskEdit3: TMaskEdit;
    Label4: TLabel;
    MaskEdit4: TMaskEdit;
    GroupBox3: TGroupBox;
    Label5: TLabel;
    Panel1: TPanel;
    Label6: TLabel;
    Panel2: TPanel;
    Label7: TLabel;
    Label8: TLabel;
    Panel3: TPanel;
    Label9: TLabel;
    Panel4: TPanel;
    Label10: TLabel;
    btn_transfer: TButton;
    btn_exit: TButton;
    source_tank: TDBLookupComboBox;
    destination_tank: TDBLookupComboBox;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Edit1: TEdit;
    Label11: TLabel;
    Label12: TLabel;
    MaskEdit1: TMaskEdit;
    Label13: TLabel;
    Panel5: TPanel;
    Label14: TLabel;
    Label15: TLabel;
    Panel6: TPanel;
    Label16: TLabel;
    Label17: TLabel;
    Panel7: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Panel8: TPanel;
    Label20: TLabel;
    Label21: TLabel;
    Panel9: TPanel;
    Label22: TLabel;
    Label23: TLabel;
    Panel10: TPanel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Panel11: TPanel;
    Panel12: TPanel;
    Label27: TLabel;
    Label28: TLabel;
    Label29: TLabel;
    Label30: TLabel;
    Panel13: TPanel;
    Panel14: TPanel;
    Label31: TLabel;
    Label32: TLabel;
    Button1: TButton;
    procedure btn_transferClick(Sender: TObject);
    procedure destination_tankCloseUp(Sender: TObject);
    procedure source_tankCloseUp(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn_exitClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure MaskEdit1Change(Sender: TObject);
  private
    { Private declarations }
    procedure InitFrm;
  public
    { Public declarations }
  end;

var
  sirie_transfer: Tsirie_transfer;
  query_s,query_d,query:TADOQuery;
  ds_s,ds_d:TDataSource;
  tank_id_s,tank_id_d:byte;
  plotn_str:string[6];
  DLLHandle:THandle;
  show_edit_tank_data:StandartProc;
  m_1,m_2,m_temp:real;
implementation

uses u_dm;

{$R *.dfm}

procedure TSirie_transfer.InitFrm;
begin
 query_s.Connection:=dm.alexpromcon;
 query_s.Close;
 query_s.SQL.Clear;
 query_s.SQL.Add('select * from dbo.tank_dic');
 query_s.Open;
 query_s.First;
 query_d.Connection:=dm.alexpromcon;
 query_d.Close;
 query_d.SQL.Clear;
 query_d.SQL.Add('select * from dbo.tank_dic');
 query_d.Open;
 query_d.First;
 source_tank.ListSource:=ds_s;
 source_tank.ListField:='tank_name';
 source_tank.KeyField:='tank_id';
 destination_tank.ListSource:=ds_d;
 destination_tank.ListField:='tank_name';
 destination_tank.KeyField:='tank_id';
 DBEdit1.DataSource:=ds_s;
 DBEdit1.DataField:='matLevel';
 DBEdit2.DataSource:=ds_d;
 DBEdit2.DataField:='matLevel';
 source_tank.KeyValue:=0;
 destination_tank.KeyValue:=0;
 //ShowMessage('Пишите комментарии по перемещению. А то я запарюсь ваши бока исправлять.');
end;

procedure Tsirie_transfer.MaskEdit1Change(Sender: TObject);
begin
try
 m_2:=StrToFloat(MaskEdit1.Text);
except
 exit;
end;
end;

procedure Tsirie_transfer.source_tankCloseUp(Sender: TObject);
begin
 if source_tank.KeyValue=destination_tank.KeyValue then
  ShowMessage('Нельзя выполнять перемещение в самого себя! Выберите другой резервуар');
end;

procedure Tsirie_transfer.btn_exitClick(Sender: TObject);
begin
 close;
end;

procedure Tsirie_transfer.btn_transferClick(Sender: TObject);
var
 curdate:string[10];
 i: Integer;
 l_1,d_1,k_1,level_1,curLevel_1,l_2,d_2,k_2,level_2,curLevel_2,vol_1,vol_2:longint;
 vol_1_cur,vol_2_cur:longint;
 query_t1,query_t2:TADOQuery;
 y,m,d:word;
begin
btn_transfer.Enabled:=false;
if ((source_tank.KeyValue<>0) and (destination_tank.KeyValue<>0)) then
 begin
  curLevel_1:=query_s.FieldValues['matLevel'];
  curLevel_2:=query_d.FieldValues['matLevel'];
  if MaskEdit3.Text<>'' then
   level_1:=StrToInt(trim(MaskEdit3.Text));
  if MaskEdit4.Text<>'' then
   level_2:=StrToInt(trim(MaskEdit4.Text));
  if level_1>curLevel_1 then
   ShowMessage('Взлив после перемещения у исходящего резервуара должен быть меньше, чем до перемещения!!! Будь внимательнее.')
  else
   if level_2<curLevel_2 then
    ShowMessage('Взлив после перемещения у входящего резервуара должен быть больше, чем до перемещения!!! Будь внимательнее.')
   else
    if Edit1.Text='' then
     ShowMessage('Аааа. Комментарий, комментарий!!! Без напоминания, я смотрю никак...')
    else
     begin
      query_t1:=TADOQuery.Create(nil);
      query_t1.Connection:=dm.alexpromCon;
      query_t1.Close;
      query_t1.SQL.Clear;
      query_t1.SQL.Add('select mat_Volume from dbo.grad_tank where tank_id=:tid and mat_Level=:ml');
      query_t1.Parameters[0].Value:=source_tank.KeyValue;
      query_t1.Parameters[1].Value:=level_1;
      query_t1.Open;
      query_t1.First;
      if query_t1.RecordCount<>0 then
       vol_1:=query_t1.Fields[0].AsInteger
      else
       begin
        l_1:=query_s.FieldValues['Cylinder_Length'];
        d_1:=query_s.FieldValues['Inside_Diameter'];
        k_1:=query_s.FieldValues['Conus_Height'];
        vol_1:=volumeSolve(l_1,d_1,k_1,level_1);
       end;
      vol_1_cur:=query_s.FieldValues['matVolume'];
      query_t2:=TADOQuery.Create(nil);
      query_t2.Connection:=dm.alexpromCon;
      query_t2.Close;
      query_t2.SQL.Clear;
      query_t2.SQL.Add('select mat_Volume from dbo.grad_tank where tank_id=:tid and mat_Level=:ml');
      query_t2.Parameters[0].Value:=destination_tank.KeyValue;
      query_t2.Parameters[1].Value:=level_2;
      query_t2.Open;
      query_t2.First;
      if query_t2.RecordCount<>0 then
       vol_2:=query_t2.Fields[0].AsInteger
      else
       begin
        l_2:=query_d.FieldValues['Cylinder_Length'];
        d_2:=query_d.FieldValues['Inside_Diameter'];
        k_2:=query_d.FieldValues['Conus_Height'];
        vol_2:=volumeSolve(l_2,d_2,k_2,level_2);
       end;
      vol_2_cur:=query_d.FieldValues['matVolume'];
      query:=TADOQuery.Create(nil);
      query.Connection:=dm.alexpromCon;
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('update dbo.tank_dic set matLevel=:ml,matVolume=:mv,to_out=:to where tank_id=:tid');
      query.Parameters[0].Value:=level_1;
      query.Parameters[1].Value:=vol_1;
      if (vol_1-query_s.FieldValues['dont_touch'])<0 then
       query.Parameters[2].Value:=0
      else
       query.Parameters[2].Value:=vol_1-query_s.FieldValues['dont_touch'];
      query.Parameters[3].Value:=source_tank.KeyValue;
      query.ExecSQL;
      query.Parameters[0].Value:=level_2;
      query.Parameters[1].Value:=vol_2;
      if (vol_2-query_s.FieldValues['dont_touch'])<0 then
       query.Parameters[2].Value:=0
      else
       query.Parameters[2].Value:=vol_2-query_s.FieldValues['dont_touch'];
      query.Parameters[3].Value:=destination_tank.KeyValue;
      query.ExecSQL;
      DecodeDate(now,y,m,d);
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('select plotn from dbo.tank_mat where tank_id=:tid');
      query.Parameters[0].Value:=source_tank.KeyValue;
      query.Open;
      query.First;
      m_1:=query.FieldValues['plotn'];
      query.Close;
      query.Parameters[0].Value:=destination_tank.KeyValue;
      query.Open;
      query.First;
      m_temp:=query.FieldValues['plotn'];
      //m_2:=(query_d.FieldValues['matVolume']*m_temp+(vol_2-vol_2_cur)*m_1)/vol_2;
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('update dbo.tank_mat set m=:@m,plotn=:@plot where tank_id=:tid');
      query.Parameters[0].Value:=Round(vol_1*m_1);
      query.Parameters[1].Value:=m_1;
      query.Parameters[2].Value:=source_tank.KeyValue;
      query.ExecSQL;
      query.Close;
      query.Parameters[0].Value:=Round(m_temp*vol_2);
      query.Parameters[1].Value:=m_temp;
      query.Parameters[2].Value:=destination_tank.KeyValue;
      query.ExecSQL;
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('insert into dbo.transfer_report(source_tank,dest_tank,');
      query.SQL.Add('out_volume,in_volume,transfer_date,transfer_time, comment,');
      query.SQL.Add('sl_before, sl_after, dl_before, dl_after, sv_before, sv_after,');
      query.SQL.Add('dv_before, dv_after,sm_before, sm_after, dm_before, dm_after)');
      query.SQL.Add(' values(:st,:dt,:ov,:iv,:td,:tt,:com,:slb,:sla,:dlb,:dla,:svb,:sva,:dvb,:dva,:smb,:sma,:dmb,:dma)');
      query.Parameters[0].Value:=source_tank.KeyValue;
      query.Parameters[1].Value:=destination_tank.keyvalue;
      query.Parameters[2].Value:=vol_1_cur-vol_1;
      query.Parameters[3].Value:=vol_2-vol_2_cur;
      curdate:=DateToStr(now);
      for i := 0 to length(curdate) - 1 do
       if curdate[i]='/' then
        curdate[i]:='.';
      query.Parameters[4].Value:=curdate;
      if length(TimeToStr(now))=8 then
       query.Parameters[5].Value:=TimeToStr(now)
      else
       query.Parameters[5].Value:='0'+TimeToStr(now);
      query.Parameters[6].Value:=Edit1.Text;
      query.Parameters[7].Value:=curLevel_1;
      query.Parameters[8].Value:=level_1;
      query.Parameters[9].Value:=curLevel_2;
      query.Parameters[10].Value:=level_2;
      query.Parameters[11].Value:=vol_1_cur;
      query.Parameters[12].Value:=vol_1;
      query.Parameters[13].Value:=vol_2_cur;
      query.Parameters[14].Value:=vol_2;
      query.Parameters[15].Value:=IntToStr(Round(query_s.FieldValues['matVolume']*m_1));
      query.Parameters[16].Value:=IntToStr(Round(vol_1*m_1));
      query.Parameters[17].Value:=IntToStr(Round(query_d.FieldValues['matVolume']*m_temp));
      query.Parameters[18].Value:=IntToStr(Round(vol_2*m_temp));
      query.ExecSQL;
      query.Close;
      query.SQL.Clear;
      query.SQL.Add('insert into transfer_month_report_by_daytank (tank_id, transfer_month, ');
      query.SQL.Add('transfer_year, in_val, out_val, in_kg, out_kg, transfer_date) values (:tid, :tm, ');
      query.SQL.Add(':ty, :iv, :ov, :ik, :ok, :td)');
      query.Parameters[0].Value:=source_tank.KeyValue;
      query.Parameters[1].Value:=m;
      query.Parameters[2].Value:=y;
      query.Parameters[3].Value:=0;
      query.Parameters[4].Value:=vol_1_cur-vol_1;
      query.Parameters[5].Value:=0;
      query.Parameters[6].Value:=Round(vol_1*m_1);
      query.Parameters[7].Value:=curdate;
      query.ExecSQL;
      query.Close;
      query.Parameters[0].Value:=destination_tank.KeyValue;
      query.Parameters[1].Value:=m;
      query.Parameters[2].Value:=y;
      query.Parameters[3].Value:=vol_2-vol_2_cur;
      query.Parameters[4].Value:=0;
      query.Parameters[5].Value:=Round((vol_2-vol_2_cur)*m_temp);
      query.Parameters[6].Value:=0;
      query.Parameters[7].Value:=curdate;
      query.ExecSQL;
      Panel1.Caption:=source_tank.Text;
      Panel2.Caption:=FloatToStr(vol_1_cur-vol_1);
      Panel5.Caption:=IntToStr(Round((vol_1_cur-vol_1)*m_1));
      Panel7.Caption:=IntToStr(vol_1);
      Panel10.Caption:=IntToStr(Round(vol_1*m_1));
      Panel11.Caption:=IntToStr(query_s.FieldValues['matVolume']);
      Panel12.Caption:=IntToStr(Round(query_s.FieldValues['matVolume']*m_1));
      query.Close;
      query.SQL.Clear;
      query.SQL.add('update dbo.inventory set end_level=:el, end_volume=:ev, end_kg=:ek where tank_id=:tid');
      query.Parameters[0].Value:=level_1;
      query.Parameters[1].Value:=vol_1;
      query.Parameters[2].Value:=Round(vol_1*m_1);
      query.Parameters[3].Value:=source_tank.KeyValue;
      query.ExecSQL;
      Panel3.Caption:=destination_tank.Text;
      Panel13.Caption:=IntToStr(query_d.FieldValues['matVolume']);
      Panel14.Caption:=IntToStr(Round(query_d.FieldValues['matVolume']*m_temp));
      Panel4.Caption:=FloatToStr(vol_2-vol_2_cur);
      Panel6.Caption:=IntToStr(Round((vol_1_cur-vol_1)*m_temp));
      Panel8.Caption:=IntToStr(vol_2);
      Panel9.Caption:=IntToStr(Round(vol_2*m_temp));
      query.Close;
      query.SQL.Clear;
      query.SQL.add('update dbo.inventory set end_level=:el, end_volume=:ev, end_kg=:ek, end_plotn=:ep where tank_id=:tid');
      query.Parameters[0].Value:=level_2;
      query.Parameters[1].Value:=vol_2;
      query.Parameters[2].Value:=Round(vol_2*m_temp);
      query.Parameters[3].Value:=m_temp;
      query.Parameters[4].Value:=destination_tank.KeyValue;
      query.ExecSQL;
      InitFrm;
      query_t1.Free;
      query_t2.Free;
      query.Free;
     end;
 end;
if ((source_tank.KeyValue=0) and (destination_tank.KeyValue<>0)) then
 begin
  MaskEdit3.Text:='0';
  l_1:=0;
  d_1:=0;
  k_1:=0;
  level_1:=0;
  if MaskEdit4.Text<>'' then
    level_2:=StrToInt(trim(MaskEdit4.Text));
  curLevel_2:=query_d.FieldValues['matLevel'];
  if level_2<curLevel_2 then
   SHowMessage('Взлив после перемещения у входящего резервуара должен быть больше, чем до перемещения!!! Будь внимательнее.')
  else
   if Edit1.Text='' then
    ShowMessage('Аааа. Комментарий, комментарий!!! Без напоминания, я смотрю никак...')
   else
   begin
    query_t2:=TADOQuery.Create(nil);
    query_t2.Connection:=dm.alexpromCon;
    query_t2.Close;
    query_t2.SQL.Clear;
    query_t2.SQL.Add('select mat_Volume from dbo.grad_tank where tank_id=:tid and mat_Level=:ml');
    query_t2.Parameters[0].Value:=destination_tank.KeyValue;
    query_t2.Parameters[1].Value:=level_2;
    query_t2.Open;
    query_t2.First;
    if query_t2.RecordCount<>0 then
     vol_2:=query_t2.Fields[0].AsInteger
    else
     begin
      l_2:=query_d.FieldValues['Cylinder_Length'];
      d_2:=query_d.FieldValues['Inside_Diameter'];
      k_2:=query_d.FieldValues['Conus_Height'];
      vol_2:=volumeSolve(l_2,d_2,k_2,level_2);
     end;
    if query_d.FieldValues['matVolume']<>0 then
     begin
      vol_2_cur:=query_d.FieldValues['matVolume'];
          query:=TADOQuery.Create(nil);
    query.Connection:=dm.alexpromCon;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('update dbo.tank_dic set matLevel=:ml,matVolume=:mv,to_out=:to where tank_id=:tid');
    query.Parameters[0].Value:=level_2;
    query.Parameters[1].Value:=vol_2;
    if (vol_2-query_d.FieldValues['dont_touch'])<0 then
     query.Parameters[2].Value:=0
    else
     query.Parameters[2].Value:=vol_2-query_d.FieldValues['dont_touch'];
    query.Parameters[3].Value:=destination_tank.KeyValue;
    query.ExecSQL;
    DecodeDate(now, y, m, d);
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select plotn from dbo.tank_mat where tank_id=:tid');
    query.Parameters[0].Value:=destination_tank.KeyValue;
    query.Open;
    query.first;
    m_2:=query.FieldValues['plotn'];
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('update dbo.tank_mat set m=:@m, plotn=:@plotn where tank_id=:tid');
    query.Parameters[0].Value:=Round(vol_2*StrToFloat(MaskEdit1.Text));
    query.Parameters[1].Value:=StrToFloat(MaskEdit1.Text);
    query.Parameters[2].Value:=destination_tank.KeyValue;
    query.ExecSQL;
    query.Close;
    query.SQL.Clear;
    query.SQL.add('update dbo.inventory set end_level=:el, end_volume=:ev, ');
    query.SQL.add('end_kg=:ek, end_plotn=:ep where tank_id=:tid');
    query.Parameters[0].Value:=level_2;
    query.Parameters[1].Value:=vol_2;
    query.Parameters[2].Value:=Round(vol_2*StrToFloat(MaskEdit1.Text));
    query.Parameters[3].Value:=StrToFloat(MaskEdit1.Text);
    query.Parameters[4].Value:=destination_tank.KeyValue;
    query.ExecSQL;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('insert into dbo.transfer_report(source_tank,dest_tank,');
    query.SQL.Add('out_volume,in_volume,transfer_date,transfer_time, comment,');
    query.SQL.Add('sl_before, sl_after, dl_before, dl_after, sv_before, sv_after,');
    query.SQL.Add('dv_before, dv_after,sm_before, sm_after, dm_before, dm_after)');
    query.SQL.Add(' values(:st,:dt,:ov,:iv,:td,:tt,:com,:slb,:sla,:dlb,:dla,:svb,:sva,:dvb,:dva,:smb,:sma,:dmb,:dma)');
    query.Parameters[0].Value:=source_tank.KeyValue;
    query.Parameters[1].Value:=destination_tank.keyvalue;
    vol_1:=0;
    query.Parameters[2].Value:=vol_1;
    query.Parameters[3].Value:=vol_2-vol_2_cur;
    curdate:=DateToStr(now);
    for i := 0 to length(curdate) - 1 do
     if curdate[i]='/' then
      curdate[i]:='.';
    query.Parameters[4].Value:=curdate;
    if length(TimeToStr(now))=8 then
     query.Parameters[5].Value:=TimeToStr(now)
    else
     query.Parameters[5].Value:='0'+TimeToStr(now);
    query.Parameters[6].Value:=Edit1.Text;
    query.Parameters[7].Value:=curLevel_1;
    query.Parameters[8].Value:=level_1;
    query.Parameters[9].Value:=curLevel_2;
    query.Parameters[10].Value:=level_2;
    query.Parameters[11].Value:=vol_1_cur;
    query.Parameters[12].Value:=vol_1;
    query.Parameters[13].Value:=vol_2_cur;
    query.Parameters[14].Value:=vol_2;
    query.Parameters[15].Value:=0;
    query.Parameters[16].Value:=0;
    query.Parameters[17].Value:=IntToStr(Round(query_d.FieldValues['matVolume']*m_2));
    query.Parameters[18].Value:=Round(vol_2*StrToFloat(MaskEdit1.Text));
    query.ExecSQL;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('insert into transfer_month_report_by_daytank (tank_id, transfer_month, ');
    query.SQL.Add('transfer_year, in_val, out_val, in_kg, out_kg, transfer_date) values (:tid, :tm, ');
    query.SQL.Add(':ty, :iv, :ov, :ik, :ok, :td)');
    query.Parameters[0].Value:=destination_tank.KeyValue;
    query.Parameters[1].Value:=m;
    query.Parameters[2].Value:=y;
    query.Parameters[3].Value:=vol_2-vol_2_cur;
    query.Parameters[4].Value:=0;
    query.Parameters[5].Value:=Round(vol_2*m_2-vol_2_cur*StrToFloat(MaskEdit1.Text));
    query.Parameters[7].Value:=curdate;
    query.Parameters[6].Value:=0;
    query.ExecSQL;
    Panel1.Caption:=source_tank.Text;
    Panel2.Caption:='';
    Panel5.Caption:='';
    Panel7.Caption:='';
    Panel10.Caption:='';
    Panel11.Caption:='';
    Panel12.Caption:='';
    Panel3.Caption:=destination_tank.Text;
    Panel13.Caption:=IntToStr(query_d.FieldValues['matVolume']);
    Panel14.Caption:=IntToStr(Round(query_d.FieldValues['matVolume']*m_2));
    Panel4.Caption:=fLOATToStr(vol_2-vol_2_cur);
    Panel6.Caption:=FloatToStr(Round(vol_2*m_2-vol_2_cur*StrToFloat(MaskEdit1.Text)));
    Panel8.Caption:=fLOATToStr(vol_2);
    Panel9.Caption:=FloatToStr(Round(vol_2*StrToFloat(MaskEdit1.Text)));
    InitFrm;
    query_t2.Free;
   end
  else
   MessageDlg('Для данного взлива нет значения объема.',mtError,[mbOk],0);
  query.Free;
 end;
end;
if ((source_tank.KeyValue<>0) and (destination_tank.KeyValue=0)) then
 begin
  MaskEdit4.Text:='0';
  l_2:=0;
  d_2:=0;
  k_2:=0;
  level_2:=0;
  if MaskEdit3.Text<>'' then
   level_1:=StrToInt(trim(MaskEdit3.Text));
  curLevel_1:=query_s.FieldValues['matLevel'];
  if level_1>curLevel_1 then
   ShowMessage('Взлив после перемещения у исходящего резервуара должен быть меньше, чем до перемещения!!! Будь внимательнее.')
  else
  if Edit1.Text='' then
   ShowMessage('Аааа. Комментарий, комментарий!!! Без напоминания, я смотрю никак...')
  else
   begin
    query_t1:=TADOQuery.Create(nil);
    query_t1.Connection:=dm.alexpromCon;
    query_t1.Close;
    query_t1.SQL.Clear;
    query_t1.SQL.Add('select mat_Volume from dbo.grad_tank where tank_id=:tid and mat_Level=:ml');
    query_t1.Parameters[0].Value:=source_tank.KeyValue;
    query_t1.Parameters[1].Value:=level_1;
    query_t1.Open;
    query_t1.First;
    if query_t1.RecordCount<>0 then
     vol_1:=query_t1.Fields[0].AsInteger
    else
     begin
      l_1:=query_s.FieldValues['Cylinder_Length'];
      d_1:=query_s.FieldValues['Inside_Diameter'];
      k_1:=query_s.FieldValues['Conus_Height'];
      vol_1:=volumeSolve(l_1,d_1,k_1,level_1);
     end;
    curLevel_1:=query_s.FieldValues['matLevel'];
    vol_1_cur:=query_s.FieldValues['matVolume'];
    query:=TADOQuery.Create(nil);
    query.Connection:=dm.alexpromCon;
    query.SQL.Clear;
    query.SQL.Add('update dbo.tank_dic set matLevel=:ml,matVolume=:mv,to_out=:to where tank_id=:tid');
    query.Parameters[0].Value:=level_1;
    query.Parameters[1].Value:=vol_1;
    if (vol_1-query_s.FieldValues['dont_touch'])<0 then
     query.Parameters[2].Value:=0
    else
     query.Parameters[2].Value:=vol_1-query_s.FieldValues['dont_touch'];
    query.Parameters[3].Value:=source_tank.KeyValue;
    query.ExecSQL;
    DecodeDate(now, y, m, d);
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('update dbo.inventory set end_level=:lv where tank_id=:tid and inv_year=:iy and inv_month=:im');
    query.Parameters[0].Value:=level_1;
    query.Parameters[1].Value:=source_tank.KeyValue;
    query.Parameters[2].Value:=y;
    query.Parameters[3].Value:=m;
    query.ExecSQL;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('select plotn from dbo.tank_mat where tank_id=:tid');
    query.Parameters[0].Value:=source_tank.KeyValue;
    query.Open;
    query.First;
    m_1:=query.FieldValues['plotn'];
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('update dbo.tank_mat set m=:@m where tank_id=:tid');
    query.Parameters[0].Value:=Round(vol_1*m_1);
    query.Parameters[1].Value:=source_tank.KeyValue;
    query.ExecSQL;
    Panel1.Caption:=source_tank.Text;
    Panel2.Caption:=FloatToStr(vol_1_cur-vol_1);
    Panel5.Caption:=IntToStr(Round((vol_1_cur-vol_1)*m_1));
    Panel7.Caption:=FloatToStr(vol_1);
    Panel10.Caption:=IntToStr(Round(vol_1*m_1));
    Panel11.Caption:=IntToStr(query_s.fieldValues['matVolume']);
    Panel12.Caption:=IntToStr(Round(query_s.fieldValues['matVolume']*m_1));
    query.Close;
    query.SQL.Clear;
    query.SQL.add('update dbo.inventory set end_level=:el, end_volume=:ev, ');
    query.SQL.add('end_kg=:ek, end_plotn=:ep where tank_id=:tid');
    query.Parameters[0].Value:=level_1;
    query.Parameters[1].Value:=vol_1;
    query.Parameters[2].Value:=Round(vol_1*m_1);
    query.Parameters[3].Value:=m_1;
    query.Parameters[4].Value:=source_tank.KeyValue;
    query.ExecSQL;
    Panel3.Caption:=destination_tank.Text;
    Panel13.Caption:='';
    Panel14.Caption:='';
    Panel4.Caption:='';
    Panel6.Caption:='';
    Panel8.Caption:='';
    Panel9.Caption:='';
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('insert into dbo.transfer_report(source_tank,dest_tank,');
    query.SQL.Add('out_volume,in_volume,transfer_date,transfer_time, comment,');
    query.SQL.Add('sl_before, sl_after, dl_before, dl_after, sv_before, sv_after,');
    query.SQL.Add('dv_before, dv_after,sm_before, sm_after, dm_before, dm_after)');
    query.SQL.Add(' values(:st,:dt,:ov,:iv,:td,:tt,:com,:slb,:sla,:dlb,:dla,:svb,:sva,:dvb,:dva,:smb,:sma,:dmb,:dma)');
    query.Parameters[0].Value:=source_tank.KeyValue;
    query.Parameters[1].Value:=destination_tank.keyvalue;
    query.Parameters[2].Value:=vol_1_cur-vol_1;
    query.Parameters[3].Value:=vol_2;
    curdate:=DateToStr(now);
    for i := 0 to length(curdate) - 1 do
     if curdate[i]='/' then
      curdate[i]:='.';
    query.Parameters[4].Value:=curdate;
    if length(TimeToStr(now))=8 then
     query.Parameters[5].Value:=TimeToStr(now)
    else
     query.Parameters[5].Value:='0'+TimeToStr(now);
    query.Parameters[6].Value:=Edit1.Text;
    query.Parameters[7].Value:=curLevel_1;
    query.Parameters[8].Value:=level_1;
    query.Parameters[9].Value:=0;
    query.Parameters[10].Value:=0;
    query.Parameters[11].Value:=vol_1_cur;
    query.Parameters[12].Value:=vol_1;
    query.Parameters[13].Value:=0;
    query.Parameters[14].Value:=0;
    query.Parameters[15].Value:=IntToStr(Round(query_s.fieldValues['matVolume']*m_1));
    query.Parameters[16].Value:=IntToStr(Round(vol_1*m_1));
    query.Parameters[17].Value:=0;
    query.Parameters[18].Value:=0;
    query.ExecSQL;
    query.Close;
    query.SQL.Clear;
    query.SQL.Add('insert into transfer_month_report_by_daytank (tank_id, transfer_month, ');
    query.SQL.Add('transfer_year, in_val, out_val, in_kg, out_kg, transfer_date) values (:tid, :tm, ');
    query.SQL.Add(':ty, :iv, :ov, :ik, :ok, :td)');
    query.Parameters[0].Value:=source_tank.KeyValue;
    query.Parameters[1].Value:=m;
    query.Parameters[2].Value:=y;
    query.Parameters[3].Value:=0;
    query.Parameters[4].Value:=vol_1_cur-vol_1;
    query.Parameters[5].Value:=0;
    query.Parameters[6].Value:=Round(vol_1*m_1);
    query.Parameters[7].Value:=curdate;
    query.ExecSQL;
    InitFrm;
    query_t1.Free;
    query.Free;
   end;
 end;
  btn_transfer.Enabled:=true;
end;

procedure Tsirie_transfer.Button1Click(Sender: TObject);
begin
DllHandle:=SafeLoadLibrary('lib\edit_tank_data.dll');
  if DLLHandle = 0 then
    begin
      if GetLastError = ERROR_DLL_NOT_FOUND then
        ShowMessage('Ошибка загрузки DLL');
        Close;
  end;
  show_edit_tank_data:=GetProcAddress(DllHandle,'show_edit_tank_data');
if show_edit_tank_data=true then
  FreeLibrary(DllHandle);
  InitFrm;
end;

procedure Tsirie_transfer.destination_tankCloseUp(Sender: TObject);
var
  qqq:TADOQuery;
  i:byte;
begin
 if destination_tank.KeyValue=source_tank.KeyValue then
  ShowMessage('Нельзя выполнять перемещение в самого себя! Выберите другой резервуар');
 if (source_tank.KeyValue=0) and (destination_tank.KeyValue<>0) then
  begin
    qqq:=TADOQuery.Create(nil);
    qqq.Connection:=dm.alexpromCon;
    qqq.Close;
    qqq.SQL.Clear;
    qqq.SQL.Add('select plotn from dbo.tank_mat where tank_id=:tid');
    qqq.Parameters[0].Value:=destination_tank.KeyValue;
    qqq.Open;
    qqq.First;
    plotn_str:=FloatToStrF(qqq.FieldByName('plotn').AsFloat, ffFixed, 4, 3);
    {if length(plotn_str)<6 then
    begin
      for i := 6 downto length(plotn_str) do
        plotn_str[i]:='0';
    end;}
    MaskEdit1.Text:=plotn_str;
    MaskEdit1.Enabled:=true;
  end
 else
  MaskEdit1.Enabled:=false;
end;

procedure Tsirie_transfer.FormClose(Sender: TObject; var Action: TCloseAction);
begin
 ds_s.Free;
 ds_d.Free;
 query_s.Free;
 query_d.Free;
 Action:=caFree;
end;

procedure Tsirie_transfer.FormCreate(Sender: TObject);
begin
 query_s:=TADOQuery.Create(nil);
 query_d:=TADOQuery.Create(nil);
 ds_s:=TDataSource.Create(nil);
 ds_s.DataSet:=query_s;
 ds_d:=TDataSource.Create(nil);
 ds_d.DataSet:=query_d;
 InitFrm;
end;

end.

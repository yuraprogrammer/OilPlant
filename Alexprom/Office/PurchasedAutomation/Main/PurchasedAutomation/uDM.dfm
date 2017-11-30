object DM: TDM
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 150
  Width = 215
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=MSDASQL.1;Password=roman;Persist Security Info=True;Use' +
      'r ID=roman;Data Source=Alexprom;Initial Catalog=Alexprom_ASUTP'
    LoginPrompt = False
    Provider = 'MSDASQL.1'
    OnInfoMessage = ADOConnection1InfoMessage
    Left = 24
    Top = 8
  end
end

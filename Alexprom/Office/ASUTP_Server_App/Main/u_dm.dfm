object dm: Tdm
  OldCreateOrder = False
  Height = 150
  Width = 215
  object alexpromCon: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=MSDASQL.1;Password=roman;Persist Security Info=True;Use' +
      'r ID=roman;Data Source=Alexprom;Mode=ReadWrite;Initial Catalog=A' +
      'lexprom_ASUTP'
    ConnectionTimeout = 0
    CursorLocation = clUseServer
    LoginPrompt = False
    Mode = cmReadWrite
    Left = 32
    Top = 16
  end
end

object dmDados: TdmDados
  OldCreateOrder = False
  Height = 271
  Width = 429
  object FDConnection: TFDConnection
    Params.Strings = (
      'Database=C:\Users\Windows\Documents\LP\DBs\SRS_DB2.FDB'
      'User_Name=SYSDBA'
      'Password=masterkey'
      'Server=localhost'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    Connected = True
    LoginPrompt = False
    Left = 56
    Top = 48
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    Left = 176
    Top = 48
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 48
    Top = 120
  end
  object qryBanco: TFDQuery
    Connection = FDConnection
    Left = 168
    Top = 120
  end
  object DataSource1: TDataSource
    DataSet = qryBanco
    Left = 256
    Top = 127
  end
end

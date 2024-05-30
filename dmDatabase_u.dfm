object dmDatabase: TdmDatabase
  Height = 480
  Width = 640
  object conDB: TADOConnection
    Connected = True
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;User ID=Admin;Data Source=C:\Us' +
      'ers\niel\Documents\Embarcadero\Studio\Projects\2024\HomePro Conn' +
      'ect\HomePro Connect.mdb;Mode=ReadWrite;Extended Properties="";Pe' +
      'rsist Security Info=False;Jet OLEDB:System database="";Jet OLEDB' +
      ':Registry Path="";Jet OLEDB:Database Password="";Jet OLEDB:Engin' +
      'e Type=5;Jet OLEDB:Database Locking Mode=1;Jet OLEDB:Global Part' +
      'ial Bulk Ops=2;Jet OLEDB:Global Bulk Transactions=1;Jet OLEDB:Ne' +
      'w Database Password="";Jet OLEDB:Create System Database=False;Je' +
      't OLEDB:Encrypt Database=False;Jet OLEDB:Don'#39't Copy Locale on Co' +
      'mpact=False;Jet OLEDB:Compact Without Replica Repair=False;Jet O' +
      'LEDB:SFP=False'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 112
    Top = 216
  end
  object tblPropertyOwners: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'PropertyOwners'
    Left = 232
    Top = 216
  end
  object tblServiceTypes: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'ServiceTypes'
    Left = 232
    Top = 304
  end
  object tblServiceProviders: TADOTable
    Connection = conDB
    CursorType = ctStatic
    TableName = 'ServiceProviders'
    Left = 232
    Top = 128
  end
  object qryServiceProviders: TADOQuery
    Connection = conDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM  ServiceProviders AS sp,'
      '(SELECT CompanyID, ROUND(AVG(r.Rating), 2) AS [Rating]'
      'FROM Ratings AS r'
      'GROUP BY r.CompanyID) as x'
      'WHERE x.CompanyID = sp.ID'
      ''
      ''
      '')
    Left = 232
    Top = 64
  end
  object dsQuerySP: TDataSource
    DataSet = qryServiceProviders
    Left = 408
    Top = 128
  end
end

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
    TableName = 'tblPropertyOwners'
    Left = 232
    Top = 216
  end
  object tblServiceTypes: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'tblServiceTypes'
    Left = 232
    Top = 304
  end
  object tblServiceProviders: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'tblServiceProviders'
    Left = 232
    Top = 128
  end
  object qryServiceProviders: TADOQuery
    Active = True
    Connection = conDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT *'
      'FROM  tblServiceProviders AS sp,'
      '(SELECT CompanyID, ROUND(AVG(r.Rating), 2) AS [Rating]'
      'FROM tblRatings AS r'
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
  object tblRequests: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'tblRequests'
    Left = 232
    Top = 368
  end
  object dsRequestOffers: TDataSource
    DataSet = qryRequestOffers
    Left = 416
    Top = 200
  end
  object qryRequestOffers: TADOQuery
    Active = True
    Connection = conDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      
        'SELECT ID, RequestID, (SELECT ServiceType FROM tblServiceTypes W' +
        'HERE ID = (SELECT ServiceType FROM tblServiceProviders WHERE ID ' +
        '= tblOffers.ServiceProviderID)) AS [Service Type], (SELECT Compa' +
        'nyName FROM tblServiceProviders WHERE ID = tblOffers.ServiceProv' +
        'iderID) AS Company, FORMAT(Quote, '#39'Currency'#39') AS [Quote Offered]' +
        ', (SELECT Description FROM tblRequests WHERE ID = tblOffers.Requ' +
        'estID) AS [Your description]'
      'FROM tblOffers'
      'ORDER BY RequestID DESC;')
    Left = 416
    Top = 280
  end
  object tblOffers: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'tblOffers'
    Left = 128
    Top = 392
  end
  object tblRatings: TADOTable
    Active = True
    Connection = conDB
    CursorType = ctStatic
    TableName = 'tblRatings'
    Left = 112
    Top = 56
  end
  object qry: TADOQuery
    Connection = conDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      '')
    Left = 72
    Top = 312
  end
  object qryServiceTypes: TADOQuery
    Active = True
    Connection = conDB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT st.ServiceType, COUNT(sp.ID) AS [Count] '
      'FROM tblServiceProviders AS sp,  tblServiceTypes AS st '
      'WHERE sp.ServiceType=st.ID'
      'GROUP BY st.ServiceType ')
    Left = 312
    Top = 336
  end
end

unit dmDatabase_u;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.Win.ADODB;

type
  TdmDatabase = class(TDataModule)
    conDB: TADOConnection;
    tblPropertyOwners: TADOTable;
    tblServiceTypes: TADOTable;
    tblServiceProviders: TADOTable;
    qryServiceProviders: TADOQuery;
    dsQuerySP: TDataSource;
    tblRequests: TADOTable;
    dsRequestOffers: TDataSource;
    qryRequestOffers: TADOQuery;
    tblOffers: TADOTable;
    tblRatings: TADOTable;
  private
    { Private declarations }
  public
    { Public declarations }

  end;

var
  dmDatabase: TdmDatabase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.

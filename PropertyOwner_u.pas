unit PropertyOwner_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage, ServiceProviderCard_u, dmDatabase_u, Vcl.Buttons,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  ServiceProviderDescription_u;

type
  TfrmPropertyOwner = class(TForm)
    PageControl: TPageControl;
    tabBrowse: TTabSheet;
    tabCompare: TTabSheet;
    tabProfile: TTabSheet;
    pnlBrowse: TPanel;
    pnlNavbar: TPanel;
    pnlNavlinkBrowse: TPanel;
    pnlNavlinkCompare: TPanel;
    pnlNavlinkProfile: TPanel;
    lblBrowseHeading: TLabel;
    pnlCompare: TPanel;
    lblCompareHeading: TLabel;
    pnlProfile: TPanel;
    lblProfileHeading: TLabel;
    ScrollBox: TScrollBox;
    lblFilter: TLabel;
    imgFilter: TImage;
    cmbFilterServiceType: TComboBox;
    lblFilterServiceType: TLabel;
    radRating: TRadioGroup;
    radJobsCompleted: TRadioGroup;
    pnlFilter: TPanel;
    pnlBrowseContainer: TPanel;
    tabRequest: TTabSheet;
    pnlRequest: TPanel;
    lblRequest: TLabel;
    shpInput1: TShape;
    memDescription: TMemo;
    lblDescription: TLabel;
    pnlRequestButton: TPanel;
    shpLoginButton: TShape;
    lblChosenCompany: TLabel;
    btnRequestBack: TSpeedButton;
    dbGrid: TDBGrid;
    pnlNavLinkRequest: TPanel;
    cmbRequestServiceType: TComboBox;
    dbNavigator: TDBNavigator;
    btnSeeRequestDescription: TBitBtn;
    btnViewCompanyInfo: TBitBtn;
    btnSelectOffer: TBitBtn;
    btnCompareHelp: TBitBtn;
    btnReview: TBitBtn;
    btnRequestHelp: TBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure NavlinkMouseEnter(Sender: TObject);
    procedure NavlinkMouseLeave(Sender: TObject);
    procedure NavlinkClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnRequestBackClick(Sender: TObject);
    procedure queryServiceProviders(sql: string);
    procedure cmbFilterServiceTypeChange(Sender: TObject);
    procedure drawServiceProviderCards;
    procedure radRatingClick(Sender: TObject);
    procedure filterCards;
    procedure sortCards;
    procedure radJobsCompletedClick(Sender: TObject);
    procedure pnlRequestButtonClick(Sender: TObject);
    procedure btnSeeRequestDescriptionClick(Sender: TObject);
    procedure btnViewCompanyInfoClick(Sender: TObject);
    procedure btnSelectOfferClick(Sender: TObject);
    procedure btnCompareHelpClick(Sender: TObject);
    procedure btnRequestHelpClick(Sender: TObject);

  var
  private
    { Private declarations }
    selectedNavLink: TPanel;
    arrSPCards: array of TServiceProviderCard;
  public
    { Public declarations }
  end;

var
  frmPropertyOwner: TfrmPropertyOwner;

implementation

uses Login_u;

{$R *.dfm}

procedure TfrmPropertyOwner.btnRequestHelpClick(Sender: TObject);
begin
  showMessage
    ('Since this is a demo, these requests will not be seen by any service providers. Offers will be randomly generated, to showcase the functionality of the program.');
end;

procedure TfrmPropertyOwner.btnCompareHelpClick(Sender: TObject);
begin
  showMessage
    ('Use the navigation tab or your mouse to highlight records in the table. Use the buttons below to get more information about the highlighted record');
end;

procedure TfrmPropertyOwner.btnRequestBackClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
end;

procedure TfrmPropertyOwner.btnSeeRequestDescriptionClick(Sender: TObject);
var
  rating: integer;
begin
  rating := strToInt(InputBox('Rating', 'Enter a rating between 1 and 5', ''));

  dmDatabase.tblOffers.Locate('ID', dmDatabase.qryRequestOffers['ID'], []);
  with dmDatabase do
  begin
    tblRatings.Insert;
    tblRatings['CompanyID'] := tblOffers['ServiceProviderID'];
    tblRatings['Rating'] := rating;
    tblRatings.Post;
  end;

end;

procedure TfrmPropertyOwner.btnSelectOfferClick(Sender: TObject);
begin
  dmDatabase.tblOffers.Locate('ID', dmDatabase.qryRequestOffers['ID'], []);

  dmDatabase.qryServiceProviders.Locate('ID',
    dmDatabase.tblOffers['ServiceProviderID'], []);

  showMessage('Tel: ' + dmDatabase.qryServiceProviders['Phone'] + #13 +
    'Email: ' + dmDatabase.qryServiceProviders['Email']);
end;

procedure TfrmPropertyOwner.btnViewCompanyInfoClick(Sender: TObject);
begin
  dmDatabase.tblOffers.Locate('ID', dmDatabase.qryRequestOffers['ID'], []);

  dmDatabase.qryServiceProviders.Locate('ID',
    dmDatabase.tblOffers['ServiceProviderID'], []);

  frmViewServiceProvider.lblTitle.Caption := dmDatabase.qryServiceProviders
    ['CompanyName'];
  frmViewServiceProvider.lblQuoteOffered.Caption := 'Quote offered: ' +
    formatFloat('R0.00', dmDatabase.tblOffers['Quote']);
  frmViewServiceProvider.imgProfile.Picture.LoadFromFile
    (dmDatabase.qryServiceProviders['ProfileImage']);
  dmDatabase.tblServiceTypes.Locate('ID', dmDatabase.qryServiceProviders
    ['ServiceType'], []);
  frmViewServiceProvider.lblServiceType.Caption := 'Service type: ' +
    dmDatabase.tblServiceTypes['ServiceType'];
  frmViewServiceProvider.lblRating.Caption := 'Rating: ' +
    floatToStr(dmDatabase.qryServiceProviders['Rating']);
  frmViewServiceProvider.lblJobsCompleted.Caption := 'Jobs completed: ' +
    floatToStr(dmDatabase.qryServiceProviders['CompletedJobs']);
  frmViewServiceProvider.memDescription.Text := dmDatabase.qryServiceProviders
    ['Description'];

  frmViewServiceProvider.ShowModal;

  // showMessage('Rating: ' + intToStr(dmDatabase.qryServiceProviders['Rating']) + #13 + 'Jobs Completed: ' + intToStr(dmDatabase.qryServiceProviders['CompletedJobs']) + #13 + 'Description: ' + dmDatabase.qryServiceProviders['Description']);
end;

procedure TfrmPropertyOwner.cmbFilterServiceTypeChange(Sender: TObject);
begin
  filterCards;
  drawServiceProviderCards;
end;

procedure TfrmPropertyOwner.drawServiceProviderCards;
var
  SPCard: TServiceProviderCard;
  Item: TControl;
  I, J, iCardHeight, iCardTop, iMargin: integer;
begin
  I := 0;
  iMargin := 10;

  // destroy all previous SPCards in the scrollbox
  while ScrollBox.ControlCount > 0 do
  begin
    Item := ScrollBox.Controls[0];
    Item.Free;
  end;

  // initialise array
  arrSPCards := [];
  setLength(arrSPCards, dmDatabase.qryServiceProviders.RecordCount);

  // create objects and fill array
  dmDatabase.qryServiceProviders.First;
  for I := 1 to dmDatabase.qryServiceProviders.RecordCount do
  begin
    SPCard := TServiceProviderCard.Create(dmDatabase.qryServiceProviders['ID'],
      ScrollBox);
    iCardHeight := SPCard.getCardHeight;
    SPCard.setTop(iCardHeight * (I - 1) + I * iMargin);
    SPCard.draw;
    arrSPCards[I - 1] := SPCard;
    dmDatabase.qryServiceProviders.Next;

  end;

end;

procedure TfrmPropertyOwner.filterCards;
begin
  queryServiceProviders
    ('SELECT * FROM  ServiceProviders AS sp, (SELECT CompanyID, ROUND(AVG(r.Rating), 2) AS [Rating] FROM Ratings AS r GROUP BY r.CompanyID) as x WHERE x.CompanyID = sp.ID');

  dmDatabase.qryServiceProviders.Open;
  if not(cmbFilterServiceType.Text = 'All') then
  begin
    dmDatabase.tblServiceTypes.Locate('ServiceType',
      cmbFilterServiceType.Text, []);
    dmDatabase.qryServiceProviders.sql.Add(' AND ServiceType = ' +
      intToStr(dmDatabase.tblServiceTypes['ID']));

  end;

  if not(radJobsCompleted.ItemIndex = 0) then
  begin
    case radJobsCompleted.ItemIndex of
      1: // > 10
        dmDatabase.qryServiceProviders.sql.Add('AND CompletedJobs > 10');
      2: // > 50
        dmDatabase.qryServiceProviders.sql.Add('AND CompletedJobs > 50');
      3:
        // > 100
        dmDatabase.qryServiceProviders.sql.Add('AND CompletedJobs > 100');

    end;
  end;

  dmDatabase.qryServiceProviders.ExecSQL;

  sortCards;

  dmDatabase.qryServiceProviders.ExecSQL;
  dmDatabase.qryServiceProviders.Close;
  dmDatabase.qryServiceProviders.Active := true;

end;

procedure TfrmPropertyOwner.FormClose(Sender: TObject;

  var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmPropertyOwner.NavlinkMouseEnter(Sender: TObject);
begin
  if Sender is TPanel then
  begin
    if not(TPanel(Sender) = selectedNavLink) then
      TPanel(Sender).Color := TColor($00FFB55F); // primary light
  end;

end;

procedure TfrmPropertyOwner.NavlinkMouseLeave(Sender: TObject);
begin
  if Sender is TPanel then
  begin
    if not(TPanel(Sender) = selectedNavLink) then
      TPanel(Sender).Color := TColor($00FEA034); // primary
  end;
end;

procedure TfrmPropertyOwner.pnlRequestButtonClick(Sender: TObject);
var
  sCompany: string;
begin
  if (cmbRequestServiceType.Text = 'Select service type') and
    (cmbRequestServiceType.Visible = true) then
  begin
    showMessage('Please select a service type');
    exit;
  end;

  if length(memDescription.Text) < 10 then
  begin
    showMessage('Please enter a thorough but concise description');
    exit;
  end;

  // request

  with dmDatabase do
  begin
    tblRequests.Open;
    tblRequests.Last;
    tblRequests.Insert;
    tblRequests['Description'] := Trim(memDescription.Text);
    tblRequests['PropertyOwnerID'] := frmLogin.iUserID;

    if cmbRequestServiceType.Visible then
    begin
      tblServiceTypes.Locate('ServiceType', cmbRequestServiceType.Text, []);
      tblRequests['ServiceTypeID'] := tblServiceTypes['ID'];
    end

    else
    begin
      sCompany := lblChosenCompany.Caption;
      Delete(sCompany, 1, 9);
      tblServiceProviders.Locate('CompanyName', sCompany, []);
      tblRequests['ServiceProviderID'] := tblServiceProviders['ID']
    end;

    tblRequests.Post;

  end;

  // success

  PageControl.ActivePageIndex := 0;
  showMessage
    ('Your request has been sent. Check your "Compare" tab to view your offers!');

  // Randomly generate offer
  with dmDatabase do
  begin
    tblRequests.Last;
    tblOffers.Last;
    tblOffers.Insert;
    tblOffers['RequestID'] := tblRequests['ID'];

    if cmbRequestServiceType.Visible then
    begin

      tblServiceProviders.Filter := 'ServiceType = ' +
        intToStr(tblRequests['ServiceTypeID']);
      tblServiceProviders.Filtered := true;
      tblServiceProviders.First;

      tblOffers['ServiceProviderID'] := tblServiceProviders['ID'];
      tblServiceProviders.Filtered := False;

      tblOffers['Quote'] := Random(5000) + 3000;

      tblOffers.Post;
    end
    else
    begin
      tblOffers['ServiceProviderID'] := tblRequests['ServiceTypeID']
    end;
  end;

end;

procedure TfrmPropertyOwner.queryServiceProviders(sql: string);
begin
  dmDatabase.qryServiceProviders.Open;
  dmDatabase.qryServiceProviders.sql.Clear;
  dmDatabase.qryServiceProviders.sql.Add(sql);
  dmDatabase.qryServiceProviders.ExecSQL;
  dmDatabase.qryServiceProviders.Close;
end;

procedure TfrmPropertyOwner.radJobsCompletedClick(Sender: TObject);
begin
  filterCards;
  drawServiceProviderCards;
end;

procedure TfrmPropertyOwner.radRatingClick(Sender: TObject);
begin
  filterCards;
  drawServiceProviderCards;
end;

procedure TfrmPropertyOwner.sortCards;
begin
  // this is only to be used in filterCards - do not call procedure on its own
  dmDatabase.qryServiceProviders.Open;
  case radRating.ItemIndex of
    1:
      // increasing
      dmDatabase.qryServiceProviders.sql.Add(' ORDER BY Rating ASC');
    2:
      // decreasing
      dmDatabase.qryServiceProviders.sql.Add(' ORDER BY Rating DESC');
  end;

end;

procedure TfrmPropertyOwner.FormCreate(Sender: TObject);
begin
  selectedNavLink := pnlNavlinkBrowse;
  PageControl.ActivePageIndex := 0;

  Left := (Monitor.Width - Width) div 2;
  Top := (Monitor.Height - Height) div 2;
end;

procedure TfrmPropertyOwner.FormShow(Sender: TObject);

begin
  // fill in info from db to combobox
  cmbFilterServiceType.Items.Add('All');
  cmbFilterServiceType.ItemIndex := 0;
  dmDatabase.tblServiceTypes.Open;
  dmDatabase.tblServiceTypes.First;
  while not dmDatabase.tblServiceTypes.Eof do
  begin
    cmbFilterServiceType.Items.Add(dmDatabase.tblServiceTypes['ServiceType']);
    cmbRequestServiceType.Items.Add(dmDatabase.tblServiceTypes['ServiceType']);
    dmDatabase.tblServiceTypes.Next;
  end;
  cmbFilterServiceType.ItemIndex := 0;

  // create service provider cards
  filterCards;
  drawServiceProviderCards;

  dmDatabase.qryRequestOffers.Filter := 'PropertyOwner = ' +
    intToStr(frmLogin.iUserID);
end;

procedure TfrmPropertyOwner.NavlinkClick(Sender: TObject);
begin
  selectedNavLink.Color := TColor($00FEA034); // primary
  selectedNavLink := TPanel(Sender);
  selectedNavLink.Color := TColor($00D98C35);
  // primary dark
  PageControl.ActivePageIndex := strToInt(selectedNavLink.Hint);
  cmbRequestServiceType.Visible := true;

end;

end.

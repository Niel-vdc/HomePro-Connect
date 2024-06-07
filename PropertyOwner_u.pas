unit PropertyOwner_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage, ServiceProviderCard_u, dmDatabase_u, Vcl.Buttons,
  Vcl.Mask, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls,
  ServiceProviderDescription_u, shellAPI;

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
    btnComplete: TBitBtn;
    btnRequestHelp: TBitBtn;
    edtName: TLabeledEdit;
    edtSurname: TLabeledEdit;
    edtEmail: TLabeledEdit;
    edtPassword: TLabeledEdit;
    btnSaveProfile: TBitBtn;
    btnDeleteRequest: TBitBtn;
    tdlRate: TTaskDialog;
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
    procedure btnCompleteClick(Sender: TObject);
    procedure btnSaveProfileClick(Sender: TObject);
    procedure btnDeleteRequestClick(Sender: TObject);
    procedure deleteRequest;

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

procedure TfrmPropertyOwner.btnCompleteClick(Sender: TObject);
// when user clicks the complete button, show an input dialog where user can rate a company
var
  sInput: string;
  iRating: integer;
begin

  if MessageDlg
    ('Are you sure you want to close this request? You will be asked to rate the company you chose and then all offers of this request will be removed and the request will be closed.',
    mtWarning, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin
    // check that input is not empty
    tdlRate.execute;

    if tdlRate.ModalResult = mrOk then
    begin

      iRating := tdlRate.RadioButton.Index + 1;
      // Insert rating into database
      dmDatabase.tblOffers.Locate('ID', dmDatabase.qryRequestOffers['ID'], []);
      with dmDatabase do
      begin
        tblRatings.Insert;
        tblRatings['CompanyID'] := tblOffers['ServiceProviderID'];
        tblRatings['Rating'] := iRating;
        tblRatings.Post;
      end;
    end;

    deleteRequest;

    showMessage('Thank you for using this service.');
  end;
end;

procedure TfrmPropertyOwner.btnCompareHelpClick(Sender: TObject);
begin
  showMessage
    ('Use the navigation tab or your mouse to highlight records in the table. Each record is an offer to a request you made. The ID can be used to distinguish which request it is. Use the buttons below to get more information about the highlighted record');
end;

procedure TfrmPropertyOwner.btnDeleteRequestClick(Sender: TObject);
begin
  // when the user clicks to delete the request
  if MessageDlg
    ('Are you sure you want to delete this request? This action is irreversible. If you have not contacted a company, this action will cancel the quotes which are offered.',
    mtWarning, [mbYes, mbNo], 0, mbYes) = mrYes then
  begin

    deleteRequest;
    showMessage('This r=equest has been deleted');
    
  end;

end;

procedure TfrmPropertyOwner.btnRequestBackClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
end;

procedure TfrmPropertyOwner.btnSaveProfileClick(Sender: TObject);
var
  sLoginCookie: TStringlist;
begin
  // update login information
  with dmDatabase do
  begin
    tblPropertyOwners.Locate('ID', frmLogin.iUserID, []);
    tblPropertyOwners.Edit;
    tblPropertyOwners['FirstName'] := edtName.Text;
    tblPropertyOwners['SurName'] := edtSurname.Text;
    tblPropertyOwners['Email'] := edtEmail.Text;
    tblPropertyOwners['Password'] := edtPassword.Text;
    tblPropertyOwners.Post;

  end;

  showMessage('Your information is saved');

  // Resave cookie text file with login detail
  sLoginCookie := TStringlist.create;
  try
    sLoginCookie.Add(intToStr(dmDatabase.tblPropertyOwners['ID']));
    sLoginCookie.Add(edtEmail.Text);
    sLoginCookie.Add(edtPassword.Text);
    sLoginCookie.SaveToFile('loginDetail.txt');
  finally
    sLoginCookie.Free;
  end;
end;

procedure TfrmPropertyOwner.btnSeeRequestDescriptionClick(Sender: TObject);
begin

  showMessage(dmDatabase.qryRequestOffers['Your description']);

end;

procedure TfrmPropertyOwner.btnSelectOfferClick(Sender: TObject);
var
  sURL: string;
begin
  dmDatabase.tblOffers.Locate('ID', dmDatabase.qryRequestOffers['ID'], []);

  dmDatabase.qryServiceProviders.Locate('ID',
    dmDatabase.tblOffers['ServiceProviderID'], []);

  sURL := 'mailto: ' + dmDatabase.qryServiceProviders['Email'];
  Shellexecute(Handle, 'open', PChar(sURL), nil, nil, SW_SHOWNORMAL);

  showMessage('Tel: ' + dmDatabase.qryServiceProviders['Phone'] + #13 +
    'Email: ' + dmDatabase.qryServiceProviders['Email']);
end;

procedure TfrmPropertyOwner.btnViewCompanyInfoClick(Sender: TObject);
// in Compare tab, if user clicks the button to view company info
// fill in data on the popup form.
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
end;

procedure TfrmPropertyOwner.cmbFilterServiceTypeChange(Sender: TObject);
// filter the service provider cards when the service type is changed in the filter
begin
  filterCards;
  drawServiceProviderCards;
end;

procedure TfrmPropertyOwner.deleteRequest;
begin
  // Delete request and offers

  with dmDatabase do
  begin
    qry.sql.Add('DELETE FROM tblOffers WHERE RequestID = ' +
      intToStr(qryRequestOffers['RequestID']));
    qry.ExecSQL;
    qry.sql.Clear;
    qry.sql.Add('DELETE FROM tblRequests WHERE ID = ' +
      intToStr(qryRequestOffers['RequestID']));
    qry.ExecSQL;

    // refresh dbGrid
    qryRequestOffers.Close;
    qryRequestOffers.Open;
    qryRequestOffers.Active := True;
  end;

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
    SPCard := TServiceProviderCard.create(dmDatabase.qryServiceProviders['ID'],
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
  // select the SP information from the query which is filtered
  queryServiceProviders
    ('SELECT * FROM tblServiceProviders AS sp, (SELECT CompanyID, ROUND(AVG(r.Rating), 2) AS [Rating] FROM tblRatings AS r GROUP BY r.CompanyID) as x WHERE x.CompanyID = sp.ID');

  dmDatabase.qryServiceProviders.Open;
  if not(cmbFilterServiceType.Text = 'All') then
  begin
  // the combobox text is in the format "service type (count of service providers)"
  // lookup the service type by copying the name until just before the bracket indicating the count
    dmDatabase.tblServiceTypes.Locate('ServiceType',
      Copy(cmbFilterServiceType.Text, 1, Pos('(', cmbFilterServiceType.Text)-2), []);
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
  dmDatabase.qryServiceProviders.Active := True;

end;

procedure TfrmPropertyOwner.FormClose(Sender: TObject;

  var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmPropertyOwner.NavlinkMouseEnter(Sender: TObject);
begin
     // change button hover colour
  if Sender is TPanel then
  begin
    if not(TPanel(Sender) = selectedNavLink) then
      TPanel(Sender).Color := TColor($00FFB55F); // primary light
  end;

end;

procedure TfrmPropertyOwner.NavlinkMouseLeave(Sender: TObject);
begin
// change button to normal colour
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
  // validate

  if (cmbRequestServiceType.Text = 'Select service type') and
    (cmbRequestServiceType.Visible = True) then
  begin
    showMessage('Please select a service type');
    exit;
  end;

  if length(memDescription.Text) > 255 then
  begin
    showMessage
      ('Please enter a concise description of 255 characters or less. If you need to add more detail, you can do so when communicating with your chosen service provider.');
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

    // if the user selects a generic service type
    if cmbRequestServiceType.Visible then
    begin
      tblServiceTypes.Locate('ServiceType', cmbRequestServiceType.Text, []);
      tblRequests['ServiceTypeID'] := tblServiceTypes['ID'];
    end

    // if the user requests a specific company
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

  // clear components
  memDescription.Lines.Clear;
  cmbRequestServiceType.Text := 'Select service type';

  // Randomly generate offer
  with dmDatabase do
  begin
    tblRequests.Last;
    if cmbRequestServiceType.Visible then
    begin
      // if the user selects a service type, generate quotes from all companies with that service type

      // filter the companies with service type
      tblServiceProviders.Filter := 'ServiceType = ' +
        intToStr(tblRequests['ServiceTypeID']);
      tblServiceProviders.Filtered := True;
      tblServiceProviders.First;

      // loop through companies
      while not tblServiceProviders.Eof do
      begin
        tblOffers.Last;
        tblOffers.Insert;
        tblOffers['RequestID'] := tblRequests['ID'];
        tblOffers['ServiceProviderID'] := tblServiceProviders['ID'];
        tblOffers['Quote'] := Random(10000) + 5000;
        // between R5000 and R15000
        tblOffers.Post;

        tblServiceProviders.Next;
      end;

      tblServiceProviders.Filtered := False;
    end
    else
    begin
      // if user selects a specific service provider, select that company
      tblOffers.Last;
      tblOffers.Insert;
      tblOffers['RequestID'] := tblRequests['ID'];
      tblServiceProviders.Locate('CompanyName', lblChosenCompany.Caption, []);
      tblOffers['ServiceProviderID'] := tblServiceProviders['ID'];
      tblOffers['Quote'] := Random(5000) + 3000; // between R3000 and R8000
      tblOffers.Post;
    end;

    qryRequestOffers.Close;
    qryRequestOffers.Open;
    qryRequestOffers.Active := True;
    dbGrid.DataSource := dsRequestOffers;
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
  // this procedure is only to be used in filterCards - do not call procedure on its own
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
  // fill in info from db to comboboxes
  cmbFilterServiceType.Items.Add('All');
  cmbFilterServiceType.ItemIndex := 0;
  dmDatabase.qryServiceTypes.Open;
  dmDatabase.qryServiceTypes.First;
  while not dmDatabase.qryServiceTypes.Eof do
  begin
       // service type (number of companies)
    cmbFilterServiceType.Items.Add(dmDatabase.qryServiceTypes['ServiceType'] + ' (' + intToStr(dmDatabase.qryServiceTypes['Count']) + ')');
    cmbRequestServiceType.Items.Add(dmDatabase.qryServiceTypes['ServiceType']);
    dmDatabase.qryServiceTypes.Next;
  end;
  cmbFilterServiceType.ItemIndex := 0;

  // create service provider cards
  filterCards;
  drawServiceProviderCards;

  dmDatabase.qryRequestOffers.Filter := 'PropertyOwner = ' +
    intToStr(frmLogin.iUserID);

  // fill in profile information
  with dmDatabase do
  begin
    tblPropertyOwners.Locate('ID', frmLogin.iUserID, []);

    edtName.Text := tblPropertyOwners['FirstName'];
    edtSurname.Text := tblPropertyOwners['SurName'];
    edtEmail.Text := tblPropertyOwners['Email'];
    edtPassword.Text := tblPropertyOwners['Password'];
  end;
end;

procedure TfrmPropertyOwner.NavlinkClick(Sender: TObject);
begin
  selectedNavLink.Color := TColor($00FEA034); // primary
  selectedNavLink := TPanel(Sender);
  selectedNavLink.Color := TColor($00D98C35);
  // primary dark
  PageControl.ActivePageIndex := strToInt(selectedNavLink.Hint);
  cmbRequestServiceType.Visible := True;

end;

end.

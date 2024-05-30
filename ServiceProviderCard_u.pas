unit ServiceProviderCard_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Buttons, dmDatabase_u;

type
  TServiceProviderCard = Class

    shpBody: TShape;
    pnlBody: TPanel;
    imgProfile: TImage;
    lblName: TLabel;
    lblServiceType: TLabel;
    lblJobsDone: TLabel;
    lblRating: TLabel;
    lblDescription: TLabel;
    btnRequest: TBitBtn;
    btnHelp: TBitBtn;

  private
    fID: integer;
    fTop: integer;
    fCardHeight: integer;
    parent: TWinControl;
  public

    constructor Create(ID: integer; parent: TWinControl);
    procedure draw();
    function getProfileImage: string;
    function getBannerImage: string;
    function getCompanyName: string;
    function getDescription: string;
    function getServiceType: string;
    function getJobsCompleted: integer;
    function getEmail: string;
    function getPhone: string;
    function getCardHeight: integer;
    function getTop: integer;
    function getRating: real;
    procedure setTop(iTop: integer);
    procedure helpClick(Sender: TObject);
    procedure requestClick(Sender: TObject);

  end;

implementation

uses PropertyOwner_u;

constructor TServiceProviderCard.Create(ID: integer; parent: TWinControl);
begin
  fID := ID;
  fCardHeight := 150;
  parent := parent;

  shpBody := TShape.Create(parent);
  shpBody.parent := parent;

  pnlBody := TPanel.Create(parent);
  pnlBody.parent := parent;

  imgProfile := TImage.Create(pnlBody);
  imgProfile.parent := pnlBody;

  lblName := TLabel.Create(pnlBody);
  lblName.parent := pnlBody;

  lblServiceType := TLabel.Create(pnlBody);
  lblServiceType.parent := pnlBody;

  lblJobsDone := TLabel.Create(pnlBody);
  lblJobsDone.parent := pnlBody;

  lblRating := TLabel.Create(pnlBody);
  lblRating.parent := pnlBody;

  lblDescription := TLabel.Create(pnlBody);
  lblDescription.parent := pnlBody;

  btnRequest := TBitBtn.Create(pnlBody);
  btnRequest.parent := pnlBody;

  btnHelp := TBitBtn.Create(pnlBody);
  btnHelp.parent := pnlBody;

end;


procedure TServiceProviderCard.draw();
var
  iMargin: integer;
begin
  iMargin := 15;

  shpBody.Top := fTop;
  shpBody.Left := iMargin;
  shpBody.Height := fCardHeight;
  shpBody.Width := 500; // parent.Width - 2 * iMargin;
  shpBody.Brush.Color := cl3DLight;
  shpBody.Pen.style := psClear;
  shpBody.Shape := stRoundRect;
  //
  pnlBody.Top := fTop;
  pnlBody.Left := shpBody.Left + iMargin;
  pnlBody.Height := shpBody.Height;
  pnlBody.Width := shpBody.Width - 2 * iMargin;
  pnlBody.BevelInner := bvNone;
  pnlBody.BevelOuter := bvNone;

  imgProfile.Left := 0;
  imgProfile.Top := 0;
  imgProfile.Width := fCardHeight;
  imgProfile.Height := fCardHeight;
  imgProfile.Stretch := True;
  imgProfile.Proportional := True;
  imgProfile.Center := True;
  imgProfile.Picture.LoadFromFile(getProfileImage());

  lblName.Caption := getCompanyName();
  lblName.Left := fCardHeight + iMargin;
  lblName.Top := iMargin;
  lblName.Font.Name := 'Roboto';
  lblName.Font.Size := 16;

  lblServiceType.Caption := 'Service: ' + getServiceType();
  lblServiceType.Left := fCardHeight + iMargin;
  lblServiceType.Top := lblName.Height + iMargin;
  lblServiceType.Font.Name := 'Roboto';
  lblServiceType.Font.Size := 10;
  lblServiceType.Font.Color := clGray;
  lblServiceType.Font.style := [fsItalic];

  lblJobsDone.Caption := 'Jobs Done: ' + intToStr(getJobsCompleted());
  lblJobsDone.Left := fCardHeight + iMargin;
  lblJobsDone.Top := lblName.Height + lblServiceType.Height + iMargin;
  lblJobsDone.Font.Name := 'Roboto';
  lblJobsDone.Font.Size := 10;
  lblJobsDone.Font.Color := clGray;
  lblJobsDone.Font.style := [fsItalic];

  lblRating.Caption := 'Rating: ' + floatToStr(getRating()) + '★';
  lblRating.Left := fCardHeight + iMargin;
  lblRating.Top := lblName.Height + lblServiceType.Height + lblJobsDone.Height + iMargin;
  lblRating.Font.Name := 'Roboto';
  lblRating.Font.Size := 10;
  lblRating.Font.Color := clGray;
  lblRating.Font.style := [fsItalic];

  //
  // request btn
  //
  btnRequest.Height := 40;
  btnRequest.Width := 120;
  btnRequest.Left := fCardHeight + iMargin;
  btnRequest.Top := fCardHeight - btnRequest.Height - iMargin;
  btnRequest.Caption := 'Request Quote';
  btnRequest.Font.Name := 'Roboto';
  btnRequest.Font.Size := 12;
  btnRequest.Font.Color := Vcl.Graphics.clWebDarkOrange;
  btnRequest.Font.style := [fsBold];
  btnRequest.OnClick := requestClick;

  btnHelp.Height := 30;
  btnHelp.Width := 30;
  btnHelp.Left := fCardHeight + iMargin + btnRequest.Width + 5;
  btnHelp.Top := fCardHeight - btnRequest.Height - iMargin;
  btnHelp.Caption := '?';
  btnHelp.Font.Name := 'Roboto';
  btnHelp.Font.Size := 12;
  btnHelp.Font.Color := clBlack;
  btnHelp.Font.style := [fsBold];
  btnHelp.OnClick := helpClick;

  // description
  lblDescription.Caption := getDescription();
  lblDescription.Left := shpBody.Width - (shpBody.Width div 3);
  lblDescription.Top := iMargin + lblName.Height;
  lblDescription.Width := shpBody.Width div 3 - iMargin;
  lblDescription.WordWrap := True;
  lblDescription.Font.Name := 'Roboto';
  lblDescription.Font.Size := 10;

end;

function TServiceProviderCard.getBannerImage: string;
begin
  dmDatabase.tblServiceProviders.Open;
  dmDatabase.tblServiceProviders.Locate('ID', fID, []);
  Result := dmDatabase.tblServiceProviders['BannerImage'];
end;

function TServiceProviderCard.getCardHeight: integer;
begin
  Result := fCardHeight;
end;

function TServiceProviderCard.getCompanyName: string;
begin
  dmDatabase.tblServiceProviders.Open;
  dmDatabase.tblServiceProviders.Locate('ID', fID, []);
  Result := dmDatabase.tblServiceProviders['CompanyName'];
end;

function TServiceProviderCard.getDescription: string;
begin
  dmDatabase.tblServiceProviders.Open;
  dmDatabase.tblServiceProviders.Locate('ID', fID, []);
  Result := dmDatabase.tblServiceProviders['Description'];
end;

function TServiceProviderCard.getEmail: string;
begin
  dmDatabase.tblServiceProviders.Open;
  dmDatabase.tblServiceProviders.Locate('ID', fID, []);
  Result := dmDatabase.tblServiceProviders['Email'];
end;

function TServiceProviderCard.getJobsCompleted: integer;
begin
  dmDatabase.tblServiceProviders.Open;
  dmDatabase.tblServiceProviders.Locate('ID', fID, []);
  Result := dmDatabase.tblServiceProviders['CompletedJobs'];
end;

function TServiceProviderCard.getPhone: string;
begin
  dmDatabase.tblServiceProviders.Open;
  dmDatabase.tblServiceProviders.Locate('ID', fID, []);
  Result := dmDatabase.tblServiceProviders['Phone'];
end;

function TServiceProviderCard.getProfileImage: string;
begin
  dmDatabase.tblServiceProviders.Open;
  dmDatabase.tblServiceProviders.Locate('ID', fID, []);
  Result := dmDatabase.tblServiceProviders['ProfileImage'];
end;

function TServiceProviderCard.getRating: real;
begin
  dmDatabase.qryServiceProviders.Open;
  dmDatabase.qryServiceProviders.Locate('ID', fID, []);
  Result := dmDatabase.qryServiceProviders['Rating'];
end;

function TServiceProviderCard.getServiceType: string;
var
  iServiceID: integer;
begin
  with dmDatabase do
  begin
    tblServiceProviders.Open;
    tblServiceTypes.Open;
    tblServiceProviders.Locate('ID', fID, []);
    iServiceID := tblServiceProviders['ServiceType'];
    tblServiceTypes.Locate('ID', iServiceID, []);
    Result := tblServiceTypes['ServiceType'];
  end;

end;

function TServiceProviderCard.getTop: integer;
begin
  Result := fTop;
end;

procedure TServiceProviderCard.helpClick(Sender: TObject);
begin
  showMessage('This is a helpful dialog');
end;

procedure TServiceProviderCard.requestClick(Sender: TObject);
begin
  frmPropertyOwner.PageControl.ActivePageIndex := 1; // go to request page
  dmDatabase.tblServiceProviders.Locate('ID', fID, []);
  frmPropertyOwner.lblChosenCompany.Caption := 'Company: ' +
    dmDatabase.tblServiceProviders['CompanyName'];
  frmPropertyOwner.cmbRequestServiceType.Visible := False;

end;

procedure TServiceProviderCard.setTop(iTop: integer);
begin
  fTop := iTop;
end;

end.

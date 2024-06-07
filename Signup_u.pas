unit Signup_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, Vcl.ExtCtrls,
  Vcl.StdCtrls,
  System.ImageList, Vcl.ImgList, Vcl.Buttons, Vcl.Imaging.pngimage, Vcl.Mask,
  dmDatabase_u;

type
  TfrmSignup = class(TForm)
    PageControl: TPageControl;
    tabPurpose: TTabSheet;
    pnlPurpose: TPanel;
    lblHeading: TLabel;
    shpService: TShape;
    shpProperty: TShape;
    imgProperty: TImage;
    imgService: TImage;
    lblProperty: TLabel;
    lblService: TLabel;
    btnBackLogin: TSpeedButton;
    tabPODetails: TTabSheet;
    pnlPODetails: TPanel;
    btnBack: TSpeedButton;
    lblDetailsHeading: TLabel;
    edtPOSurname: TLabeledEdit;
    shpSurname: TShape;
    edtPOName: TLabeledEdit;
    shpName: TShape;
    edtPOEmail: TLabeledEdit;
    shpEmail: TShape;
    edtPOPassword: TLabeledEdit;
    shpRepeatPassword: TShape;
    edtPORepeatPassword: TLabeledEdit;
    shpPassword: TShape;
    shpSignup: TShape;
    pnlSignupButton: TPanel;
    tabSPDetails: TTabSheet;
    pnlServiceProviderDetails: TPanel;
    btnSPBack1: TSpeedButton;
    lblServiceProviderDetails: TLabel;
    edtSPCompanyName: TLabeledEdit;
    shpCompanyName: TShape;
    edtSPPassword: TLabeledEdit;
    shpSPPassword: TShape;
    edtSPRepeatPassword: TLabeledEdit;
    shpSPRepeatPassword: TShape;
    btnSPNext1: TSpeedButton;
    btnSignup: TSpeedButton;
    tabSPDescribe: TTabSheet;
    pnlSPDescribe: TPanel;
    lblDescribe: TLabel;
    btnSPBack2: TSpeedButton;
    btnSPNext2: TSpeedButton;
    Shape1: TShape;
    memSPDescription: TMemo;
    lblDescription: TLabel;
    Shape2: TShape;
    lblServiceType: TLabel;
    cmbServiceType: TComboBox;
    tabSPContact: TTabSheet;
    pnlSPContact: TPanel;
    lblContact: TLabel;
    edtEmail: TLabeledEdit;
    Shape3: TShape;
    edtPhone: TLabeledEdit;
    Shape4: TShape;
    SpeedButton1: TSpeedButton;
    btnSPNext3: TSpeedButton;
    btnSPBack3: TSpeedButton;
    tabSPPersonalise: TTabSheet;
    pnlSPPersonalise: TPanel;
    btnBack4: TSpeedButton;
    lblSPPersonalise: TLabel;
    imgBanner: TImage;
    shpBannerImage: TShape;
    imgProfile: TImage;
    shpProfileImageBorder: TShape;
    shpProfileImage: TShape;
    btnUploadProfile: TBitBtn;
    btnUploadBanner: TBitBtn;
    pnlSPSignup: TPanel;
    shpSPSignup: TShape;
    pnlFuture: TPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure imgPropertyMouseEnter(Sender: TObject);
    procedure imgPropertyMouseLeave(Sender: TObject);
    procedure imgServiceMouseEnter(Sender: TObject);
    procedure imgServiceMouseLeave(Sender: TObject);
    procedure btnBackLoginClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure imgPropertyClick(Sender: TObject);
    procedure imgServiceClick(Sender: TObject);
    procedure pnlSignupButtonMouseEnter(Sender: TObject);
    procedure pnlSignupButtonMouseLeave(Sender: TObject);
    procedure btnBackClick(Sender: TObject);
    procedure btnSPNext1Click(Sender: TObject);
    procedure btnSPNext2Click(Sender: TObject);
    procedure btnSPNext3Click(Sender: TObject);
    procedure pnlSPSignupClick(Sender: TObject);
    procedure btnBack4Click(Sender: TObject);
    procedure btnSPBack1Click(Sender: TObject);
    procedure btnSPBack3Click(Sender: TObject);
    procedure btnSPBack2Click(Sender: TObject);
    procedure pnlSPSignupMouseEnter(Sender: TObject);
    procedure pnlSPSignupMouseLeave(Sender: TObject);
    procedure pnlSignupButtonClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    isPropertyOwner: Boolean;
    sName, sSurname, sEmail: string; // property owner details
    sCompanyName, sServiceType, sDescription, sPhone: string;
    // service provider details;

  public
  { Public declarations }
    CONST
    clPrimary = TColor($00FEA034);
    clPrimaryLight = TColor($00FFB55F);
    clPrimaryDark = TColor($00D98C35);
  end;

var
  frmSignup: TfrmSignup;

implementation

uses Login_u;

{$R *.dfm}

procedure TfrmSignup.btnBack4Click(Sender: TObject);
begin
  PageControl.ActivePageIndex := 4;
end;

procedure TfrmSignup.btnBackClick(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
end;

procedure TfrmSignup.btnBackLoginClick(Sender: TObject);
begin
  Hide;
  frmLogin.Show;

end;

procedure TfrmSignup.btnSPBack1Click(Sender: TObject);
begin
  PageControl.ActivePageIndex := 0;
end;

procedure TfrmSignup.btnSPBack2Click(Sender: TObject);
begin
  PageControl.ActivePageIndex := 2;
end;

procedure TfrmSignup.btnSPBack3Click(Sender: TObject);
begin
  PageControl.ActivePageIndex := 3;
end;

procedure TfrmSignup.btnSPNext1Click(Sender: TObject);
begin
  // Check if fields are empty
  if (edtSPCompanyName.Text = '') or (edtSPPassword.Text = '') or (edtSPRepeatPassword.Text = '') then
  begin
    showMessage('Please fill in all fields');
    Exit;
  end;

  // Check if name is shorter than 200
  if (length(edtSPCompanyName.Text) > 200) then
  begin
    showMessage('Please enter a name which is shorter than 200 characters.');
    Exit;
  end;


  // Check if password is shorter than 200
  if (length(edtSPPassword.Text) > 200) then
  begin
    showMessage
      ('Please enter a password which is shorter than 200 characters.');
    Exit;
  end;

  // Check if password is longer than 8
  if (length(edtSPPassword.Text) < 8) then
  begin
    showMessage('Please enter a password which is longer than 8 characters.');
    Exit;
  end;

  // Check if passwords are equal
  if not(edtSPPassword.Text = edtSPRepeatPassword.Text) then
  begin
    showMessage('Your passwords do not match.');
    Exit;
  end;

   // Check if user exists
  if dmDatabase.tblPropertyOwners.Locate('CompanyName;Password', VarArrayOf([edtSPCompanyName.Text, edtSPPassword.Text]), []) then
  begin
    showMessage('This company already exists.');
    Exit;
  end;



  // Next page
  PageControl.ActivePageIndex := 3;
end;

procedure TfrmSignup.btnSPNext2Click(Sender: TObject);
begin
  PageControl.ActivePageIndex := 4;
end;

procedure TfrmSignup.btnSPNext3Click(Sender: TObject);
begin
  PageControl.ActivePageIndex := 5;
end;


procedure TfrmSignup.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmSignup.FormCreate(Sender: TObject);
begin
  

  Left := (Monitor.Width - Width) div 2;
  Top := (Monitor.Height - Height) div 2;
end;

procedure TfrmSignup.FormShow(Sender: TObject);
begin
  // fill in info from db
  dmDatabase.tblServiceTypes.Open;
  dmDatabase.tblServiceTypes.First;
  while not dmDatabase.tblServiceTypes.Eof do
  begin
    cmbServiceType.Items.Add(dmDatabase.tblServiceTypes['ServiceType']);
    dmDatabase.tblServiceTypes.Next;
  end;
end;

procedure TfrmSignup.imgPropertyClick(Sender: TObject);
begin
  isPropertyOwner := True;
  PageControl.ActivePageIndex := 1;
end;

procedure TfrmSignup.imgPropertyMouseEnter(Sender: TObject);
begin
  shpProperty.Brush.Color := clPrimaryLight;
end;

procedure TfrmSignup.imgPropertyMouseLeave(Sender: TObject);
begin
  shpProperty.Brush.Color := clPrimary;
end;

procedure TfrmSignup.imgServiceClick(Sender: TObject);
begin
  isPropertyOwner := False;
  PageControl.ActivePageIndex := 2;
end;

procedure TfrmSignup.imgServiceMouseEnter(Sender: TObject);
begin
  shpService.Brush.Color := TColor($20C5FF); // Light orange (gold)
end;

procedure TfrmSignup.imgServiceMouseLeave(Sender: TObject);
begin
  shpService.Brush.Color := TColor($00A5FF); // Orange
end;

procedure TfrmSignup.pnlSignupButtonClick(Sender: TObject);
var
  sLoginCookie : TStringlist;
begin
  // Check if fields are empty
  if (edtPOName.Text = '') or (edtPOSurname.Text = '') or (edtPOEmail.Text = '')
    or (edtPOPassword.Text = '') or (edtPORepeatPassword.Text = '') then
  begin
    showMessage('Please fill in all fields');
    Exit;
  end;

  // Check if name is shorter than 200
  if (length(edtPOName.Text) > 200) then
  begin
    showMessage('Please enter a name which is shorter than 200 characters.');
    Exit;
  end;

  // Check if surname is shorter than 200
  if (length(edtPOSurname.Text) > 200) then
  begin
    showMessage('Please enter a surname which is shorter than 200 characters.');
    Exit;
  end;

  // Check if email is shorter than 200
  if (length(edtPOEmail.Text) > 200) then
  begin
    showMessage('Please enter an email which is shorter than 200 characters.');
    Exit;
  end;

  // Check if password is shorter than 200
  if (length(edtPOPassword.Text) > 200) then
  begin
    showMessage
      ('Please enter a password which is shorter than 200 characters.');
    Exit;
  end;

  // Check if password is longer than 8
  if (length(edtPOPassword.Text) < 8) then
  begin
    showMessage('Please enter a password which is longer than 8 characters.');
    Exit;
  end;

  // Check if passwords are equal
  if not(edtPOPassword.Text = edtPORepeatPassword.Text) then
  begin
    showMessage('Your passwords do not match.');
    Exit;
  end;

   // Check if user exists
  if dmDatabase.tblPropertyOwners.Locate('FirstName;Surname;Email', VarArrayOf([edtPOName.Text, edtPOSurname.Text, edtPOEmail.Text]), []) then
  begin
    showMessage('This user already exists. ');
    Exit;
  end;


  // Sign up property owner
  with dmDatabase do
  begin
  tblPropertyOwners.Open;
  tblPropertyOwners.Last;
  tblPropertyOwners.Insert;
  tblPropertyOwners['FirstName'] := edtPOName.Text;
  tblPropertyOwners['SurName'] := edtPOSurName.Text;
  tblPropertyOwners['Email'] := edtPOEmail.Text;
  tblPropertyOwners['Password'] := edtPOPassword.Text;
  tblPropertyOwners.Post;
  end;

  // Create cookie with login detail
  sLoginCookie:= TStringlist.create;
  try
    sLoginCookie.Add(inttoStr(dmDatabase.tblPropertyOwners['ID']));
    sLoginCookie.Add(edtPOEmail.Text);
    sLoginCookie.Add(edtPOPassword.Text);
    sLoginCookie.SaveToFile('loginDetail.txt');
  finally
    sLoginCookie.Free;
  end;


  // Go back to main form
  Hide;
  frmLogin.Show;
end;

procedure TfrmSignup.pnlSignupButtonMouseEnter(Sender: TObject);
begin
  shpSignup.Brush.Color := clPrimaryLight;
  pnlSignupButton.Color := clPrimaryLight;
end;

procedure TfrmSignup.pnlSignupButtonMouseLeave(Sender: TObject);
begin
  shpSignup.Brush.Color := clPrimary;
  pnlSignupButton.Color := clPrimary;
end;

procedure TfrmSignup.pnlSPSignupClick(Sender: TObject);
begin
  // Sign up SP
  Hide;
  frmLogin.Show;
end;

procedure TfrmSignup.pnlSPSignupMouseEnter(Sender: TObject);
begin
  shpSPSignup.Brush.Color := clPrimaryLight;
  pnlSPSignup.Color := clPrimaryLight;
end;

procedure TfrmSignup.pnlSPSignupMouseLeave(Sender: TObject);
begin
  shpSPSignup.Brush.Color := clPrimary;
  pnlSPSignup.Color := clPrimary;
end;

end.

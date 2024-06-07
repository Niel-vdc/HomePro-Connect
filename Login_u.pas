unit Login_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FMX.Colors, Vcl.Mask, Signup_u, PropertyOwner_u, dmDatabase_u;

type
  TfrmLogin = class(TForm)
    shpEmail: TShape;
    pnlBody: TPanel;
    btnSignup: TSpeedButton;
    shpLoginButton: TShape;
    pnlLoginButton: TPanel;
    edtLoginEmail: TLabeledEdit;
    pnlTitle: TPanel;
    edtLoginPassword: TLabeledEdit;
    shpPassword: TShape;

    procedure pnlLoginButtonMouseEnter(Sender: TObject);
    procedure pnlLoginButtonMouseLeave(Sender: TObject);
    procedure btnSignupClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure pnlLoginButtonClick(Sender: TObject);

  private
    { Private declarations }

  public
  { Public declarations }
  iUserID : integer;

    CONST
    clPrimary = TColor($00FEA034);
    clPrimaryLight = TColor($00FFB55F);
    clPrimaryDark = TColor($00D98C35);
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnSignupClick(Sender: TObject);
begin
  frmSignup.PageControl.ActivePageIndex := 0;
  frmSignup.Show;
  Hide;
end;

procedure TfrmLogin.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Application.Terminate;
end;

procedure TfrmLogin.FormCreate(Sender: TObject);
var
  loginFile: TextFile;
  sLine: string;
  aLoginDetail: array [1 .. 3] of string; // ID, email, password
  i: integer;
begin
  Left := (Monitor.Width - Width) div 2;
  Top := (Monitor.Height - Height) div 2;

  // open login file, read data to aLoginDetail array
  if fileExists('loginDetail.txt') then
  begin
    i := 1;
    assignFile(loginFile, 'loginDetail.txt');
    reset(loginFile);
    while not Eof(loginFile) do
    begin
      readln(loginFile, sLine);

      aLoginDetail[i] := sLine;
      i := i + 1;
    end;
    closeFile(loginFile);

    iUserID := strToInt(aLoginDetail[1]);
    edtLoginEmail.Text := aLoginDetail[2];
    edtLoginPassword.Text := aLoginDetail[3];

  end;
end;

procedure TfrmLogin.pnlLoginButtonClick(Sender: TObject);
begin
  // login;
  if not(dmDatabase.tblPropertyOwners.Locate('Email;Password',
    VarArrayOf([edtLoginEmail.Text, edtLoginPassword.Text]), [])) then
  // or dmDatabase.tblServiceProviders.Locate('Email;Password', VarArrayOf([edtLoginEmail.Text, edtLoginPassword.Text]), [])) then
  begin
    showMessage('User not found');
    Exit;
  end;
  // go to first page
  Hide;
  frmPropertyOwner.Show;
end;

procedure TfrmLogin.pnlLoginButtonMouseEnter(Sender: TObject);
begin
  shpLoginButton.Brush.Color := clPrimaryLight;
  pnlLoginButton.Color := clPrimaryLight;
end;

procedure TfrmLogin.pnlLoginButtonMouseLeave(Sender: TObject);
begin
  shpLoginButton.Brush.Color := clPrimary;
  pnlLoginButton.Color := clPrimary;
end;

end.

program HomeProConnect_p;

uses
  Vcl.Forms,
  Login_u in 'Login_u.pas' {frmLogin},
  Signup_u in 'Signup_u.pas' {frmSignup},
  PropertyOwner_u in 'PropertyOwner_u.pas' {frmPropertyOwner},
  ServiceProviderCard_u in 'ServiceProviderCard_u.pas',
  dmDatabase_u in 'dmDatabase_u.pas' {dmDatabase: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmSignup, frmSignup);
  Application.CreateForm(TfrmPropertyOwner, frmPropertyOwner);
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.Run;
end.

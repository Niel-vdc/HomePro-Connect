program HomeProConnect_p;

uses
  Vcl.Forms,
  dmDatabase_u in 'dmDatabase_u.pas' {dmDatabase: TDataModule},
  Login_u in 'Login_u.pas' {frmLogin},
  PropertyOwner_u in 'PropertyOwner_u.pas' {frmPropertyOwner},
  ServiceProviderCard_u in 'ServiceProviderCard_u.pas',
  ServiceProviderDescription_u in 'ServiceProviderDescription_u.pas' {frmViewServiceProvider},
  Signup_u in 'Signup_u.pas' {frmSignup},
  ViewServiceProviderDescription in 'ViewServiceProviderDescription.pas' {frmServiceProvider};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmLogin, frmLogin);
  Application.CreateForm(TfrmServiceProvider, frmServiceProvider);
  Application.CreateForm(TfrmViewServiceProvider, frmViewServiceProvider);
  Application.CreateForm(TdmDatabase, dmDatabase);
  Application.CreateForm(TfrmPropertyOwner, frmPropertyOwner);
  Application.CreateForm(TfrmViewServiceProvider, frmViewServiceProvider);
  Application.CreateForm(TfrmSignup, frmSignup);
  Application.CreateForm(TfrmServiceProvider, frmServiceProvider);
  Application.Run;
end.

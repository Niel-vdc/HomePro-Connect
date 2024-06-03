unit ViewServiceProviderDescription;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons;

type
  TfrmServiceProvider = class(TForm)
    lblTitle: TLabel;
    imgProfile: TImage;
    lblRating: TLabel;
    lblJobsCompleted: TLabel;
    lblServiceType: TLabel;
    lblDescription: TLabel;
    btnClose: TBitBtn;
    memDescription: TMemo;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServiceProvider: TfrmServiceProvider;

implementation

{$R *.dfm}

end.

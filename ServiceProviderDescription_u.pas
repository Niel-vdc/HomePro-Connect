unit ServiceProviderDescription_u;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrmViewServiceProvider = class(TForm)
    lblTitle: TLabel;
    imgProfile: TImage;
    lblRating: TLabel;
    lblJobsCompleted: TLabel;
    lblServiceType: TLabel;
    lblDescription: TLabel;
    btnClose: TBitBtn;
    memDescription: TMemo;
    lblQuoteOffered: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmViewServiceProvider: TfrmViewServiceProvider;

implementation

{$R *.dfm}

end.

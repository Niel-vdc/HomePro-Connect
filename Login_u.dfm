object frmLogin: TfrmLogin
  Left = 0
  Top = 0
  Caption = 'Login'
  ClientHeight = 550
  ClientWidth = 750
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  TextHeight = 15
  object pnlBody: TPanel
    Left = 0
    Top = 121
    Width = 750
    Height = 429
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object shpEmail: TShape
      Left = 176
      Top = 89
      Width = 393
      Height = 49
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object btnSignup: TSpeedButton
      Left = 336
      Top = 319
      Width = 81
      Height = 41
      Cursor = crHandPoint
      Caption = 'Sign Up'
      Flat = True
      Font.Charset = ANSI_CHARSET
      Font.Color = 16687156
      Font.Height = -16
      Font.Name = 'Roboto Bk'
      Font.Style = []
      ParentFont = False
      OnClick = btnSignupClick
    end
    object shpLoginButton: TShape
      Left = 256
      Top = 264
      Width = 241
      Height = 49
      Brush.Color = 16687156
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object shpPassword: TShape
      Left = 176
      Top = 160
      Width = 393
      Height = 47
      Pen.Style = psClear
      Shape = stRoundRect
    end
    object pnlLoginButton: TPanel
      Left = 264
      Top = 264
      Width = 225
      Height = 49
      Cursor = crHandPoint
      BevelOuter = bvNone
      Caption = 'Login'
      Color = 16686901
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto Bk'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = pnlLoginButtonClick
      OnMouseEnter = pnlLoginButtonMouseEnter
      OnMouseLeave = pnlLoginButtonMouseLeave
    end
    object edtLoginEmail: TLabeledEdit
      Left = 192
      Top = 105
      Width = 361
      Height = 33
      BorderStyle = bsNone
      Color = clWhite
      EditLabel.Width = 47
      EditLabel.Height = 33
      EditLabel.Caption = 'E-Mail'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clGrayText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Roboto'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentFont = False
      TabOrder = 1
      Text = ''
    end
    object edtLoginPassword: TLabeledEdit
      Left = 192
      Top = 174
      Width = 361
      Height = 33
      BorderStyle = bsNone
      Color = clWhite
      EditLabel.Width = 71
      EditLabel.Height = 33
      EditLabel.Caption = 'Password'
      EditLabel.Font.Charset = ANSI_CHARSET
      EditLabel.Font.Color = clGrayText
      EditLabel.Font.Height = -16
      EditLabel.Font.Name = 'Roboto'
      EditLabel.Font.Style = []
      EditLabel.ParentFont = False
      EditLabel.Transparent = True
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Roboto'
      Font.Style = []
      LabelPosition = lpLeft
      LabelSpacing = 30
      ParentFont = False
      PasswordChar = '*'
      TabOrder = 2
      Text = ''
    end
  end
  object pnlTitle: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 121
    Align = alTop
    BevelOuter = bvNone
    Caption = 'HomePro Connect'
    Color = 16687156
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -48
    Font.Name = 'Britannic Bold'
    Font.Style = []
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
  end
end

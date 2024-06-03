object frmViewServiceProvider: TfrmViewServiceProvider
  Left = 0
  Top = 0
  Caption = 'Service Provider'
  ClientHeight = 419
  ClientWidth = 537
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object lblTitle: TLabel
    Left = 88
    Top = 40
    Width = 64
    Height = 38
    Caption = 'Title'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -32
    Font.Name = 'Roboto Bk'
    Font.Style = []
    ParentFont = False
  end
  object imgProfile: TImage
    Left = 88
    Top = 128
    Width = 161
    Height = 129
    Proportional = True
    Stretch = True
  end
  object lblRating: TLabel
    Left = 264
    Top = 153
    Width = 54
    Height = 19
    Caption = 'Rating: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object lblJobsCompleted: TLabel
    Left = 264
    Top = 178
    Width = 121
    Height = 19
    Caption = 'Jobs completed: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object lblServiceType: TLabel
    Left = 264
    Top = 128
    Width = 87
    Height = 19
    Caption = 'ServiceType'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object lblDescription: TLabel
    Left = 88
    Top = 263
    Width = 89
    Height = 19
    Caption = 'Description: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    ParentFont = False
  end
  object lblQuoteOffered: TLabel
    Left = 88
    Top = 84
    Width = 68
    Height = 25
    Caption = 'Quote: '
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Roboto Bk'
    Font.Style = []
    ParentFont = False
  end
  object btnClose: TBitBtn
    Left = 432
    Top = 382
    Width = 75
    Height = 25
    Caption = '&OK'
    Kind = bkClose
    NumGlyphs = 2
    TabOrder = 0
  end
  object memDescription: TMemo
    Left = 88
    Top = 288
    Width = 338
    Height = 89
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Roboto'
    Font.Style = []
    Lines.Strings = (
      'memDescription')
    ParentFont = False
    ReadOnly = True
    TabOrder = 1
  end
end

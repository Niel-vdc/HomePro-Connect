object frmPropertyOwner: TfrmPropertyOwner
  Left = 0
  Top = 0
  Caption = 'HomePro Connect'
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
  OnShow = FormShow
  TextHeight = 15
  object PageControl: TPageControl
    Left = 0
    Top = 60
    Width = 750
    Height = 490
    ActivePage = tabBrowse
    Align = alClient
    TabOrder = 0
    object tabBrowse: TTabSheet
      Caption = 'Browse'
      TabVisible = False
      object pnlBrowse: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 480
        Align = alClient
        ParentBackground = False
        TabOrder = 0
        object pnlFilter: TPanel
          Left = 1
          Top = 1
          Width = 192
          Height = 478
          Align = alLeft
          BevelOuter = bvNone
          Color = cl3DLight
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 0
          object imgFilter: TImage
            Left = 25
            Top = 80
            Width = 20
            Height = 20
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000140000
              001408060000008D891D0D000000097048597300000B1300000B1301009A9C18
              000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000000
              C14944415478DA6364200F2C00E278206E04E2066409465A18B89F04831280F8
              2192810FA018C5C0FF2418A88066200660447732013001883F20197800880FD2
              3C0CD18101143F80BA005758DA03F14620DE40C840908DF550572492EA749081
              0A6862F9405C8066A0022906E28A65988120C3EE0FA881E8DE29807A9B6C2FA3
              8306060A23051DA0271B0120EE87CA15324012364906A2039077EF23B11F1232
              B00187DC050648A245367022312EA47A2CE32ABE40D96A029A811706240CA96A
              200059793ACF6B88F68B0000000049454E44AE426082}
          end
          object lblBrowseHeading: TLabel
            Left = 25
            Top = 16
            Width = 96
            Height = 35
            Caption = 'Browse'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -29
            Font.Name = 'Roboto'
            Font.Style = []
            ParentFont = False
          end
          object lblFilter: TLabel
            Left = 51
            Top = 81
            Width = 37
            Height = 19
            Caption = 'Filter'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Roboto Bk'
            Font.Style = []
            ParentFont = False
          end
          object lblFilterServiceType: TLabel
            Left = 24
            Top = 122
            Width = 90
            Height = 19
            Caption = 'Service Type'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Roboto Bk'
            Font.Style = []
            ParentFont = False
          end
          object cmbFilterServiceType: TComboBox
            Left = 24
            Top = 147
            Width = 145
            Height = 27
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            ParentFont = False
            TabOrder = 0
            OnChange = cmbFilterServiceTypeChange
          end
          object radJobsCompleted: TRadioGroup
            Left = 21
            Top = 317
            Width = 148
            Height = 111
            Caption = 'Jobs completed'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              'No sorting'
              '> 10'
              '> 50'
              '> 100')
            ParentFont = False
            TabOrder = 1
            OnClick = radJobsCompletedClick
          end
          object radRating: TRadioGroup
            Left = 21
            Top = 196
            Width = 148
            Height = 97
            Caption = 'Rating'
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -16
            Font.Name = 'Roboto'
            Font.Style = []
            ItemIndex = 0
            Items.Strings = (
              'No sorting'
              'Increasing'
              'Decreasing')
            ParentFont = False
            TabOrder = 2
            OnClick = radRatingClick
          end
        end
        object pnlBrowseContainer: TPanel
          Left = 193
          Top = 1
          Width = 548
          Height = 478
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object ScrollBox: TScrollBox
            Left = 0
            Top = 0
            Width = 548
            Height = 478
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
          end
        end
      end
    end
    object tabRequest: TTabSheet
      Caption = 'Request'
      ImageIndex = 1
      TabVisible = False
      object pnlRequest: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 480
        Align = alClient
        ParentBackground = False
        TabOrder = 0
        object lblRequest: TLabel
          Left = 176
          Top = 48
          Width = 189
          Height = 35
          Caption = 'Request Quote'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
        end
        object shpInput1: TShape
          Left = 168
          Top = 169
          Width = 393
          Height = 184
          Pen.Style = psClear
          Shape = stRoundRect
        end
        object lblDescription: TLabel
          Left = 176
          Top = 148
          Width = 332
          Height = 14
          Caption = 'Enter a clear description of the job you want to be completed. '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
        end
        object shpLoginButton: TShape
          Left = 236
          Top = 400
          Width = 253
          Height = 49
          Brush.Color = 16687156
          Pen.Style = psClear
          Shape = stRoundRect
        end
        object lblChosenCompany: TLabel
          Left = 176
          Top = 89
          Width = 76
          Height = 19
          Caption = 'Company: '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
        end
        object btnRequestBack: TSpeedButton
          Left = 24
          Top = 24
          Width = 65
          Height = 25
          Cursor = crHandPoint
          Caption = 'Back'
          Flat = True
          Font.Charset = ANSI_CHARSET
          Font.Color = 16687156
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          Glyph.Data = {
            32090000424D320900000000000042000000280000001A000000160000000100
            200003000000F0080000130B0000130B000000000000000000000000FF0000FF
            0000FF0000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000FA9F3530FA9F30300000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FD9F3270FEA034EFFEA033EFFA9F35300000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FD9F3480FEA034FFFEA034EFFC9F
            3350000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FD9F3390FEA034FFFEA0
            35DFF79F30200000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000FF9F3020FEA034CFFEA0
            34FFFEA035DFF79F302000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000FF9F3020FEA0
            33DFFEA034FFFEA034AFFF9F3010000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000FB9F
            3440FEA034EFFEA034FFFEA034FFFEA033DFFEA033DFFEA033DFFEA033DFFEA0
            33DFFEA033DFFEA033DFFEA033DFFEA033DFFEA033DFFEA033DFFEA034AF0000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000FB9F3440FEA034EFFEA034FFFEA034FFFFA033DFFFA033DFFFA0
            33DFFFA033DFFFA033DFFFA033DFFFA033DFFFA033DFFFA033DFFFA033DFFFA0
            33DFFFA0359F0000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FF9F3020FEA035DFFEA034FFFD9F
            33A0FF9F30100000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000000000000000000000000000FF9F
            3020FEA035CFFEA034FFFEA034CFF79F30200000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000FFA0339FFEA034FFFEA033DFFA9F30300000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000FFA1347FFEA0
            34FFFEA033EFFC9F356000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000FFA1365FFEA034EFFEA034EFFF9F353000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            000000000000000000000000000000000000FA9F3030FA9F3530000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000000000000
            00000000000000000000000000000000000000000000}
          ParentFont = False
          OnClick = btnRequestBackClick
        end
        object memDescription: TMemo
          Left = 176
          Top = 176
          Width = 377
          Height = 169
          BevelInner = bvNone
          BorderStyle = bsNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          Lines.Strings = (
            '')
          ParentFont = False
          ParentShowHint = False
          ScrollBars = ssVertical
          ShowHint = False
          TabOrder = 0
        end
        object pnlRequestButton: TPanel
          Left = 252
          Top = 400
          Width = 225
          Height = 49
          Cursor = crHandPoint
          BevelOuter = bvNone
          Caption = 'Send request'
          Color = 16686901
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Roboto Bk'
          Font.Style = []
          ParentBackground = False
          ParentFont = False
          TabOrder = 1
        end
      end
    end
    object tabCompare: TTabSheet
      Caption = 'Compare'
      ImageIndex = 2
      TabVisible = False
      object pnlCompare: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 480
        Align = alClient
        TabOrder = 0
        object lblCompareHeading: TLabel
          Left = 96
          Top = 56
          Width = 203
          Height = 35
          Caption = 'Compare Offers'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
        end
        object dbGrid: TDBGrid
          Left = 56
          Top = 97
          Width = 641
          Height = 280
          DataSource = dmDatabase.dsQuerySP
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
        end
      end
    end
    object tabProfile: TTabSheet
      Caption = 'Profile'
      ImageIndex = 3
      TabVisible = False
      object pnlProfile: TPanel
        Left = 0
        Top = 0
        Width = 742
        Height = 480
        Align = alClient
        TabOrder = 0
        object lblProfileHeading: TLabel
          Left = 88
          Top = 48
          Width = 148
          Height = 35
          Caption = 'Your profile'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
        end
      end
    end
  end
  object pnlNavbar: TPanel
    Left = 0
    Top = 0
    Width = 750
    Height = 60
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Color = 16687156
    ParentBackground = False
    TabOrder = 1
    object pnlNavlinkBrowse: TPanel
      Left = 0
      Top = 2
      Width = 143
      Height = 58
      Cursor = crHandPoint
      Hint = '0'
      BevelOuter = bvNone
      Caption = 'Browse Services'
      Color = 14257205
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto Bk'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = NavlinkClick
      OnMouseEnter = NavlinkMouseEnter
      OnMouseLeave = NavlinkMouseLeave
    end
    object pnlNavlinkCompare: TPanel
      Left = 143
      Top = 2
      Width = 113
      Height = 58
      Cursor = crHandPoint
      Hint = '2'
      BevelOuter = bvNone
      Caption = 'Compare'
      Color = 16687156
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto Bk'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = NavlinkClick
      OnMouseEnter = NavlinkMouseEnter
      OnMouseLeave = NavlinkMouseLeave
    end
    object pnlNavlinkProfile: TPanel
      Left = 648
      Top = 2
      Width = 102
      Height = 58
      Cursor = crHandPoint
      Hint = '3'
      BevelOuter = bvNone
      Caption = 'Profile'
      Color = 16686901
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto Bk'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 2
      OnClick = NavlinkClick
      OnMouseEnter = NavlinkMouseEnter
      OnMouseLeave = NavlinkMouseLeave
    end
  end
end

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
    ActivePage = tabCompare
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
          Width = 208
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
            Left = 8
            Top = 147
            Width = 194
            Height = 26
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -15
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
              'No limit'
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
          Left = 209
          Top = 1
          Width = 532
          Height = 478
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          ExplicitLeft = 193
          ExplicitWidth = 548
          object ScrollBox: TScrollBox
            Left = 0
            Top = 0
            Width = 532
            Height = 478
            Align = alClient
            BorderStyle = bsNone
            TabOrder = 0
            ExplicitWidth = 548
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
          Hint = 'Enter a description of 255 characters and under'
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
          ShowHint = True
          TabOrder = 0
        end
        object pnlRequestButton: TPanel
          Left = 252
          Top = 400
          Width = 225
          Height = 49
          Cursor = crHandPoint
          Hint = 
            'Your request will be sent to all service providers who work in y' +
            'our selected service type.'
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
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = pnlRequestButtonClick
        end
        object cmbRequestServiceType: TComboBox
          Left = 176
          Top = 89
          Width = 385
          Height = 27
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          TabOrder = 2
          Text = 'Select service type'
        end
      end
      object btnRequestHelp: TBitBtn
        Left = 680
        Top = 24
        Width = 33
        Height = 33
        Hint = 'Help'
        Caption = '?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnRequestHelpClick
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
        ParentBackground = False
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
          Left = 32
          Top = 97
          Width = 673
          Height = 280
          DataSource = dmDatabase.dsRequestOffers
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -16
          TitleFont.Name = 'Roboto Bk'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'RequestID'
              Title.Caption = 'Request ID'
              Width = 87
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Service Type'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Company'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Quote Offered'
              Width = 150
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'Your description'
              Width = 200
              Visible = True
            end>
        end
        object dbNavigator: TDBNavigator
          Left = 560
          Top = 66
          Width = 140
          Height = 25
          DataSource = dmDatabase.dsRequestOffers
          VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
          TabOrder = 1
        end
        object btnSeeRequestDescription: TBitBtn
          Left = 32
          Top = 392
          Width = 233
          Height = 33
          Hint = 'This is the description which you entered in your job request'
          Caption = 'View your request description'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnSeeRequestDescriptionClick
        end
        object btnViewCompanyInfo: TBitBtn
          Left = 32
          Top = 431
          Width = 233
          Height = 33
          Hint = 'This includes rating, jobs completed and a description'
          Caption = 'View company information'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 3
          OnClick = btnViewCompanyInfoClick
        end
        object btnSelectOffer: TBitBtn
          Left = 271
          Top = 392
          Width = 210
          Height = 33
          Hint = 
            'This will open your default email application and address a new ' +
            'email to the selected company'
          Caption = 'Contact this company'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Roboto Bk'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 4
          OnClick = btnSelectOfferClick
        end
        object btnCompareHelp: TBitBtn
          Left = 672
          Top = 16
          Width = 33
          Height = 33
          Hint = 'Help'
          Caption = '?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 5
          OnClick = btnCompareHelpClick
        end
        object btnComplete: TBitBtn
          Left = 528
          Top = 393
          Width = 169
          Height = 33
          Hint = 'Rate the company and delete the request thereafter'
          Caption = 'Complete this request'
          Font.Charset = ANSI_CHARSET
          Font.Color = 6469635
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = btnCompleteClick
        end
        object btnDeleteRequest: TBitBtn
          Left = 528
          Top = 432
          Width = 172
          Height = 33
          Hint = 'Careful!'
          Caption = 'Delete this request'
          Font.Charset = ANSI_CHARSET
          Font.Color = clRed
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 7
          OnClick = btnDeleteRequestClick
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
        ParentBackground = False
        TabOrder = 0
        object lblProfileHeading: TLabel
          Left = 215
          Top = 80
          Width = 304
          Height = 35
          Caption = 'Your profile information'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -29
          Font.Name = 'Roboto'
          Font.Style = []
          ParentFont = False
        end
        object edtName: TLabeledEdit
          Left = 216
          Top = 152
          Width = 313
          Height = 27
          EditLabel.Width = 76
          EditLabel.Height = 27
          EditLabel.Caption = 'First name'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Roboto Bk'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentFont = False
          TabOrder = 0
          Text = ''
        end
        object edtSurname: TLabeledEdit
          Left = 216
          Top = 194
          Width = 313
          Height = 27
          EditLabel.Width = 64
          EditLabel.Height = 27
          EditLabel.Caption = 'Surname'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Roboto Bk'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentFont = False
          TabOrder = 1
          Text = ''
        end
        object edtEmail: TLabeledEdit
          Left = 216
          Top = 234
          Width = 313
          Height = 27
          EditLabel.Width = 46
          EditLabel.Height = 27
          EditLabel.Caption = 'E-mail'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Roboto Bk'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentFont = False
          TabOrder = 2
          Text = ''
        end
        object edtPassword: TLabeledEdit
          Left = 216
          Top = 274
          Width = 313
          Height = 27
          EditLabel.Width = 70
          EditLabel.Height = 27
          EditLabel.Caption = 'Password'
          EditLabel.Font.Charset = ANSI_CHARSET
          EditLabel.Font.Color = clWindowText
          EditLabel.Font.Height = -16
          EditLabel.Font.Name = 'Roboto Bk'
          EditLabel.Font.Style = []
          EditLabel.ParentFont = False
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -16
          Font.Name = 'Roboto'
          Font.Style = []
          LabelPosition = lpLeft
          LabelSpacing = 10
          ParentFont = False
          TabOrder = 3
          Text = ''
        end
      end
      object btnSaveProfile: TBitBtn
        Left = 215
        Top = 336
        Width = 314
        Height = 49
        Caption = 'Save'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Roboto Bk'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        OnClick = btnSaveProfileClick
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
      Left = 254
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
    object pnlNavLinkRequest: TPanel
      Left = 143
      Top = 2
      Width = 113
      Height = 58
      Cursor = crHandPoint
      Hint = '1'
      BevelOuter = bvNone
      Caption = 'Request'
      Color = 16686901
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Roboto Bk'
      Font.Style = []
      ParentBackground = False
      ParentFont = False
      TabOrder = 3
      OnClick = NavlinkClick
      OnMouseEnter = NavlinkMouseEnter
      OnMouseLeave = NavlinkMouseLeave
    end
  end
  object tdlRate: TTaskDialog
    Buttons = <>
    RadioButtons = <
      item
        Caption = #9733
      end
      item
        Caption = #9733#9733
      end
      item
        Caption = #9733#9733#9733
      end
      item
        Caption = #9733#9733#9733#9733
      end
      item
        Caption = #9733#9733#9733#9733#9733
        Default = True
      end>
    Text = 'Please rate this company'
    Title = 'Rate'
    Left = 492
    Top = 498
  end
end

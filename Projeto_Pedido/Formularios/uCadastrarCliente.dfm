object fCadastrarCliente: TfCadastrarCliente
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Cliente'
  ClientHeight = 279
  ClientWidth = 503
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object pnlMaster: TPanel
    Left = 0
    Top = 0
    Width = 503
    Height = 279
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    StyleName = 'Windows'
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 25
      Top = 20
      Width = 249
      Height = 42
      Margins.Left = 0
      Margins.Top = 15
      Margins.Right = 0
      Margins.Bottom = 15
      AutoSize = False
      Caption = 'Novo Cliente'
      Font.Charset = ANSI_CHARSET
      Font.Color = 16744448
      Font.Height = -24
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
    object Label7: TLabel
      AlignWithMargins = True
      Left = 25
      Top = 87
      Width = 126
      Height = 13
      Margins.Left = 6
      AutoSize = False
      Caption = 'Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      AlignWithMargins = True
      Left = 25
      Top = 143
      Width = 126
      Height = 13
      Margins.Left = 6
      AutoSize = False
      Caption = 'Cidade'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      AlignWithMargins = True
      Left = 423
      Top = 143
      Width = 34
      Height = 13
      Margins.Left = 6
      AutoSize = False
      Caption = 'UF'
      Font.Charset = ANSI_CHARSET
      Font.Color = 5585461
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object pnlCancelar: TPanel
      AlignWithMargins = True
      Left = 363
      Top = 226
      Width = 110
      Height = 30
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 14869218
      ParentBackground = False
      TabOrder = 4
      object btnCancelar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 30
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Cancelar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnCancelarClick
        ExplicitLeft = -8
      end
    end
    object pnlSalvar: TPanel
      AlignWithMargins = True
      Left = 218
      Top = 226
      Width = 110
      Height = 30
      Margins.Left = 0
      Margins.Top = 20
      Margins.Right = 15
      Margins.Bottom = 20
      BevelOuter = bvNone
      Color = 16475988
      ParentBackground = False
      TabOrder = 3
      object btnSalvar: TSpeedButton
        Left = 0
        Top = 0
        Width = 110
        Height = 30
        Cursor = crHandPoint
        Align = alClient
        Caption = 'Salvar'
        Flat = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -17
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnSalvarClick
        ExplicitLeft = -1
      end
    end
    object edtCidade: TEdit
      Left = 25
      Top = 159
      Width = 384
      Height = 31
      AutoSize = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 50
      ParentFont = False
      TabOrder = 1
    end
    object edtUF: TEdit
      Left = 423
      Top = 159
      Width = 50
      Height = 31
      AutoSize = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 2
      ParentFont = False
      TabOrder = 2
    end
    object edtNome: TEdit
      Left = 25
      Top = 106
      Width = 448
      Height = 31
      AutoSize = False
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 80
      ParentFont = False
      TabOrder = 0
    end
  end
end

object fLocalizarProduto: TfLocalizarProduto
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'fLocalizarProduto'
  ClientHeight = 480
  ClientWidth = 619
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poOwnerFormCenter
  Scaled = False
  OnShow = FormShow
  TextHeight = 15
  object pnlGrid: TPanel
    Left = 0
    Top = 90
    Width = 619
    Height = 390
    Align = alClient
    TabOrder = 0
    object grdLocalizar: TDBGrid
      Left = 1
      Top = 1
      Width = 617
      Height = 388
      Align = alClient
      DataSource = dsLocalizar
      Options = [dgTitles, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = grdLocalizarDblClick
      Columns = <
        item
          Alignment = taCenter
          Expanded = False
          FieldName = 'ID_Produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Title.Alignment = taCenter
          Title.Caption = 'C'#243'digo'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Arial Rounded MT Bold'
          Title.Font.Style = []
          Width = 90
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'NM_Produto'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial Narrow'
          Font.Style = []
          Title.Caption = 'Nome'
          Title.Font.Charset = ANSI_CHARSET
          Title.Font.Color = clWindowText
          Title.Font.Height = -13
          Title.Font.Name = 'Arial Rounded MT Bold'
          Title.Font.Style = []
          Width = 500
          Visible = True
        end>
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 619
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 7119398
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -40
    Font.Name = 'Segoe UI'
    Font.Style = []
    Padding.Left = 10
    Padding.Bottom = 3
    ParentBackground = False
    ParentFont = False
    TabOrder = 1
    StyleName = 'Windows'
    object lblTitulo: TLabel
      AlignWithMargins = True
      Left = 17
      Top = 3
      Width = 249
      Height = 42
      Margins.Left = 0
      Margins.Top = 15
      Margins.Right = 0
      Margins.Bottom = 15
      AutoSize = False
      Caption = 'Consultar Clientes'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Layout = tlCenter
    end
  end
  object pnlConsulta: TPanel
    Left = 0
    Top = 50
    Width = 619
    Height = 40
    Align = alTop
    BevelOuter = bvNone
    Color = clWhite
    ParentBackground = False
    TabOrder = 2
    StyleName = 'Windows'
    object pnlFiltro: TPanel
      AlignWithMargins = True
      Left = 1
      Top = 1
      Width = 400
      Height = 38
      Margins.Left = 1
      Margins.Top = 1
      Margins.Right = 15
      Margins.Bottom = 1
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'pnlFiltro'
      TabOrder = 0
      object shpFiltro: TShape
        Left = 0
        Top = 0
        Width = 400
        Height = 38
        Margins.Left = 2
        Margins.Top = 2
        Margins.Right = 2
        Margins.Bottom = 2
        Align = alClient
        Pen.Color = clSilver
        Pen.Style = psInsideFrame
        Shape = stRoundRect
        ExplicitWidth = 633
      end
      object edtFiltro: TEdit
        Left = 10
        Top = 9
        Width = 380
        Height = 28
        BevelInner = bvNone
        BevelOuter = bvNone
        BorderStyle = bsNone
        CharCase = ecUpperCase
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Segoe UI'
        Font.Style = []
        MaxLength = 40
        ParentFont = False
        TabOrder = 0
      end
    end
    object pnlPesquisar: TPanel
      AlignWithMargins = True
      Left = 416
      Top = 0
      Width = 100
      Height = 40
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 1
      Margins.Bottom = 0
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'pnlPesquisar'
      TabOrder = 1
      object shpPesquisar: TShape
        Left = 0
        Top = 0
        Width = 100
        Height = 40
        Align = alClient
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = -3
        ExplicitTop = -2
        ExplicitWidth = 215
      end
      object btnPesquisar: TSpeedButton
        Left = 0
        Top = 0
        Width = 100
        Height = 40
        Align = alClient
        Caption = 'Pesquisar '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnPesquisarClick
        ExplicitLeft = -40
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
    object pnlFechar: TPanel
      AlignWithMargins = True
      Left = 518
      Top = 0
      Width = 100
      Height = 40
      Margins.Left = 0
      Margins.Top = 0
      Margins.Right = 1
      Margins.Bottom = 0
      Align = alRight
      BevelOuter = bvNone
      TabOrder = 2
      object shpFechar: TShape
        Left = 0
        Top = 0
        Width = 100
        Height = 40
        Align = alClient
        Pen.Style = psClear
        Shape = stRoundRect
        ExplicitLeft = -3
        ExplicitTop = -2
        ExplicitWidth = 215
      end
      object btnFechar: TSpeedButton
        Left = 0
        Top = 0
        Width = 100
        Height = 40
        Align = alClient
        Caption = 'Fechar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        OnClick = btnFecharClick
        ExplicitLeft = -40
        ExplicitWidth = 23
        ExplicitHeight = 22
      end
    end
  end
  object qryLocalizar: TFDQuery
    Connection = fDMConexao.Conecta
    SQL.Strings = (
      'SELECT ID_Produto'
      '      ,NM_Produto'
      '      ,VL_Unitario'
      'FROM PRODUTO'
      'ORDER BY NM_Produto')
    Left = 24
    Top = 201
    object qryLocalizarID_Produto: TFDAutoIncField
      FieldName = 'ID_Produto'
      Origin = 'ID_Cliente'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
      DisplayFormat = '000000'
    end
    object qryLocalizarNM_Produto: TStringField
      FieldName = 'NM_Produto'
      Origin = 'NM_Cliente'
      Required = True
      Size = 80
    end
    object qryLocalizarVL_Unitario: TBCDField
      FieldName = 'VL_Unitario'
      Origin = 'VL_Unitario'
      Required = True
      DisplayFormat = '#,##0.00'
      Precision = 10
      Size = 2
    end
  end
  object dsLocalizar: TDataSource
    DataSet = qryLocalizar
    Left = 64
    Top = 201
  end
end

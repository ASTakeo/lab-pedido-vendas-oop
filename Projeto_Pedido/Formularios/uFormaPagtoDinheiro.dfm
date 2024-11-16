object fFormaPagtoDinheiro: TfFormaPagtoDinheiro
  Left = 0
  Top = 0
  Width = 355
  Height = 265
  TabOrder = 0
  object pnlPrincipal: TPanel
    Left = 0
    Top = 0
    Width = 355
    Height = 265
    Align = alClient
    Padding.Left = 70
    Padding.Top = 30
    Padding.Right = 70
    Padding.Bottom = 30
    TabOrder = 0
    object Label1: TLabel
      Left = 24
      Top = 105
      Width = 140
      Height = 30
      Caption = 'Total Recebido:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object edtValorRecebido: TEdit
      Left = 184
      Top = 101
      Width = 145
      Height = 38
      Alignment = taRightJustify
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      NumbersOnly = True
      ParentFont = False
      TabOrder = 0
      Text = '0,00'
      StyleName = 'Windows'
    end
  end
end

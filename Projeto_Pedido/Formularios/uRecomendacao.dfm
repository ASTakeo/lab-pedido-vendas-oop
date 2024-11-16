object fRecomendacao: TfRecomendacao
  Left = 0
  Top = 0
  Width = 786
  Height = 510
  TabOrder = 0
  object Panel2: TPanel
    Left = 0
    Top = 50
    Width = 786
    Height = 460
    Align = alClient
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 0
    ExplicitTop = 41
    ExplicitWidth = 787
    ExplicitHeight = 469
    object ListBox1: TListBox
      Left = 0
      Top = 0
      Width = 786
      Height = 460
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      Items.Strings = (
        ''
        'Identifica'#231#227'o:'
        ''
        '- Nome   : Alexssandro Takeo Sugahara'
        '- Celular: (14)99620-2045'
        '- E-mail : alexssandro.sugahara@etec.sp.gov.br'
        '           atsugahara@hotmail.com'
        ''
        ''
        'Recomenda'#231#245'es - Projeto Pedido:'
        ''
        '  - Fork no reposit'#243'rio'
        '  - Enviar Pullrequest (Nome E-mail)'
        
          '  - Repositorio (https://github.com/alepmedeiros/lab-pedido-vend' +
          'as-oop)'
        '  - Requisitos a serem seguidos para a cria'#231#227'o do projeto:'
        
          '  - Este '#233' um exemplo onde devem ser aplicadas t'#233'cnicas como Ori' +
          'enta'#231#227'o de Objetos, '
        
          '  - Orienta'#231#227'o de Interface, padr'#227'o MVC, arquitetura em camadas,' +
          ' Clean Code.'
        '  - Abaixo est'#227'o alguns requisitos para a cria'#231#227'o do projeto'
        ''
        ''
        'Solicita'#231#245'es:'
        ''
        '  - 01. O operador deve informar o cliente, e os produtos.'
        
          '  - 02. A classe que representa a tabela de cliente deve ter(c'#243'd' +
          'igo, nome, cidade, uf).'
        
          '  - 03. A classe que representa a tabela de produtos deve ter(c'#243 +
          'digo, descri'#231#227'o, pre'#231'o de venda).'
        
          '  - 04. Para informar o produto na tela do pedido de venda, o op' +
          'erador deve informar: c'#243'digo do produto, '
        '        quantidade e valor unit'#225'rio.'
        
          '  - 05. Conforme o operador insere os produtos e confirma, eles ' +
          'devem ir em uma grade para visualiza'#231#227'o.'
        
          '  - 06. A grade deve apresentar: c'#243'digo do produto, descri'#231#227'o do' +
          ' produto, quantidade, valor unit'#225'rio e valor total.'
        
          '  - 07. Ter a possibilidade de selecionar um item dessa grade e ' +
          'poder editar a quantidade e o valor unit'#225'rio.'
        
          '  - 08. Ter a possibilidade de selecionar um item dessa grade e ' +
          'poder excluir. Deve ser perguntado se '
        '        o operador deseja realmente excluir esse registro'
        '  - 09. Exiba um totalizador no rodap'#233' da tela.'
        
          '  - 10. Ter um bot'#227'o de salvar o pedido, persistindo os dados na' +
          's tabelas pedidos e pedidos itens.'
        
          '  - 11. A classe que representa a tabela de pedidos deve possuir' +
          ' (N'#250'mero do Pedido, Data de Emiss'#227'o, C'#243'digo '
        '        do Cliente, Valor Total).'
        
          '  - 12. A classe que representa a tabela de itens do pedido deve' +
          ' possuir (incremento autom'#225'tico, n'#250'mero do '
        
          '        pedido, c'#243'digo do produto, quantidade, valor unit'#225'rio, v' +
          'alor total).'
        '  - 13. Use a transa'#231#227'o e trate de poss'#237'veis erros.'
        '  - 14. O pedido deve ter um n'#250'mero sequencial crescente.'
        
          '  - 15. A chave prim'#225'ria da tabela de pedidos deve ser (N'#250'mero d' +
          'o pedido), n'#227'o podendo haver duplica'#231#227'o entre '
        '        os registros registrados.'
        
          '  - 16. A chave prim'#225'ria da tabela de itens do pedido deve ser (' +
          'auto-incremento), pois pode haver repeti'#231#227'o de produtos.'
        
          '  - 17. Crie os FKs necess'#225'rios para vincular a tabela de produt' +
          'os do pedido e a tabela de dados gerais do pedido.'
        
          '  - 18. Crie os '#237'ndices necess'#225'rios nos dados gerais do pedido e' +
          ' nas tabelas de produtos do pedido.'
        
          '  - 19. Ter a possibilidade de visualizar pedidos j'#225' realizados,' +
          ' por clientes ou geral.'
        
          '  - 20. Crie um bot'#227'o na tela do pedido, que deve ficar vis'#237'vel ' +
          'quando o c'#243'digo do cliente estiver em branco, para '
        '    cancelar um pedido.'
        ''
        'Crit'#233'rios de engines'
        ''
        '  - Usar SQLite como banco de dados.'
        '  - Use FireDAC para se conectar ao banco de dados.'
        
          '  - Use conven'#231#245'es de transa'#231#227'o e tratamento de exce'#231#227'o ao grava' +
          'r dados.'
        
          '  - Priorize o uso de SQL, mesmo em inser'#231#245'es e atualiza'#231#245'es, is' +
          'so '#233' para manter o conhecimento em SQL.'
        
          '  - Iremos usar conceito de orienta'#231#227'o a objetos, criando classe' +
          's por exemplo. '
        
          '  - Nota: Seguir as melhores pr'#225'ticas '#233' importante, no caso usan' +
          'do orienta'#231#227'o a interface, '#233' extremamente importante.'
        '  - N'#227'o usamos componentes de terceiros, somente nativos do IDE.'
        '  ')
      ParentFont = False
      TabOrder = 0
      ExplicitTop = -50
    end
  end
  object pnlHeader: TPanel
    Left = 0
    Top = 0
    Width = 786
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
    ExplicitLeft = -266
    ExplicitWidth = 1052
    object pnlFechar: TPanel
      AlignWithMargins = True
      Left = 731
      Top = 3
      Width = 50
      Height = 41
      Margins.Right = 5
      Align = alRight
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Color = 7119398
      ParentBackground = False
      TabOrder = 0
      ExplicitLeft = 997
      object btnFechar: TSpeedButton
        Left = 0
        Top = 0
        Width = 50
        Height = 41
        Align = alClient
        Caption = 'X'
        ImageIndex = 4
        Flat = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -29
        Font.Name = 'Arial Rounded MT Bold'
        Font.Style = []
        ParentFont = False
        OnClick = btnFecharClick
        ExplicitWidth = 60
        ExplicitHeight = 44
      end
    end
    object Panel1: TPanel
      Left = 10
      Top = 0
      Width = 321
      Height = 47
      Align = alLeft
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Projeto Pedido'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -24
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end

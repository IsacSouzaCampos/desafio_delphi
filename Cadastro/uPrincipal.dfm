object Form1: TForm1
  Left = 0
  Top = 0
  Anchors = []
  BorderStyle = bsSizeToolWin
  Caption = 'Cadastro'
  ClientHeight = 326
  ClientWidth = 298
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poDesigned
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object PageControl1: TPageControl
    Left = 1
    Top = -3
    Width = 296
    Height = 333
    ActivePage = TabSheet1
    TabOrder = 0
    TabStop = False
    object TabSheet1: TTabSheet
      AlignWithMargins = True
      Caption = 'Cadastro'
      object LabelCPFInput: TLabel
        Left = 56
        Top = 8
        Width = 25
        Height = 13
        Caption = '*CPF'
      end
      object LabelName: TLabel
        Left = 56
        Top = 64
        Width = 81
        Height = 13
        Caption = '*Nome Completo'
      end
      object LabelAge: TLabel
        Left = 56
        Top = 128
        Width = 34
        Height = 13
        Caption = '*Idade'
      end
      object LabelPhone: TLabel
        Left = 56
        Top = 192
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object EditName: TEdit
        Left = 56
        Top = 83
        Width = 177
        Height = 21
        TabOrder = 1
        OnExit = EditNameExit
        OnKeyPress = EditNameKeyPress
      end
      object ButtonInsert: TButton
        Left = 56
        Top = 263
        Width = 177
        Height = 25
        Caption = 'Cadastrar'
        TabOrder = 4
        OnClick = ButtonInsertClick
      end
      object MaskPhone: TMaskEdit
        Left = 56
        Top = 211
        Width = 177
        Height = 21
        EditMask = '!\(99\) 99999-9999;1;_'
        MaxLength = 15
        TabOrder = 3
        Text = '(  )      -    '
      end
      object MaskCPFInput: TMaskEdit
        Left = 56
        Top = 27
        Width = 177
        Height = 21
        EditMask = '999.999.999-99;1;_'
        MaxLength = 14
        TabOrder = 0
        Text = '   .   .   -  '
        OnExit = MaskCPFInputExit
      end
      object MaskAge: TMaskEdit
        Left = 56
        Top = 147
        Width = 175
        Height = 21
        EditMask = '999;1;_'
        MaxLength = 3
        TabOrder = 2
        Text = '   '
        OnExit = MaskAgeExit
      end
    end
    object TabSheet2: TTabSheet
      AlignWithMargins = True
      Caption = 'Pesquisa'
      object LabelCPFSearch: TLabel
        Left = 56
        Top = 216
        Width = 25
        Height = 13
        Caption = '*CPF'
      end
      object ButtonSearch: TButton
        Left = 56
        Top = 263
        Width = 177
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 1
        OnClick = ButtonSearchClick
      end
      object MaskCPFSearch: TMaskEdit
        Left = 56
        Top = 235
        Width = 177
        Height = 21
        EditMask = '999.999.999-99;1;_'
        MaxLength = 14
        TabOrder = 0
        Text = '   .   .   -  '
        OnExit = MaskCPFSearchExit
      end
      object DBGrid1: TDBGrid
        Left = 0
        Top = 0
        Width = 282
        Height = 169
        Align = alTop
        DataSource = dmDados.DataSource1
        TabOrder = 2
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'CPF'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'NOME_COMPLETO'
            Width = 108
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'IDADE'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'TELEFONE'
            Visible = True
          end>
      end
      object ButtonShowAll: TButton
        Left = 184
        Top = 175
        Width = 95
        Height = 25
        Caption = 'Mostrar Todos'
        TabOrder = 3
        OnClick = ButtonShowAllClick
      end
    end
  end
end

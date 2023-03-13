object Form1: TForm1
  Left = 0
  Top = 0
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
    object TabSheet1: TTabSheet
      AlignWithMargins = True
      Caption = 'Cadastro'
      object Label1: TLabel
        Left = 56
        Top = 8
        Width = 25
        Height = 13
        Caption = '*CPF'
      end
      object Label2: TLabel
        Left = 56
        Top = 64
        Width = 81
        Height = 13
        Caption = '*Nome Completo'
      end
      object Label3: TLabel
        Left = 56
        Top = 128
        Width = 34
        Height = 13
        Caption = '*Idade'
      end
      object Label4: TLabel
        Left = 56
        Top = 192
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object Edit1: TEdit
        Left = 56
        Top = 27
        Width = 177
        Height = 21
        TabOrder = 0
        OnExit = Edit1Exit
      end
      object Edit2: TEdit
        Left = 56
        Top = 83
        Width = 177
        Height = 21
        TabOrder = 1
        OnExit = Edit2Exit
      end
      object Edit3: TEdit
        Left = 56
        Top = 147
        Width = 177
        Height = 21
        TabOrder = 2
        OnExit = Edit3Exit
      end
      object Edit4: TEdit
        Left = 56
        Top = 211
        Width = 177
        Height = 21
        TabOrder = 3
      end
      object Button1: TButton
        Left = 56
        Top = 264
        Width = 177
        Height = 25
        Caption = 'Cadastrar'
        TabOrder = 4
      end
    end
    object TabSheet2: TTabSheet
      AlignWithMargins = True
      Caption = 'Pesquisa'
      object Label5: TLabel
        Left = 56
        Top = 8
        Width = 25
        Height = 13
        Caption = '*CPF'
      end
      object Edit5: TEdit
        Left = 56
        Top = 27
        Width = 177
        Height = 21
        TabOrder = 0
        OnExit = Edit5Exit
      end
      object Button2: TButton
        Left = 56
        Top = 88
        Width = 177
        Height = 25
        Caption = 'Pesquisar'
        TabOrder = 1
      end
    end
  end
end

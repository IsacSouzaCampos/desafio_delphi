object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Fatorial'
  ClientHeight = 123
  ClientWidth = 260
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 16
    Top = 24
    Width = 26
    Height = 13
    Caption = 'Vaor:'
  end
  object Label2: TLabel
    Left = 16
    Top = 48
    Width = 52
    Height = 13
    Caption = 'Resultado:'
  end
  object Edit1: TEdit
    Left = 74
    Top = 21
    Width = 65
    Height = 21
    TabOrder = 0
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 74
    Top = 45
    Width = 65
    Height = 21
    ReadOnly = True
    TabOrder = 3
  end
  object Button1: TButton
    Left = 16
    Top = 80
    Width = 123
    Height = 25
    Caption = 'Calcular'
    TabOrder = 2
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 160
    Top = 21
    Width = 81
    Height = 84
    Caption = 'Algoritmo'
    ItemIndex = 0
    Items.Strings = (
      'Linear'
      'Recursivo')
    TabOrder = 1
  end
end

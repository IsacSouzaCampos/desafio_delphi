object Form1: TForm1
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Fibonacci'
  ClientHeight = 273
  ClientWidth = 248
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnActivate = FormActivate
  OnCreate = FormCreate
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 48
    Top = 5
    Width = 48
    Height = 13
    Caption = 'Resultado'
  end
  object Label2: TLabel
    Left = 8
    Top = 200
    Width = 40
    Height = 13
    Caption = 'Posi'#231#227'o:'
  end
  object ListBox1: TListBox
    Left = 48
    Top = 24
    Width = 153
    Height = 146
    ItemHeight = 13
    TabOrder = 2
  end
  object Button1: TButton
    Left = 8
    Top = 224
    Width = 113
    Height = 25
    Caption = 'Gerar'
    TabOrder = 1
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 127
    Top = 192
    Width = 106
    Height = 65
    Caption = 'Algoritmo'
    ItemIndex = 0
    Items.Strings = (
      'Linear'
      'Recursivo')
    TabOrder = 0
  end
  object MaskPosition: TMaskEdit
    Left = 64
    Top = 197
    Width = 56
    Height = 21
    EditMask = '99;1;_'
    MaxLength = 2
    TabOrder = 3
    Text = '  '
    OnExit = MaskPositionExit
  end
end

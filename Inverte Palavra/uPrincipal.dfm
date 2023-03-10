object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Inverte Palavra'
  ClientHeight = 193
  ClientWidth = 317
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  OnKeyDown = FormKeyDown
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 24
    Width = 75
    Height = 13
    Caption = 'Palavra Original'
  end
  object Label2: TLabel
    Left = 40
    Top = 72
    Width = 83
    Height = 13
    Caption = 'Palavra Invertida'
  end
  object Edit1: TEdit
    Left = 40
    Top = 45
    Width = 241
    Height = 21
    TabOrder = 0
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 40
    Top = 91
    Width = 241
    Height = 21
    ReadOnly = True
    TabOrder = 1
  end
  object Button1: TButton
    Left = 40
    Top = 153
    Width = 241
    Height = 25
    Caption = 'Inverter'
    TabOrder = 2
    OnClick = Button1Click
  end
end

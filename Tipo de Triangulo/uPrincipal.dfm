object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 186
  ClientWidth = 443
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
    Left = 24
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Lado 1'
  end
  object Label2: TLabel
    Left = 160
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Lado 2'
  end
  object Label3: TLabel
    Left = 296
    Top = 24
    Width = 32
    Height = 13
    Caption = 'Lado 3'
  end
  object Label4: TLabel
    Left = 160
    Top = 88
    Width = 121
    Height = 25
    Alignment = taCenter
    AutoSize = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Edit1: TEdit
    Left = 33
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 0
    OnExit = Edit1Exit
  end
  object Edit2: TEdit
    Left = 160
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 1
    OnExit = Edit2Exit
  end
  object Edit3: TEdit
    Left = 296
    Top = 43
    Width = 121
    Height = 21
    TabOrder = 2
    OnExit = Edit3Exit
  end
  object Button1: TButton
    Left = 24
    Top = 144
    Width = 393
    Height = 25
    Caption = 'Verificar'
    TabOrder = 3
    OnClick = Button1Click
  end
end

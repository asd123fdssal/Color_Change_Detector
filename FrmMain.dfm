object Form1: TForm1
  Left = 583
  Top = 299
  AutoScroll = False
  Caption = 'Form1'
  ClientHeight = 129
  ClientWidth = 423
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object Edit1: TEdit
    Left = 120
    Top = 96
    Width = 121
    Height = 21
    TabOrder = 9
  end
  object btnPos: TButton
    Left = 8
    Top = 8
    Width = 97
    Height = 33
    Caption = 'GetPosition'
    TabOrder = 0
    OnClick = btnPosClick
  end
  object Exit: TButton
    Left = 8
    Top = 88
    Width = 97
    Height = 33
    Caption = 'Exit'
    TabOrder = 7
    TabStop = False
    OnClick = ExitClick
  end
  object Start: TButton
    Left = 8
    Top = 48
    Width = 97
    Height = 33
    Caption = 'Start'
    TabOrder = 8
    OnClick = StartClick
  end
  object XiButton1: TButton
    Left = 320
    Top = 85
    Width = 97
    Height = 33
    Caption = 'SETTING'
    TabOrder = 10
    TabStop = False
    OnClick = XiButton1Click
  end
  object XPos: TPanel
    Left = 216
    Top = 8
    Width = 96
    Height = 33
    Caption = 'XPos1'
    TabOrder = 1
  end
  object YPos: TPanel
    Left = 216
    Top = 48
    Width = 96
    Height = 33
    Caption = 'YPos1'
    TabOrder = 2
  end
  object Color1: TPanel
    Left = 320
    Top = 8
    Width = 96
    Height = 33
    Caption = 'Color1'
    TabOrder = 5
  end
  object Color2: TPanel
    Left = 320
    Top = 48
    Width = 96
    Height = 33
    Caption = 'Color2'
    TabOrder = 6
  end
  object ColorPanel: TPanel
    Left = 112
    Top = 8
    Width = 97
    Height = 33
    Caption = 'ColorPanel'
    ParentBackground = False
    TabOrder = 3
  end
  object ColorPanel2: TPanel
    Left = 112
    Top = 48
    Width = 97
    Height = 33
    Caption = 'ColorPanel'
    ParentBackground = False
    TabOrder = 4
  end
  object getColorTimer: TTimer
    Enabled = False
    Interval = 1
    OnTimer = getColorTimerTimer
    Left = 256
    Top = 72
  end
end

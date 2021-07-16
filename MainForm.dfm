object formMain: TformMain
  Left = 623
  Top = 354
  BorderStyle = bsToolWindow
  Caption = 'Alert By Time'
  ClientHeight = 289
  ClientWidth = 472
  Color = clBtnFace
  Font.Charset = RUSSIAN_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Verdana'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbTimeStart: TLabel
    Left = 8
    Top = 8
    Width = 58
    Height = 13
    Caption = 'Time start'
  end
  object lbMinutesAdd: TLabel
    Left = 137
    Top = 8
    Width = 83
    Height = 13
    Caption = 'Minutes to add'
  end
  object lbTimeEnd: TLabel
    Left = 264
    Top = 8
    Width = 53
    Height = 13
    Caption = 'Time end'
  end
  object dtpTimeStart: TDateTimePicker
    Left = 8
    Top = 24
    Width = 125
    Height = 21
    Date = 44393.352137708330000000
    Time = 44393.352137708330000000
    Kind = dtkTime
    TabOrder = 0
  end
  object cbMinutesAdd: TComboBox
    Left = 136
    Top = 24
    Width = 125
    Height = 21
    Style = csDropDownList
    ItemHeight = 13
    ItemIndex = 0
    TabOrder = 1
    Text = '3'
    Items.Strings = (
      '3'
      '5'
      '60'
      '120')
  end
  object dtpTimeEnd: TDateTimePicker
    Left = 264
    Top = 24
    Width = 125
    Height = 21
    Date = 44393.352137708330000000
    Time = 44393.352137708330000000
    Enabled = False
    Kind = dtkTime
    TabOrder = 2
  end
  object btnRun: TButton
    Left = 392
    Top = 24
    Width = 75
    Height = 25
    Caption = 'Run'
    TabOrder = 3
    OnClick = btnRunClick
  end
  object stbBar: TStatusBar
    Left = 0
    Top = 270
    Width = 472
    Height = 19
    Panels = <>
    SimplePanel = True
  end
  object btnTimeLeft: TButton
    Left = 8
    Top = 72
    Width = 75
    Height = 25
    Caption = 'Time left'
    TabOrder = 5
    OnClick = btnTimeLeftClick
  end
end

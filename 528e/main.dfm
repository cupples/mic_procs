object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 246
  ClientWidth = 664
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCloseQuery = FormCloseQuery
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object input_panel: TPanel
    Left = 10
    Top = 8
    Width = 159
    Height = 113
    TabOrder = 0
    DesignSize = (
      159
      113)
    object input_bar: TProgressBar
      Left = 8
      Top = 24
      Width = 9
      Height = 57
      Max = 300
      Orientation = pbVertical
      Step = 1
      TabOrder = 0
    end
    object input_label: TStaticText
      Left = 8
      Top = 1
      Width = 56
      Height = 17
      Caption = 'input_label'
      TabOrder = 1
    end
    object cb_low_cut: TCheckBox
      Left = 23
      Top = 64
      Width = 97
      Height = 17
      Caption = 'cb_low_cut'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object c_cb_device: TComboBox
      Left = 4
      Top = 87
      Width = 145
      Height = 21
      Style = csDropDownList
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 3
      OnChange = c_cb_deviceChange
    end
  end
  object Panel1: TPanel
    Left = 175
    Top = 8
    Width = 130
    Height = 113
    Caption = 'Panel1'
    TabOrder = 1
  end
  object expand_comp_panel: TPanel
    Left = 311
    Top = 8
    Width = 338
    Height = 113
    TabOrder = 2
    object expander_label: TLabel
      Left = 8
      Top = 0
      Width = 100
      Height = 13
      Caption = 'Downward Expander'
    end
    object compressor_label: TLabel
      Left = 272
      Top = 0
      Width = 57
      Height = 13
      Caption = 'Compressor'
    end
    object exp_t_label: TLabel
      Left = 9
      Top = 87
      Width = 72
      Height = 13
      Alignment = taCenter
      Caption = 'exp threashold'
    end
    object exp_t_value_label: TLabel
      Left = 9
      Top = 41
      Width = 61
      Height = 19
      Alignment = taCenter
      Caption = '-45.0 db'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object comp_t_label: TLabel
      Left = 99
      Top = 87
      Width = 79
      Height = 13
      Alignment = taCenter
      Caption = 'comp threashold'
    end
    object comp_t_value_label: TLabel
      Left = 96
      Top = 39
      Width = 61
      Height = 19
      Alignment = taCenter
      Caption = '-35.0 db'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object comp_r_label: TLabel
      Left = 193
      Top = 87
      Width = 50
      Height = 13
      Alignment = taCenter
      Caption = 'comp ratio'
    end
    object comp_r_value_label: TLabel
      Left = 192
      Top = 39
      Width = 38
      Height = 19
      Alignment = taCenter
      Caption = '6.0:1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object GainIncrease: TLabel
      Left = 267
      Top = 39
      Width = 63
      Height = 13
      Caption = 'GainIncrease'
    end
    object LExpander_bar: TProgressBar
      Left = 9
      Top = 24
      Width = 152
      Height = 9
      TabOrder = 0
    end
    object LCompressor_bar: TProgressBar
      Left = 176
      Top = 24
      Width = 154
      Height = 9
      TabOrder = 1
    end
    object expand_cb: TCheckBox
      Left = 280
      Top = 66
      Width = 49
      Height = 17
      Caption = 'exp in'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object compress_cb: TCheckBox
      Left = 280
      Top = 89
      Width = 57
      Height = 17
      Caption = 'comp in'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object exp_t_upd: TUpDown
      Left = 31
      Top = 66
      Width = 33
      Height = 15
      Min = -600
      Max = 200
      Orientation = udHorizontal
      Position = -450
      TabOrder = 4
      OnChanging = exp_t_updChanging
    end
    object comp_t_upd: TUpDown
      Left = 116
      Top = 66
      Width = 33
      Height = 15
      Min = -600
      Max = 200
      Orientation = udHorizontal
      Position = -350
      TabOrder = 5
      OnChanging = exp_t_updChanging
      OnClick = comp_t_updClick
    end
    object comp_r_upd: TUpDown
      Left = 200
      Top = 66
      Width = 33
      Height = 15
      Max = 500
      Orientation = udHorizontal
      Position = 60
      TabOrder = 6
      OnChanging = exp_t_updChanging
      OnClick = comp_r_updClick
    end
    object cb_above_threashold: TCheckBox
      Left = 129
      Top = 1
      Width = 97
      Height = 17
      Caption = 'cb_above_threashold'
      TabOrder = 7
    end
  end
  object eq_panel: TPanel
    Left = 8
    Top = 127
    Width = 497
    Height = 113
    TabOrder = 3
    object heq_g_label: TLabel
      Left = 456
      Top = 71
      Width = 32
      Height = 13
      Alignment = taCenter
      Caption = 'gain'
    end
    object heq_g_value_label: TLabel
      Left = 456
      Top = 25
      Width = 32
      Height = 19
      Alignment = taCenter
      Caption = '0 db'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object heq_b_value_label: TLabel
      Left = 401
      Top = 25
      Width = 36
      Height = 19
      Alignment = taCenter
      Caption = '1.5 k'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object heq_b_label: TLabel
      Left = 408
      Top = 70
      Width = 29
      Height = 13
      Alignment = taCenter
      Caption = 'bw'
    end
    object heq_f_label: TLabel
      Left = 353
      Top = 71
      Width = 28
      Height = 13
      Alignment = taCenter
      Caption = 'freq'
    end
    object heq_f_value_label: TLabel
      Left = 343
      Top = 25
      Width = 52
      Height = 19
      Alignment = taCenter
      Caption = '6.8 khz'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object cb_eq: TCheckBox
      Left = 449
      Top = 90
      Width = 39
      Height = 17
      Caption = 'eq in'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object heq_g_ud: TUpDown
      Left = 456
      Top = 50
      Width = 32
      Height = 15
      Min = -150
      Max = 150
      Orientation = udHorizontal
      TabOrder = 1
      OnClick = heq_g_udClick
    end
    object heq_b_ud: TUpDown
      Left = 401
      Top = 49
      Width = 29
      Height = 15
      Min = 300
      Max = 4000
      Increment = 100
      Orientation = udHorizontal
      Position = 1500
      TabOrder = 2
      OnClick = heq_b_udClick
    end
    object heq_f_ud: TUpDown
      Left = 353
      Top = 50
      Width = 28
      Height = 15
      Min = 680
      Max = 22000
      Increment = 100
      Orientation = udHorizontal
      Position = 6800
      TabOrder = 3
      OnClick = heq_f_udClick
    end
    object leq_panel: TPanel
      Left = 0
      Top = 0
      Width = 161
      Height = 113
      TabOrder = 4
      object leq_g_value_label: TLabel
        Left = 119
        Top = 25
        Width = 32
        Height = 19
        Alignment = taCenter
        Caption = '0 db'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object leq_g_label: TLabel
        Left = 119
        Top = 71
        Width = 32
        Height = 13
        Alignment = taCenter
        Caption = 'gain'
      end
      object leq_f_value_label: TLabel
        Left = 6
        Top = 25
        Width = 48
        Height = 19
        Alignment = taCenter
        Caption = '160 hz'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object leq_f_label: TLabel
        Left = 11
        Top = 71
        Width = 35
        Height = 13
        Alignment = taCenter
        Caption = 'freq'
      end
      object leq_b_value_label: TLabel
        Left = 64
        Top = 25
        Width = 36
        Height = 19
        Alignment = taCenter
        Caption = '1.5 k'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object leq_b_label: TLabel
        Left = 75
        Top = 71
        Width = 14
        Height = 13
        Alignment = taCenter
        Caption = 'bw'
      end
      object leq_g_ud: TUpDown
        Left = 118
        Top = 50
        Width = 33
        Height = 15
        Min = -150
        Max = 150
        Orientation = udHorizontal
        TabOrder = 0
        OnClick = leq_g_udClick
      end
      object leq_f_ud: TUpDown
        Left = 13
        Top = 50
        Width = 33
        Height = 15
        Min = 10
        Max = 500
        Increment = 10
        Orientation = udHorizontal
        Position = 160
        TabOrder = 1
        OnClick = leq_f_udClick
      end
      object leq_b_ud: TUpDown
        Left = 66
        Top = 50
        Width = 34
        Height = 15
        Min = 300
        Max = 4000
        Increment = 100
        Orientation = udHorizontal
        Position = 1500
        TabOrder = 2
        OnClick = leq_b_udClick
      end
    end
    object meq_panel: TPanel
      Left = 167
      Top = 0
      Width = 162
      Height = 113
      TabOrder = 5
      object meq_g_value_label: TLabel
        Left = 122
        Top = 25
        Width = 32
        Height = 19
        Alignment = taCenter
        Caption = '0 db'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object meq_g_label: TLabel
        Left = 120
        Top = 71
        Width = 33
        Height = 13
        Alignment = taCenter
        Caption = 'gain'
      end
      object meq_f_value_label: TLabel
        Left = 8
        Top = 25
        Width = 52
        Height = 19
        Alignment = taCenter
        Caption = '2.5 khz'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object meq_f_label: TLabel
        Left = 20
        Top = 71
        Width = 20
        Height = 13
        Alignment = taCenter
        Caption = 'freq'
      end
      object meq_b_value_label: TLabel
        Left = 62
        Top = 25
        Width = 51
        Height = 19
        Alignment = taCenter
        Caption = '1.5 k'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object meq_b_label: TLabel
        Left = 72
        Top = 71
        Width = 33
        Height = 13
        Alignment = taCenter
        Caption = 'bw'
      end
      object meq_g_ud: TUpDown
        Left = 119
        Top = 50
        Width = 34
        Height = 15
        Min = -150
        Max = 150
        Orientation = udHorizontal
        TabOrder = 0
        OnClick = meq_g_udClick
      end
      object meq_f_ud: TUpDown
        Left = 23
        Top = 50
        Width = 33
        Height = 15
        Min = 160
        Max = 6300
        Increment = 100
        Orientation = udHorizontal
        Position = 2500
        TabOrder = 1
        OnClick = meq_f_udClick
      end
      object meq_b_ud: TUpDown
        Left = 72
        Top = 50
        Width = 33
        Height = 15
        Min = 300
        Max = 4000
        Increment = 100
        Orientation = udHorizontal
        Position = 1500
        TabOrder = 2
        OnClick = meq_b_udClick
      end
    end
  end
  object output_panel: TPanel
    Left = 511
    Top = 127
    Width = 137
    Height = 111
    TabOrder = 4
    object out_g_label: TLabel
      Left = 49
      Top = 71
      Width = 32
      Height = 13
      Alignment = taCenter
      Caption = 'gain'
    end
    object out_g_value_label: TLabel
      Left = 41
      Top = 25
      Width = 48
      Height = 19
      Alignment = taCenter
      Caption = '100 %'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 96
      Top = 87
      Width = 31
      Height = 13
      Caption = 'Label1'
    end
    object output_bar: TProgressBar
      Left = 120
      Top = 24
      Width = 9
      Height = 57
      Max = 300
      Orientation = pbVertical
      Step = 1
      TabOrder = 0
    end
    object out_g_ud: TUpDown
      Left = 48
      Top = 50
      Width = 33
      Height = 15
      Max = 32000
      Increment = 1000
      Orientation = udHorizontal
      Position = 10000
      TabOrder = 1
      OnClick = out_g_udClick
    end
  end
  object waveIn: TunavclWaveInDevice
    consumer = waveOut
    pcm_samplesPerSec = 48000
    pcm_bitsPerSample = 24
    pcm_numChannels = 1
    onDataDSP = waveInDataDSP
    deviceId = 1
    calcVolume = True
    Left = 32
    Top = 32
  end
  object waveOut: TunavclWaveOutDevice
    pcm_samplesPerSec = 48000
    pcm_bitsPerSample = 24
    pcm_numChannels = 1
    deviceId = 0
    calcVolume = True
    playbackOptions = [unapo_smoothStartup, unapo_jitterRepeat]
    Left = 64
    Top = 32
  end
  object Timer1: TTimer
    Interval = 50
    OnTimer = Timer1Timer
    Left = 96
    Top = 30
  end
end

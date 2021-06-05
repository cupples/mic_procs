unit main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, unaVC_wave, unaVCIDE, unaVC_pipe, dspCompressor, dspExpander, dspEqualizer, dsphighpass, dspConst, dspAmplify, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  System.Generics.Collections, dspLevel, Vcl.CheckLst, system.math, unaWave, unaVCIDEutils, unaASIOAPI, unaTypes, unaMsAcmClasses, dspParametricEQ;

type
  TForm1 = class(TForm)
    waveIn: TunavclWaveInDevice;
    waveOut: TunavclWaveOutDevice;
    GainIncrease: TLabel;
    Timer1: TTimer;
    cb_above_threashold: TCheckBox;
    LExpander_bar: TProgressBar;
    LCompressor_bar: TProgressBar;
    cb_eq: TCheckBox;
    cb_low_cut: TCheckBox;
    c_cb_device: TComboBox;
    input_label: TStaticText;
    input_bar: TProgressBar;
    input_panel: TPanel;
    Panel1: TPanel;
    expand_comp_panel: TPanel;
    expander_label: TLabel;
    eq_panel: TPanel;
    expand_cb: TCheckBox;
    compress_cb: TCheckBox;
    compressor_label: TLabel;
    exp_t_label: TLabel;
    exp_t_upd: TUpDown;
    exp_t_value_label: TLabel;
    comp_t_label: TLabel;
    comp_t_upd: TUpDown;
    comp_t_value_label: TLabel;
    comp_r_label: TLabel;
    comp_r_upd: TUpDown;
    comp_r_value_label: TLabel;
    leq_g_label: TLabel;
    leq_g_ud: TUpDown;
    leq_g_value_label: TLabel;
    leq_b_value_label: TLabel;
    leq_b_ud: TUpDown;
    leq_b_label: TLabel;
    leq_f_label: TLabel;
    leq_f_ud: TUpDown;
    leq_f_value_label: TLabel;
    meq_g_label: TLabel;
    meq_g_ud: TUpDown;
    meq_g_value_label: TLabel;
    meq_b_value_label: TLabel;
    meq_b_ud: TUpDown;
    meq_b_label: TLabel;
    meq_f_label: TLabel;
    meq_f_ud: TUpDown;
    meq_f_value_label: TLabel;
    heq_g_label: TLabel;
    heq_g_ud: TUpDown;
    heq_g_value_label: TLabel;
    heq_b_value_label: TLabel;
    heq_b_ud: TUpDown;
    heq_b_label: TLabel;
    heq_f_label: TLabel;
    heq_f_ud: TUpDown;
    heq_f_value_label: TLabel;
    leq_panel: TPanel;
    meq_panel: TPanel;
    output_panel: TPanel;
    output_bar: TProgressBar;
    out_g_label: TLabel;
    out_g_ud: TUpDown;
    out_g_value_label: TLabel;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure waveInDataDSP(sender: unavclInOutPipe; data: Pointer;
      len: Cardinal);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Timer1Timer(Sender: TObject);
    procedure c_cb_deviceChange(Sender: TObject);
    procedure exp_t_updChanging(Sender: TObject; var AllowChange: Boolean);
    procedure comp_t_updClick(Sender: TObject; Button: TUDBtnType);
    procedure comp_r_updClick(Sender: TObject; Button: TUDBtnType);
    procedure leq_f_udClick(Sender: TObject; Button: TUDBtnType);
    procedure meq_f_udClick(Sender: TObject; Button: TUDBtnType);
    procedure heq_f_udClick(Sender: TObject; Button: TUDBtnType);
    procedure leq_b_udClick(Sender: TObject; Button: TUDBtnType);
    procedure meq_b_udClick(Sender: TObject; Button: TUDBtnType);
    procedure heq_b_udClick(Sender: TObject; Button: TUDBtnType);
    procedure leq_g_udClick(Sender: TObject; Button: TUDBtnType);
    procedure meq_g_udClick(Sender: TObject; Button: TUDBtnType);
    procedure heq_g_udClick(Sender: TObject; Button: TUDBtnType);
    procedure out_g_udClick(Sender: TObject; Button: TUDBtnType);
  private
    { Private declarations }
    lowcut: TDChighpass;
    compressorL: TDCCompressor;
    expanderL: TDCExpander;
    compressorR: TDCCompressor;
    expanderR: TDCExpander;
    eq_low, eq_mid, eq_high: TDCParametricEQ;
    //eq: TDCEqualizer;
    amp1: TDCAmplify;
    amp2: TDCAmplify;
    output_amp: TDCAmplify;
    input_level: TDCLevel;
    output_level: TDCLevel;

  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.comp_r_updClick(Sender: TObject; Button: TUDBtnType);
begin
  compressorL.Ratio := comp_r_upd.Position / 10.0;
  compressorR.Ratio := compressorL.ThresholdDB;
  comp_r_value_label.Caption :=  FloatToStrF(extended(comp_r_upd.Position / 10.0), ffFixed, 3, 1) + ':1';
end;

procedure TForm1.comp_t_updClick(Sender: TObject; Button: TUDBtnType);
begin
  compressorL.ThresholdDB := comp_t_upd.Position / 10.0;
  compressorR.ThresholdDB := compressorL.ThresholdDB;
  comp_t_value_label.Caption :=  FloatToStrF(extended(comp_t_upd.Position / 10.0), ffFixed, 3, 1) + ' db';
end;

procedure TForm1.c_cb_deviceChange(Sender: TObject);
begin
  wavein.close(1);
  wavein.deviceId := c_cb_device.itemIndex -1;
  wavein.open();
end;

procedure TForm1.exp_t_updChanging(Sender: TObject; var AllowChange: Boolean);
begin
  expanderL.ThresholdDB := exp_t_upd.Position / 10.0;
  expanderR.ThresholdDB := expanderL.ThresholdDB;
  exp_t_value_label.Caption :=  FloatToStrF(extended(exp_t_upd.Position / 10.0), ffFixed, 3, 1) + ' db';
end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   wavein.close(1);
end;

procedure TForm1.FormCreate(Sender: TObject);
var
eq_count: byte;
begin
  Setpriorityclass(GetCurrentProcess(), HIGH_PRIORITY_CLASS);

  {$IFDEF __AFTER_D7__ }
  doubleBuffered := True;
  {$ENDIF __AFTER_D7__ }

  input_level := TDCLevel.Create(self);
  output_level := TDCLevel.Create(self);

  enumWaveDevices(c_cb_device, true, true, nil, unavcwe_MME);
  c_cb_device.itemIndex := wavein.deviceId - 1;

  lowcut := TDCHighpass.Create(self);
  lowcut.ProcessMessages := True;
  lowcut.Cutoff[0] := 80;
  lowcut.Enabled := True;

  amp1 := TDCAmplify.Create(self);
  amp1.Enabled := True;
  amp1.Volume[0] := 10000;
  amp1.Volume[1] := 10000;

  amp2 := TDCAmplify.Create(self);
  amp2.Enabled := True;
  amp2.Volume[0] := 6000;
  amp2.Volume[1] := 6000;

  output_amp := TDCAmplify.Create(self);
  output_amp.Enabled := True;
  output_amp.Volume[0] := 10000;
  output_amp.Volume[1] := 10000;

  expanderL := TDCExpander.Create(self);
  expanderL.ThresholdDB := -45;
  expanderL.AttackTime := 0.005;
  expanderL.DecayTime := 0.5;
  expanderL.Ratio := 20;
  expanderL.GainDB := 0;
  expanderL.Enabled := True;
  expanderL.ProcessMessages := True;

  expanderR := TDCExpander.Create(self);
  expanderR.ThresholdDB := -45;
  expanderR.AttackTime := 0.005;
  expanderR.DecayTime := 0.5;
  expanderR.Ratio := 20;
  expanderR.GainDB := 0;
  expanderR.Enabled := True;
  expanderR.ProcessMessages := True;

  compressorL := TDCCompressor.Create(self);
  compressorL.ProcessMessages := True;
  compressorL.ThresholdDB := -35;
  compressorL.AttackTime := 0.05;
  compressorL.DecayTime := 0.1;
  compressorL.Ratio := 6.0;
  compressorL.GainDB := 0.0;
  compressorL.Enabled := True;

  compressorR := TDCCompressor.Create(self);
  compressorR.ProcessMessages := True;
  compressorR.ThresholdDB := -35;
  compressorR.AttackTime := 0.05;
  compressorR.DecayTime := 0.1;
  compressorR.Ratio := 6.0;
  compressorR.GainDB := 0.0;
  compressorR.Enabled := True;

//  eq := TDCEqualizer.Create(self);
//  eq.ProcessMessages := True;
//  eq.Seperate := False;
//  eq.SampleSize := 0;
//  eq.FFTSize := fts64;
//  eq.Enabled := True;

  // Set some random EQ values that will make this crazy
//  for eq_count := 0 to 31 do
//  begin
//     eq.Band[0, eq_count] := 30-eq_count*2;
//     eq.Band[1, eq_count] := 30-eq_count*2;
//  end;


  // play with dsp parametic eq type
  eq_low := TDCParametricEQ.Create(self);
  eq_low.Frequency[0] := 4000;
  eq_low.Q[0] := 3000;
  eq_low.GainDB[0] := 10;
  eq_low.Enabled := True;

  eq_mid := TDCParametricEQ.Create(self);
  eq_mid.Enabled := True;

  eq_high := TDCParametricEQ.Create(self);
  eq_high.Enabled := True;

  // Enable audio passthough.
  wavein.active := True;
end;

procedure TForm1.heq_b_udClick(Sender: TObject; Button: TUDBtnType);
begin
  eq_high.Q[0] := heq_b_ud.Position;
  eq_high.Q[1] := eq_high.Q[0];
  heq_b_value_label.Caption := FloatToStrF(heq_b_ud.Position / 1000.0, ffFixed, 5, 1) + ' k';
end;

procedure TForm1.heq_f_udClick(Sender: TObject; Button: TUDBtnType);
begin
  eq_high.Frequency[0] := heq_f_ud.Position;
  eq_high.Frequency[1] := eq_high.Frequency[0];
  heq_f_value_label.Caption := FloatToStrF(heq_f_ud.Position / 1000.0, ffFixed, 5, 1) + ' khz';
end;

procedure TForm1.heq_g_udClick(Sender: TObject; Button: TUDBtnType);
begin
  eq_high.GainDB[0] := heq_g_ud.Position;
  eq_high.GainDB[1] := eq_high.GainDB[0];
  heq_g_value_label.Caption := FloatToStrF(heq_g_ud.Position / 10.0, ffFixed, 5, 1) + ' db';
end;

procedure TForm1.leq_b_udClick(Sender: TObject; Button: TUDBtnType);
begin
  eq_low.Q[0] := leq_b_ud.Position;
  eq_low.Q[1] := eq_low.Q[0];
  leq_b_value_label.Caption := FloatToStrF(leq_b_ud.Position / 1000.0, ffFixed, 5, 1) + ' k';
end;

procedure TForm1.leq_f_udClick(Sender: TObject; Button: TUDBtnType);
begin
  eq_low.Frequency[0] := leq_f_ud.Position;
  eq_low.Frequency[1] := eq_low.Frequency[0];
  leq_f_value_label.Caption := inttostr(leq_f_ud.Position) + ' hz';
end;

procedure TForm1.leq_g_udClick(Sender: TObject; Button: TUDBtnType);
begin
  eq_low.GainDB[0] := leq_g_ud.Position;
  eq_low.GainDB[1] := eq_low.GainDB[0];
  leq_g_value_label.Caption := FloatToStrF(leq_g_ud.Position / 10.0, ffFixed, 5, 1) + ' db';
end;

procedure TForm1.meq_b_udClick(Sender: TObject; Button: TUDBtnType);
begin
  eq_mid.Q[0] := meq_b_ud.Position;
  eq_mid.Q[1] := eq_mid.Q[0];
  meq_b_value_label.Caption := FloatToStrF(meq_b_ud.Position / 1000.0, ffFixed, 5, 1) + ' khz';
end;

procedure TForm1.meq_f_udClick(Sender: TObject; Button: TUDBtnType);
begin
  eq_mid.Frequency[0] := meq_f_ud.Position;
  eq_mid.Frequency[1] := eq_mid.Frequency[0];
  meq_f_value_label.Caption := FloatToStrF(meq_f_ud.Position / 1000.0, ffFixed, 5, 1) + ' khz';
end;

procedure TForm1.meq_g_udClick(Sender: TObject; Button: TUDBtnType);
begin
  eq_mid.GainDB[0] := meq_g_ud.Position;
  eq_mid.GainDB[1] := eq_mid.GainDB[0];
  meq_g_value_label.Caption := FloatToStrF(meq_g_ud.Position / 10.0, ffFixed, 5, 1) + ' db';
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
    LExpander_bar.Position:= Trunc(ExpanderL.GainIncrease * 100.0);
    LCompressor_bar.Position:= Trunc(CompressorL.GainReduction * 100.0);
    cb_above_threashold.Checked := ExpanderL.AboveThrs;
    gainIncrease.Caption := floattostr(ExpanderL.GainIncrease);
    output_bar.Position := waveGetLogVolume(waveout.getVolume());
    label1.Caption := floattostr(output_level.InputLevel);
    input_bar.Position := waveGetLogVolume(wavein.getVolume());
end;

procedure TForm1.out_g_udClick(Sender: TObject; Button: TUDBtnType);
begin
  output_amp.Volume[0] := out_g_ud.Position;
  output_amp.Volume[1] := output_amp.Volume[0];
  out_g_value_label.Caption := FloatToStrF(out_g_ud.Position / 100.0, ffFixed, 5, 1) + ' %';
end;

procedure TForm1.waveInDataDSP(sender: unavclInOutPipe; data: Pointer;
  len: Cardinal);
var
i: integer;
begin

  input_level.Process(data, len, 48000, 24, 1, False);
  if cb_low_cut.Checked then lowcut.Process(data, len, 48000, 24, 1, False);

  expanderL.SampleSize := len;
  expanderR.SampleSize := len;
  if expand_cb.Checked then ExpanderL.Process(data, len, 48000, 24, 1, False);

  amp1.Process(data, len, 24, 1, False);

  compressorL.SampleSize := len;
  compressorR.SampleSize := len;
  if compress_cb.Checked then compressorL.Process(data, len, 48000, 24, 1, False);

 // amp2.Process(data, len, 24, 1, False);

  // eq.Process(data, len, 24, 1, false);

  if cb_eq.Checked then eq_low.Process(data, len, 48000, 24, 1, false);
  if cb_eq.Checked then eq_mid.Process(data, len, 48000, 24, 1, false);
  if cb_eq.Checked then eq_high.Process(data, len, 48000, 24, 1, false);

  output_amp.Process(data, len, 24, 1, False);
  output_level.Process(data, len, 48000, 24, 1, False);
end;

end.

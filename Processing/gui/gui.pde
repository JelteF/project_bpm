/*
 * Effect Unit GUI - By David van Erkelens
 * David.vanErkelens@student.uva.nl
 * 10264019 - Department of Computer Science
 * June 24th, 2012 - All Rights Reserved
 */

import controlP5.*;
import ddf.minim.*;

ControlP5 gui;

Minim minim;
AudioInput input;
AudioOutput output;

PFont boldfont;
PFont regfont;

Slider intensity;
int sliderValue;

Slider volume;
int volumeValue;

Textfield bpmdis;
Textfield intdis;
Textfield voldis;

Button echobtn;
Button panbtn;
Button transbtn;
Button delaybtn;
Button flangerbtn;
Button filterbtn;
Button phaserbtn;
Button pitchbtn;
Button activebtn;

WaveformRenderer waveform;

Boolean active;

void setup()
{
  size(400, 410);
  gui = new ControlP5(this);
  minim = new Minim(this);
  bpmdis = gui.addTextfield("bpmdisplay", 325, 8, 65, 20).setValue(" n/a");
  bpmdis.captionLabel().setVisible(false);
  volume = gui.addSlider("volumeValue").setPosition(10, 360).setRange(0, 100).setSize(380, 15).setSliderMode(Slider.FLEXIBLE).setValue(100);
  volume.captionLabel().setVisible(false);
  volume.valueLabel().setVisible(false);
  boldfont = loadFont("SegoeUI-Bold-14.vlw");
  regfont = loadFont("SegoeUI-48.vlw");
  panbtn = gui.addButton("Panorama").setPosition(10, 185).setSize(185, 20);
  transbtn = gui.addButton("Transformer").setPosition(10, 210).setSize(185, 20);
  echobtn = gui.addButton("Echo").setPosition(10, 235).setSize(185, 20);
  delaybtn = gui.addButton("Delay").setPosition(10, 260).setSize(185, 20);
  flangerbtn = gui.addButton("Flanger").setPosition(205, 185).setSize(185, 20);
  filterbtn = gui.addButton("Filter").setPosition(205, 210).setSize(185, 20);
  phaserbtn = gui.addButton("Phaser").setPosition(205, 235).setSize(185, 20);
  pitchbtn = gui.addButton("PitchShift").setPosition(205, 260).setSize(185, 20);
  intensity = gui.addSlider("sliderValue").setPosition(10, 310).setRange(0, 1000).setSize(380, 15).setSliderMode(Slider.FLEXIBLE);
  intensity.captionLabel().setVisible(false);
  intensity.valueLabel().setVisible(false);
  intdis = gui.addTextfield("intensitydisplay", 325, 331, 65, 20);
  intdis.captionLabel().setVisible(false);
  voldis = gui.addTextfield("volumedisplay", 325, 381, 65, 20);
  voldis.captionLabel().setVisible(false);
  active = false;
  input = minim.getLineIn(Minim.STEREO, 1024);
  output = minim.getLineOut(Minim.STEREO, 1024);
  waveform = new WaveformRenderer(1024);
  input.addListener(waveform);
  output.addSignal(waveform);
}

void draw()
{
  background(color(170, 170, 170));
  textFont(boldfont, 20);
  fill(0);
  text("Sound effect unit", 10, 24);
  textFont(regfont, 11);
  text("Sound input:", 10, 48);
  text("Detected BPM:", 240, 23);
  rect(10, 55, 380, 100);
  fill(0);
  textFont(regfont, 11);
  text("Select an effect:", 10, 180);
  text("Select the intensity:", 10, 305);
  text("Select the volume:", 10, 355);
  text("(c) 2012 Project BPM", 10, 400);
  intdis.setValue(""+sliderValue);
  voldis.setValue(""+volumeValue+"%");
  fill(255, 0, 0);
  stroke(255, 0, 0);
  for(int i = 0; i < input.bufferSize() - 1; i++)
  {
    line(round(((i/(float)input.bufferSize())*379)+10), 105 + input.mix.get(i)*50, round((((i+1)/(float)input.bufferSize())*379)+10), 105 + input.mix.get(i+1)*50);
  }
  noStroke();
}

void stop()
{
  input.close();
  minim.stop();
  super.stop();
}

void Echo()
{
  if(active)
    activebtn.setColorBackground(color(2, 52, 77));
  if(activebtn == echobtn)
  {
    active = false;
    return;
  }
  echobtn.setColorBackground(color(255, 0, 0));
  intensity.setRange(-255, 255);
  active = true;
  activebtn = echobtn;
}

void Delay()
{
  if(active)
    activebtn.setColorBackground(color(2, 52, 77));
  if(activebtn == delaybtn)
  {
    active = false;
    return;
  }
  delaybtn.setColorBackground(color(255, 0, 0));
  intensity.setRange(0, 250);
  active = true;
  activebtn = delaybtn;
}

void PitchShift()
{
  if(active)
    activebtn.setColorBackground(color(2, 52, 77));
  if(activebtn == pitchbtn)
  {
    active = false;
    return;
  }
  pitchbtn.setColorBackground(color(255, 0, 0));
  intensity.setRange(0, 250);
  active = true;
  activebtn = pitchbtn;
}

void Flanger()
{
  if(active)
    activebtn.setColorBackground(color(2, 52, 77));
  if(activebtn == flangerbtn)
  {
    active = false;
    return;
  }
  flangerbtn.setColorBackground(color(255, 0, 0));
  intensity.setRange(0, 250);
  active = true;
  activebtn = flangerbtn;
}

void Filter()
{
  if(active)
    activebtn.setColorBackground(color(2, 52, 77));
  if(activebtn == filterbtn)
  {
    active = false;
    return;
  }
  filterbtn.setColorBackground(color(255, 0, 0));
  intensity.setRange(0, 250);
  active = true;
  activebtn = filterbtn;
}

void Phaser()
{
  if(active)
    activebtn.setColorBackground(color(2, 52, 77));
  if(activebtn == phaserbtn)
  {
    active = false;
    return;
  }
  phaserbtn.setColorBackground(color(255, 0, 0));
  intensity.setRange(0, 250);
  active = true;
  activebtn = phaserbtn;
}

void Transformer()
{
  if(active)
    activebtn.setColorBackground(color(2, 52, 77));
  if(activebtn == transbtn)
  {
    active = false;
    return;
  }
  transbtn.setColorBackground(color(255, 0, 0));
  intensity.setRange(0, 250);
  active = true;
  activebtn = transbtn;
}

void Panorama()
{
  if(active)
    activebtn.setColorBackground(color(2, 52, 77));
  if(activebtn == panbtn)
  {
    active = false;
    return;
  }
  panbtn.setColorBackground(color(255, 0, 0));
  intensity.setRange(0, 250);
  active = true;
  activebtn = panbtn;
}


// http://processing.org/discourse/beta/num_1259706373.html
class WaveformRenderer implements AudioListener, AudioSignal
{

  private float[] left;
  private float[] right;
  private int buffer_max;
  private int inpos, outpos;
  private int count;
  
  // Assumes that samples will always enter and exit in blocks 
  // of buffer_size, so we don't have to worry about splitting 
  // blocks across the ring-buffer boundary

  WaveformRenderer(int buffer_size)
  {
     int n_buffers = 4;
     buffer_max = n_buffers * buffer_size;
     left = new float[buffer_max];
     right = new float[buffer_max];
     inpos = 0;
     outpos = 0;
     count = 0;
  }

  synchronized void samples(float[] samp)
  {
    // handle mono by writing samples to both left and right
    samples(samp, samp);
  }

  synchronized void samples(float[] sampL, float[] sampR)
  {
    System.arraycopy(sampL, 0, left, inpos, sampL.length);
    System.arraycopy(sampR, 0, right, inpos, sampR.length);
    inpos += sampL.length;
    if (inpos == buffer_max) {
      inpos = 0;
    }
    count += sampL.length;
    // println("samples: count="+count);
  }


  void generate(float[] samp)
  {
     // println("generate: count="+count);
     if (count > 0) {
       System.arraycopy(left, outpos, samp, 0, samp.length);
       outpos += samp.length;
       if (outpos == buffer_max) {
         outpos = 0;
       }
       count -= samp.length;
     }
  }

  void generate(float[] sampL, float[] sampR)
  {
     // handle stereo by copying one channel, then passing the other channel 
     // to the mono handler which will update the pointers
     if (count > 0) {
       System.arraycopy(right, outpos, sampR, 0, sampR.length);
       generate(sampL);
     }
  }


} 
 


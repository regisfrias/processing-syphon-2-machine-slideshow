import codeanticode.syphon.*;
import oscP5.*;
import netP5.*;

/*
Spacebar or right arrow: go to next slide
Left arrow: go to previous slide
*/

PGraphics canvas;
SyphonServer server;

String[] lyrics;
int slide = 0;

int fade = 0;
boolean fading = false;

OscP5 oscP5;
NetAddress myRemoteLocation;

PFont font;
JSONObject config;

void settings() {
  size(600,400, P3D);
  PJOGL.profile=1;
}

void setup() { 
  canvas = createGraphics(width, height, P3D);
  lyrics = loadStrings("lyrics-PT.txt");
  config = loadJSONObject("../../config.json");

  // Create syhpon server to send frames out.
  server = new SyphonServer(this, "Processing Syphon");
  
  // this needs to be set in config.json
  int localPort = config.getInt("localPort");;
  int remotePort = config.getInt("remotePort");
  String remoteIp = config.getString("remoteIp");
  
  oscP5 = new OscP5(this, localPort);
  myRemoteLocation = new NetAddress(remoteIp, remotePort);
  
  font = loadFont("OpenSans-Light-48.vlw");
}

void draw() {
  canvas.beginDraw();
  canvas.background(255);
  canvas.noStroke();
  canvas.textFont(font, 32);
  canvas.textAlign(CENTER, CENTER);
  canvas.textSize(26);
  canvas.textLeading(32);
  
  if(fading){
    if(fade <= 255){
      fade+=10;
    } else {
      fading = false;
      slide++;
      fade = 0;
    }
  }
  
  canvas.fill(0); 
  canvas.text(lyrics[slide], width/2, height/2);
  canvas.fill(255, fade);
  canvas.rect(0,0,width,height);
  canvas.fill(0, fade);
  if(slide < lyrics.length - 1) canvas.text(lyrics[slide+1], width/2, height/2);
  canvas.endDraw();
  image(canvas, 0, 0);
  server.sendImage(canvas);
}

void keyPressed(){
  if( keyCode == 32 || keyCode == 39){
    if(slide < lyrics.length - 1){
      fading = true;
      
      println(slide);
      /* in the following different ways of creating osc messages are shown by example */
      OscMessage myMessage = new OscMessage("/test");
      
      myMessage.add(slide); /* add an int to the osc message */
    
      /* send the message */
      oscP5.send(myMessage, myRemoteLocation);
    }
  }
  if(keyCode == 37){
    if(slide > 0) slide--;
  }
}

/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());
}
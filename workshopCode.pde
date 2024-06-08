import peasy.*;
PeasyCam cam;
 
//GLOBE TUTORIAL
 
int cols = 20;
int rows = 20;
 
String s = "C2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HOC2HO";
String[] input = s.split("");
float inputL = input.length;
 
float waveSize = 60;
float t;
float speed = 0.05;
 
float phi, theta;
float globeRadius = 400;
float txtSize;
 
PFont font;
 
void setup() {
  size(900,900,P3D);
 
  font = createFont("AktivGrotesk-Regular.ttf",txtSize);
  cam = new PeasyCam(this, 1000);
  frameRate(60);
 
  fill(255);
  noStroke();
 
 
  phi = 2*PI/rows;
  theta = PI/rows;
}
 
void draw() {
  background(0);
 
  for (int j = 0; j < cols; j++) {
    for (int i = 0; i < inputL; i++) {
 
       float thisRadius = globeRadius * sin(j*theta);
       txtSize = (2*PI*thisRadius/(inputL*1.5));
 
      //wave
      float w = cos(i*0.5+j*0.5+t)*waveSize;
 
      float globeWave = globeRadius+w;
 
      float x = globeWave*sin(j*theta)*cos(i*phi);
      float y = globeWave*sin(j*theta)*sin(i*phi);
      float z = globeWave*cos(j*theta);
 
      pushMatrix();
      translate(x,y,z);
      rotateX(radians(w));
        textFont(font,0.1+txtSize);
      text(input[i],0,0,0);
      popMatrix();
 
 
    }
  }  
  t+= speed;
}
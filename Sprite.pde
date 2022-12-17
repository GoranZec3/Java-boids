public class Sprite{
PImage spriteSheet;


int frameCount =3;
float frameDurationSeconds = 0.05;
float secondsSinceAnimationStarted = 0;
int frameWidth = 32;

public Sprite(PImage spriteSheet){
  this.spriteSheet = spriteSheet;
}

void updateAnimation(float secondsElapsed){
  secondsSinceAnimationStarted += secondsElapsed;
}

void draw(){
  //figure out which frame we should be drawing currently
  int currentFrameIndex = (int)(secondsSinceAnimationStarted/ frameDurationSeconds);
  currentFrameIndex %= frameCount;

  drawAnimtionFrame(currentFrameIndex);
}
void drawAnimtionFrame(int frameIndex){
  //Crop out and draw the appropriate part of the image
  imageMode(CENTER);
  
  int frameStartX = frameWidth*frameIndex;
  
  image(
  spriteSheet, 
  0,0,                  //position
  frameWidth, frameWidth,   //size to draw
  frameStartX, 0,              //top left section to draw
  frameStartX + frameWidth, frameWidth   //bottom right
  ); 

}



}

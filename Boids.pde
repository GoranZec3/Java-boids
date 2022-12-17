PImage birdSpriteSheet;

ArrayList<Bird> birds = new ArrayList<Bird>();

enum DebugMode {OFF, ALL, SINGLE};
DebugMode debugMode = DebugMode.OFF;
/*
*Bird flocking tuning parameters
*/

float BIRD_MAX_SPEED = 200;
float BIRD_MOUSE_FOLLOW_STRENGTH = 250f;
float BIRD_SEPARATION_RADIUS = 65f;
float BIRD_SEPARATION_STRENGTH = 100f;


Sprite bird;

void setup(){
  size(600,600, P3D);
  birdSpriteSheet = loadImage("bird_top_R");
  for(int i=0; i<20; i++){
    PVector randomPosition = new PVector(random(0, width), random(0, height)); 
    Bird bird = new Bird(new Sprite(birdSpriteSheet), randomPosition);
    birds.add(bird);
  }
  birds.get(0).isBirdZero = true;
  
}
int previousMillis;
void draw(){
  //Calculate delta time since last fram
  int millisElapsed = millis() - previousMillis;
  
  float secondsElapsed= millisElapsed / 1000f;
  previousMillis = millis();
  
  background(133,195,201);
  for(Bird bird : birds){
    //debug mode press 'd'
    bird.update(secondsElapsed, birds);
    boolean debugDraw = debugMode == DebugMode.ALL || (debugMode == DebugMode.SINGLE && bird.isBirdZero);
    bird.draw(debugDraw);
  } 
}

void keyPressed(){
  
  if(key == 'd'){
    if(debugMode == DebugMode.OFF)          {debugMode = DebugMode.SINGLE;}
    else if (debugMode == DebugMode.SINGLE) {debugMode = DebugMode.ALL;}
    else if (debugMode == DebugMode.ALL)    {debugMode = DebugMode.OFF;}   
  
  }
}

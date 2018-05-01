boolean gameStart = false;

float x = 150;
float y = 150;
float speedX = random(3, 5);
float speedY = random(3, 5);
int leftColor = 128;
int rightColor = 128;
int diam;
int rectSize = 150;
int time = millis();
PImage img;


void setup() {
  size(1400, 800);
  noStroke();
  smooth();
  ellipseMode(CENTER);
  fill(0,255,255);
  img = loadImage("parallax-mountain-bg.png");
  img.resize(1400,800);
  background(img);
}

void draw() { 
  background(img);

  diam = 20;
  ellipse(x, y, diam, diam);

  fill(leftColor);
  rect(0, y - 75, 10, rectSize);
  rect(250,125, 10, rectSize);
  rect(550,455, 10, rectSize);
  rect(1200, 700, 10, rectSize);
  rect(1100, 100, 10, rectSize);
  fill(rightColor);
  rect(width-10, mouseY-rectSize/2, 10, rectSize);

  if (gameStart) {

    x = x + speedX;
    y = y + speedY;

    // if ball hits movable bar, invert X direction and apply effects
    if ( x > width-30 && x < width -20 && y > mouseY-rectSize/2 && y < mouseY+rectSize/2 ) {
      fill(random(255), random(255), random(255));
      speedX = speedX * -1;
      x = x + speedX;
      ellipse(x,y,diam,diam);
      rectSize = constrain(rectSize, 10,150);      
    } 
      
    // if ball hits wall, change direction of X
    else if (x < 25) {
      speedX = speedX * -1.1;
      x = x + speedX;
    }

    else {     
      leftColor = 128;
      rightColor = 128;
    }
    // resets things if you lose
    if (x > width) { 
      gameStart = false;
      x = 150;
      y = 150; 
      speedX = random(3, 5);
      speedY = random(3, 5);
      rectSize = 150;
    }
    
  int passedMillis = millis() - time; // calculates passed milliseconds
  if(passedMillis >= 10){
      time = millis();
      fill(random(0,255), random(0,255), random(0,255)); 
  }

    // if ball hits up or down, change direction of Y   
    if ( y > height || y < 0 ) {
      speedY = speedY * -1;
      y = y + speedY;
    }
  }
  
    if( x > 550 &&  x < 560 && y > 455 && y < 595){
      if(speedX < 5){
      fill(random(255), random(255), random(255));
      speedX = speedX * -1;
      x = x + speedX;
      rightColor = 0;
      rectSize = constrain(rectSize, 10,150); 
      } else {
      fill(random(255), random(255), random(255));
      speedX = speedX * -1;
      rightColor = 0;
      rectSize = constrain(rectSize, 10,150);
      } 
  }
  
  if( x > 250 && x < 260 && y > 125 && y < 275){
      if(speedX < 5){
      fill(random(255), random(255), random(255));
      speedX = speedX * -1;
      x = x + speedX;
      rightColor = 0;
      rectSize = constrain(rectSize, 10,150); 
      } else {
      fill(random(255), random(255), random(255));
      speedX = speedX * -1;
      rightColor = 0;
      rectSize = constrain(rectSize, 10,150);
      }
  }
    if( x > 1200 && x < 1210 && y > 700 && y < 850){
      if(speedX < 5){
      fill(random(255), random(255), random(255));
      speedX = speedX * -1;
      x = x + speedX;
      rightColor = 0;
      rectSize = constrain(rectSize, 10,150); 
      } else {
      fill(random(255), random(255), random(255));
      speedX = speedX * -1;
      rightColor = 0;
      rectSize = constrain(rectSize, 10,150);
      }
  }
  
   if( x > 1100 && x < 1110 && y > 100 && y < 250){
      fill(random(255), random(255), random(255));
      if(speedX < 5){
      speedX = speedX * -1;
      x = x + speedX;
      rightColor = 0;
      rectSize = constrain(rectSize, 10,150); 
      } else {
      fill(random(255), random(255), random(255));
      speedX = speedX * -1;
      rightColor = 0;
      rectSize = constrain(rectSize, 10,150);
      }
  }
}

void mousePressed() {
  gameStart = !gameStart;
}

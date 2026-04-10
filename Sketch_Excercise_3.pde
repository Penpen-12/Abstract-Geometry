/**
  Assignment: Geomoetric Abstraction
  Student: Ratanak Ly
  Pasadena City College, Spring 2026
  Course Name: DMA60 Creative Coding
  Prof. George McKinney
  Project Description: This program is for creating an intereactive abstract geometric art 
  through coding. 
  To enlarge circles, Pressing R and pressing Spacebar to make it smaller. 
  Also, you can have fun with moving a little rocket around by pressing the UP, DOWN, LEFT, amd RIGHT.
  Last Modified: April. 1, 2026
  */
float angle= 0.0;
float offset = 30;
float scalar = 30;
float speed = 0.05;
boolean SHIFT=false;
float x;
float y;
float xEllipse;
float yEllipse;
float VV1 = 50;
float VV2 = 50;
float path = 15;


void setup() {
  size(600, 500);
  background(255, 240, 240);
  rectMode(CENTER);
  smooth();
  frameRate(15);

 
  //background white pattern hatch
  for (int i=0; i<600; i++) {
    beginShape();
    vertex(0, i*10);
    vertex(i*10, 0);

    endShape();
    stroke(i*15, i*10, i*10.5);
    strokeWeight(1);
  }
  // Perspective Hatch
  float Vx=6;
  float Vy=0;
  randomSeed(2);
  for (int i=0; i<300; i+=3) {
    float r = random(0, 400);
    pushMatrix();
    stroke(r+2, 200, 235);
    strokeWeight(1);
    line(Vx+(i*2), Vy+(i*20), 400, i+2);
    rotate(5/6*PI);
    popMatrix();
  }
  
  drawSky();
 
  drawCurves();
  
}

void drawCurves(){
   //Curves

  for (int i=0; i<100; i+=2) {
    float r = random(15);
    stroke(r*40, 218, 245);
    strokeWeight(r);

    fill(13, 13, 13);
    for (int j=2; j<20; j+=2) {
     arc(i+r*j, i+(r*j*2), width/j, 400-j, i, TWO_PI, OPEN);
    }
    //arc(i+r, i+(r*2),width/2,300,i,HALF_PI,PIE);
    //arc(i+r*2, i+(r*4),width/3,350,i,HALF_PI,PIE);
    //arc(i+r*4, i+(r*6),width/4,400,i,HALF_PI,PIE);
    //arc(i+r*6, i+(r*8),width/5,450,i,HALF_PI,PIE);
    //arc(i+r*8, i+(r*10),width/6,500,i,HALF_PI,PIE);
    //arc(i+r*10, i+(r*12),width/7,550,i,HALF_PI,PIE);
    fill(242, 226, 5);
    for (int j=2; j<20; j+=2) {
      arc(i+r*j, i+(r*j*2), width/j, 250-j, i, HALF_PI, OPEN);
    }
     if (i<=50) {
      break;
    }
  }
 
}


void drawSky(){
   //blue patterns
  float Vxx1=400;
  float Vyy1=20;
  fill(81, 250, 234, 234);
 
  for (int i=0; i<100; i+=2) {
    float r = random(15);
    stroke(r*40, 218, 245);
    strokeWeight(r);
    fill(81, 250, 234, 234);
    arc(Vxx1+(i*2), Vyy1+(i*15), Vxx1*r+i, Vyy1*r+30, i, 2*PI, PIE);
 
  }
}




void draw() {
  
    drawSky();
    drawCurves();
    drawB();
  //Farthest plateforms
  for (int i=1; i<=25; i++) {
    float size = i*8;
    float r = random(6);
    stroke(r, r*2, 255);
    strokeWeight(r);
    float Vx4 = 200;
    float Vy4 = 400;
    rect(Vx4 + (i*11), Vy4 + (i/4), 10+size, 60+size);
    fill (255, 255, i*20.5);
  }

  
  //Longer plateforms
  for (int i=0; i<=50; i+=2) {
    float size = i*8;
    float r = random(10);
    float Vx5 = 100;
    float Vy5 = 250;

    stroke(r, r/2, 255);
    strokeWeight(r/2);
    rect(Vx5 + (i*10), Vy5 +(i/4), 10+size, 60+size);
    fill (255, 255, i*5.5);
  }
 


  //Megastructure
  for (int i=0; i<600; i+=25) {
    float r=random(0, 50);
    stroke(242, 65, 163);
    strokeWeight(1);
    circle(0, 300, i/2);
    strokeWeight(r/3);
    circle(i+i/10, 300, i);
    fill(i/2, i*10, i*1.5);
    stroke(0);
  }
  
    //plateform
  float Vx3 = 143;
  float Vy3 = 300;
  for (int i=1; i<=12; i++) {
    float size = i*8;
    float r = random(10);
    stroke(r, r/4, 255.5);
    strokeWeight(r);
    rect(Vx3 + (i*11), Vy3 + (i*2), 10+size, 60+size);
    fill (255, 255, i*15.5);
  }

  
    //Rooftop
  float containerX = 620; //centerpoint of the circle in x position
  float containerY = 300; //centerpoint of the circle in y position
  float containerR = 200;

  noFill();
  stroke(147, 211, 161);
  strokeWeight(1);
  ellipse(containerX, containerY, containerR*2, containerR*2);
  noStroke();
  //pattern inside the circle
  for (int i=0; i<=width; i+=25) {
    for (int j=0; j<=height; j+=25) {

      float d = dist (i, j, containerX, containerY);
      float c = random(10);

      if (d < containerR) {
        fill(noise(i, j)*180, 255, 0, 255);
        circle(i, j, 2*c);


         xEllipse = offset + angle*scalar;
         yEllipse = offset + angle*scalar;

        //For radius in X & y directions to get smaller when Pressing Spacebar

        if ( xEllipse< -52) {
           xEllipse=-52;
          angle= -83/30; //angle at x =-52
          speed = 0.05;
        }
        if ( yEllipse<-52) {
           yEllipse= -52;
          angle= -83/30;
          speed = 0.05;
        }

        //For radius in X & y directions to get bigger when Pressing R
        if ( xEllipse>75) {
           xEllipse= 75;
          angle = 45/30; //angle at x = 75
          speed = 0.05;
        }
        if ( yEllipse>75) {
           yEllipse= 75;
          angle = 45/30;
          speed = 0.05;
        }

     
        fill(noise(i, j)*10, 200, 0, 46);
        stroke(255);
        strokeWeight(1);
        ellipse(i, j, 2*c+ xEllipse/6, 2*c+ yEllipse/6);
      }
    }
  }
  drawB();
}
   void drawB(){
  
  //the shorter uilding rooftop
  float containerX2 = 0; //centerpoint of the circle in x position
  float containerY2 = 300; //centerpoint of the circle in y position
  float containerR2 = 75;

  noFill();
  stroke(147, 211, 161);
  strokeWeight(1);
  ellipse(containerX2, containerY2, containerR2*2, containerR2*2);
  noStroke();
  //pattern inside the circle
  for (int i=0; i<=width; i+=20) {
    for (int j=0; j<=height; j+=20) {

      float d = dist (i, j, containerX2, containerY2);
      float c = random(10);
      if (d < containerR2) {
        fill(noise(i, j)*180, 255, 0, 255);
        circle(i, j, c);
      }
    }
  }

 //Huge glass staorcase structure
  float startX1=144;
  float startY1 = 266;
  float endX1 = 220;
  float endY1 = 246;


  for (int i=0; i<=20; i++) {
    float x = lerp(startX1, endX1, i/20.0);
    float y = lerp(startY1, endY1, i/20.0);
    strokeWeight(0.5);
    line(startX1, startY1, endX1, endY1);

    stroke(147, 70, 138);
    line (x-200, y, x, y);
    stroke(13);
    strokeWeight(1);
    fill(i*25, i*40, i*2, i*2);
    arc (x-100, y, x, y, i/PI, TWO_PI, PIE);
    circle (x, y, 8);
    

    
  }


  
//Interactive Spaceship
    
    //x+=path;
    for (int z=0; z<=width; z+=20){
     for (int j=0; j<=50; j+=20){
      
  
     stroke(0);
     fill(255,118,258);
     rect(x,y ,z/8, j+4);
     ellipse (x,y,z/4,j);
     fill(252,89,152);
     ellipse (x,y,40,10);     
     
      }
     }
}
  




void keyReleased() {
  println(keyCode, speed, angle, x, y);
 
   //Pressing right,left,up,and down keys for moving spaceship around^^
      if (keyCode==RIGHT) {
      
    path = path + 10;
    x+=20;
 
     } 
     
      if (keyCode==LEFT) {
    path = path - 10;
    x-=20;
      }
      
      if (keyCode==UP) {
    y-=20;
      }
      if (keyCode==DOWN) {
    y+=20;
      }
      
       //Pressing D for Rotate
       
       if (keyCode==68){
        
       }
       
      
      
      
  // Pressing R key for making the closet circles bigger
  if (keyCode==82) {
    speed=speed+0.3;
    angle+=speed;
  }
 
 //Pressing Space key for making the closest circles smaller

  if (keyCode==32) {
    speed=speed-0.3;
    angle+=speed;
   
  }
    if (keyCode == 16) {
    SHIFT = true;
  }
 
 
}

void mousePressed() {
  println(mouseX, mouseY);
}

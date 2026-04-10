let angle= 0.0;
let offset = 30;
let scalar = 30;
let speed = 0.05;
let SHIFT=false;
let x = 0;
let y = 0;
let xEllipse;
let yEllipse;
let VV1 = 50;
let VV2 = 50;
let path = 15;


function setup() {
  createCanvas(600, 500);
  background(255, 240, 240);
  rectMode(CENTER);
  smooth();
  frameRate(15);

 
  //background white pattern hatch
  for ( i=0; i<600; i++) {
    beginShape();
    vertex(0, i*10);
    vertex(i*10, 0);

    endShape();
    stroke(i*15, i*10, i*10.5);
    strokeWeight(1);
  }
  // Perspective Hatch
  let Vx=6;
  let Vy=0;
  randomSeed(2);
  for ( i=0; i<300; i+=3) {
    let r = random(0, 400);
    stroke(r+2, 200, 235);
    strokeWeight(1);
    line(Vx+(i*2), Vy+(i*20), 400, i+2);
    rotate(5/6*PI);
   
  }
  
  drawSky();
 
  drawCurves();
  
}

function drawCurves(){
   //Curves

  for ( i=0; i<100; i+=2) {
    let r = random(15);
    stroke(r*40, 218, 245);
    strokeWeight(r);

    fill(13, 13, 13);
    for ( j=2; j<20; j+=2) {
     arc(i+r*j, i+(r*j*2), width/j, 400-j, i, TWO_PI, OPEN);
    }
    //arc(i+r, i+(r*2),width/2,300,i,HALF_PI,PIE);
    //arc(i+r*2, i+(r*4),width/3,350,i,HALF_PI,PIE);
    //arc(i+r*4, i+(r*6),width/4,400,i,HALF_PI,PIE);
    //arc(i+r*6, i+(r*8),width/5,450,i,HALF_PI,PIE);
    //arc(i+r*8, i+(r*10),width/6,500,i,HALF_PI,PIE);
    //arc(i+r*10, i+(r*12),width/7,550,i,HALF_PI,PIE);
    fill(242, 226, 5);
    for ( j=2; j<20; j+=2) {
      arc(i+r*j, i+(r*j*2), width/j, 250-j, i, HALF_PI, OPEN);
    }
     if (i<=50) {
      break;
    }
  }
 
}


function drawSky(){
   //blue patterns
  let Vxx1=400;
  let Vyy1=20;
  fill(81, 250, 234, 234);
 
  for ( i=0; i<100; i+=2) {
    let r = random(15);
    stroke(r*40, 218, 245);
    strokeWeight(r);
    fill(81, 250, 234, 234);
    arc(Vxx1+(i*2), Vyy1+(i*15), Vxx1*r+i, Vyy1*r+30, i, 2*PI, PIE);
 
  }
}




function draw() {
  
    drawSky();
    drawCurves();
    drawB();
  //Farthest plateforms
  for ( i=1; i<=25; i++) {
    let size = i*8;
    let r = random(6);
    stroke(r, r*2, 255);
    strokeWeight(r);
    let Vx4 = 200;
    let Vy4 = 400;
    rect(Vx4 + (i*11), Vy4 + (i/4), 10+size, 60+size);
    fill (255, 255, i*20.5);
  }

  
  //Longer plateforms
  for ( i=0; i<=50; i+=2) {
    let size = i*8;
    let r = random(10);
    let Vx5 = 100;
    let Vy5 = 250;

    stroke(r, r/2, 255);
    strokeWeight(r/2);
    rect(Vx5 + (i*10), Vy5 +(i/4), 10+size, 60+size);
    fill (255, 255, i*5.5);
  }
 


  //Megastructure
  for ( i=0; i<600; i+=25) {
    let r=random(0, 50);
    stroke(242, 65, 163);
    strokeWeight(1);
    circle(0, 300, i/2);
    strokeWeight(r/3);
    circle(i+i/10, 300, i);
    fill(i/2, i*10, i*1.5);
    stroke(0);
  }
  
    //plateform
  let Vx3 = 143;
  let Vy3 = 300;
  for ( i=1; i<=12; i++) {
    let size = i*8;
    let r = random(10);
    stroke(r, r/4, 255.5);
    strokeWeight(r);
    rect(Vx3 + (i*11), Vy3 + (i*2), 10+size, 60+size);
    fill (255, 255, i*15.5);
  }

  
    //Rooftop
  let containerX = 620; //centerpoint of the circle in x position
  let containerY = 300; //centerpoint of the circle in y position
  let containerR = 200;

  noFill();
  stroke(147, 211, 161);
  strokeWeight(1);
  ellipse(containerX, containerY, containerR*2, containerR*2);
  noStroke();
  //pattern inside the circle
  for ( i=0; i<=width; i+=25) {
    for ( j=0; j<=height; j+=25) {

      let d = dist (i, j, containerX, containerY);
      let c = random(10);

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
  
  spaceship();
}



   function drawB(){
  
  //the shorter uilding rooftop
  let containerX2 = 0; //centerpoint of the circle in x position
  let containerY2 = 300; //centerpoint of the circle in y position
  let containerR2 = 75;

  noFill();
  stroke(147, 211, 161);
  strokeWeight(1);
  ellipse(containerX2, containerY2, containerR2*2, containerR2*2);
  noStroke();
  //pattern inside the circle
  for ( i=0; i<=width; i+=20) {
    for ( j=0; j<=height; j+=20) {

      let d = dist (i, j, containerX2, containerY2);
      let c = random(10);
      if (d < containerR2) {
        fill(noise(i, j)*180, 255, 0, 255);
        circle(i, j, c);
      }
    }
  }

 //Huge glass staorcase structure
  let startX1=144;
  let startY1 = 266;
  let endX1 = 220;
  let endY1 = 246;


  for ( i=0; i<=20; i++) {
    let x = lerp(startX1, endX1, i/20.0);
    let y = lerp(startY1, endY1, i/20.0);
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

}
  
function spaceship(){
    
//Interactive Spaceship
    
    //x+=path;
    for ( z=0; z<=width; z+=20){
     for ( j=0; j<=50; j+=20){
      
  
     stroke(0);
     fill(255,118,258);
     rect(x,y ,z/8, j+4);
     ellipse (x,y,z/4,j);
     fill(252,89,152);
     ellipse (x,y,40,10);     
     
      }
     }

}



function keyReleased() {
  console.log(keyCode, speed, angle, x, y);
 
   //Pressing right,left,up,and down keys for moving spaceship around^^
      if (keyCode==RIGHT_ARROW) {
      
    path = path + 10;
    x+=20;
 
     } 
     
      if (keyCode==LEFT_ARROW) {
    path = path - 10;
    x-=20;
      }
      
      if (keyCode==UP_ARROW) {
    y-=20;
      }
      if (keyCode==DOWN_ARROW) {
    y+=20;
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

function mousePressed() {
  console.log(mouseX, mouseY);
}
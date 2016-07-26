int bg1X;
int bg2X;
int hp;
int fighterX;
int fighterY;
int speed;
int enemyX;
int enemyY;
int treasureX;
int treasureY;
int start;
PImage bg1Img;
PImage bg2Img;
PImage enemyImg;
PImage fighterImg;
PImage hpImg;
PImage treasureImg;
PImage start1Img;
PImage start2Img;
PImage end1Img;
PImage end2Img;
boolean upPressed=false;
boolean downPressed=false;
boolean leftPressed=false;
boolean rightPressed=false;

void setup () {
  size(640,480) ;  // must use this size.
  bg1X=-1;
  enemyX=-1;
  fighterX=floor(random(590));
  fighterY=floor(random(430));
  enemyY=floor(random(420));
  treasureX=floor(random(600));
  treasureY=floor(random(440));
  speed=5;
  start=0;   //0:start screen  1:playing   2.restart
  hp=(190/10*2);
  bg1Img=loadImage("img/bg1.png");
  bg2Img=loadImage("img/bg2.png");
  enemyImg=loadImage("img/enemy.png");
  fighterImg=loadImage("img/fighter.png");
  hpImg=loadImage("img/hp.png");
  treasureImg=loadImage("img/treasure.png");
  start1Img=loadImage("img/start1.png");
  start2Img=loadImage("img/start2.png");
  end1Img=loadImage("img/end1.png");
  end2Img=loadImage("img/end2.png");
  
}
void draw(){
  //start screen
  if (start==0){
    image(start2Img,0,0);
    if(mouseX>204 && mouseX<457){
       if(mouseY>375 && mouseY<416){
         image(start1Img,0,0);}
          if (mousePressed){
              start= 1;
            }
          }
      
     }
  switch (start){
    case 1:
  // rolling background
    if (bg1X<=639){
      bg1X=bg1X+1;
      if (bg1X>=0){
        bg2X=bg1X-640;}//(0,-640),(1,-639)........(640,0)
      else{
        bg2X=640+bg1X;}//(-639,1),(-638,2)........(0,-640)    
      }else {
        bg1X=-bg1X;
        bg2X=640+bg1X;//(-640,0)
        }     
  image(bg1Img,bg1X,0);
  image(bg2Img,bg2X,0);
  
  //fighter
 if (upPressed){
    fighterY=fighterY-speed;
 }
 if (downPressed){
    fighterY=fighterY+speed;
 }
 if (leftPressed){
    fighterX=fighterX-speed;
 }
 if (rightPressed){
    fighterX=fighterX+speed;
 }
 //boundary detection
 if (fighterX>(width-50)){
   fighterX=width-50;
 }
 if (fighterX<0){
   fighterX=0;
 }
 if (fighterY>(height-50) ){
   fighterY=height-50;
 } 
 if (fighterY<0){
   fighterY=0;
 }    
  image(fighterImg,fighterX,fighterY);
  //hp
  stroke(#FF0000,160);
  fill(#FF0000,160);//red
  rect(10,5,hp,12);
  image(hpImg,0,0);
  //treasure
  image(treasureImg,treasureX,treasureY); 
   if ( treasureX <= (fighterX+40) &&(treasureX>=(fighterX-40))) {
    if ( treasureY <= (fighterY+40) &&(treasureY>=(fighterY-40))){
       hp=hp+19;
       treasureX=floor(random(600));
       treasureY=floor(random(440));
       if (hp>=190){
          hp=190;
        }
       rect(10,5,hp,12);        
      }           
    }    
  //moving enemy
  enemyX=(enemyX+3)%639;   
  enemyY=enemyY+(fighterY-enemyY)/20; 
  image(enemyImg,enemyX,enemyY);
  if ( enemyX <= (fighterX+60) &&(enemyX>=(fighterX-60))) {
    if ( enemyY <= (fighterY+60) &&(enemyY>=(fighterY-60))){              
       hp=hp-38;
       if (hp<=0){
          start=2;          
        }else{
        start=1;
        rect(10,5,hp,12);
        enemyX=-1;
        enemyY=floor(random(420));
        }
      } 
    }  
    break;
    //restrat
    case 2:  
    image(end2Img,0,0);
    if(mouseX>210 && mouseX<430){
       if(mouseY>313 && mouseY<343){
         image(end1Img,0,0);}
          if (mousePressed){
              start= 1;
              hp=38;
              enemyX=-1;
              enemyY=floor(random(420));
              fighterX=floor(random(590));
              fighterY=floor(random(430));
            }
          }
      break;
  }
 
}

void keyPressed(){
  if(key==CODED){
    switch(keyCode){ 
      case UP:
        upPressed=true;
        break;
      case DOWN:
        downPressed=true;
        break;
      case LEFT:
        leftPressed=true;
        break;
      case RIGHT:
        rightPressed=true;
        break;
      }
    }
}
void keyReleased(){
  if(key==CODED){
    switch(keyCode){ 
      case UP:
        upPressed=false;
        break;
      case DOWN:
        downPressed=false;
        break;
      case LEFT:
        leftPressed=false;
        break;
      case RIGHT:
        rightPressed=false;
        break;
      }
    }
}

Bacteria[] bobs = new Bacteria[100]; 
double randomness = 0.97;
double speed = 2;
boolean moveToMouse = true;

 void setup()   
{
   size(700,700);
    for(int i = 0; i < bobs.length; i++){
      bobs[i] = new Bacteria();
    }
 }   
 void draw()   
 {    
   background(255);
   for(int i = 0; i < bobs.length; i++){
     bobs[i].move(); 
     bobs[i].show();
    }
   
 }  
 
 void mousePressed(){
   moveToMouse = !moveToMouse;
   }
 
 class Bacteria    
 {     
   float myX;
   float myY;
   color myColor;
   
   Bacteria(){
     myX = (int)(Math.random() * 700) + 1;
     myY = (int)(Math.random() * 700) + 1;
     myColor = color((int)(Math.random()*255 + 1),(int)(Math.random()*255 + 1),(int)(Math.random()*255 + 1));
   }
   
   void show(){
     noStroke();
     fill(myColor);
     ellipse(myX, myY, 30, 30);
   }
   
   void move(){
   int directionChange = 0;
   double random = 0;
   
   while (random < randomness){
     directionChange += 4;
     random = Math.random();
   }
   
   directionChange *= ((int)(Math.random()*2)*2 - 1);
   
   float angleToMove = atan2((float)(myY - mouseY),(float)(mouseX - myX));
   

   angleToMove += radians(directionChange);
   angleToMove += moveToMouse ? 0: PI;

   
   myX += (speed * cos(angleToMove));
   myY -= (speed * sin(angleToMove));
   

  }
     
 }    

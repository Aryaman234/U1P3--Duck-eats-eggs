int duckX=250;
int duckY=250;
PImage itDuck;
float eggX=random(500);
float eggY=random(250);
PImage egg;
float point=1;
float score=0;
int ballsX[];
int ballsY[];
int numballs = 20;
int ballsWidth=20;
int ballsHeight=20;

void setup()
{
  size(500, 500);
  background(255, 255, 255);

ballsX = new int[numballs];
ballsY = new int[numballs];
 
  itDuck=loadImage("itDuck.jpg"); 
  itDuck.resize(50,50);

  egg =loadImage("egg.jpg");
  egg.resize(50, 50);
  
   for(int i=0; i<numballs ; i++)
  {
  ballsX[i]= 50;
  ballsY[i]= (int)random (0,height);
  }
}

void draw()
{
 
background(255, 255, 255);

  Capture();

  image(egg,eggX,eggY);
  image(itDuck,duckX,duckY);
  
  for(int i=0; i<numballs; i++)
{
 int directionX=(int)random(-1,2);
 ellipse(ballsX[i],ballsY[i],ballsHeight,ballsWidth);
 ballsX[i]=ballsX[i]+2;
 
 if(ballsX[i]>width)
 
 {
  ballsX[i]=0;
 }  
 
 
  float K =dist(duckX,duckY,ballsX[i],ballsY[i]);

if (K<15)
{
  
 background(0);
  noLoop();
duckX=-1000;
duckY=-1000;
textSize(30);
fill(255,255,255);
text("Game Over",30,100); 
ballsWidth=0;
ballsHeight=0;

} 
}
}


void Capture()
{

  float D = dist(duckX,duckY,eggX,eggY);

  if (D<35)
  {
    eggX=random(400);
    eggY=random(400);
    score=score+point;
  }
  fill(0);
  text(score, 450, 20);
  
}




void keyPressed()

{

  if (key=='w') 
  {
    
    duckY=duckY-10;
  }
  if (key=='s') 
  {
    
    duckY=duckY+10;
  }
  if (key=='d') 
  {
   
    duckX=duckX+10;
  }
  if (key=='a') 
  {
  
    duckX=duckX-10;
  }
}

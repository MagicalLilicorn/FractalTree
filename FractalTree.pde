private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .5; 
SnowFlake [] snow; 
public void setup() 
{   
	size(640,480);    
	snow = new SnowFlake[200];
  	for (int i = 0; i < snow.length; i++){
    	snow[i] = new SnowFlake();
  	}  
} 
public void draw() 
{   
	background(0);  
	for (int i = 0; i < snow.length; i++){
		snow[i].show();
    	snow[i].move();
    	snow[i].wrap();
  	} 
	stroke(255,255,255);
	strokeWeight(3);   
	line(320,480,320,380);   
	drawBranches(320,380,100,3*Math.PI/2,3);  //will add later 


} 
public void drawBranches(int x,int y, double branchLength, double angle, double strWeight) 
{   
	double angle1, angle2;
	angle1 = angle + branchAngle;
	angle2 = angle - branchAngle;
	branchLength = branchLength*fractionLength;
	strokeWeight((float)strWeight);
	int endX1 = (int)(branchLength*Math.cos(angle1) + x);
	int endY1 = (int)(branchLength*Math.sin(angle1) + y);
	int endX2 = (int)(branchLength*Math.cos(angle2) + x);
	int endY2 = (int)(branchLength*Math.sin(angle2) + y);
	line(x, y, endX1, endY1);   
	line(x, y, endX2, endY2);

	if (branchLength > smallestBranch){
		drawBranches(endX1, endY1, branchLength, angle1, strWeight/1.2);
		drawBranches(endX2, endY2, branchLength, angle2, strWeight/1.2);
	}
} 

class SnowFlake
{
  //class member variable declarations
  int myX;
  int myY;
  boolean isMoving;
  SnowFlake()
  {
    //class member variable initializations
    myX = (int)(Math.random()*1200);
    myY = (int)(Math.random()*600);
    isMoving = true;
  }
  void show()
  {
    //your code here
    noStroke();
    ellipse(myX,myY,2,2);
  }

  void move()
  {
    //your code here
    if (isMoving == true){
      myY = myY + 1;
    } 
  }
  void wrap()
  {
    //your code here
    if (myY > 585){
      myY = 0;
      myX = (int)(Math.random()*1200);      
    }
  }
}

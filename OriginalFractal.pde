private double fractionLength = .8; 
private int smallestBranch = 10; 
private double branchAngle = .2;  
private int amount = 1;

public void setup() {   
  size(640,480);    
  noLoop(); 
} 

public void draw() {   
  background(0);      
  
  fill(0, 0, 0);
  line(320, 480, 320, 380);   
  drawBranches(320, 380, 100, 3 * Math.PI / 2);  
} 

public void keyPressed(){
  if (key == 'a'){
    amount += 1;
  }
}

public void drawBranches(int x, int y, double branchLength, double angle) {   
  double angle1 = angle + branchAngle;
  double angle2 = angle - branchAngle;
  
  branchLength *= fractionLength;
  
  int endX1 = (int)(branchLength * Math.cos(angle1) + x);
  int endY1 = (int)(branchLength * Math.sin(angle1) + y);
  int endX2 = (int)(branchLength * Math.cos(angle2) + x);
  int endY2 = (int)(branchLength * Math.sin(angle2) + y);
  
  stroke(0, (int) (Math.random() * 150) + 100, (int) (Math.random() * 150) + 100);
  line(x, y, endX1, endY1);
  line(x, y, endX2, endY2);  
  
  for (int i = 0; i < amount; i++){
    if (branchLength > smallestBranch) {
      drawBranches(endX1, endY1, branchLength - 2, angle1 + Math.PI/4);
      drawBranches(endX2, endY2, branchLength - 2, angle2 - Math.PI/4);
    }
    
    if (Math.random() <= .3){ 
      stroke(250, 0, 0);
      ellipse(endX1, endY1 - 5, 7, 10);
      ellipse(endX1 - 5, endY1, 10, 7);
      ellipse(endX1, endY1 + 5, 7, 10);
      ellipse(endX1 + 5, endY1, 10, 7);
    }
  }
}

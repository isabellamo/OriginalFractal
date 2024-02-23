public void setup(){
  size(500, 500);
  rectMode(CENTER);
}

public void draw(){
  background(0);
  noStroke();

  int idleTime = millis() + 1000;

  while(idleTime > millis()){
    for (int i = 50; i < 500; i += 100){
      for (int j = 50; j < 500; j += 100){
        myFractal(i, j, 100);
      }
    }
  }
}

public void myFractal(int x, int y, int size){
  rect(x, y, size, size);

  fill(50, 50, (int)(Math.random() * 150) + 100);

  if (size > 10){
    myFractal(x - size / 2, y, size / 2);
    myFractal(x + size / 2, y, size / 2);
  }
}

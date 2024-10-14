void setup()
{
  size(500, 500);
  noLoop();
}

void draw()
{
  background(25, 100, 25); 
  int rows = 8;
  int columns = 8;
  int sum = 0;

  
  for (int i = 0; i < rows; i++) {
    for (int j = 0; j < columns; j++) {
      Die die = new Die(50 + j * 50, 50 + i * 50); 
      die.show();
      sum = sum + die.values;
    }
  }

  
  fill(255); 
  text("Sum: " + sum, 226, 480); 
}

void mousePressed()
{
  redraw();
}

class Die 
{
  int x;
  int y;
  int size;
  int values;
  
  Die(int x, int y) // Constructor
  {
    this.x = x;
    this.y = y;
    this.size = 50;
    roll();
  }
  
  void roll()
  {
    values = (int)(Math.random() * 6 + 1);
  }
  
  void show()
  {
    
    fill(250); 
    rect(x, y, size, size);

    
    fill(0); 
   
    int dotSize = size / 6;
    int middleX = x + size / 2;
    int centerY = y + size / 2;
    int fit = size / 4;

//dots
    if (values == 1 || values == 3 || values == 5) {
      ellipse(middleX, centerY, dotSize, dotSize); 
    }
    if (values >= 2) {
      ellipse(x + fit, y + fit, dotSize, dotSize);  
      ellipse(x + size - fit, y + size - fit, dotSize, dotSize); 
    }
    if (values >= 4) {
      ellipse(x + fit, y + size - fit, dotSize, dotSize); 
      ellipse(x + size - fit, y + fit, dotSize, dotSize);  
    }
    if (values == 6) {
      ellipse(x + fit, centerY, dotSize, dotSize); 
      ellipse(x + size - fit, centerY, dotSize, dotSize);  
    }
  }
}

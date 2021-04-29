public int size;
public int rColor, gColor, bColor;
public int mousePressedIndex = 0;
public int mouseDraggedIndex = 20;

public void setup() {
  size(800, 800);
  background(0);
  this.size = width;
  this.mousePressedIndex = mousePressedIndex;
  this.rColor = rColor;
  this.gColor = gColor;
  this.bColor = bColor;
}
public void draw() {
 sierpinski(0, this.size, this.size);
}

void mousePressed() {
  mousePressedIndex++;
}
//*//
void mouseDragged() {
  mouseDraggedIndex = mouseDraggedIndex + 5;
  if (mouseDraggedIndex > size/4) {
    mouseDraggedIndex = 20;
  }
}

public void sierpinski(int x, int y, int len) {
  if (len <= mouseDraggedIndex) {
    //draw triangle
    if (mousePressedIndex % 2 != 0) {
      this.rColor = (int)(Math.random()*255);
      this.gColor = (int)(Math.random()*255);
      this.bColor = (int)(Math.random()*255);
    }
    else {
      this.rColor = 0;
      this.gColor = 0;
      this.bColor = 0;  
    }
    fill(this.rColor, this.gColor, this.bColor);    
    stroke(255);
    

    triangle(x, y, x+len/2, y-len, x+len, y);
    
  }
  else {
    sierpinski(x, y, len/2);
    sierpinski(x+len/2, y, len/2);
    sierpinski(x+len/4, y-(len/2), len/2);
  }

}

class Button {

  // Button class
  private int x;
  private int y; 
  private PImage pi;
  // Mainly will be used for towers (when we create more)
  private boolean pushed;

  // Reads in the image
  void setup(String name) {
    x=0; 
    y=0;
    pushed=false;
    pi = loadImage(name);
  }

  // Means its pushed
  void setPushed() {
    pushed = !pushed;
  }

  boolean getPushed() {
    return pushed;
  }

  public void setXY(int x, int y) {
    this.x = x ;
    this.y = y;
  }

  // Displays the button image
  void display() {
    image(pi, x*50, y*50, 50, 50);
  }
}


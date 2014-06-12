class Button {
   // Button class
    private int x;
    private int y; 
    private PImage pi;
    // Mainly will be used for towers (when we create more)
    private boolean pushed;
    
    Button(String name) {
      x=0; 
      y=0;
      pushed=false;
      pi = loadImage(name);
    
    }
    // Reads in the image
//    public void setup(String name) {
//      x=0; 
//      y=0;
//      pushed=false;
//      pi = loadImage(name);
//    }

    // Means its pushed
    public void setPushed() {
      pushed = !pushed;
    }

    public boolean getPushed() {
      return pushed;
    }

    public void setXY(int x, int y) {
      this.x = x ;
      this.y = y;
    }

    // Displays the button image
    public void display() {
      image(pi, x*50, y*50, 50, 50);
    }
}

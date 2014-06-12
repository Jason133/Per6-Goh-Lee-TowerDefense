class Tower {
  int x, y;
  private int centerX, centerY ;
  private PImage pi = loadImage("tower.png");;

    void setup() {
      x = 0;
      y=0;

    }
    public void setXY(int x, int y) {
      this.x = x ;
      this.y = y;
    }
    void display() {
      image(pi, x*50, y*50, 50, 50);
      
    }
}

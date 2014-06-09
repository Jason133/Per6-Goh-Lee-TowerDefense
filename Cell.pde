class Cell {
  int x; 
  int y;
    
   void setup() {
    this.x = 0 ;
    this.y = 0 ;
  }
  
  void outlineMe() {
    noFill();
    // Light Green: #00FF00
    stroke(#00FF00) ;
    // Rectangle for the tile
    rect(x*50, y*50,50,50);
  }
  
  void setXY(int x, int y) {
    this.x = x ;
    this.y = y ;
    
  }
  
}

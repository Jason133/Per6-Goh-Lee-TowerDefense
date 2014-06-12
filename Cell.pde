class Cell {
  int x; 
  int y;

   Cell(int x, int y) {
    this.x = 0 ;
    this.y = 0 ;
  }
  void outlineMe() {
    noFill();
    stroke(#00FF00) ;
    strokeWeight(2);
    rect(x*50, y*50,50,50);
    
  }
  
  void setXY(int x, int y) {
    this.x = x ;
    this.y = y ;
    
  }
  
}

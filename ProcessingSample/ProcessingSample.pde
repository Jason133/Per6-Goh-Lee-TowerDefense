int x, y, dx, dy, tileW, tileH;

void setup(){
    size(800, 800);
    x = 50;
    y = 50; 
    dx = 5;
    dy = 5;
    tileW = 50;
    tileH = 50;
}

void draw(){
      background(200);
      for(int i = 0; i < width / 50; i ++){
        for(int j = 0; j < height / 50; j ++){
          rect(tileW * i, tileH * j, tileW, tileH);
          fill(0, 160, 50); // red, blue, green
        }
      }
}

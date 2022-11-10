static final int scaling = 255;
PImage colors = new PImage(scaling,scaling);
PImage grayscale = new PImage(scaling,scaling);
PImage better_grayscale = new PImage(scaling,scaling);
PImage demo, demo_gray, demo_better_gray = new PImage(scaling,scaling);
int z = 0;
boolean bigger = true;

void setup(){
  size(1600, 800);
  colorMode(HSB, scaling);
  demo = loadImage("demo.png");
  
  for(int x = 0; x < scaling; x++){
    for(int y = 0; y < scaling; y++){
      colors.set(x,y, color(x,y,255));
    }
  }
  image(colors, 0,0);
  
  
  grayscale = colors;
  demo_gray = demo;
  better_grayscale = to_gray(colors);
  demo_better_gray = to_gray(demo);
  image(colors, 0,0);
  image(demo, 0,scaling*1.2);
  grayscale.filter(GRAY);
  demo_gray.filter(GRAY);
  image(grayscale, scaling*1.2, 0);
  image(demo_gray, scaling*1.2, scaling*1.2);
  
  
  image(better_grayscale, scaling*2.4, 0);
  image(demo_better_gray, scaling*2.4, scaling*1.2);
  noLoop();
  
}

void draw(){
  //if(bigger){
  //  z++;
  //} else {
  //  z--;
  //}
  //if(z >= 255){
  //  bigger = false;
  //  z -= 1;
  //} else if (z<0){
  //  bigger = true;
  //}
  //for(int x = 0; x < scaling; x++){
  //  for(int y = 0; y < scaling; y++){
  //    colors.set(x,y, color(x,y,z));
  //  }
  //}
  //image(colors, 0,0);
}

PImage to_gray(PImage p){
  int p_width = p.width;
  int p_height = p.height;
  PImage out = new PImage(width,height);
  for(int x = 0; x < p_width; x++){
    for(int y = 0; y < p_height; y++){
      color c = p.get(x,y);
      color gray_c = color(0,0,255-saturation(c));
      out.set(x,y, gray_c);
    }
  }
  return out;
}

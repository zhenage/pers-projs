void setup() {
  size(640, 360, P3D);
  frameRate(45);
  noStroke();
}

void draw() {
  println(dirlight() + "," + pointlight());
  defineLights();
  background(0);
  
  for (int x = 0; x <= width; x += 74) {
    for (int y = 0; y <= height; y += 74) {
      pushMatrix();
      translate(x, y);
      rotateY(map(mouseX, 0, width, 0, 1.1*PI));
      rotateX(map(mouseY, 0, height, 0, 1.1*PI));
      box(90);
      popMatrix();
    }
  }
}

int pointlight() {
  int val = 0;
    if (frameCount % 512 < 256) {
      val = frameCount % 256;
    } else {
      val = 256 - (frameCount % 256);
    }
     return val;
}

int dirlight() {
  int val = 0;
    if ((frameCount + 130) % 512 < 256) {
      val += (frameCount + 130) % 256;
    } else {
      val = 256 - ((frameCount + 130) % 256);
    }
     return val;
}

void defineLights() {
  pointLight(pointlight(), 0, 50, 200, -150, 0);

  directionalLight(50, 0, dirlight(), 1, 0, 0);    
                   
  spotLight(180, 180, 0, 0, 30, 180, 0, -0.4, -0.4, PI / 3, 3);
}

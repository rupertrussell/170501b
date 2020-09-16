// From https://www.openprocessing.org/sketch/425101
// by Saskia Freeke 
// 170501b

float t;
float theta;
int maxFrameCount = 200;

int a = 0;
float sz1;
int oldFrameCount;
int size = 10000;
int grow = 200; // was 50 

void setup() {
  size(10000, 10000);
  noFill();
  }

void draw() {
  background(245);
  pushMatrix();
  translate(width/2, height/2);

  t = (float)frameCount/maxFrameCount;
  theta = TWO_PI*t;

  for (float x = -size; x <= size; x += grow){
    for (float y = -size; y <= size; y += grow) {
      float offSet = (x)*a;
      float sz3 = map(cos(-theta+offSet), 0, 1, 0, 45);
      strokeWeight(2);

      if((x+y)%100 == 0){
        stroke(#3F5666);
        shape(x , y , sz1, sz1, sz3);
      } else {
        stroke(#EA3845);
        shape(x , y , sz1, sz1, -sz3);
      }

    }
  }
    popMatrix();
    sz1+= 0.5;

    if (sz1 > 1000 ) {
      sz1 = 0;
    }
    if(frameCount == oldFrameCount + 3){
     save(frameCount + ".png");
     oldFrameCount = frameCount;
     println("Saved " + frameCount + ".png");
    }
}

void shape(float xPos, float yPos, float pOne, float pTwo, float rot) {
  pushMatrix();
  translate(xPos, yPos);
  rotate(radians(rot));
  rotate(radians(45));

  beginShape();
  vertex(-pOne, -pOne);
  vertex(-pOne, -pTwo);
  vertex(pOne, -pTwo);
  vertex(pOne, -pOne);
  vertex(pTwo, -pOne);
  vertex(pTwo, pOne);
  vertex(pOne, pOne);
  vertex(pOne, pTwo);
  vertex(-pOne, pTwo);
  vertex(-pOne, pOne);
  vertex(-pTwo, pOne);
  vertex(-pTwo, -pOne);
  endShape(CLOSE);


  popMatrix();
}

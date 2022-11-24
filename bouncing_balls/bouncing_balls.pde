Box space;
AllBalls balls;
TexturePool pool;
float radius;
float spaceSize;
float width;
float height;
float middleX;
float middleY;
float startZ;


void setup(){
  size(1080, 1080, P3D); // size of canvas.
  width = 1080; // width of canvas.
  height = 1080; // height of canvas.
  radius = 40; // radius of ball.
  spaceSize = 600; // length of box.

  // Points of the canvas.
  middleX = width/2;
  middleY = height/2;
  startZ = spaceSize/2-radius;

  pool = new TexturePool(); // texture pool;
  balls = new AllBalls(); // stores all balls.
  space = new Box(spaceSize, middleX, middleY, 0); // box that contains the balls (walls).
}

void draw(){
  background(0); // set background to black.
  space.show(); // display the box.
  balls.showAll(); // display ball(s), if any.

}

// Generate ball on the middle of the canvas when mouse clicks.
void mouseClicked(){
  balls.createBall(radius, middleX, middleY, startZ, pool.getTexture(), width, height, spaceSize);

}

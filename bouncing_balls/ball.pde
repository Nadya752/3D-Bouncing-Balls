class Ball {
    PVector pos; // position of ball.
    PShape ball;

    boolean isMoving; // boolean value if ball is moving.
    int countStop; // to count the frames before ball stops moving.

    float width; // width of canvas.
    float height; // height of canvas.
    float r; // radius of ball.

    float angleX = 0; // angle of ball when it rotates in x-axis.
    boolean isSwitching = false; // Ball switches angle when hit a wall;
    
    PVector v; // velocity of ball.
    float speedLimit;
    float prevVy; // velocity of ball from previous frame.

    // Points to help determine wall constraints.
    float sx;
    float sy;
    float sz;
    float l;

    float gravity = 0.1;

    Ball(float radius, float x, float y , float z, PImage img, float width, float height, float bsize){
        this.pos =  new PVector (x, y, z);
        this.speedLimit = random(-20, 20);
        this.v = new PVector (this.speedLimit, this.speedLimit, this.speedLimit);
        this.r = radius;
        this.width = width;
        this.height = height;
        this.isMoving = true;
        this.countStop = 0;

        this.sx = width/2;
        this.sy = height/2;
        this.sz = bsize;
        this.l = bsize/2;

        noStroke();
        this.ball = createShape(SPHERE, r);
        this.ball.setTexture(img);

    }

    // Rotate ball.
    void rotateBall(boolean isSwitching){

        // If it touches the front, back, left, or right wall,
        // it changes the rotation direction.
        if (isSwitching){
            this.angleX--;
        }else{
            this.angleX++;
        }

    }

    // Moves ball.
    void move(){
        // If there is no more velocity then the ball stops moving.
        if ( this.v.x == 0 && this.v.y == 0 && this.v.z == 0 ){
            this.isMoving = false;
            return;
        }

        // Increments vy with gravity;
        if (this.v.y != 0){
            this.v.y += this.gravity;
        }


        // Wall constraints.
        // Ceiling and floor.
        if ( ((pos.y - r) < (sy-l)) || ((pos.y+r) > (sy+l)) ){
            
            // Corrects the ball y position
            // to avoid getting stuck.
            if ((pos.y - r) < (sy-l)){
                this.pos.y = (sy-l)+r;
            }else if ((pos.y+r) > (sy+l)){
                this.pos.y = (sy+l)-r;
            }

            // Decrease speed every time ball comes contact with wall.
            this.v.y *= -0.8;

            // If height of ball bouncing is less than 0.03,
            // it stops moving.
            if (abs(this.v.y-prevVy) <= 0.03){
                this.v.y = 0;
            }

            this.prevVy = this.v.y; // stores previous vy.


        // Left and right wall.
        }else if ( ((pos.x - r) < (sx-l)) || ((pos.x+r) > (sx+l)) ){
            // Corrects the ball x position.
            if ( (pos.x - r) < (sx-l)){
                this.pos.x = (sx-l)+r;
            }else{
                this.pos.x = (sx+l)-r;   
            }

            this.v.x *= -0.9;
            this.isSwitching = !this.isSwitching; // Switches direction of rotation.

        // Back and front wall.
        }else if ( ((pos.z + r) > (sz-l)) || ((pos.z-r) < (l *-1)) ){
            // Corrects the ball x position.
            if ((pos.z + r) > (sz-l)){
                this.pos.z = (sz-l) -r;
            }else if ((pos.z - r) < (l *-1)){
                this.pos.z = (l*-1) +r;
            }

            this.v.z *= -0.8;
            this.isSwitching = !this.isSwitching;
        }

        // if ball stops bouncing.
        if (this.v.y == 0){

            // Delays before ball stops moving completely.
            if (this.countStop < 10){
                this.countStop++;
            
            // Ball stops moving.
            }else{
                this.v.x = 0;
                this.v.z = 0;
                countStop = 0;
            }

        }

        // Move ball on all axis acoording to its velocity.
        this.pos = this.pos.add(this.v);

    }

    // Displays ball.
    void show(){
        pushMatrix();
        translate(pos.x, pos.y, pos.z); // move ball.

        // Rotates ball as it moves.
        if (this.isMoving){
            rotateX(radians(angleX));
            rotateBall(this.isSwitching);
        }

        shape(ball);
        popMatrix();

    }
}

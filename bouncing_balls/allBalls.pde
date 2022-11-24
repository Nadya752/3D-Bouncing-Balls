class AllBalls{
    ArrayList<Ball> balls; // stores all balls.
    int size;

    AllBalls(){
        balls = new ArrayList <Ball>();
        size = 0;

    }

    // Creates a new ball object.
    void createBall(float radius, float x, float y , float z, PImage img, float width, float height, float bsize){
        Ball ball = new Ball(radius,  x, y, z, img, width, height, bsize);
        balls.add(ball);
        size++;


    }

    // Checks if there is collision between 2 balls.
    boolean isCollision(Ball b1, Ball b2){

        float xAxis = (b1.pos.x - b2.pos.x)*(b1.pos.x - b2.pos.x);
        float yAxis = (b1.pos.y - b2.pos.y)*(b1.pos.y - b2.pos.y);
        float zAxis = (b1.pos.z - b2.pos.z)*(b1.pos.z - b2.pos.z);

        float distance = sqrt(xAxis + yAxis + zAxis);
        float diameter = b1.r + b2.r;

        if (distance < diameter){

            // If balls already travelling away from each other despite overlapping,
            // then it is not colliding.

            /* USYD CODE CITATION ACKNOWLEDGEMENT
            * I declare that the following lines of code have been copied with only minor changes
            * from the website titled: "Sphere to sphere collision c++"
            * and it is not my own work.
            *
            * Original URL
            * https://stackoverflow.com/questions/29825110/sphere-to-sphere-collision-c
            * Last access October, 2021
            */

            PVector v1 = b1.pos.copy();
            PVector v2 = b2.pos.copy();
            PVector delta = v1.sub(v2);
            PVector direction = delta.normalize();
            PVector vdelta = new PVector ((b1.v.x -b2.v.x), (b1.v.y -b2.v.y), (b1.v.z -b2.v.z));
            float fspeed = vdelta.dot(direction);

            if (fspeed >= 0){
                return false;
            }
            /* end of copied code */

            // Pull the balls away apart.
            b1.pos = b1.pos.add(delta);
            b2.pos = b2.pos.sub(delta);

            // Else if travelling towards each other then it is colliding.
            return true;

        }else{
            return false;
        }

    }

    // handle the collision by switching velocity.
    void handleCollision(Ball b1, Ball b2){
        float tempX = b1.v.x;
        float tempY = b1.v.y;
        float tempZ = b1.v.z;
        
        // Switch direction of rotation.
        b1.isSwitching = !b1.isSwitching;
        b2.isSwitching = !b2.isSwitching;
        
        // No switching if one of the ball has stopped moving.

        if (b2.v.x != 0){
            b1.v.x = b2.v.x;
        }
        if (b2.v.y!= 0){
            b1.v.y = b2.v.y;
        }
        if (b2.v.z!= 0){
            b1.v.z = b2.v.z;
        }

        if (tempX != 0){
            b2.v.x = tempX;
        }

        if (tempY != 0){
            b2.v.y = tempY;
        }
        if (tempZ != 0){
            b2.v.z = tempZ;
        }

    }
    
    // Checks collision for every pairs of balls.
    void checkAllCollisions (){

        // If there is only one ball
        // then no need to check for collision.
        if (size <=1){
            return;
        }

        // Go through the list of balls.
        for(int i = 0; i< this.size; i++){
            for (int j = i+1; j<size; j++){
                Ball b1 = this.balls.get(i);
                Ball b2 = this.balls.get(j);

                // Check and handle collision between the pair.
                if (isCollision(b1, b2)){
                    handleCollision(b1, b2);

                }
            }
        }
    }

    // Wrapper function that moves and display the balls.
    void showAll(){
        for (Ball ball : this.balls){
            ball.move();
            checkAllCollisions();
            ball.show();
        }

    }

}
# 3D-Bouncing-Balls

This project is an interactive 3D animation scene which intends to replicate the the behaviour of ball(s) inside a box. The main file (i.e., "bouncing_balls.pde") uses the classes Balls, Box, AllBalls (i.e., which stores a list of balls), and TexturePool (i.e., which stores the texture pool). The folder ‘texture’ stores jpg files of the textures, which is generated randomly by TexturePool. The ball rotates in x-axis, and changes the direction of rotation every time it comes in contact with the left, right, front, or back wall (or another ball).

##### To run the source code
1. Clone the GitHub repository
2. Make sure you have Processing 4 in your local machine. See instructions below.
3. Open the main file "bouncing_balls.pde" in your Processing 4 application
4. Run the main file "bouncing_balls.pde" by pressing the run button in Processing application. 
5. To generate a ball in the program, click anywhere on the screen, and a ball will be generated on a fixed starting position (i.e., on the centre of the box)and with random speed and direction.

##### Using Processing
1. [Install processing 4](https://processing.org/download) in your local machine 

##### Personalisation
1. To change the canvas size, change the first and second parameter of `size()`, and also update the variables `width` and `height`, to which are all located in `setup()` function. 
2. To change the radius of the ball, update the variable `radius` located in `setup()` function.
3. To change the length of the box that contains the balls, update the variable `spaceSize` located in `setup()` function. 
4. To update the texturePool, update the 'texture' folder by adding or deleting .jpg texture files, and update the `size` variable that refers to the size of the texture pool and `fileNames` string list in ‘texturePool.pde’. 

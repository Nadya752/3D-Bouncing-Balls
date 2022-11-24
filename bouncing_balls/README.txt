How to run the source code
1.	Run the main file ‘SID490055892_Ass1b.pde’ by pressing the run button in Processing application.
2.	The main file uses the class balls from ‘SID490055892_balls.pde’, box class from ‘SID490055892_box.pde’, allBalls class, which stores a list of balls, from ‘SID490055892_allBalls.pde’, and texturePool class from ‘SID490055892_texturePool.pde’, which stores the texture pool.
3.	The folder ‘texture’ stores jpg files of the textures, which is generated randomly by texturePool.
4.	The ball rotates in x-axis, and changes the direction of rotation every time it comes in contact with the left, right, front, or back wall (or another ball).
5.	To generate a ball in the program, click anywhere on the screen, and a ball will be generated on a fixed starting position (on the centre of the box) but with random speed and direction.
6.	To change the canvas size, change the first and second parameter of size(), and also update the variables ‘width’ and ‘height’, to which are all located in setup() function.
7.	To change the radius of the ball, update the variable ‘radius’ located in setup() function.
8.	To change the length of the box that contains the balls, update the variable ‘spaceSize’ located in setup() function.
9.	To update the texturePool, update the 'texture' folder by adding or deleting .jpg texture files, and update the size variable that refers to the size of the texture pool and fileNames string list in ‘SID490055892_texturePool.pde’.


class Box {
  PShape box; 
  PVector v; // position of the box.

    Box(float size, float x, float y, float z){

      noFill();
      this.v = new PVector(x, y, z);
      stroke(100);
      box = createShape(BOX, size, size, size);

    }

    // Displays the box.
    void show(){
        pushMatrix();
        translate(v.x, v.y, v.z);
        shape(box);
        popMatrix();

    }

}
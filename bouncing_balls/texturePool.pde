class TexturePool{
    PImage[] pool;
    String[] fileNames = { "earth", "eris", "jupiter",
                            "makemake", "mars", "moon", "neptune",
                            "sun", "unknownPlanet", "venus" };
    int size = 10;

    TexturePool(){
        pool = new PImage[size];

        String prefix = "./textures/"; // folder name.
        String suffix = ".jpg"; // file extension.

        // Load all images from texture folder.
        for (int i = 0; i < this.size; i++){
            this.pool[i] = loadImage(prefix+ fileNames[i] + suffix);

        }

    }

    // Get a random texture from pool;
    PImage getTexture(){
        int idx = int(random(0, size));
        return this.pool[idx];

    }
}
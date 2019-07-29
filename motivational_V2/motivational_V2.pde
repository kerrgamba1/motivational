// declaration of the frame width and height, (NOTE IF CHANGED THE LOCATION OF THE TEXT AND CLOUD WILL HAVE TO BE CHANGED BY HAND)
int frameWidth = 1200, frameHeight = 628;

// declaration of global variables
Table table;
PGraphics frame;
PImage cloud;

// setup function to run before the draw function begins, initiating the global variables
void setup() {
  // Declares the table to recieve the data from
  table = loadTable("input.csv", "header");
  
  // Declare the font that the text in the images will be
  PFont font = createFont("Helvetica", 48);  // change font here. Get name from Tools > Create Font
  
  // creates a PGraphic frame to use as a canvas for the image
  frame = createGraphics(frameWidth, frameHeight, JAVA2D);
  frame.smooth(8);

  // specifies the color, size, and font of the text to be drawn in the frame
  frame.beginDraw();
  frame.fill(color(0));  // Sets the color of the text (color(0) = black)
  frame.textFont(font);
  frame.textSize(48);
  frame.textAlign(CENTER, CENTER);
  frame.endDraw();
  
  // Loads the cload image to be used in the motivator
  cloud = loadImage("assets/new-cloud.png");
}

// draw function that will run after the setup function
void draw() {
  noLoop();
  println("loading...");
  
  int i = 1;
  // for each row in the table, grab the information and display it on the sceen as specified
  for (TableRow row : table.rows()) {
    String IMGfilename = row.getString("imgFileName");
    if(IMGfilename.length() == 0) {
      break;
    }
    
    String cloudText = row.getString("cloudText");
    String finalFileName = row.getString("finalFileName");
    PImage background = loadImage("inputImages/" + IMGfilename); //<>//
    
    frame.beginDraw();
    frame.image(background, 0, 0, frameWidth, frameHeight);
    frame.image(cloud, 0, 321, frameWidth, 307);
    frame.text(cloudText, 100, 371, 1000, 207);
    frame.endDraw();
    frame.save("imageOutputs/" + finalFileName);

    println("image " + i + " done");
    i++;
  }
  println("done");

  // when complete exit the program
  exit();
}

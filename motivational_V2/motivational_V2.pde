// declaration of the frame width and height, (NOTE IF CHANGED THE LOCATION OF THE TEXT AND CLOUD WILL HAVE TO BE CHANGED BY HAND)
int frameWidth = 600, frameHeight = 324;

// declaration of global variables
Table table;
PGraphics frame;
PImage cloud;
PFont font;
color c = color(0);
int i = 1;

// setup function to run before the draw function begins, initiating the global variables
void setup() {
  font = createFont("Helvetica", 22);  // change font here. Get name from Tools > Create Font

  table = loadTable("input.csv", "header");

  frame = createGraphics(frameWidth, frameHeight, JAVA2D);
  frame.smooth(8);
  
  // specifies the color, size, and font of the text to be drawn in the frame
  frame.beginDraw();
  frame.fill(c);
  frame.textFont(font);
  frame.textSize(22);
  frame.textAlign(CENTER, CENTER);
  frame.endDraw();

  cloud = loadImage("assets/new-cloud.png");
}

// draw function that will run after the setup function
void draw() {
  noLoop();
  println("loading...");
  
  // for each row in the table, grab the information and display it on the sceen as specified
  for (TableRow row : table.rows()) {
    String cloudText = row.getString("cloudText");
    String IMGfilename = row.getString("imgFileName");
    String finalFileName = row.getString("finalFileName");
    PImage background = loadImage("inputImages/" + IMGfilename);

    frame.beginDraw();
    frame.image(background, 0, 0, frameWidth, frameHeight);
    frame.image(cloud, 0, 180, frameWidth, 153); //544
    frame.text(cloudText, 50, 215, 500, 103);
    frame.endDraw();
    frame.save("imageOutputs/" + finalFileName);

    println("image " + i + " done");
    i++;
  }
  println("done");
  
  // when complete exit the program
  exit();
}

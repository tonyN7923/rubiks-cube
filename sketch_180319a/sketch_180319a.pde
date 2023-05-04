//AET 310 Creative Coding
//Tony Nguyen
//Challenge 7

PImage whiteSide, yellowSide, redSide, orangeSide, greenSide, blueSide;

int numberOfSteps = 21;
PImage loadWhite[] = new PImage[numberOfSteps];
PImage loadYellow[] = new PImage[numberOfSteps];
PImage loadRed[] = new PImage[numberOfSteps];
PImage loadOrange[] = new PImage[numberOfSteps];
PImage loadGreen[] = new PImage[numberOfSteps];
PImage loadBlue[] = new PImage[numberOfSteps];


String stepNum;

boolean keyP, mouseP;

void setup()
{
    fullScreen(P3D);
    imageMode(CENTER);
    
    for(int i = 0; i < numberOfSteps; i++)
    {        
        loadWhite[i] = loadImage("white" + (i + 1) + ".jpg");
        loadYellow[i] = loadImage("yellow" + (i + 1) + ".jpg");
        loadRed[i] = loadImage("red" + (i + 1) + ".jpg");
        loadOrange[i] = loadImage("orange" + (i + 1) + ".jpg");
        loadGreen[i] = loadImage("green" + (i + 1) + ".jpg");
        loadBlue[i] = loadImage("blue" + (i + 1) + ".jpg");
    }
}

void draw()
{
    background(155);
    translate(width / 2, height / 2, -200);
    
    for(int i = 0; i < numberOfSteps; i++)
    {
        if(mouseX >= i * width / numberOfSteps && mouseX <= (i + 1) * width / numberOfSteps && !keyP)
        {
            whiteSide = loadWhite[i];
            yellowSide = loadYellow[i];
            redSide = loadRed[i];
            orangeSide = loadOrange[i];
            greenSide = loadGreen[i];
            blueSide = loadBlue[i];
            
            stepNum = "Step: " + (i + 1) + "/" + numberOfSteps;  
        }
    }
    textSize(50);
    text(stepNum, 500, 500, 0);
    rotateY(mouseX * 0.005);
    rotateX(mouseY * 0.005);
    drawCube();
}

void drawCube()
{    
    //F
    pushMatrix(); //store current transformation state
    translate(0, 0, 256);
    image(orangeSide, 0, 0);
    popMatrix();  //restores previous transformation state
    
    //R
    pushMatrix();
    rotateY(3 * HALF_PI);
    translate(0, 0, 256);
    image(greenSide, 0, 0);
    popMatrix();
    
    //B
    pushMatrix();
    rotateY(PI);
    translate(0, 0, 256);
    image(redSide, 0, 0);
    popMatrix();
    
    //L
    pushMatrix();
    rotateY(HALF_PI);
    translate(0, 0, 256);
    image(blueSide, 0, 0);
    popMatrix();
    
    //U
    pushMatrix();
    rotateX(HALF_PI);
    translate(0, 0, 256);
    image(yellowSide, 0, 0);
    popMatrix();
    
    //D
    pushMatrix();
    rotateX(3 * HALF_PI);
    translate(0, 0, 256);
    image(whiteSide, 0, 0);
    popMatrix();
}

void mousePressed()
{
    mouseP = true;
    keyP = false;
}

void keyPressed()
{
    keyP = true;
}

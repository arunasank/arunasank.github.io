final int screen0 = 0;
final int screen1 = 1;
final int screen2 = 2;
final int screen3 = 3;
final int screen4 = 4;
PShape snail;
PShape grass;
PShape train;
PShape home;
boolean[] setStateBinaryCard = {
  false, false, false, false, false, false, false, false, false, false
};
boolean[] pressedCards = {
  false, false, false, false, false, false, false, false, false, false
};
int programState = 0;
float translateVariable = 0;
//Audio sound0 = new Audio();
//Audio sound1 = new Audio();
String fileExt;
void setup()
{
//  size(screenWidth(), screenHeight());
  size(window.innerWidth, window.innerHeight);
  frameRate(60);

  snail = loadShape("snail.svg");
  grass = loadShape("grass.svg");
  train = loadShape("train.svg");
  home = loadShape("home.svg");
  startScreen();
  //  sound1.setAttribute("src", "sound1.wav");
  //  sound0.setAttribute("src", "sound0.wav");
}
void draw()
{
  float horizontalSpace = 0.016273393 * width;
  float verticalSpace = 0.014423077 * height;
  switch(programState)
  {
  case screen0:
    programState = 0;
    startScreen();
    shape(home, width - 5 * horizontalSpace, height - 10 * verticalSpace);
    break;
  case screen1:
        programState = 1;
        translateVariable = 0;
        userDefinedSetup1();
        shape(home, width - 5 * horizontalSpace, height - 10 * verticalSpace);
    break;
  case screen2:
//    userDefinedSetup2();
    shape(home, width - 5 * horizontalSpace, height - 10 * verticalSpace);
    break;
  case screen3:
    drawBoxes3();
    shape(home, width - 5 * horizontalSpace, height - 10 * verticalSpace);
//    shape(home, 2 * horizontalSpace, height - 0.192307692 * height, 0.081366965 * width, 0.192307692 * height);
    break;
  case screen4:
    drawBoxes4();
    break;
  }
}

void mousePressed()
{
  float horizontalSpace = 0.016273393 * width;
  float verticalSpace = 0.014423077 * height;
  if(mouseX > width - 5 * horizontalSpace && mouseX < width - 5 * horizontalSpace + 58 && mouseY > height - 10 * verticalSpace && mouseY < height - 10 * verticalSpace + 58 && programState != 4)
  {
     programState = 0;
  }
  else if(mouseX > 2 * horizontalSpace && mouseX < 2 * horizontalSpace + 58 && mouseY > 0 && mouseY < 58 && programState == 4)
  {
    programState = 0;
  }
  switch(programState)
  {
  case screen0:
    mousePressedStartScreen();
    //    translateVariable = 0;
    //    userDefinedSetup1();
    //    programState = screen1;
    break;
  case screen1:
//    userDefinedSetup2();
//    programState = screen2;
    break;
  case screen2:
    mouseInBoxes();
    break;
  case screen3:
    mouseInBoxes();
    break;
  case screen4:
    mousePressedScreen4();
    break;
  }
}

int screenWidth()
{
  return (int) 1229;
}

int screenHeight()
{
  return (int) 520;
}

public void resizeSketch()
{
    size($(window).width(), $(window).height());
}

int numberOfCards = 10;
BinaryCard[] B = new BinaryCard[10];
class BinaryCard
{
  float horizontalCardSize;
  float verticalCardSize;
  int numberOfDots;
  float posX, posY;
  boolean cardState;
  int cardNumber;

  BinaryCard(float horizontalCardSize, float verticalCardSize, int numberOfDots, float posX, float posY, boolean cardState, int cardNumber)
  {
    this.horizontalCardSize = horizontalCardSize;
    this.verticalCardSize = verticalCardSize;
    this.numberOfDots = numberOfDots;
    this.posX = posX;
    this.posY = posY;
    this.cardState = cardState;
    this.cardNumber = cardNumber;
  }

  void displayCard(boolean font)
  {
    if (this.cardState)
    {
      strokeWeight(3);
      fill(255);
      stroke(160, 160, 180);
      rect(this.posX, this.posY, this.horizontalCardSize, this.verticalCardSize);
      strokeWeight((0.036615134 * width)/sqrt(numberOfDots));
      drawDots(this.posX, this.posY, this.horizontalCardSize, this.verticalCardSize, this.numberOfDots);
      cardNumber = 1;
    }
    else
    {
      strokeWeight(3);
      fill(160, 160, 180);
      rect(this.posX, this.posY, this.horizontalCardSize, this.verticalCardSize);
      cardNumber = 0;
    }
    if (font)
      fontFunction(this.posX + this.horizontalCardSize/2, this.posY + this.verticalCardSize + 3 * 0.008136697 * width);
  }

  void drawDots(float posX, float posY, float horizontalCardSize, float verticalCardSize, int numberOfDots)
  {
    int oddOrEven = -1;

    int tempNumberOfDots = numberOfDots;
    stroke(160, 160, 180);
    if (numberOfDots < 2)
      point(posX + horizontalCardSize/2, posY + verticalCardSize/2);
    else
    {
      while ( (tempNumberOfDots) > 0)
      {
        oddOrEven += 1;
        tempNumberOfDots >>= 1;
      }
      if (oddOrEven % 2 == 1)
      {
        drawDots(posX, posY, horizontalCardSize, verticalCardSize/2, numberOfDots/2);
        drawDots(posX, posY + verticalCardSize/2, horizontalCardSize, verticalCardSize/2, numberOfDots/2);
      }
      else if ( oddOrEven % 2 == 0)
      {
        drawDots(posX, posY, horizontalCardSize/2, verticalCardSize, numberOfDots/2);
        drawDots(posX + horizontalCardSize/2, posY, horizontalCardSize/2, verticalCardSize, numberOfDots/2);
      }
    }
  }

  void fontFunction(float xCoordinate, float yCoordinate)
  {
    int notCardNumber = (cardNumber == 1) ? 0 : 1;
    fill(0);
    PFont Cardo = createFont("ribeye", width/40);
    textFont(Cardo);
    fill(255, 255, 233);
    text(notCardNumber, xCoordinate, yCoordinate);
    fill(0);
    text(cardNumber, xCoordinate, yCoordinate);
    fill(255);
  }
}

void userDefinedSetup2()
{
  frameRate(60);
  background(255, 255, 233);
  float verticalSpace = 0.02441009 * (width/4);
  float horizontalSpace = 0.016273393 * (width);
  float horizontalCardSize = ((width) - (7 * horizontalSpace))/5;
  float verticalCardSize = (height - ((20 * verticalSpace)))/2;
  PFont Cardo = createFont("ribeye", width/30);
  int i, multiplier;
  //  pushMatrix();
  translate(horizontalSpace, 0);
  drawBoxes(((width) - (7 * horizontalSpace))/5, (height - ((20 * verticalSpace)))/2);
  verticalSpace = 0.02441009 * (width/4);

  fill(160, 160, 180);
  textFont(Cardo);
  textAlign(NORMAL);
  text("Binary String", 0.065093572 * width, height - ( 2 * verticalSpace));
  text("Decimal Number", width/2, height - (2 * verticalSpace));
  ellipseMode(RADIUS);
  stroke(0);
  fill(160, 160, 180);
//  ellipse(width * 0.918633035, height - ( 4 * verticalSpace), 0.040683483 * width/2, 0.096153846 * height/2);
  fill(0);
  //  triMode(CENTER);
//  triangle(width * 0.918633035 - 0.008136697 * width , height - ( 4 * verticalSpace) + 0.019230769 * height, width * 0.918633035 - 0.008136697 * width, height - ( 4 * verticalSpace) - 0.019230769 * height, width * 0.918633035 + 0.008136697 * width, height - ( 4 * verticalSpace));
  fill(255, 255, 233);
  stroke(160, 160, 180);

  ellipseMode(RADIUS);
  stroke(0);
  fill(160, 160, 180);
  ellipse(0.016273393 * width, height - ( 4 * verticalSpace), 0.040683483 * width/2, 0.096153846 * height/2);
  fill(0);
  text("?", width * 0.011073393, height - (2 * verticalSpace));
  fill(255, 255, 233);
  stroke(160, 160, 180);
  translate(-horizontalSpace, 0);
  //  popMatrix();
}
void drawBoxes(float horizontalCardSize, float verticalCardSize)
{
  background(255, 255, 233);
  float verticalSpace = 0.02441009 * (width/4);
  float horizontalSpace = 0.016273393 * (width);
  PFont Cardo = createFont("ribeye", width/30);
  int i, horizontalMultiplier, oneOrZeroMultiplier;
  for (i=0; i < numberOfCards; i++)
  {
    horizontalMultiplier = (i <= 4) ? (i % 5) : 4 - (i % 5);
    verticalSpace = (i <= 4) ? ((7 * 0.02441009 * (width/4)) + verticalCardSize) : 0.02441009 * (width/4);
    BinaryCard b = new BinaryCard(horizontalCardSize, verticalCardSize, (int)pow(2, i), horizontalMultiplier * (horizontalSpace + horizontalCardSize), verticalSpace, !setStateBinaryCard[i], 1);
    B[i] = b;
    B[i].displayCard(true);
    verticalSpace = 0.02441009 * (width/4);
    displayOneOrZero(B[i].cardState, ((0.284784378 * width) + (0.012205045 * width * (9 - i))), height - ( 2 * verticalSpace));
  }
}

void mouseInBoxes()
{
  int i;
  strokeWeight(3);
  float verticalSpace = 0.02441009 * (width/4);
  float horizontalSpace = 0.016273393 * (width);
  float horizontalCardSize = (programState == 3) ? ((width/1.2) - (7 * horizontalSpace))/5 : ((width) - (7 * horizontalSpace))/5;
  float verticalCardSize = (programState == 3) ? (height/1.2 - ((20 * verticalSpace)))/2 : (height - ((20 * verticalSpace)))/2;
  if (mouseX >= (width * 0.75 - 0.040683483 * width) && mouseY >= (0.25 * height) && mouseX <=  (width * 0.75 - 0.040683483 * width + 0.040683483 * width) && mouseY <= (0.096153846 * height + 0.25 * height) && programState == 2)
  {
    programState = 2;
    userDefinedSetup2();
  }

  else
  {
    for (i=0;i<10;i++)
    {
      if (mouseX >= (horizontalSpace + B[i].posX) && mouseX <= ( horizontalSpace + B[i].posX + B[i].horizontalCardSize) && mouseY >= B[i].posY && mouseY <= B[i].posY + B[i].verticalCardSize)
      {
        //        if (B[i].cardState)
        //        {
        //          sound1.play();
        //        }
        //        else
        //        {
        //          sound0.play();
        //        }
        translate(horizontalSpace, 0);
        B[i].cardState = !B[i].cardState;
        setStateBinaryCard[i] = !B[i].cardState;
        B[i].displayCard(true);
        translate(-horizontalSpace, 0);

        if (programState == 3)
        {
//          pressedCards[i] = true;
          setStateBinaryCard[i] = B[i].cardState;
          if (B[i].cardState)
          {
            randomNumber += B[i].numberOfDots;
          }
          else
          {
            randomNumber -= B[i].numberOfDots;
          }
          subtractSum();
        }

        else
        {
          translate(horizontalSpace, 0);
          displayOneOrZero(!setStateBinaryCard[i], ((0.284784378 * width) + (0.012205045 * width * (9 - i))), height - ( 2 * verticalSpace));
          translate(-horizontalSpace, 0);
        }
      }
    }
  }
//  if ((pow(mouseX -  horizontalSpace - width * 0.918633035, 2)/pow(0.040683483 * width/2, 2)) + (pow(mouseY - (height - 4 * verticalSpace), 2)/pow(0.096153846 * height/2, 2)) <= 1)
//  {
//    for (i =0; i<setStateBinaryCard.length; i++)
//      setStateBinaryCard[i] = false;
//    translateVariable = 0;
//    if (programState == 2)
//    {
//      programState = 3;
//      userDefinedSetup3();
//    }
//    else if (programState == 3)
//    {
//      programState = 4;
//      level = 1;
//      score = 0;
//      translateVariable = 0;
//      for (i =0; i<setStateBinaryCard.length; i++)
//        setStateBinaryCard[i] = false;
//      userDefinedSetup4();
//    }
//  }
  if (pow(((mouseX - horizontalSpace - width * 0.016273393)/ (0.040683483 * width/2)), 2) + pow(((mouseY - (height - 4 * verticalSpace))/(0.096153846 * height/2)), 2) <= 1 && programState == 2)
  {
    hintAlert();
  }
}

void displayOneOrZero(boolean state, float posX, float posY)
{
  int zeroOrOne;
  int cardSum = 0;
  int i;
  float verticalSpace = 0.02441009 * (width/4);
  fill(255, 255, 233);
  
  if (state)
  {
    text(0, posX, posY);
    zeroOrOne = 1;
  }
  else
  {
    text(1, posX, posY);
    zeroOrOne = 0;
  }
  fill(0);

  if (programState != screen3)
  {
    for (i=0;i<10;i++)
    {
      try
      {
        if (B[i].cardState)
        {
          cardSum += B[i].numberOfDots;
        }
      }
      catch(Exception e) {
      }
    }
    fill(0);
    text(zeroOrOne, posX, posY);
    noStroke();
    fill(255, 255, 233);
    rect(width/2 + textWidth("Decimal Number          ") + verticalSpace, height - (8 * verticalSpace), width/2 + 2 * verticalSpace, height/2);
    rectMode(CORNER);
    fill(0);
    text(cardSum, width/2 + textWidth("Decimal Number          ") + verticalSpace, height - ( 2 * verticalSpace));

//    translate(0,0);
    stroke(0);
    fill(160, 160, 180);
    strokeWeight(3);
    ellipseMode(RADIUS);
//    ellipse(width * 0.918633035, height - ( 4 * verticalSpace), 0.040683483 * width/2, 0.096153846 * height/2);
    fill(0);
//    triangle(width * 0.918633035 - 0.008136697 * width , height - ( 4 * verticalSpace) + 0.019230769 * height, width * 0.918633035 - 0.008136697 * width, height - ( 4 * verticalSpace) - 0.019230769 * height, width * 0.918633035 + 0.008136697 * width, height - ( 4 * verticalSpace));
    fill(255, 255, 233);
    stroke(160, 160, 180);
  }
}

void userDefinedSetup1()
{ 
  translateVariable = 0 ;
  float horizontalSpace = 0.016273393 * width;
  float verticalSpace = 0.014423077 * height;
  background(255, 255, 233);
  PFont Cardo = createFont("ribeye", width/40);
  if(frameCount % 2 == 0)
    translateVariable += (int) random(15);
  else
    translateVariable -= (int) random(8);
  
  pushMatrix();
  frameRate(5);  
  shape(snail, 0.032546786 * width + translateVariable, height - (2.023076923 * height)/3 + translateVariable,(0.60537022 * width)/4, (2.023076923 * height)/4);
  popMatrix();
  fill(160,160,180);
  textFont(Cardo);
  textAlign(CENTER, CENTER);
  text("Binary is composed of 2 states, 0 and 1", width/2 + 0.065093572 * width, 6 * verticalSpace );
  text("0 : OFF and 1 : ON.", 2 * width/3, 12 * verticalSpace);

  PFont CardoMedium = createFont("ribeye", width/30);
  textFont(CardoMedium);
  textAlign(NORMAL);
  fill(153, 204, 153);
  text("How do I play this game?", horizontalSpace, 22 * verticalSpace);

  PFont CardoSmall = createFont("ribeye", width/60);
  textFont(CardoSmall);
  text("If a card has been switched ON, the dots on it are visible.", horizontalSpace, 26 * verticalSpace);
  text("When a card is switched OFF, they are hidden.", horizontalSpace, 30 * verticalSpace);
  textAlign(RIGHT);
  text("To change the state of a card from ON to OFF or OFF to ON, click it.", width - horizontalSpace, 38 * verticalSpace);
  text("In the next screen, observe how switching OFF and switching ON a card ", width - horizontalSpace, 42 * verticalSpace);
  text("changes the binary and decimal value of a number.", width - horizontalSpace, 46 * verticalSpace);
  text("Click the CLUELESS (?) button in the bottom left for a hint.", width - horizontalSpace, 50 * verticalSpace);
//  text("continue noting down the 1s and 0s, but this time moving from left to right", width - horizontalSpace, 54 * verticalSpace);

  fill(160, 160, 180);
  textFont(Cardo);
  textAlign(CENTER);
  text("The sequence of 1s and 0s is the binary value of the number on the right!", width/2, 63 * verticalSpace);
  textAlign(NORMAL);
}

void userDefinedSetup3()
{
  background(255, 255, 233);
  float verticalSpace = 0.02441009 * (width/4);
  float horizontalSpace = 0.016273393 * (width);
  float horizontalCardSize = ((width) - (7 * horizontalSpace))/5;
  float verticalCardSize = (height - ((20 * verticalSpace)))/2;
  PFont Cardo = createFont("ribeye", width/30);
  tempRandomNumber = (int) random(1023);
  randomNumber = 0;
  translateVariable = 0;
  drawBoxes3();
  verticalSpace = 0.02441009 * (width/4);
  fill(160, 160, 180);
  textFont(Cardo);
  textAlign(NORMAL);
  ellipseMode(RADIUS);
  stroke(0);
  fill(160, 160, 180);
  ellipse(width * 0.918633035, height - ( 4 * verticalSpace), 0.040683483 * width/2, 0.096153846 * height/2);
  fill(0);
  //  triMode(CENTER);
//  triangle(width * 0.918633035 - 0.008136697 * width , height - ( 4 * verticalSpace) + 0.019230769 * height, width * 0.918633035 - 0.008136697 * width, height - ( 4 * verticalSpace) - 0.019230769 * height, width * 0.918633035 + 0.008136697 * width, height - ( 4 * verticalSpace));
  fill(255, 255, 233);
  stroke(160, 160, 180);
}

int randomNumber, tempRandomNumber;
int score = 0;
void drawBoxes3()
{
  frameRate(60);
  level = (int)((score >0 ) ?(score/100) + 1: 1);
  translateVariable += 0.25 + (0.1 * (level - 1));
  background(255, 255, 233);
  float verticalSpace = 0.02441009 * (width/4);
  float horizontalSpace = 0.016273393 * (width);
  PFont Cardo = createFont("ribeye", width/30); 
  int i, horizontalMultiplier, oneOrZeroMultiplier;
  float horizontalCardSize = ((width/1.2) - (7 * horizontalSpace))/5;
  float verticalCardSize = (height/1.2 - ((20 * verticalSpace)))/2;
  float textHeight = (height/3 + 6 * verticalSpace);
  fill(160, 160, 180);
  textFont(Cardo);
  translate(horizontalSpace, 0);
  textAlign(NORMAL);
  ellipseMode(RADIUS);
  stroke(0);
  fill(160, 160, 180);
//  ellipse(width * 0.918633035, height - ( 4 * verticalSpace), 0.040683483 * width/2, 0.096153846 * height/2);
  fill(0);
  //  triMode(CENTER);
//  triangle(width * 0.918633035 - 0.008136697 * width , height - ( 4 * verticalSpace) + 0.019230769 * height, width * 0.918633035 - 0.008136697 * width, height - ( 4 * verticalSpace) - 0.019230769 * height, width * 0.918633035 + 0.008136697 * width, height - ( 4 * verticalSpace));
  fill(255, 255, 233);
  stroke(160, 160, 180);
  fill(0);
  text(tempRandomNumber, 3 * horizontalSpace, 5 * verticalSpace);
  fill(255);
  for (i=0; i < numberOfCards; i++)
  {
    horizontalMultiplier = (i <= 4) ? (i % 5) : 4 - (i % 5);
    verticalSpace = (i <= 4) ? ((7 * 0.02441009 * (width/4)) + verticalCardSize) : 0.02441009 * (width/4);
    verticalSpace += translateVariable;
    BinaryCard b = new BinaryCard(horizontalCardSize, verticalCardSize, (int)pow(2, i), horizontalMultiplier * ((horizontalSpace + 1) + horizontalCardSize), verticalSpace, setStateBinaryCard[i], 1);
    B[i] = b;
    B[i].displayCard(true);
    strokeWeight(3);
    stroke(160, 160, 180);
    if(randomNumber > tempRandomNumber)
      fill(240, 190, 190);
    rect(width - 11 * horizontalSpace, height/3 + translateVariable, 0.097640358 * width, 0.115384615 * height);
    fill(0);
    text(randomNumber, width - 10 * horizontalSpace, textHeight + translateVariable);
    fill(0);
    verticalSpace = 0.02441009 * (width/4);
  }
  for (i = 0; i < numberOfCards; i ++)
  {
    fill(0);
//    text((int)B[i].cardState, ((0.284784378 * width) + (0.012205045 * width * (9-i))), ( 4 * verticalSpace));
  }
  text("Score: ", width - 15 * horizontalSpace, 4 * verticalSpace);
  text(score, width - 10 * horizontalSpace, 4 * verticalSpace);

  if (translateVariable >= height - (verticalCardSize) || randomNumber == tempRandomNumber)
  {
    if(randomNumber != tempRandomNumber)
      score -= level * 10;
    translateVariable = 0;
    userDefinedSetup3();
    for ( i=0; i < numberOfCards; i++)
    {
      setStateBinaryCard[i] = false;
//      pressedCards[i] = false;
    }
  }
  translate(-horizontalSpace,0);
}

void hintAlert()
{
  PFont CardoSmall = createFont("ribeye", width/60);
  String[] a = {
    "\n\n  As you move counter clockwise \n  from the card with 1 dot,\n  the number of dots double with every card.", "\n\n  Do you think there is a limit to the number of\n  cards?", 
    "\n\n  Turn OFF all cards.\n  Turn ON the card with 1 dot.\n  Try to create the numbers 1, 2, 3 ...1023\n  by turning cards ON and OFF\n\n  How do the binary and decimal values change?",
    "\n\n  Can you tell which 0 or 1 in the binary string\n  is toggled on pressing a certain card?", "\n\n  If you are given 15 cards, \n  what will be the number of dots on the 13th card?"
  };

  PFont Cardo = createFont("ribeye", width/20);
  pushMatrix();
  rectMode(CENTER);
  fill(255);
  stroke(160, 160, 180);
  rect(width/2, height/2, width/2, height/2);
  shape(snail, width/1.5 + translateVariable, height/2 - translateVariable, (0.60537022 * width)/8, (2.023076923 * height)/8);
  rectMode(CORNER);
  rect(width * 0.75 - 0.040683483 * width, 0.25 * height, 0.040683483 * width, 0.096153846 * height);
  fill(160, 160, 180);
  textFont(Cardo);
  text("X", width * 0.75 - 0.036615134 * width, 0.25 * height + 0.086538462 * height);
  textFont(CardoSmall);
  text(a[(int)random(a.length)], 0.25 * width, 0.25 * height);
  popMatrix();
}

void mousePressedStartScreen()
{
  float horizontalSpace = width/3;
  float verticalSpace = height/5;
  background(255, 255, 233);
  PFont Cardo = createFont("ribeye", width/40);
  String[] textInRectangles = {
    "PRACTICE", "GAME 1", "GAME 2", "HELP"
  }; 

  int i = 0;

  if (mouseX >= 1.25 * horizontalSpace && mouseX <= 1.75 * horizontalSpace)
  {
    if (mouseY >= 0.75 * verticalSpace && mouseY <= 1.25 * verticalSpace)
    {
      programState = 2;
      for (i =0; i<setStateBinaryCard.length; i++)
        setStateBinaryCard[i] = false;
      translateVariable = 0;
      userDefinedSetup2();
    }
    else if (mouseY >= 1.75 * verticalSpace && mouseY <= 2.25 * verticalSpace)
    {
      programState = 3;
      for (i =0; i<setStateBinaryCard.length; i++)
        setStateBinaryCard[i] = false;
      translateVariable = 0;
      userDefinedSetup3();
    }
    else if (mouseY >= 2.75 * verticalSpace && mouseY <= 3.25 * verticalSpace)
    {
      programState = 4;
//      drawBoxes4();
//      programState = 4;
      level = 1;
      score = 0;
      translateVariable = 0;
      for (i =0; i<setStateBinaryCard.length; i++)
        setStateBinaryCard[i] = false;
      userDefinedSetup4();
      //      shape(home, 2 * horizontalSpace, height - 0.192307692 * height, 0.081366965 * width, 0.192307692 * height);
    }
    else if (mouseY >= 3.75 * verticalSpace && mouseY <= 4.25 * verticalSpace)
    {
      programState = 1;
      //      drawBoxes4();
    } 
    //  pushMatrix();
    //  for( i = 1; i < 5; i++ )
    //  {
    //    strokeWeight(3);
    //    stroke(160,160,180);
    //    fill(0, 0, 0, 180);
    //    rectMode(CENTER);
    //    rect(1.5 * horizontalSpace, i * verticalSpace, horizontalSpace/2, verticalSpace/2);
    //    textAlign(CENTER);
    //    fill(255);
    //    text(textInRectangles[i - 1], 1.5 * horizontalSpace, i * verticalSpace);
    //  }
    //  popMatrix();
  }
}

void mousePressedScreen4()
{
  int i;
  float verticalSpace = 0.057692309 * height/4;
  float horizontalSpace = 0.016273393 * (width);
  float horizontalCardSize = ((width/1.1) - (6 * horizontalSpace))/numberOfCards;
  float verticalCardSize = (height/1.2 - ((20 * verticalSpace)))/2;
  for (i = 0; i < numberOfCards; i++)
  {
    if (pow(mouseX - (5 * horizontalSpace + (numberOfCards - 1 - i) * (horizontalSpace + horizontalCardSize)), 2)/pow(horizontalCardSize/4, 2) + pow( mouseY - (8 * verticalSpace + verticalCardSize * 2 + verticalCardSize/2), 2)/pow(horizontalCardSize/4, 2) <=1)
    {
      //      B[i].cardState = !B[i].cardState;
      setStateBinaryCard[i] = !setStateBinaryCard[i];
      translate(horizontalSpace, 0);
      translate(0, verticalSpace * 7);
      B[i].displayCard(false);
      translate(-horizontalSpace, 0);
      translate(0, -7 * verticalSpace);

      if (scoreCount == 1)
      {
        if (setStateBinaryCard[i])
        {
          randomNumber += B[i].numberOfDots;
          subtractSum();
        }

        else
        {
          randomNumber -= B[i].numberOfDots;
          subtractSum();
        }
      }

      if (!B[i].cardState)
        fill(160, 160, 180);
      pushMatrix();
      strokeWeight(3);
      ellipseMode(RADIUS);
      translate(5 * horizontalSpace, 0);
      translate(0, 7 * verticalSpace);
      ellipse((numberOfCards - 1 - i) * (horizontalSpace + horizontalCardSize), verticalSpace + verticalCardSize * 2 + verticalCardSize/2, horizontalCardSize/4, horizontalCardSize/4);
      textAlign(CENTER);
      B[i].fontFunction((numberOfCards - 1 - i) * (horizontalSpace + horizontalCardSize), verticalSpace + verticalCardSize * 2.9);
      textAlign(NORMAL);
      translate(0, -7 * verticalSpace);
      translate(-5 * horizontalSpace, 0);
      popMatrix();
    }
  }
  
//  translate(horizontalSpace,0);
//  translate(0,7 * verticalSpace);
//  if(mouseX > width - 2.75 * horizontalSpace && mouseX < 2.25 * horizontalSpace && mouseY >= 8 * verticalSpace && mouseY <= 8 * verticalSpace + verticalCardSize * 0.75)
   if(mouseX >= (5 * horizontalSpace + width - 8.75 * horizontalSpace) && (mouseX <= 5 * horizontalSpace + width - 8.25 * horizontalSpace) && mouseY >= 8 * verticalSpace && mouseY <= 8 * verticalSpace + verticalCardSize * 0.75)
     level += 1;
   if(level!=1 && mouseX >= (5 * horizontalSpace + width - 8.75 * horizontalSpace) && (mouseX <= 5 * horizontalSpace + width - 8.25 * horizontalSpace) && mouseY >=8 * verticalSpace + height - (13 * verticalSpace + verticalCardSize * 0.75) && mouseY <= 8 * verticalSpace + height - (13 * verticalSpace))
     level -= 1;
//   println("MOUSE " + mouseX + " " + mouseY);
// mouseX >= (5 * horizontalSpace + width - 6.75 * horizontalSpace) && (mouseX <= 5 * horizontalSpace + width - 6.25 * horizontalSpace) &&  
//  translate(-horizontalSpace,0);
//  translate(0,-7 * verticalSpace);
//  triangle(width - 2.5 * horizontalSpace, verticalSpace, width - 2.75 * horizontalSpace, verticalCardSize/2, width - 2.25 * horizontalSpace, verticalCardSize/2);
//  triangle(width - 2.5 * horizontalSpace, verticalCardSize/2, width - 2.75 * horizontalSpace, verticalCardSize * 0.75, width - 2.25 * horizontalSpace, verticalCardSize * 0.75);
//  triangle(width - 2.5 * horizontalSpace, height - 12 * verticalSpace, width - 2.75 * horizontalSpace, height - 12 * verticalSpace - verticalCardSize/2, width - 2.25 * horizontalSpace, height - 12 * verticalSpace - verticalCardSize/2);
//  triangle(width - 2.5 * horizontalSpace, height - 12 * verticalSpace - verticalCardSize/2, width - 2.75 * horizontalSpace, height - 12 * verticalSpace - verticalCardSize * 0.75, width - 2.25 * horizontalSpace, height - 12 * verticalSpace - verticalCardSize * 0.75);
}

void startScreen()
{
  numberOfCards = 10;
  if(translateVariable > width)
  {
    translateVariable = 0;
  }
  float horizontalSpace = width/3;
  float verticalSpace = height/5;
  background(255, 255, 233);
  PFont Cardo = createFont("ribeye", width/50);
//  PShape home = loadShape("home.svg");
  String[] textInRectangles = {"PRACTICE", "GAME 1", "GAME 2", "HELP"}; 
  int i = 0;
  while (i < width)
  {
    fill(0, 0, 0, 180);
    tint(255);
    shape(grass, i, height/4, 0.647681041 * width/2, 1.530769231 * height/2);
    i += 0.647681041 * width/2;
  }
  shape(snail,translateVariable, height - (2.023076923 * height)/3, (0.60537022 * width)/3, (2.023076923 * height)/3);
//  shape(home, width * 0.918633035, height - ( 4 * verticalSpace), 0.040683483 * width/2, 0.096153846 * height/2);
  
  pushMatrix();
  textFont(Cardo);
  for( i = 1; i < 5; i++ )
  {
    strokeWeight(3);
    stroke(160,160,180);
    fill(0, 0, 0, 180);
    rectMode(CENTER);
    rect(1.5 * horizontalSpace, i * verticalSpace, horizontalSpace/2, verticalSpace/2);
    textAlign(CENTER);
    fill(255);
    text(textInRectangles[i - 1], 1.5 * horizontalSpace, i * verticalSpace);
  }
  popMatrix();
  rectMode(CORNER);
  textAlign(NORMAL);
  
  
//  
//  textAlign(CENTER);
//  text("PRACTISE", 1.5 * horizontalSpace, verticalSpace, horizontalSpace/2, verticalSpace/2);
//  text("PLAY", 1.5 * horizontalSpace, verticalSpace, horizontalSpace/2, verticalSpace/2
//  //  fill(153, 204, 153);
//  fill(0);
//  text("Hi, I am Binns, the binary bug.", 12 * horizontalSpace, 8 * verticalSpace);
//  textAlign(CENTER, CENTER);
//  text("This activity will teach you to count in Binary.", width/2, 20 * verticalSpace);
//  text("Let's Begin!", width/2, 28 * verticalSpace); 
//  text("Read the instructions in SCREEN 1.", width/2, 36 * verticalSpace);
//  text("Practise in SCREEN 2.", width/2, 44 * verticalSpace);
//  text("PLAY in SCREEN 3.", width/2, 52 * verticalSpace);
//  text("Click me to go to the next screen.", width/2, 60 * verticalSpace);
//  textAlign(NORMAL);
  if (frameCount % 2 == 0)
  {
    translateVariable +=8 * random(1);
  }
  else
  {
    translateVariable -=0.09;
  }
}

int level = 0;
void subtractSum()
{
  if(randomNumber == tempRandomNumber)
  {
    score += level * 10;
    scoreCount +=1;
  }
}
int scoreCount = 1;
void userDefinedSetup4()
{

  tempRandomNumber = (int) random(126) + 1;
  randomNumber = 0;
  drawBoxes4();
  //  callTrain(tempRandomNumber);
  //  translateVariable = 0;
}

void drawBoxes4()
{
//  pushMatrix();
  numberOfCards = 7;
//  popMatrix();

  int i;
  background(255, 255, 233);
  //  int horizontalMultiplier;
  float verticalSpace = 0.057692309 * height/4;
  float horizontalSpace = 0.016273393 * (width);
  float horizontalCardSize = ((width/1.1) - (6 * horizontalSpace))/numberOfCards;
  float verticalCardSize = (height/1.2 - ((20 * verticalSpace)))/2;
  PFont Cardo = createFont("ribeye", width/40);
  shape(home, 2 * horizontalSpace, 0);
  textFont(Cardo);
  translate(horizontalSpace, 0);
  translate(0, verticalSpace * 7);
  fill(255);
  rect(0, verticalSpace + verticalCardSize * 2, (numberOfCards - 1) * (horizontalSpace + horizontalCardSize) + horizontalCardSize, verticalCardSize);
  for (i=0; i < numberOfCards; i++)
  {
    BinaryCard b = new BinaryCard(horizontalCardSize, verticalCardSize, (int)pow(2, i), (numberOfCards - 1 - i) * (horizontalSpace + horizontalCardSize), verticalSpace, setStateBinaryCard[i], 1);
    B[i] = b;
    B[i].displayCard(false);
    verticalSpace = 0.057692309 * height/4;
    pushMatrix();
    strokeWeight(3);
    ellipseMode(RADIUS);
    translate(4 * horizontalSpace, 0);
    ellipse((numberOfCards - 1 - i) * (horizontalSpace + horizontalCardSize), verticalSpace + verticalCardSize * 2.5, horizontalCardSize/4, horizontalCardSize/4);
    textAlign(CENTER);
    B[i].fontFunction((numberOfCards - 1 - i) * (horizontalSpace + horizontalCardSize), verticalSpace + verticalCardSize * 2.95);
    textAlign(NORMAL);
    translate(-4 * horizontalSpace, 0);
    popMatrix();
  }
  fill(0);
  strokeWeight(3);
  triangle(width - 4.5 * horizontalSpace, verticalSpace, width - 4.75 * horizontalSpace, verticalCardSize/2, width - 4.25 * horizontalSpace, verticalCardSize/2);
  triangle(width - 4.5 * horizontalSpace, verticalCardSize/2, width - 4.75 * horizontalSpace, verticalCardSize * 0.75, width - 4.25 * horizontalSpace, verticalCardSize * 0.75);
  triangle(width - 4.5 * horizontalSpace, height - 12 * verticalSpace, width - 4.75 * horizontalSpace, height - 12 * verticalSpace - verticalCardSize/2, width - 4.25 * horizontalSpace, height - 12 * verticalSpace - verticalCardSize/2);
  triangle(width - 4.5 * horizontalSpace, height - 12 * verticalSpace - verticalCardSize/2, width - 4.75 * horizontalSpace, height - 12 * verticalSpace - verticalCardSize * 0.75, width - 4.25 * horizontalSpace, height - 12 * verticalSpace - verticalCardSize * 0.75);
  fill(255);
  translate(-horizontalSpace, 0);
  callTrain(tempRandomNumber);
  verticalSpace = 0.02441009 * (width/4);
  translate(0, -7 * verticalSpace);
  
  
  text("Score: ", width - 15 * horizontalSpace, 4 * verticalSpace);
  text(score, width - 7 * horizontalSpace, 4 * verticalSpace);
}
void callTrain(int trainNumber)
{
  float verticalSpace = 0.057692309 * height/4;
  float horizontalSpace = 0.016273393 * (width);
  float verticalCardSize = (height/1.2 - ((20 * verticalSpace)))/2;
  int i;
  translateVariable += level;
  fill(0);
  text(trainNumber, translateVariable + horizontalSpace * 3, verticalSpace + verticalCardSize + verticalCardSize * 0.6);
  tint(255);
  shape(train, translateVariable, verticalSpace + verticalCardSize, 0.16273393 * width, 0.288461538 * height);

  if (translateVariable >= width)
  {
    if(randomNumber != tempRandomNumber)
      score -= level * 10;
    translateVariable = 0;
    userDefinedSetup4();
    scoreCount = 1;
    for ( i=0; i < numberOfCards; i++)
    {
      setStateBinaryCard[i] = false;
    }
  }
}




///* @pjs OJ = "OJ.ttf"; */ 
final int screen1 = 1;
final int screen2 = 2;
int programState = 1;
void setup()
{
//  size(screenWidth(), screenHeight());
  size(window.innerWidth, window.innerHeight);
  userDefinedSetup1();
}

void draw()
{  
  switch(programState)
  {
  case screen1:
    userDefinedSetup1();
    break;
  case screen2:
    break;
  }
}

void mousePressed()
{
  switch(programState)
  {
  case screen1:
    userDefinedSetup2();
    programState = 2;
    break;
  case screen2:
    mouseInBoxes();
    break;
  }
}

int screenWidth()
{
  return (int) (displayWidth * 0.85);
}

int screenHeight()
{
  return (int) (displayHeight * 0.85);
}

void displayOneOrZero(boolean state, float posX, float posY)
{
  int zeroOrOne;
  int cardSum = 0;
  int i;
  fill(255, 255, 233);
  if (state)
  {
    text(0, posX, posY);
    ;
    zeroOrOne = 1;
  }
  else
  {
    text(1, posX, posY);
    zeroOrOne = 0;
  }
  fill(0);
  
  for (i=0;i<10;i++)
  {
    try
    {
      if (B[i].cardState)
      {
        cardSum += B[i].numberOfDots;
      }
      println("cardSum" + " " + cardSum);
    }
    catch(Exception e){}
  }
  fill(0);
  text(zeroOrOne, posX, posY);
  noStroke();
  fill(255,255, 233);
  rect(0.776647681 * width, 0.506021155 * width - (0.16273393 * width/2), 0.32546786 * width, 0.244100895 * (width/2));
  fill(0);
  text(cardSum, 0.776647681 * width, 0.506021155 * width - 0.0065093572 * width * 0.008136697 * (width/4));
  rectMode(CORNER);
}

class BinaryCard
{
  float cardSize;
  int numberOfDots;
  float posX, posY;
  boolean cardState;
  int cardNumber;
  BinaryCard(float cardSize, int numberOfDots, float posX, float posY, boolean cardState, int cardNumber)
  {
    this.cardSize = cardSize;
    this.numberOfDots = numberOfDots;
    this.posX = posX;
    this.posY = posY;
    this.cardState = cardState;
    this.cardNumber = cardNumber;
  }

  void displayCard()
  {
    if (this.cardState)
    {
      strokeWeight(3);
      fill(255);
      stroke(160, 160, 180);
      rect((this.posX), this.posY, this.cardSize, this.cardSize);
      strokeWeight((0.036615134 * width)/sqrt(numberOfDots));
      drawDots(this.posX, this.posY, this.cardSize, this.cardSize, this.numberOfDots);
      cardNumber = 1;
    }
    else
    {
      fill(160, 160, 180);
      rect((this.posX), this.posY, this.cardSize, this.cardSize);
      cardNumber = 0;
    }
    fontFunction();
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

  void fontFunction()
  {
    int notCardNumber = (cardNumber == 1) ? 0 : 1;
    fill(0);
    PFont Cardo = createFont("ribeye", width/40);
    textFont(Cardo);
    fill(255, 255, 233);
    text(notCardNumber, this.posX + this.cardSize/2, this.posY + this.cardSize + 3 * 0.008136697 * width);
    fill(0);
    text(cardNumber, this.posX + this.cardSize/2, this.posY + this.cardSize + 3 * 0.008136697 * width);
    fill(255);
  }
}

void mouseInBoxes()
{
  int i;
  strokeWeight(3);
  float horizontalSpace = 0.016273393 * (width);
  float verticalSpace = 0.02441009 * (width/4);
  float cardSize = ((width) - (7 * horizontalSpace))/5;
  //  translate(0,0);
  if (mouseY >= verticalSpace && mouseY <= (verticalSpace + cardSize))
  {  
    for (i=0; i < numberOfCards; i++)
    {
      if (mouseX >= i * (horizontalSpace + cardSize) + horizontalSpace && mouseX <= i * (horizontalSpace + cardSize) + horizontalSpace + cardSize  )
      {
        B[i].cardState = !B[i].cardState;
//        translate(horizontalSpace, 0);
        B[i].displayCard();
        displayOneOrZero(B[i].cardState,((0.284784378 * width) + (0.012205045 * width * (5 + i))),(0.506021155 * width - 0.0065093572 * width * 0.008136697 * (width/4)));  
      }
    }
  }
  else if (mouseY >= (30 * 0.008136697 * (width/4) + cardSize) && mouseY <= ((30 * 0.008136697 * (width/4) + cardSize) + cardSize))
  {
    for (i=5; i < numberOfCards; i++)
    {
      if (mouseX >= (i%5) * (horizontalSpace + cardSize) + horizontalSpace && mouseX <= (i%5) * (horizontalSpace + cardSize) + horizontalSpace + cardSize  )
      {
        B[i].cardState = !B[i].cardState;
//        translate(horizontalSpace, 0);
        B[i].displayCard();
        println((0.065093572 * width + i) + " " + (0.506021155 * width - 0.0065093572 * width * 0.008136697 * (width/4)));
        displayOneOrZero(B[i].cardState,((0.284784378 * width) + (0.012205045 * width * ( 9 - i))),(0.506021155 * width - 0.0065093572 * width * 0.008136697 * (width/4)));
      }
    }
  }
}

final int numberOfCards = 10;
BinaryCard[] B = new BinaryCard[10];
void userDefinedSetup1()
{
  float horizontalSpace = 0.016273393 * width;
  background(255, 255, 233);
  PFont Cardo = createFont("ribeye", width/30);
  //  PFont OJ = createFont("OJ",width/30);


  fill(153, 204, 153);
  textFont(Cardo);
  textAlign(CENTER, CENTER);
  text("Dotty teaches you to count in Binary --", width/2 + 80, 2 * horizontalSpace );
  text(" the language of computers!", 2 * width/3, 5 * horizontalSpace);

  PFont CardoMedium = createFont("ribeye", width/20);
  textFont(CardoMedium);
  textAlign(NORMAL);
  text("How do I play Dotty?", horizontalSpace, 12 * horizontalSpace);

  PFont CardoSmall = createFont("ribeye", width/50);
  textFont(CardoSmall);
  text("Click on dotted cards to flip them.", horizontalSpace, 14 * horizontalSpace);
  text("Add the all the dots on the card you can see, and note down this number somewhere.", horizontalSpace, 16 * horizontalSpace);
  textAlign(RIGHT);
  text("To find the binary value of this number,", width - horizontalSpace, 20 * horizontalSpace);
  text("note down the 1 and 0 below every card", width - horizontalSpace, 22 * horizontalSpace);
  text(" starting from the right and moving towards your left", width - horizontalSpace, 24 * horizontalSpace);
  text("On reaching the last card on the left, go to the card immediately below that one", width - horizontalSpace, 26 * horizontalSpace);
  text("continue noting down the 1s and 0s, but this time moving from left to right", width - horizontalSpace, 28 * horizontalSpace);

  fill(160, 160, 180);
  textFont(Cardo);
  textAlign(CENTER);
//  println(31 * horizontalSpace);
  text("The string of 1s and 0s is the binary value!", width/2, 31 * horizontalSpace);
  textAlign(NORMAL);


  //  text("To count the
}

void userDefinedSetup2()
{
  background(255, 255, 233);
  float verticalSpace = 0.02441009 * (width/4);
  float horizontalSpace = 0.016273393 * (width);
  float cardSize = ((width) - (7 * horizontalSpace))/5;
  int i, power, multiplier;
  PFont Cardo = createFont("ribeye", width/30);

  translate(horizontalSpace, 0);
  for (i=0; i < numberOfCards; i++)
  {           
    power = (i > 4) ? (i) : (4 - i);
    multiplier = (i > 4) ? ( 9 - i) : ( 5 + i);    
    verticalSpace = (i > 4) ? (30 * 0.008136697 * (width/4) + cardSize): 0.02441009 * (width/4);
    BinaryCard b = new BinaryCard(cardSize, (int)pow(2, power), (i % 5) * (horizontalSpace + cardSize), verticalSpace, true, 1);
    B[i] = b;
    B[i].displayCard();
    displayOneOrZero(B[i].cardState,((0.284784378 * width) + (0.012205045 * width * multiplier)),(0.506021155 * width - 0.0065093572 * width * 0.008136697 * (width/4)));
    displayOneOrZero(B[i].cardState,((0.284784378 * width) + (0.012205045 * width * multiplier)),(0.506021155 * width - 0.0065093572 * width * 0.008136697 * (width/4)));
  }
  translate(0,0); 
  
  fill(160, 160, 180);
  textFont(Cardo);
  textAlign(NORMAL);
  text("Binary String", 0.065093572 * width, 0.506021155 * width - 0.0065093572 * width * 0.008136697 * (width/4));
  text("Decimal Number", width/2, 0.506021155 * width - 0.0065093572 * width * 0.008136697 * (width/4));
}



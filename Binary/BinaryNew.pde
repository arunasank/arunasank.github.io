final int screen1 = 1;
final int screen2 = 2;
final int screen3 = 3;
int programState = 1;
Audio sound0 = new Audio();
Audio sound1 = new Audio();
//float vol1 = 0;
//float vol2 = 0;
String fileExt;
void setup()
{
//  size(screenWidth(), screenHeight());
  size(window.innerWidth, window.innerHeight);
  userDefinedSetup1();
  sound1.setAttribute("src", "sound1.wav");
  sound0.setAttribute("src", "sound0.wav");
//  sound1.play();
//  sound0.play();
}
void draw()
{  
//  switch(programState)
//  {
//  case screen1:
//    break;
//  case screen2:
//    break;
//  case screen3:
//  
//      break;
//  }
}

void mousePressed()
{
  //  println(mouseX + " " + mouseY);
  switch(programState)
  {
  case screen1:
    userDefinedSetup2();
    programState = 2;
    break;
  case screen2:
    //    userDefinedSetup2();
    mouseInBoxes();
    break;
    //  case screen3:
    //    questions();
    //    break;
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

void questions()
{
}

final int numberOfCards = 10;
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

  void displayCard()
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
      fill(160, 160, 180);
      rect(this.posX, this.posY, this.horizontalCardSize, this.verticalCardSize);
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
    text(notCardNumber, this.posX + this.horizontalCardSize/2, this.posY + this.verticalCardSize + 3 * 0.008136697 * width);
    fill(0);
    text(cardNumber, this.posX + this.horizontalCardSize/2, this.posY + this.verticalCardSize + 3 * 0.008136697 * width);
    fill(255);
  }
}

void userDefinedSetup2()
{
  background(255, 255, 233);
  float verticalSpace = 0.02441009 * (width/4);
  float horizontalSpace = 0.016273393 * (width);
  float horizontalCardSize = ((width) - (7 * horizontalSpace))/5;
  float verticalCardSize = (height - ((20 * verticalSpace)))/2;
  PFont Cardo = createFont("ribeye", width/30); 
  PShape next = loadShape("next.svg");
  int i, multiplier;
  drawBoxes();
  verticalSpace = 0.02441009 * (width/4);
  
  for(i = 0; i <numberOfCards; i++)
  {
    multiplier = (i > 4) ? ( 9 - i) : ( 5 + i);
    displayOneOrZero(B[i].cardState, ((0.284784378 * width) + (0.012205045 * width * multiplier)), height - ( 2 * verticalSpace));
  }

  fill(160, 160, 180);
  textFont(Cardo);
  textAlign(NORMAL);
  text("Binary String", 0.065093572 * width, height - ( 2 * verticalSpace));
  text("Decimal Number", width/2, height - (2 * verticalSpace));
  
  stroke(0);
  fill(160, 160, 180);
  ellipse(width * 0.918633035, height - ( 4 * verticalSpace), 0.040683483 * width, 0.096153846 * height);
  fill(255, 255, 233);
  stroke(160, 160, 180);
}
void drawBoxes()
{
  background(255, 255, 233);
  float verticalSpace = 0.02441009 * (width/4);
  float horizontalSpace = 0.016273393 * (width);
  float horizontalCardSize = ((width) - (7 * horizontalSpace))/5;
  float verticalCardSize = (height - ((20 * verticalSpace)))/2;
  PFont Cardo = createFont("ribeye", width/30); 
  PShape next = loadShape("next.svg");
  int i, horizontalMulitplier, oneOrZeroMultiplier;

  translate(horizontalSpace, 0);
  for (i=0; i < numberOfCards; i++)
  {
    horizontalMultiplier = (i <= 4) ? (i % 5) : 4 - (i % 5);
    verticalSpace = (i <= 4) ? ((7 * 0.02441009 * (width/4)) + verticalCardSize) : 0.02441009 * (width/4);
    BinaryCard b = new BinaryCard(horizontalCardSize, verticalCardSize, (int)pow(2, i), horizontalMultiplier * (horizontalSpace + horizontalCardSize), verticalSpace, true, 1);
    B[i] = b;
    B[i].displayCard();
    verticalSpace = 0.02441009 * (width/4);
  }
  translate(0, 0);
}

void mouseInBoxes()
{
  int i;
  strokeWeight(3);
  float verticalSpace = 0.02441009 * (width/4);
  float horizontalSpace = 0.016273393 * (width);
  float horizontalCardSize = ((width) - (7 * horizontalSpace))/5;
  float verticalCardSize = (height - ((20 * verticalSpace)))/2;
  translate(0, 0);
  //FIRST ROW
  if (mouseY >= verticalSpace && mouseY <= (verticalSpace + verticalCardSize))
  {  
    for (i=9; i > 4; i--)
    {
      if (mouseX >= (9 - i) * (horizontalSpace + horizontalCardSize) + horizontalSpace && mouseX <= (9 - i) * (horizontalSpace + horizontalCardSize) + (horizontalSpace + horizontalCardSize) )
      {
        if (B[i].cardState)
        {
          sound1.play();
        }
        else
        {
          sound0.play();
        }

        B[i].cardState = !B[i].cardState;
        B[i].displayCard();
        displayOneOrZero(B[i].cardState, ((0.284784378 * width) + (0.012205045 * width * (9 - i))), height - ( 2 * verticalSpace));
      }
    }
  }
  //SECOND ROW
  else if (mouseY >= (7 * verticalSpace + verticalCardSize) && mouseY <= ((7 * verticalSpace + verticalCardSize) + verticalCardSize))
  {
    for (i=0; i < 5; i++)
    {
      if (mouseX >= (i) * (horizontalSpace + horizontalCardSize) + horizontalSpace && mouseX <= (i) * (horizontalSpace + horizontalCardSize) + horizontalSpace + horizontalCardSize  )
      {
        if (B[i].cardState)
        {
          sound1.play();
        }
        else
        {
          sound0.play();
        }
        B[i].cardState = !B[i].cardState;
        B[i].displayCard();  
        displayOneOrZero(B[i].cardState, ((0.284784378 * width) + (0.012205045 * width * ( 9 - i))), height - ( 2 * verticalSpace));
      }
    }
  }
  else if (pow((mouseX - width * 0.918633035), 2) + pow((mouseY - (height - ( 4 * verticalSpace))), 2) <= pow(0.040683483 * width, 2))
  {
    userDefinedSetup3();
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
    }
    catch(Exception e) {
    }
  }
  fill(0);
  text(zeroOrOne, posX, posY);
  noStroke();
  fill(255, 255, 233);
  rect(width/2 + textWidth("Decimal Number          ") + verticalSpace, height - (8 * verticalSpace), width/2 + 2 * verticalSpace, height/2);
  fill(0);
  text(cardSum, width/2 + textWidth("Decimal Number          ") + verticalSpace, height - ( 2 * verticalSpace));
  rectMode(CORNER);
}

void userDefinedSetup1()
{
  float horizontalSpace = 0.016273393 * width;
  float verticalSpace = 0.014423077 * height;
  background(255, 255, 233);
  PFont Cardo = createFont("ribeye", width/40);


  fill(153, 204, 153);
  textFont(Cardo);
  textAlign(CENTER, CENTER);
  text("Dotty teaches you to count in Binary --", width/2 + 0.065093572 * width, 6 * verticalSpace );
  text(" the language of computers!", 2 * width/3, 12 * verticalSpace);

  PFont CardoMedium = createFont("ribeye", width/30);
  textFont(CardoMedium);
  textAlign(NORMAL);
  text("How do I play Dotty?", horizontalSpace, 18 * verticalSpace);

  PFont CardoSmall = createFont("ribeye", width/60);
  textFont(CardoSmall);
  text("Click on dotted cards to flip them.", horizontalSpace, 22 * verticalSpace);
  text("Add the dots from every card that is not flipped. Note down the sum.", horizontalSpace, 26 * verticalSpace);
  textAlign(RIGHT);
  text("To find the binary value of the above sum,", width - horizontalSpace, 34 * verticalSpace);
  text("note down the 1 and 0 below every card", width - horizontalSpace, 38 * verticalSpace);
  text(" starting from the right and moving towards your left", width - horizontalSpace, 42 * verticalSpace);
  text("On reaching the last card on the left, go to the card immediately below that one", width - horizontalSpace, 48 * verticalSpace);
  text("continue noting down the 1s and 0s, but this time moving from left to right", width - horizontalSpace, 54 * verticalSpace);

  fill(160, 160, 180);
  textFont(Cardo);
  textAlign(CENTER);
  //  println(31 * horizontalSpace);
  text("The string of 1s and 0s is the binary value!", width/2, 63 * verticalSpace);
  textAlign(NORMAL);

  //  shape(next, width - 8 * horizontalSpace, height - 8 * verticalSpace, 8 * verticalSpace, 8 * verticalSpace);
}

void userDefinedSetup3()
{
  background(255, 255, 233);
  float verticalSpace = 0.02441009 * (width/4);
  float horizontalSpace = 0.016273393 * (width);
  float horizontalCardSize = ((width) - (7 * horizontalSpace))/5;
  float verticalCardSize = (height - ((20 * verticalSpace)))/2;
  PFont Cardo = createFont("ribeye", width/30); 
  PShape next = loadShape("next.svg");
  drawBoxes();
  verticalSpace = 0.02441009 * (width/4); 

      //  fill(160, 160, 180);
      //  textFont(Cardo);
      //  textAlign(NORMAL);
      //  text("Binary String", 0.065093572 * width, height - ( 2 * verticalSpace));
      //  text("Decimal Number", width/2, height - (2 * verticalSpace));
}



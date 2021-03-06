/*    This program is free software: you can redistribute it and/or modify
 it under the terms of the GNU Affero General Public License as published by
 the Free Software Foundation, either version 3 of the License, or
 (at your option) any later version.
 
 	Author: Aruna Sankaranarayanan
 	Email: aaruna.evam@gmail.com
 
 This program is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU Affero General Public License for more details.
 
 You should have received a copy of the GNU Affero General Public License
 along with this program.  If not, see <http://www.gnu.org/licenses/>.
 
 */

final int screen0 = 0;
final int screen1 = 1;
final int screen2 = 2;
final int screen3 = 3;
PShape snail;
PShape grass;
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
  startScreen();
//  sound1.setAttribute("src", "sound1.wav");
//  sound0.setAttribute("src", "sound0.wav");
}
void draw()
{
  switch(programState)
  {
  case screen0:
    programState = 0;
    startScreen();
    break;
  case screen1:
    programState = 1;
    userDefinedSetup1();
    break;
  case screen2:
    break;
  case screen3:
    drawBoxes3();
    break;
  }
}

void mousePressed()
{
  switch(programState)
  {
  case screen0:
    translateVariable = 0;
    userDefinedSetup1();
    programState = screen1;
    break;
  case screen1:
    userDefinedSetup2();
    programState = screen2;
    break;
  case screen2:
    mouseInBoxes();
    break;
  case screen3:
    mouseInBoxes();
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
      strokeWeight(3);
      fill(160, 160, 180);
      rect(this.posX, this.posY, this.horizontalCardSize, this.verticalCardSize);
      cardNumber = 0;
    }
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

  for (i = 0; i < numberOfCards; i++)
  {
    multiplier = (i > 4) ? ( 9 - i) : (9 - i);
    displayOneOrZero(B[i].cardState, ((0.284784378 * width) + (0.012205045 * width * multiplier)), height - ( 2 * verticalSpace));
  }

  fill(160, 160, 180);
  textFont(Cardo);
  textAlign(NORMAL);
  text("Binary String", 0.065093572 * width, height - ( 2 * verticalSpace));
  text("Decimal Number", width/2, height - (2 * verticalSpace));
  ellipseMode(RADIUS);
  stroke(0);
  fill(160, 160, 180);
  ellipse(width * 0.918633035, height - ( 4 * verticalSpace), 0.040683483 * width/2, 0.096153846 * height/2);
  fill(0);
  //  triMode(CENTER);
  triangle(width * 0.918633035 - 0.008136697 * width , height - ( 4 * verticalSpace) + 0.019230769 * height, width * 0.918633035 - 0.008136697 * width, height - ( 4 * verticalSpace) - 0.019230769 * height, width * 0.918633035 + 0.008136697 * width, height - ( 4 * verticalSpace));
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
    B[i].displayCard();
    verticalSpace = 0.02441009 * (width/4);
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

  //FIRST ROW
  else if (mouseY >= verticalSpace + translateVariable && mouseY <= (verticalSpace + verticalCardSize) + translateVariable)
  {  
    for (i=9; i > 4; i--)
    {
      if (mouseX >= (9 - i) * (horizontalSpace + horizontalCardSize) + horizontalSpace && mouseX <= (9 - i) * (horizontalSpace + horizontalCardSize) + (horizontalSpace + horizontalCardSize) )
      {
//        if (B[i].cardState)
//        {
//          sound1.play();
//        }
//        else
//        {
//          sound0.play();
//        }
        translate(horizontalSpace,0);
        B[i].cardState = !B[i].cardState;
        setStateBinaryCard[i] = !B[i].cardState;
        B[i].displayCard();
        translate(-horizontalSpace,0);

        if (programState == 3)
        {
          pressedCards[i] = true;
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
          translate(horizontalSpace,0);
          displayOneOrZero(!setStateBinaryCard[i], ((0.284784378 * width) + (0.012205045 * width * (9 - i))), height - ( 2 * verticalSpace));
          translate(-horizontalSpace,0);
        }
      }
    }
  }

  //SECOND ROW
  else if (mouseY >= (7 * verticalSpace + verticalCardSize) + translateVariable && mouseY <= ((7 * verticalSpace + verticalCardSize) + verticalCardSize) + translateVariable)
  {
    for (i=0; i < 5; i++)
    {
      if (mouseX >= (i) * (horizontalSpace + horizontalCardSize) + horizontalSpace && mouseX <= (i) * (horizontalSpace + horizontalCardSize) + horizontalSpace + horizontalCardSize  )
      {
//        if (B[i].cardState)
//        {
//          sound1.play();
//        }
//        else
//        {
//          sound0.play();
//        }
        translate(horizontalSpace,0);
        B[i].cardState = !B[i].cardState;
        setStateBinaryCard[i] = !B[i].cardState;
        B[i].displayCard();
        translate(-horizontalSpace,0);

        if (programState == 3)
        {
          pressedCards[i] = true;
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
          translate(horizontalSpace,0);
          displayOneOrZero(!setStateBinaryCard[i], ((0.284784378 * width) + (0.012205045 * width * ( 9 - i))), height - ( 2 * verticalSpace));
          translate(-horizontalSpace,0);
        }
      }
    }
  }
  else if ((pow(mouseX -  horizontalSpace - width * 0.918633035, 2)/pow(0.040683483 * width/2, 2)) + (pow(mouseY - (height - 4 * verticalSpace), 2)/pow(0.096153846 * height/2, 2)) <= 1 && programState == 2)
  {
    for (i =0; i<setStateBinaryCard.length; i++)
      setStateBinaryCard[i] = false;
    translateVariable = 0;
    programState = 3;
    userDefinedSetup3();
  }
  else if (pow(((mouseX - horizontalSpace - width * 0.016273393)/ (0.040683483 * width/2)), 2) + pow(((mouseY - (height - 4 * verticalSpace))/(0.096153846 * height/2)), 2) <= 1 && programState == 2)
  {
    hintAlert();
  }
//  translat(-horizontalSpace,0);
  //  width * 0.918633035, height - ( 4 * verticalSpace), 0.040683483 * width, 0.096153846 * height
  //  0.016273393 * width, height - ( 4 * verticalSpace), 0.040683483 * width, 0.096153846 * height
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
    ellipse(width * 0.918633035, height - ( 4 * verticalSpace), 0.040683483 * width/2, 0.096153846 * height/2);
    fill(0);
    triangle(width * 0.918633035 - 0.008136697 * width , height - ( 4 * verticalSpace) + 0.019230769 * height, width * 0.918633035 - 0.008136697 * width, height - ( 4 * verticalSpace) - 0.019230769 * height, width * 0.918633035 + 0.008136697 * width, height - ( 4 * verticalSpace));
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
//  translate(horizontalSpace, 0);
  drawBoxes3();
//  translate(-horizontalSpace, 0);
  verticalSpace = 0.02441009 * (width/4);
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
  fill(0);
  text(tempRandomNumber, 3 * horizontalSpace, 4 * verticalSpace);
  fill(255);
  translate(horizontalSpace, 0);
  for (i=0; i < numberOfCards; i++)
  {
    horizontalMultiplier = (i <= 4) ? (i % 5) : 4 - (i % 5);
    verticalSpace = (i <= 4) ? ((7 * 0.02441009 * (width/4)) + verticalCardSize) : 0.02441009 * (width/4);
    verticalSpace += translateVariable;
    BinaryCard b = new BinaryCard(horizontalCardSize, verticalCardSize, (int)pow(2, i), horizontalMultiplier * ((horizontalSpace + 1) + horizontalCardSize), verticalSpace, setStateBinaryCard[i], 1);
    B[i] = b;
    B[i].displayCard();
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
    text((int)B[i].cardState, ((0.284784378 * width) + (0.012205045 * width * (9-i))), ( 4 * verticalSpace));
  }
  text("Score : ", width - 0.284784378 * width, 4 * verticalSpace);
  text(score, width - 0.16273393 * width, 4 * verticalSpace);

  if (translateVariable >= height - (verticalCardSize) || randomNumber == tempRandomNumber)
  {
    if(randomNumber != tempRandomNumber)
      score -= level * 10;
    translateVariable = 0;
    userDefinedSetup3();
    for ( i=0; i < numberOfCards; i++)
    {
      setStateBinaryCard[i] = false;
      pressedCards[i] = false;
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

void startScreen()
{
  if(translateVariable > width)
  {
    translateVariable = 0;
  }
  float horizontalSpace = 0.016273393 * width;
  float verticalSpace = 0.014423077 * height;
  background(255, 255, 233);
  PFont Cardo = createFont("ribeye", width/40);
  int i = 0;
  while (i < width)
  {
    fill(0, 0, 0, 180);
    tint(255);
    shape(grass, i, height/4, 0.647681041 * width/2, 1.530769231 * height/2);
    i += 0.647681041 * width/2;
  }
  shape(snail,translateVariable, height - (2.023076923 * height)/3, (0.60537022 * width)/3, (2.023076923 * height)/3);

  textFont(Cardo);  
  //  fill(153, 204, 153);
  fill(0);
  text("Hi, I am Binns, the binary bug.", 12 * horizontalSpace, 8 * verticalSpace);
  textAlign(CENTER, CENTER);
  text("This activity will teach you to count in Binary.", width/2, 20 * verticalSpace);
  text("Let's Begin!", width/2, 28 * verticalSpace); 
  text("Read the instructions in SCREEN 1.", width/2, 36 * verticalSpace);
  text("Practise in SCREEN 2.", width/2, 44 * verticalSpace);
  text("PLAY in SCREEN 3.", width/2, 52 * verticalSpace);
  text("Click me to go to the next screen.", width/2, 60 * verticalSpace);
  textAlign(NORMAL);
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
  }
}


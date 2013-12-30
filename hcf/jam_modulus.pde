This program is free software: you can redistribute it and/or modify
it under the terms of the GNU Affero General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

	Author: Aruna Sankaranarayanan
	email: aruna.evam@gmail.com
This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU Affero General Public License for more details.

You should have received a copy of the GNU Affero General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.	


/* @pjs CardoR = "http://fonts.googleapis.com/css?family=Cardo"; */
void setup()
{ 
//  size(initialScreenWidth(), initialScreenHeight());
  size(window.innerWidth, window.innerHeight);
  background(233, 233, 233);
  totalBoxes = (int)(0.008136697 * width);
  userDefinedSetup();
}

void draw()
{
//  userDefinedSetup();
}

void mousePressed()
{
  if (mouseButton == LEFT && totalBoxes < 30 && !mouseInBoxes())
  {
    totalBoxes ++;
    userDefinedSetup();
  }
  if (mouseButton == RIGHT && totalBoxes > 5 && !mouseInBoxes())
  {
    totalBoxes --;
    userDefinedSetup();
  }
  if (mouseInBoxes())
    drawGreenSquares(getNumberInBox(mouseX, mouseY));
}

int initialScreenWidth()
{
  return (int) (displayWidth * 0.3);
}

int initialScreenHeight()
{
  return (int) (displayHeight * 0.3);
}
void fontFunction()
{
//  PFont cardoR = loadFont("CardoR.vlw");
//  PFont cardoI = loadFont("CardoI.vlw");
  PFont cardoR = createFont("Cardo",width/40);
  PFont cardoI = createFont("Cardo",width/40);
  
  
//  textFont(cardoR, width/40);
  textFont(cardoR);
  fill(0);
  text("To increase the number", 0.008136697 * width, 0.05788712 * height);
  text("of boxes around the circle,", 0.008136697 * width, 0.11577424 * height);
    
//  textFont(cardoI, width/40);
  textFont(cardoR);
  fill(69, 82, 104);
  text("left click.", 0.008136697 * width, 0.17366136 * height);
  
//  textFont(cardoR, width/40);
  textFont(cardoR);
  fill(0);
  text("To decrease the number", 0.008136697 * width, height * 0.82633864);
  text("of boxes around the circle,", 0.008136697 * width, height * 0.88422576);
  
//  textFont(cardoI, width/40);
  textFont(cardoR);
  fill(69, 82, 104);
  text("right click.", 0.008136697 * width, height * 0.94211288);
  
//  textFont(cardoR, width/40);
  textFont(cardoR);
  text("Pass to every ____ child", 0.715215622 * width, 0.04341534 * height);
}

int gcd(int divided, int divisor)
{
  int rem;
  while(divided % divisor != 0)
  {
    rem = divided % divisor;
    divided = divisor;
    divisor = rem;
  }
  
  return divisor;
}
boolean mouseInBoxes()
{
  float i = 0.05788712 * height;
  boolean mouseInBoxFlag = false;
  int boxColumn;
  //  color boxColour = color(49, 60, 83);
  //  color fontColour = color(253,253,253);
  int column = 1;
  switch(column)
  {
  case 1:
    if (totalBoxes >= 15)
      boxColumn = 15;
    else
      boxColumn = ceil(totalBoxes);
    if (mousePressed && mouseX >= (0.803905614 * width) && mouseX <= (0.846216436 * width))
    {
//      println(mouseX);
      for (i = (0.11577424 * height); i <= (boxColumn * 0.05788712 * height) ; i += (0.05788712 * height))
      {
        if (mousePressed && mouseY >= i && mouseY <= (i+ 0.04341534 * height) )
        {
          mouseInBoxFlag = true;
          break;
        }
      }
    }
    if (totalBoxes <= 15)
    {
      break;
    }
  case 2:
    if (totalBoxes >= 29)
      boxColumn = 15;
    else
      boxColumn = ceil(totalBoxes) - 14;
    if (mousePressed && mouseX >= (width * 0.868999186) && mouseX <= (width * 0.911310008))
    {
//      println(mouseX);
      for (i = (0.11577424 * height); i <= (boxColumn * 0.05788712 * height) ; i += (0.05788712 * height))
      {
        if (mousePressed && mouseY >= i && mouseY <= (i+ 0.04341534 * height) )
        {
          mouseInBoxFlag = true;
          break;
        }
      }
    }
    if (totalBoxes < 30)
    {
      break;
    }
  case 3:
    if (totalBoxes < 40)
      boxColumn = ceil(totalBoxes) - 28;
    else
      boxColumn = ceil(totalBoxes) - 28;
    if (mousePressed && mouseX >= (width * 0.934092758) && mouseX <= (width * 0.97640358))
    {
//      println(mouseX);
      for (i = (0.11577424 * height); i <= (boxColumn * 0.05788712 * height) ; i += (0.05788712 * height))
      {
        if (mousePressed && mouseY >= i && mouseY <= (i+ 0.04341534 * height) )
        {
          mouseInBoxFlag = true;
          break;
        }
      }
    }
    break;
  }
  //  if (mousePressed && (get(mouseX, mouseY) == boxColour || get(mouseX, mouseY) == fontColour))
  //    mouseInBoxFlag = true;
  return mouseInBoxFlag;
}

int getNumberInBox(int mX, int mY)
{
//  if (floor(mX/80) == 12)
  if( floor(mX/(0.065093572 * width)) == 12)  
  {
//    println(floor(mY/(0.05788712 * height)));
    return (floor(mY/(0.05788712 * height)));
  }
//  else if (floor(mX/80) == 13)
  else if(floor(mX/(0.065093572 * width)) == 13)
  {
//    println(floor(mY/(0.05788712 * height)) + (floor(mX/(0.065093572 * width))) + 1);
    return (floor(mY/(0.05788712 * height)) + (floor(mX/(0.065093572 * width))) + 1);
  }
  else
  {
//    println(floor(mY/(0.05788712 * height)) + (floor(mX/(0.065093572 * width)) * 2));
    return (floor(mY/(0.05788712 * height)) + (floor(mX/(0.065093572 * width)) * 2));
  }
}
void modulusBoxFunction()
{
  int i = 1;
  
  float initialWidth = width * 0.804719284;
  float initialHeight = 0.11577424 * height;
//  PFont cardoR = loadFont("CardoR.vlw");
  PFont cardoR = createFont("Cardo",0.020341741 * width);

  textAlign(NORMAL);
//  textFont(cardoR, 0.020341741 * width);
  textFont(cardoR);
  for ( ; i < totalBoxes ; i++)
  {
    fill(49, 60, 83);
    rectMode(CORNER);
    rect(initialWidth, initialHeight, 0.040683483 * width, 0.04341534 * height);
    fill(253, 253, 253);
    if (i<9)
//      text(i+1, 0.820992677 * width, 0.15195369 * height);
        text(i+1, initialWidth + (0.017915309 * width), initialHeight + (0.0391884058 * height));
    else
//      text(i+1, 0.816924329 * width, 0.15195369 * height);
        text(i+1, initialWidth + (0.011915309 * width), initialHeight + (0.0391884058 * height));    
    initialHeight += 0.05788712 * height;

    if (i == 14 || i == 28)
    {
      initialWidth += 0.065093572 * width;
      initialHeight = 0.11577424 * height;
    }
  }
}


void drawGreenSquares(int number)
{
  userDefinedSetup();

  int hcf = gcd(totalBoxes, number);
  int i;
  float theta;
  float arclength = 0;
  float boxSize = 0.036615134 * width;
  float radius = ((totalBoxes) * (boxSize))/ (2 * PI);

  for (i = 0; i < (totalBoxes/hcf) ; i++)
  {
    theta = (arclength * number)/ radius;

    pushMatrix();
    translate(width/2, height/2);
    translate(radius*cos(theta), radius*sin(theta));
    rotate(theta);
    fill(156, 255, 0, 100);
    rectMode(CENTER);
    rect(0, 0, boxSize, boxSize);
    popMatrix();
    arclength += boxSize;
  }
}
int totalBoxes;
void userDefinedSetup()
{
//  PFont cardoR = loadFont("CardoR.vlw");
  PFont cardoR = createFont("Cardo",0.020341741 * width);
  
  background(255);
  //Write all the messages on the screen.
  fontFunction();
  
  //Draw all the modulus numbers(Inside the blue boxes on the right) on the screen. 
  modulusBoxFunction();
  
  float boxSize = 0.036615134 * width; //length and width of the light blue boxes in the center of the screen.
  float radius = ((totalBoxes) * (boxSize))/ (2 * PI); //radius of the circle in the center of the screen.
  int i; //iterator
  float theta; //Angle between center of circle and center of each blue box around the circle
  float arclength = 0; 

  stroke(0);
  fill(255);
  
  //Draw circle in the center and write the number of boxes inside the circle.
  ellipse(width/2, height/2, radius*2, radius*2);
  textAlign(CENTER, CENTER);
//  textFont(cardoR, 0.020341741 * width);
  textFont(cardoR);
  fill(0);
  if (totalBoxes > 9)
    text(totalBoxes, width/2, height/2);
  else
    text(totalBoxes, width/2, height/2);
  textAlign(NORMAL);

  for (i = 0; i < totalBoxes; i++)
  {
    theta = arclength / radius;     

    pushMatrix();
    translate(width/2, height/2);
    translate(radius*cos(theta), radius*sin(theta));
    rotate(theta);
    fill(182, 192, 210, 100);
    rectMode(CENTER);
    rect(0, 0, boxSize, boxSize);
    popMatrix();
    arclength += boxSize;
  }
}


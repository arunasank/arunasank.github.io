/*

    This file(Ultimate_tic_tac_toe.pde) is part of Algorithmic Tic Tac Toe, also known as Tic Tac Toe Advanced(case insensitive).

    Author: Aruna Sankaranarayanan
      (aruna.evam@gmail.com)

    Tic Tac Toe Advanced is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    Tic Tac Toe Advanced is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with Tic Tac Toe Advanced.  If not, see <http://www.gnu.org/licenses/>.
*/

/*-------Each small grid is initalised with 0-9
to mark the grids with the number of their position*/
char grid0[][] = {{0,1,2},{3,4,5},{6,7,8}};
char grid1[][] = {{0,1,2},{3,4,5},{6,7,8}};
char grid2[][] = {{0,1,2},{3,4,5},{6,7,8}};
char grid3[][] = {{0,1,2},{3,4,5},{6,7,8}};
char grid4[][] = {{0,1,2},{3,4,5},{6,7,8}};
char grid5[][] = {{0,1,2},{3,4,5},{6,7,8}};
char grid6[][] = {{0,1,2},{3,4,5},{6,7,8}};
char grid7[][] = {{0,1,2},{3,4,5},{6,7,8}};
char grid8[][] = {{0,1,2},{3,4,5},{6,7,8}};

/*notWon[] keeps track of which of the smaller squares have not been won
  notWon[i] = true, implies, grid i is still available for play as grid has not been won.
  notWon[i] = false implies grid i is not available for play, as grid has been won.*/
boolean notWon[] = {true, true, true,true, true, true,true, true, true};

char bigGrid[][] = {{0,1,2},{3,4,5},{6,7,8}};

/*programState keeps track of which player has to play.
  programState can be assigned two values, player1 or player2
  depending on which player has to make the next move. The starting move is given to player 1.*/
int programState = 1;

/*The two states of teh game are denoted by player1 and player2,
  which decide whether player1 or player2 has to play.*/
final int player1 = 1;
final int player2 = 2;

/*val is used to store the value of the current move. All of player 1's grids are marked with an 'A'
  and all of player 2's grids are marked with a 'B'*/
char val;

/*nextTurn denotes the number of the large grid in which the next move has to be made.
  if nextTurn = -1, the next move can be made in any of the grids.*/
int nextTurn = -1;

/*The following three values are used to create a flashing boundary effect to mark the large grid
  in which the next move has to be made.
  The boundary flashes for the duration(in milliseconds) assigned to DISPLAY_DURATION*/
boolean boolFlashingBox; //false by default
int startTime;
final int DISPLAY_DURATION = 300;

void setup() 
{
  size(1200,708);
  background(240, 241, 236);
  
PFont playerFont = loadFont("MOC.vlw");
  
  //Help button
  helpButton();
  
  //Credits button
  creditsButton();
  
  //the following stroke colour is the blue used to draw the LARGE grid.
  stroke(71,95,119);
  strokeWeight(5);
  //Big tic-tac-toe
  //X1 - first horizontal line
  line(10,236,950,236);
  //X2 - second horizontal line
  line(10,472,950,472);
  //Y1 - first vertical line
  line(320,10,320,698);
  //Y2 - second vertical line
  line(640,10,640,698);

/*****  ROW 1 of small grids ***********/

//  Following stroke is the green colour of the smaller grids
  strokeWeight(3);
  stroke(40,190,40);
  
/***********  grid0  *****************/
  
  line(35,82,285,82);//Horizontal 1
  line(35,154,285,154);//Horizontal 2
  line(115,30,115,206);//Vertical 1
  line(205,30,205,206);//Vertical 2
  
/*************************************/  
  
/***********  grid1  *****************/  

  line(355,82,605,82);//Horizontal 1
  line(355,154,605,154);//Horizontal 2
  line(435,30,435,206);//Vertical 1
  line(525,30,525,206);//Vertical 2
  
/************************************/  

/***********  grid2  *****************/  

  line(675,82,925,82);//Horizontal 1
  line(675,154,925,154);//Horizontal 2
  line(755,30,755,206);//Vertical 1
  line(845,30,845,206);//Vertical 2

/************************************/

/***********  ROW2 of small grids  ****/

/***********  grid3  *****************/

//  stroke(215,75,75);
  line(35,318,285,318);//Horizontal 1
  line(35,390,285,390);//Horizontal 2
  line(115,266,115,442);//Vertical 1
  line(205,266,205,442);//Vertical 2
  
/*************************************/
  
/***********  grid4  *****************/

  line(355,318,605,318);//Horizontal 1
  line(355,390,605,390);//Horizontal 2
  line(435,266,435,442);//Vertical 1
  line(525,266,525,442);//Vertical 2

/************************************/

/***********  grid5  *****************/
  
  line(675,318,925,318);//Horizontal 1
  line(675,390,925,390);//Horizontal 2
  line(755,266,755,442);//Vertical 1
  line(845,266,845,442);//Vertical 2

/************************************/
    
/********ROW 3 of small grids  *****/

//  stroke(215,75,75);
  
/**********  grid6  ***************/  
  line(35,554,285,554);
  line(35,626,285,626);
  line(115,502,115,678);
  line(205,502,205,678);
  
/**********************************/
  
/********** grid7  ***************/  
  line(355,554,605,554);
  line(355,626,605,626);
  line(435,502,435,678);
  line(525,502,525,678);
  
/********************************/
  
/********** grid8 ***************/
  line(675,554,925,554);
  line(675,626,925,626);
  line(755,502,755,678);
  line(845,502,845,678);
  
/*******************************/

/*Payer1's fill colour is the yellow you see when
  you run the game. This fill colour is that light red.*/
  fill(255,244,110);

  
  /*Rectangles for player1 and player2*/
  stroke(40,190,40);
  fill(255,244,110);
  rect(1000,236,180,60);
  fill(255);
  rect(1000,412,180,60);
  
  fill(0);
  textFont(playerFont, 30);
  text("Player 1",1045,275);
  text("Player 2",1045,451);
}

void draw()
{ 
  //Each grid marked by player1(CROSS) will have 'A' in it.
  char cross = 'A';
  //Each grid marked by player2(ZERO) will have 'B' in it.
  char zero = 'B';
  
  int i;//iterator
  
  /*Control the state of the program.
    Mostly program state is necessary to manipulate
    the fill colour of the grids, either
    light red or light blue, depending on which player
    is making the moves.*/
  switch(programState)
  {
    case player1:
                 val = cross;
                 fill(255,244,110);
                 break;                 
    case player2:
                 fill(149,215,221);
                 val = zero;
                 break;
  }


/*Flashing box at the end of each turn that marks the
  next grid of play.*/
  if (boolFlashingBox)
  {
    noFill();
    if(nextTurn != -1)
    {
      stroke(71,95,119);
      drawBigGrid(nextTurn);
    }
    else
    {
      for(i=0;i<9;i++)
      {
        if(notWon[i])
        {
          stroke(71,95,119);
          drawBigGrid(i);
        }
      }
      if (millis() - startTime > DISPLAY_DURATION) 
      {
        stroke(240, 241, 236);
      
        for(i=0;i<9;i++)
        {
          if(notWon[i])
          {
            drawBigGrid(i);
          }
        }
      
        boolFlashingBox = false;
      }
    }
    if (millis() - startTime > DISPLAY_DURATION) 
    {
      stroke(240, 241, 236);
      drawBigGrid(nextTurn);
      boolFlashingBox = false;
    }
  }
  
//  stroke(215,75,75);
    stroke(40,190,40);

}
  
void switchPlayer()
{
  PFont playerFont = loadFont("MOC.vlw");
/*Function called to switch players.*/
  if(programState == player1)
  {
    programState = player2;
    stroke(40,190,40);
    fill(149,215,221);
    rect(1000,412,180,60);
    fill(0);
    textFont(playerFont, 30);
    text("Player 2",1045,451);
    
    fill(255);
    rect(1000,236,180,60);
    fill(0);
    textFont(playerFont, 30);
    text("Player 1",1045,275);
  }
    
  else
  { 
    programState = player1;
    stroke(40,190,40);
    fill(255,244,110);
    rect(1000,236,180,60);
    fill(0);
    textFont(playerFont, 30);
    text("Player 1",1045,275);
    
    fill(255);
    rect(1000,412,180,60);
    fill(0);
    textFont(playerFont, 30);
    text("Player 2",1045,451);
  }
  
  
}

void mousePressed()
{
  if((nextTurn == 0 || nextTurn == -1) && notWon[0])
  {
    gridPressed0();
  }
      
  if((nextTurn == 1 || nextTurn == -1) && notWon[1])
  {
    gridPressed1();
  }
          
  if((nextTurn == 2 || nextTurn == -1) && notWon[2])
  {
    gridPressed2();
  }
  if((nextTurn == 3 || nextTurn == -1) && notWon[3])
  {
    gridPressed3();
  }
  if((nextTurn == 4 || nextTurn == -1) && notWon[4])
  {
    gridPressed4();
  }
  if((nextTurn == 5 || nextTurn == -1) && notWon[5])
  {
    gridPressed5();
  }
  if((nextTurn == 6 || nextTurn == -1) && notWon[6])
  {
    gridPressed6();
  }
  if((nextTurn == 7 || nextTurn == -1)&& notWon[7])
  {
    gridPressed7();
  }
  if((nextTurn == 8 || nextTurn == -1) && notWon[8])
  {
    gridPressed8();
  }

  if(sqrt(sq(1172 - mouseX) + sq(30 - mouseY)) <= 50)
  link("http://mathwithbaddrawings.com/2013/06/16/ultimate-tic-tac-toe/");
  
  if(sqrt(sq(1172 - mouseX) + sq(675 - mouseY)) <= 50)
  link("http://gardengnoming.wordpress.com");  
  
/****************************************************************************************/
  
/*The following loop starts the timer for the boolean flashing box*/
//  if(nextTurn != -1)
//  {
//    boolFlashingBox = true;
//    startTime = millis();
//  }
//  else
//  {
//    boolFlashingBox = true;
//    startTime = millis();
//  }
boolFlashingBox = true;
    startTime = millis();

/*****************************************************************************************/  
}

void creditsButton()
{
  PFont playerFont = loadFont("MOC.vlw");
  stroke(71,95,119);
  strokeWeight(5);
  fill(255,120,120);
  ellipse(1172,675,50,50);
  smooth();
  fill(255);
  textFont(playerFont,20);
  text("Me",1160,682);
}

void helpButton()
{
  PFont playerFont = loadFont("MOC.vlw");
  stroke(71,95,119);
  strokeWeight(5);
  fill(255,120,120);
  ellipse(1172,30,50,50);
  smooth();
  fill(255);
  textFont(playerFont,30);
  text("?",1168,42);
  
}

void drawBigGrid(int n)
{
  
//Function draws a rectangle in any of the big grids either to
//mark a big grid as being won or drawn(basically to mark a grid as unplayable)
//and also to draw the boundary around the flashing boxes.

 switch(n)
  {
    case 0:rect(30,25,260,186);
          
          break;
    case 1:rect(350,25,260,186);
          
          break;
    case 2:rect(670,25,260,186);
          
          break;
    case 3:rect(30,261,260,186);
          
          break;
    case 4:rect(350,261,260,186);
          
          break;
    case 5:rect(670,261,260,186);
          
          break;
    case 6:rect(30,497,260,186);
          
          break;
    case 7:rect(350,497,260,186);
          
          break;
    case 8:rect(670,497,260,186);
          
          break;
  }
}

boolean gridNotPlayable(char[][] grid, int n)
{
  
/*A grid is not playable if it has been won by player1 or player2 or if a grid has been drawn*/
  int value = -1, i, j;
  int row;
  if(n < 3)
    row = 0;
  else if(n < 6)
    row = 1;
  else
    row = 2;
 
//Row 1 has been finished by one player, so the grid is won
    if ((grid[0][0] == grid[0][1]) && (grid[0][1] == grid[0][2]))
    {
      notWon[n] = false;
      drawBigGrid(n);
      if(grid[0][0] == 'A')
      {
        bigGrid[row][n%3] = 'A';
        bigGridWon();
      }
      else
      {
        bigGrid[row][n%3] = 'B';
        bigGridWon();
      }
    }
// Row 2 has been finished by one player, so the grid is won
    else if ((grid[1][0] == grid[1][1]) && (grid[1][1] == grid[1][2]))
    {
      notWon[n] = false;
      drawBigGrid(n);
      if(grid[1][0] == 'A')
      {
        bigGrid[row][n%3] = 'A';
        bigGridWon();
      }
      else
      {
        bigGrid[row][n%3] = 'B';
        bigGridWon();
      }
    }
    
//Row 3 has been finished by one player, so the grid is won
    else if ((grid[2][0] == grid[2][1]) && (grid[2][1] == grid[2][2]))
    {
      notWon[n] = false;
      drawBigGrid(n);
      if(grid[2][0] == 'A')
      {
        bigGrid[row][n%3] = 'A';
        bigGridWon();
      }
      else
      {
        bigGrid[row][n%3] = 'B';
        bigGridWon();
      }
    }
    
//Col 1 has been finished by one player, so the grid is won
    else if ((grid[0][0] == grid[1][0]) && (grid[1][0] == grid[2][0]))
    { 
      notWon[n] = false;
      drawBigGrid(n);
      if(grid[0][0] == 'A')
      {
        bigGrid[row][n%3] = 'A';
        bigGridWon();
      }
      else
      {
        bigGrid[row][n%3] = 'B';
        bigGridWon();
      }      
    }
    
//Col2 has been finished by one player, so the grid is won
    else if ((grid[0][1] == grid[1][1]) && (grid[1][1] == grid[2][1]))
    {
      notWon[n] = false;
      drawBigGrid(n);
      if(grid[0][1] == 'A')
      {
        bigGrid[row][n%3] = 'A';
        bigGridWon();
      }
      else
      {
        bigGrid[row][n%3] = 'B';
        bigGridWon();
      }
    }
//Col3 has been finished by one player, so the grid is won
    else if ((grid[0][2] == grid[1][2]) && (grid[1][2] == grid[2][2]))
    {
      notWon[n] = false;
      drawBigGrid(n);
      if(grid[0][2] == 'A')
      {
        bigGrid[row][n%3] = 'A';
        bigGridWon();
      }
      else
      {
        bigGrid[row][n%3] = 'B';
        bigGridWon();
      }
    }
//leftDiagonal has been finished by one player, so the grid is won
    else if ((grid[0][0] == grid[1][1]) && (grid[1][1] == grid[2][2]))
    {
      notWon[n] = false;
      drawBigGrid(n);
      if(grid[0][0] == 'A')
      {
        bigGrid[row][n%3] = 'A';
        bigGridWon();
      }
      else
      {
        bigGrid[row][n%3] = 'B';
        bigGridWon();
      }
    }
//rightDiagonal has been finished by one player, so the grid is won
    else if ((grid[0][2] == grid[1][1]) && (grid[1][1] == grid[2][0]))
    {
      notWon[n] = false;
      drawBigGrid(n);
      if(grid[0][2] == 'A')
      {
        bigGrid[row][n%3] = 'A';
        bigGridWon();
      }
      else
      {
        bigGrid[row][n%3] = 'B';
        bigGridWon();
      }     
    }
//Grid is drawn    
    else
    {
      for(i=0;i<3;i++)
      {
        for(j=0;j<3;j++)
        {
          if(grid[i][j]!='A' && grid[i][j]!='B')//If grid is marked with 'A' or 'B', it means that a player has marked the grid. Otherwise the grid contains numbers.
            value = 2;//If there is any number in the small grids, the large grid is still playable, so value acts as a flag.
        }
      }
      if(value!=2)
      {
        fill(0);
        drawBigGrid(n);//If value!=2, the large grid has been completely marked with no player winning. That is, the grid is a drawn grid.
        bigGrid[row][n%3] = 'X';
        bigGridWon();
      }
    }
      
 if(value != -1)//gridNotPlayable is false, so grid available for play
   return false;
 
 else           //gridNotPlayable is true, so grid not available for play
 {
   notWon[n] = false;
   return true;
 }
}

void bigGridWon()
{
   char value = 'X';
   int i,j;
   PFont playerFont = loadFont("MOC.vlw");
   if ((bigGrid[0][0] == bigGrid[0][1]) && (bigGrid[0][1] == bigGrid[0][2]))
   {
     if(bigGrid[0][0] == 'A')
       value = 'A';
     else
       value = 'B';
   }
   
   else if ((bigGrid[1][0] == bigGrid[1][1]) && (bigGrid[1][1] == bigGrid[1][2]))
   {
     if(bigGrid[1][0] == 'A')
       value = 'A';
     else
       value = 'B';
   }
   
   else if ((bigGrid[2][0] == bigGrid[2][1]) && (bigGrid[2][1] == bigGrid[2][2]))
   {
     if(bigGrid[2][0] == 'A')
       value = 'A';
     else
       value = 'B';
   }
//Col 1 has been finished by one player, so the grid is won
   else if ((bigGrid[0][0] == bigGrid[1][0]) && (bigGrid[1][0] == bigGrid[2][0]))
   {
     if(bigGrid[0][0] == 'A')
       value = 'A';
     else
       value = 'B';
   }

//Col2 has been finished by one player, so the grid is won
   else if ((bigGrid[0][1] == bigGrid[1][1]) && (bigGrid[1][1] == bigGrid[2][1]))
   {
     if(bigGrid[0][1] == 'A')
       value = 'A';
     else
       value = 'B';
   }

//Col3 has been finished by one player, so the grid is won
   else if ((bigGrid[0][2] == bigGrid[1][2]) && (bigGrid[1][2] == bigGrid[2][2]))
   {
     if(bigGrid[0][2] == 'A')
       value = 'A';
     else
       value = 'B';
   }

//leftDiagonal has been finished by one player, so the grid is won
   else if ((bigGrid[0][0] == bigGrid[1][1]) && (bigGrid[1][1] == bigGrid[2][2]))
   {
     if(bigGrid[0][0] == 'A')
       value = 'A';
     else
       value = 'B';
   }
//rightDiagonal has been finished by one player, so the grid is won
   else if ((bigGrid[0][2] == bigGrid[1][1]) && (bigGrid[1][1] == bigGrid[2][0]))
   {
     if(bigGrid[0][2] == 'A')
       value = 'A';
     else
       value = 'B';
   }

//Grid is drawn    
    else
    {
      for(i=0;i<3;i++)
      {
        for(j=0;j<3;j++)
        {
          if(bigGrid[i][j]!='A' && bigGrid[i][j]!='B' && bigGrid[i][j]!='X')//If grid is marked with 'A' or 'B', it means that a player has marked the grid. Otherwise the grid contains numbers.
            value = 'N';//value = 'N' => One of the small grids hasn't been won by Player1, Player2. Neither has it been drawn.
        }
      }
      
      if(value!='N')
        value = 'D';
    }
    
    for(i=0;i<3;i++)
    {
      print("\n");
      for(j=0;j<3;j++)
      {
        print(bigGrid[i][j]+"  ");
      }
    }
    
    switch(value)
    {
      case 'A':
               fill(255,244,110, 130);
               rect(10,10,940,688);
               fill(0);
               textFont(playerFont,100);
               smooth();
               text("Player 1 wins!",200,375);
               noLoop();
               break;
      case 'B':
               fill(149,215,221, 130);
               rect(10,10,940,688);
               fill(0);
               textFont(playerFont,100);
               smooth();
               text("Player 2 wins!",200,375);
               noLoop();
               break;
      case 'D':
               fill(119,221,119, 130);
               rect(10,10,940,688);
               fill(0);
               textFont(playerFont,100);
               smooth();
               text("DRAW!",325,375);
               noLoop();
               break;
    }
}

void gridPressed0()
{
  /*If the next grid of play is Grid0, the following loop will run*/
  
  /*************************************  Grid0  **********************************/
      //[0,0]
      if(mouseX>=35 && mouseX<=115 && mouseY<=82 && mouseY>=30 && grid0[0][0] == 0)
      {
        rect(35,30,80,52);
        nextTurn = 0;
        grid0[0][0] = val;
        gridNotPlayable(grid0,0);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[0,1]
      else if(mouseX>=115 && mouseX<=205 && mouseY>=30 && mouseY<=82 && grid0[0][1] == 1)
      { 
        rect(115,30,90,52);
        nextTurn = 1;
        grid0[0][1] = val;
        gridNotPlayable(grid0,0);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[0,2]
      else if(mouseX>=205 && mouseX<=285 && mouseY>=30 && mouseY<=82 && grid0[0][2] == 2)
      {
        rect(205,30,80,52);
        nextTurn = 2;
        grid0[0][2] = val;
        gridNotPlayable(grid0,0);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[1,0]
      else if(mouseX>=35 && mouseX<=115 && mouseY>=82 && mouseY<=154 && grid0[1][0] == 3)
      {
        rect(35,82,80,72);
        nextTurn = 3;
        grid0[1][0] = val;
        gridNotPlayable(grid0,0);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[1,1]
      else if(mouseX>=115 && mouseX<=205 && mouseY>=82 && mouseY<=154 && grid0[1][1] == 4)
      {
        rect(115,82,90,72);
        nextTurn = 4;
        grid0[1][1] = val;
        gridNotPlayable(grid0,0);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[1,2]
      else if(mouseX>=205 && mouseX<=285 && mouseY>=82 && mouseY<=154 && grid0[1][2] == 5)
      {
        rect(205,82,80,72);
        nextTurn = 5;
        grid0[1][2] = val;
        gridNotPlayable(grid0,0);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[2,0]
      else if(mouseX>=35 && mouseX<=115 && mouseY>=154 && mouseY<=206 && grid0[2][0] == 6)
      {
        rect(35,154,80,52);
        nextTurn = 6;
        grid0[2][0] = val;
        gridNotPlayable(grid0,0);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[2,1]
      else if(mouseX>=115 && mouseX<=205 && mouseY>=154 && mouseY<=206 && grid0[2][1] == 7)
      {
        rect(115,154,90,52);
        nextTurn = 7;
        grid0[2][1] = val;
        gridNotPlayable(grid0,0);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[2,2]
      else if(mouseX>=205 && mouseX<=285 && mouseY>=154 && mouseY<=206 && grid0[2][2] == 8)
      {
        rect(205,154,80,52);
        nextTurn = 8;
        grid0[2][2] = val;
        gridNotPlayable(grid0,0);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
}
void gridPressed1()
{
/**********************************************************************/

/*Following loop will run if the next grid of play is Grid1*/

/*************************** Grid1 **********************************/
  //Grid 1, Index 1, Top Center
        //[0,3]
      if(mouseX>=355 && mouseX<=435 && mouseY<=82 && mouseY>=30 && grid1[0][0] == 0)
      {
        rect(355,30,80,52);
        nextTurn = 0;
        grid1[0][0] = val;
        gridNotPlayable(grid1,1);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[0,4]
      else if(mouseX>=435 && mouseX<=525 && mouseY>=30 && mouseY<=82 && grid1[0][1] == 1)
      { 
        rect(435,30,90,52);
        nextTurn = 1;
        grid1[0][1] = val;
        gridNotPlayable(grid1,1);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[0,5]
      else if(mouseX>=525 && mouseX<=605 && mouseY>=30 && mouseY<=82 && grid1[0][2] == 2)
      {
        rect(525,30,80,52);
        nextTurn = 2;
        grid1[0][2] = val;
        gridNotPlayable(grid1,1);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[1,3]
      else if(mouseX>=355 && mouseX<=435 && mouseY>=82 && mouseY<=154 && grid1[1][0] == 3)
      { 
        rect(355,82,80,72);
        nextTurn = 3;
        grid1[1][0] = val;
        gridNotPlayable(grid1,1);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[1,4]
      else if(mouseX>=435 && mouseX<=525 && mouseY>=82 && mouseY<=154 && grid1[1][1] == 4)
      {
        rect(435,82,90,72);
        nextTurn = 4;
        grid1[1][1] = val;
        gridNotPlayable(grid1,1);
        if(!notWon[nextTurn])
          nextTurn = -1;        
        switchPlayer();
      }
      //[1,5]
      else if(mouseX>=525 && mouseX<=605 && mouseY>=82 && mouseY<=154 && grid1[1][2] == 5)
      {
        rect(525,82,80,72);
        nextTurn = 5;
        grid1[1][2] = val;
        gridNotPlayable(grid1,1);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[2,3]
      else if(mouseX>=355 && mouseX<=435 && mouseY>=154 && mouseY<=206 && grid1[2][0] == 6)
      {
        rect(355,154,80,52);
        nextTurn = 6;
        grid1[2][0] = val;
        gridNotPlayable(grid1,1);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[2,4]
      else if(mouseX>=435 && mouseX<=525 && mouseY>=154 && mouseY<=206 && grid1[2][1] == 7)
      {
        rect(435,154,90,52);
        nextTurn = 7;
        grid1[2][1] = val;
        gridNotPlayable(grid1,1);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[2,5]
      else if(mouseX>=525 && mouseX<=605 && mouseY>=154 && mouseY<=206 && grid1[2][2] == 8)
      {
        rect(525,154,80,52);
        nextTurn = 8;
        grid1[2][2] = val;
        gridNotPlayable(grid1,1);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
}
void gridPressed2()
{
  /*****************************************************************************************/

/*If the next grid of play is Grid2, the following grid will run*/

/********************************* Grid2 ************************************************/
  
  //Grid 2, Index 2, Top Right
      //[0,6]
      if(mouseX>=675 && mouseX<=755 && mouseY<=82 && mouseY>=30 && grid2[0][0] == 0)
      {
        rect(675,30,80,52);
        nextTurn = 0;
        grid2[0][0] = val;
        gridNotPlayable(grid2,2);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[0,7]
      else if(mouseX>=755 && mouseX<=845 && mouseY>=30 && mouseY<=82 && grid2[0][1] == 1 )
      { 
        rect(755,30,90,52);
        nextTurn = 1;
        grid2[0][1] = val;
        gridNotPlayable(grid2,2);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[0,8]
      else if(mouseX>=845 && mouseX<=925 && mouseY>=30 && mouseY<=82 && grid2[0][2] == 2 )
      {
        rect(845,30,80,52);
        nextTurn = 2;
        grid2[0][2] = val;
        gridNotPlayable(grid2,2);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[1,6]
      else if(mouseX>=675 && mouseX<=755 && mouseY>=82 && mouseY<=154 && grid2[1][0] == 3)
      {
        rect(675,82,80,72);
        nextTurn = 3;
        grid2[1][0] = val;
        gridNotPlayable(grid2,2);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[1,7]
      else if(mouseX>=755 && mouseX<=845 && mouseY>=82 && mouseY<=154 && grid2[1][1] == 4 )
      {
        rect(755,82,90,72);
        nextTurn = 4;
        grid2[1][1] = val;
        gridNotPlayable(grid2,2);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[1,8]
      else if(mouseX>=845 && mouseX<=925 && mouseY>=82 && mouseY<=154 && grid2[1][2] == 5 )
      {
        rect(845,82,80,72);
        nextTurn = 5;
        grid2[1][2] = val;
        gridNotPlayable(grid2,2);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[2,6]
      else if(mouseX>=675 && mouseX<=755 && mouseY>=154 && mouseY<=206 && grid2[2][0] == 6 )
      {
        rect(675,154,80,52);
        nextTurn = 6;
        grid2[2][0] = val;
        gridNotPlayable(grid2,2);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[2,7]
      else if(mouseX>=755 && mouseX<=845 && mouseY>=154 && mouseY<=206 && grid2[2][1] == 7 )
      {
        rect(755,154,90,52);
        nextTurn = 7;
        grid2[2][1] = val;
        gridNotPlayable(grid2,2);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[2,8]
      else if(mouseX>=845 && mouseX<=925 && mouseY>=154 && mouseY<=206 && grid2[2][2] == 8 )
      {
        rect(845,154,80,52);
        nextTurn = 8;
        grid2[2][2] = val;
        gridNotPlayable(grid2,2);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
}
void gridPressed3()
{
  /*******************************************************************************************/

/*If the next grid of play is grid 3, the following loop will run*/

/***************************************  Grid3  *******************************************/
  
  //Grid 3, Index 3, Middle Left
      //[3,0]
      if(mouseX>=35 && mouseX<=115 && mouseY<=318 && mouseY>=266 && grid3[0][0] == 0 )
      {
        rect(35,266,80,52);
        nextTurn = 0;
        grid3[0][0] = val;
        gridNotPlayable(grid3,3);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[3,1]
      else if(mouseX>=115 && mouseX<=205 && mouseY>=266 && mouseY<=318 && grid3[0][1] == 1 )
      { 
        rect(115,266,90,52);
        nextTurn = 1;
        grid3[0][1] = val;
        gridNotPlayable(grid3,3);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[3,2]
      else if(mouseX>=205 && mouseX<=285 && mouseY>=266 && mouseY<=318 && grid3[0][2] == 2 )
      {
        rect(205,266,80,52);
        nextTurn = 2;
        grid3[0][2] = val;
        gridNotPlayable(grid3,3);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[4,0]
      else if(mouseX>=35 && mouseX<=115 && mouseY>=318 && mouseY<=390 && grid3[1][0] == 3 )
      {
        rect(35,318,80,72);
        nextTurn = 3;
        grid3[1][0] = val;
        gridNotPlayable(grid3,3);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[4,1]
      else if(mouseX>=115 && mouseX<=205 && mouseY>=318 && mouseY<=390 && grid3[1][1] == 4 )
      {
        rect(115,318,90,72);
        nextTurn = 4;
        grid3[1][1] = val;
        gridNotPlayable(grid3,3);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[4,2]
      else if(mouseX>=205 && mouseX<=285 && mouseY>=318 && mouseY<=390 && grid3[1][2] == 5 )
      {
        rect(205,318,80,72);
        nextTurn = 5;
        grid3[1][2] = val;
        gridNotPlayable(grid3,3);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[5,0]
      else if(mouseX>=35 && mouseX<=115 && mouseY>=390 && mouseY<=442 && grid3[2][0] == 6 )
      {
        rect(35,390,80,52);
        nextTurn = 6;
        grid3[2][0] = val;
        gridNotPlayable(grid3,3);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[5,1]
      else if(mouseX>=115 && mouseX<=205 && mouseY>=390 && mouseY<=442 && grid3[2][1] == 7 )
      {
        rect(115,390,90,52);
        nextTurn = 7;
        grid3[2][1] = val;
        gridNotPlayable(grid3,3);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[5,2]
      else if(mouseX>=205 && mouseX<=285 && mouseY>=390 && mouseY<=442 && grid3[2][2] == 8 )
      {
        rect(205,390,80,52);
        nextTurn = 8;
        grid3[2][2] = val;
        gridNotPlayable(grid3,3);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
}
void gridPressed4()
{
  /****************************************************************************************/

/*If the next grid of play is grid4, the following loop will run*/
/***************************** Grid4 ****************************************************/

  //Grid 4, Index 4, Middle Center
      //[3,3]
      if(mouseX>=355 && mouseX<=435 && mouseY<=318 && mouseY>=266 && grid4[0][0] == 0 )
      {
        rect(355,266,80,52);
        nextTurn = 0;
        grid4[0][0] = val;
        gridNotPlayable(grid4,4);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[3,4]
      else if(mouseX>=435 && mouseX<=525 && mouseY>=266 && mouseY<=318 && grid4[0][1] == 1 )
      { 
        rect(435,266,90,52);
        nextTurn = 1;
        grid4[0][1] = val;
        gridNotPlayable(grid4,4);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[3,5]
      else if(mouseX>=525 && mouseX<=605 && mouseY>=266 && mouseY<=318 && grid4[0][2] == 2 )
      {
        rect(525,266,80,52);
        nextTurn = 2;
        grid4[0][2] = val;
        gridNotPlayable(grid4,4);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[4,3]
      else if(mouseX>=355 && mouseX<=435 && mouseY>=318 && mouseY<=390 && grid4[1][0] == 3 )
      {
        rect(355,318,80,72);
        nextTurn = 3;
        grid4[1][0] = val;
        gridNotPlayable(grid4,4);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[4,4]
      else if(mouseX>=435 && mouseX<=525 && mouseY>=318 && mouseY<=390 && grid4[1][1] == 4 )
      {
        rect(435,318,90,72);
        nextTurn = 4;
        grid4[1][1] = val;
        gridNotPlayable(grid4,4);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[4,5]
      else if(mouseX>=525 && mouseX<=605 && mouseY>=318 && mouseY<=390 && grid4[1][2] == 5 )
      {
        rect(525,318,80,72);
        nextTurn = 5;
        grid4[1][2] = val;
        gridNotPlayable(grid4,4);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[5,3]
      else if(mouseX>=355 && mouseX<=435 && mouseY>=390 && mouseY<=442 && grid4[2][0] == 6 )
      {
        rect(355,390,80,52);
        nextTurn = 6;
        grid4[2][0] = val;
        gridNotPlayable(grid4,4);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[5,4]
      else if(mouseX>=435 && mouseX<=525 && mouseY>=390 && mouseY<=442 && grid4[2][1] == 7 )
      {
        rect(435,390,90,52);
        nextTurn = 7;
        grid4[2][1] = val;
        gridNotPlayable(grid4,4);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[5,5]
      else if(mouseX>=525 && mouseX<=605 && mouseY>=390 && mouseY<=442 && grid4[2][2] == 8 )
      {
        rect(525,390,80,52);
        nextTurn = 8;
        grid4[2][2] = val;
        gridNotPlayable(grid4,4);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
}
void gridPressed5()
{
  /****************************************************************************************/

/*If the next grid of play is grid5, the following loop will run*/
/***************************** Grid5 ****************************************************/

  //Grid 6, Index 5, Middle Right
      //[3,6]
      if(mouseX>=675 && mouseX<=755 && mouseY<=318 && mouseY>=266 && grid5[0][0] == 0 )
      {
        rect(675,266,80,52);
        nextTurn = 0;
        grid5[0][0] = val;
        gridNotPlayable(grid5,5);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[3,7]
      else if(mouseX>=755 && mouseX<=845 && mouseY>=266 && mouseY<=318 && grid5[0][1] == 1 )
      { 
        rect(755,266,90,52);
        nextTurn = 1;
        grid5[0][1] = val;
        gridNotPlayable(grid5,5);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[3,8]
      else if(mouseX>=845 && mouseX<=925 && mouseY>=266 && mouseY<=318 && grid5[0][2] == 2 )
      {
        rect(845,266,80,52);
        nextTurn = 2;
        grid5[0][2] = val;
        gridNotPlayable(grid5,5);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //4,6]
      else if(mouseX>=675 && mouseX<=755 && mouseY>=318 && mouseY<=390 && grid5[1][0] == 3 )
      {
        rect(675,318,80,72);
        nextTurn = 3;
        grid5[1][0] = val;
        gridNotPlayable(grid5,5);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[4,7]
      else if(mouseX>=755 && mouseX<=845 && mouseY>=318 && mouseY<=390 && grid5[1][1] == 4 )
      {
        rect(755,318,90,72);
        nextTurn = 4;
        grid5[1][1] = val;
        gridNotPlayable(grid5,5);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[4,8]
      else if(mouseX>=845 && mouseX<=925 && mouseY>=318 && mouseY<=390 && grid5[1][2] == 5 )
      {
        rect(845,318,80,72);
        nextTurn = 5;
        grid5[1][2] = val;
        gridNotPlayable(grid5,5);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[5,6]
      else if(mouseX>=675 && mouseX<=755 && mouseY>=390 && mouseY<=442 && grid5[2][0] == 6 )
      {
        rect(675,390,80,52);
        nextTurn = 6;
        grid5[2][0] = val;
        gridNotPlayable(grid5,5);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[5,7]
      else if(mouseX>=755 && mouseX<=845 && mouseY>=390 && mouseY<=442 && grid5[2][1] == 7 )
      {
        rect(755,390,90,52);
        nextTurn = 7;
        grid5[2][1] = val;
        gridNotPlayable(grid5,5);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[5,8]
      else if(mouseX>=845 && mouseX<=925 && mouseY>=390 && mouseY<=442 && grid5[2][2] == 8 )
      {
        rect(845,390,80,52);
        nextTurn = 8;
        grid5[2][2] = val;
        gridNotPlayable(grid5,5);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      
}
  
void gridPressed6()
{
  /****************************************************************************************/

/*If the next grid of play is grid6, the following loop will run*/
/***************************** Grid6 ****************************************************/
  
  //Grid 6, Index 6, Bottom Left
      //[6,0]
      if(mouseX>=35 && mouseX<=115 && mouseY<=554 && mouseY>=502 && grid6[0][0] == 0 )
      {
        rect(35,502,80,52);
        nextTurn = 0;
        grid6[0][0] = val;
        gridNotPlayable(grid6,6);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[6,1]
      else if(mouseX>=115 && mouseX<=205 && mouseY>=502 && mouseY<=554 && grid6[0][1] == 1 )
      { 
        rect(115,502,90,52);
        nextTurn = 1;
        grid6[0][1] = val;
        gridNotPlayable(grid6,6);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[6,2]
      else if(mouseX>=205 && mouseX<=285 && mouseY>=502 && mouseY<=554 && grid6[0][2] == 2 )
      {
        rect(205,502,80,52);
        nextTurn = 2;
        grid6[0][2] = val;
        gridNotPlayable(grid6,6);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[7,0]
      else if(mouseX>=35 && mouseX<=115 && mouseY>=554 && mouseY<=626 && grid6[1][0] == 3 )
      {
        rect(35,554,80,72);
        nextTurn = 3;
        grid6[1][0] = val;
        gridNotPlayable(grid6,6);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[7,1]
      else if(mouseX>=115 && mouseX<=205 && mouseY>=554 && mouseY<=626 && grid6[1][1] == 4 )
      {
        rect(115,554,90,72);
        nextTurn = 4;
        grid6[1][1] = val;
        gridNotPlayable(grid6,6);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[7,2]
      else if(mouseX>=205 && mouseX<=285 && mouseY>=554 && mouseY<=626 && grid6[1][2] == 5 )
      {
        rect(205,554,80,72);
        nextTurn = 5;
        grid6[1][2] = val;
        gridNotPlayable(grid6,6);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[8,0]
      else if(mouseX>=35 && mouseX<=115 && mouseY>=626 && mouseY<=678 && grid6[2][0] == 6 )
      {
        rect(35,626,80,52);
        nextTurn = 6;
        grid6[2][0] = val;
        gridNotPlayable(grid6,6);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[8,1]
      else if(mouseX>=115 && mouseX<=205 && mouseY>=626 && mouseY<=678 && grid6[2][1] == 7 )
      {
        rect(115,626,90,52);
        nextTurn = 7;
        grid6[2][1] = val;
        gridNotPlayable(grid6,6);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[8,2]
      else if(mouseX>=205 && mouseX<=285 && mouseY>=626 && mouseY<=678 && grid6[2][2] == 8 )
      {
        rect(205,626,80,52);
        nextTurn = 8;
        grid6[2][2] = val;
        gridNotPlayable(grid6,6);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      
}

void gridPressed7()
{
  /****************************************************************************************/

/*If the next grid of play is grid7, the following loop will run*/
/***************************** Grid7 ****************************************************/
  
  //Grid 7, Index 7, Bottom Center
      //[6,3]
      if(mouseX>=355 && mouseX<=435 && mouseY<=554 && mouseY>=502 && grid7[0][0] == 0 )
      {
        rect(355,502,80,52);
        nextTurn = 0;
        grid7[0][0] = val;
        gridNotPlayable(grid7,7);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[6,4]
      else if(mouseX>=435 && mouseX<=525 && mouseY>=502 && mouseY<=554 && grid7[0][1] == 1 )
      { 
        rect(435,502,90,52);
        nextTurn = 1;
        grid7[0][1] = val;
        gridNotPlayable(grid7,7);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[6,5]
      else if(mouseX>=525 && mouseX<=605 && mouseY>=502 && mouseY<=554 && grid7[0][2] == 2 )
      {
        rect(525,502,80,52);
        nextTurn = 2;
        grid7[0][2] = val;
        gridNotPlayable(grid7,7);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[7,3]
      else if(mouseX>=355 && mouseX<=435 && mouseY>=554 && mouseY<=626 && grid7[1][0] == 3 )
      {
        rect(355,554,80,72);
        nextTurn = 3;
        grid7[1][0] = val;
        gridNotPlayable(grid7,7);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[7,4]
      else if(mouseX>=435 && mouseX<=525 && mouseY>=554 && mouseY<=626 && grid7[1][1] == 4 )
      {
        rect(435,554,90,72);
        nextTurn = 4;
        grid7[1][1] = val;
        gridNotPlayable(grid7,7);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[7,5]
      else if(mouseX>=525 && mouseX<=605 && mouseY>=554 && mouseY<=626 && grid7[1][2] == 5 )
      {
        rect(525,554,80,72);
        nextTurn = 5;
        grid7[1][2] = val;
        gridNotPlayable(grid7,7);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[8,3]
      else if(mouseX>=355 && mouseX<=435 && mouseY>=626 && mouseY<=678 && grid7[2][0] == 6 )
      {
        rect(355,626,80,52);
        nextTurn = 6;
        grid7[2][0] = val;
        gridNotPlayable(grid7,7);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[8,4]
      else if(mouseX>=435 && mouseX<=525 && mouseY>=626 && mouseY<=678 && grid7[2][1] == 7 )
      {
        rect(435,626,90,52);
        nextTurn = 7;
        grid7[2][1] = val;
        gridNotPlayable(grid7,7);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[8,5]
      else if(mouseX>=525 && mouseX<=605 && mouseY>=626 && mouseY<=678 && grid7[2][2] == 8 )
      {
        rect(525,626,80,52);
        nextTurn = 8;
        grid7[2][2] = val;
        gridNotPlayable(grid7,7);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      
}
void gridPressed8()
{
  /****************************************************************************************/

/*If the next grid of play is grid8, the following loop will run*/
/***************************** Grid8 ****************************************************/
  
  //Grid 8, Index 8, Bottom Right
      //[6,6]
      if(mouseX>=675 && mouseX<=755 && mouseY<=554 && mouseY>=502 && grid8[0][0] == 0 )
      {
        rect(675,502,80,52);
        nextTurn = 0;
        grid8[0][0] = val;
        gridNotPlayable(grid8,8);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[6,7]
      else if(mouseX>=755 && mouseX<=845 && mouseY>=502 && mouseY<=554 && grid8[0][1] == 1 )
      { 
        rect(755,502,90,52);
        nextTurn = 1;
        grid8[0][1] = val;
        gridNotPlayable(grid8,8);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[6,8]
      else if(mouseX>=845 && mouseX<=925 && mouseY>=502 && mouseY<=554 && grid8[0][2] == 2 )
      {
        rect(845,502,80,52);
        nextTurn = 2;
        grid8[0][2] = val;
        gridNotPlayable(grid8,8);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[7,6]
      else if(mouseX>=675 && mouseX<=755 && mouseY>=554 && mouseY<=626 && grid8[1][0] == 3 )
      {
        rect(675,554,80,72);
        nextTurn = 3;
        grid8[1][0] = val;
        gridNotPlayable(grid8,8);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[7,7]
      else if(mouseX>=755 && mouseX<=845 && mouseY>=554 && mouseY<=626 && grid8[1][1] == 4 )
      {
        rect(755,554,90,72);
        nextTurn = 4;
        grid8[1][1] = val;
        gridNotPlayable(grid8,8);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[7,8]
      else if(mouseX>=845 && mouseX<=925 && mouseY>=554 && mouseY<=626 && grid8[1][2] == 5 )
      {
        rect(845,554,80,72);
        nextTurn = 5;
        grid8[1][2] = val;
        gridNotPlayable(grid8,8);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[8,6]
      else if(mouseX>=675 && mouseX<=755 && mouseY>=626 && mouseY<=678 && grid8[2][0] == 6 )
      {
        rect(675,626,80,52);
        nextTurn = 6;
        grid8[2][0] = val;
        gridNotPlayable(grid8,8);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[8,7]
      else if(mouseX>=755 && mouseX<=845 && mouseY>=626 && mouseY<=678 && grid8[2][1] == 7 )
      {
        rect(755,626,90,52);
        nextTurn = 7;
        grid8[2][1] = val;
        gridNotPlayable(grid8,8);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      //[8,8]
      else if(mouseX>=845 && mouseX<=925 && mouseY>=626 && mouseY<=678 && grid8[2][2] == 8 )
      {
        rect(845,626,80,52);
        nextTurn = 8;
        grid8[2][2] = val;
        gridNotPlayable(grid8,8);
        if(!notWon[nextTurn])
          nextTurn = -1;
        switchPlayer();
      }
      
}
public void resizeSketch()
{
    size($(window).width(), $(window).height());
}


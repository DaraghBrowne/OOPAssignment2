/*
  Author: Daragh Browne

DIT OOP Assignment 2
====================
MultiplayerTanks Game
*/
ArrayList<Player> players = new ArrayList<Player>();


void setup()
{
  size(1000, 600);
}

void draw()
{
  
  int w=40;
  int h=40;
  int x_coord = width/2; // x coordination of the player
  int y_coord = height/2; // y coordination of the player
    
  fill(255);
  rect(x_coord -40 , y_coord -40 , w,h); //outer square
    
  fill(255);
  rect(x_coord - 30, y_coord-30 ,w/2,h/2); //inner square
    
  //wheels
  fill(255);
  rect(x_coord - 50 , y_coord - 50 ,w-30,h+20); //left wheel
  rect(x_coord,y_coord - 50 ,w-30,h+20); //right wheel
    
  //cannon
  fill(255);
  rect(x_coord - 25,y_coord-30,w-30,-h);
}
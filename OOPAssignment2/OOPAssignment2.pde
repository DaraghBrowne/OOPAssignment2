/*
  Author: Daragh Browne

DIT OOP Assignment 2
====================
MultiplayerTanks Game
*/
ArrayList<Player> players = new ArrayList<Player>();

Player p = new Player(color(random(0,255)));

void setup()
{
  size(1000, 600);
  
}

void draw()
{
  background(0);
  
  p.display();
}
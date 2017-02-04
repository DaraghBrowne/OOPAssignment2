/*
Author: Daragh Browne

DIT OOP Assignment 2
====================
MultiplayerTanks Game
*/
ArrayList<Player> players = new ArrayList<Player>();

Player p = new Player(color(0,255,40));

void setup()
{
  size(1000, 600);
  
}

boolean[] keys = new boolean[1000];

void keyPressed()
{ 
 keys[keyCode] = true;
}

void keyReleased()
{
 keys[keyCode] = false; 
}

boolean checkKey(int k)
{
 if (keys.length >= k) 
 {
   return keys[k] || keys[Character.toUpperCase(k)];  
 }
 return false;
}


void draw()
{
  background(0);
  
  p.update();
  p.display();
}
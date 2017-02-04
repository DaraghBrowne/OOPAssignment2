/*
Author: Daragh Browne

DIT OOP Assignment 2
====================
MultiplayerTanks Game
*/
ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

Player p = new Player(color(0,255,40));

void setup()
{
  size(1000, 600);
  
  
  //create the number of enemies
  for(int i= 0 ; i < 15; i++)
  {
    Enemy enemy = new Enemy(random(20,40),random(20,40),random(100 ,width),random(height/2,height));
    players.add(enemy); //  draws the enemy objects
    enemies.add(enemy);
    
  }//end for loop
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
  
  for(int i =0 ; i < players.size(); i++)
    {
      players.get(i).update();
      players.get(i).display();
    }//end for loop
}
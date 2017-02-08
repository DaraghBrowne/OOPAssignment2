/*
Author: Daragh Browne
 
 DIT OOP Assignment 2
 ====================
 MultiplayerTanks Game
 */
ArrayList<Player> players = new ArrayList<Player>();
ArrayList<Enemy> enemies = new ArrayList<Enemy>();

Player p = new Player(color(0, 255, 40));

//insert background images
PImage startScreen;
boolean begin = false;

int score; // keeps track of the score 
int counter = 1;
int bulletsUsed = 0;


void setup()
{
  size(1000, 600);
  score = 0;


  startScreen = loadImage("startScreen.jpg"); // start game background

  //create the number of enemies
  for (int i= 0; i < 25; i++)
  {
    //i amount of enemies spawned with a random size between a certain range and spawning at random location on x and y axis
    Enemy enemy = new Enemy(random(20, 40), random(20, 40), random(0, width), random(0, height));
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
  //start background image
  image(startScreen, 0, 0, width, height);
  PFont f = createFont("Stencil", 20); //Create Font;
  textFont(f);
  
  textSize(100);
  fill(0);
  text("TANKS",width/3*2,100);
  textSize(20);
  text("Dodge the moving Enemies AND Shoot them",width/3*2-120,150);
    
  text("Press [spacebar] to start the game", width/3*2-120,220);
  textSize(50);
  text("CONTROLS", width/3*2,350);
  textSize(20);
  text("W(up), S(down), A(left), D(right)",width/3*2 - 40,425);
  text("E to shoot",width/3*2 - 40,450);
  
  
  if (key == ' ')
  {
    begin = true;
  }

  if (begin == true) // executes everything if the begin boolean is true
  {
    background(0);

    p.update();
    p.display();

    textFont(f);
    text("Score: " + score, 10, 20);

    for (int i =0; i < players.size(); i++)
    {
      players.get(i).update();
      players.get(i).display();
    }//end for loop
  }
  
  if (score == 250)
  { 
    counter = 1;
    
  }
  
  if(counter == 1)
  {
    textSize(100);
    background(0);
    fill(255);
    text("YOU WIN!", width/2-200,  height/3);
    textSize(40);
    text("Press z to play again", width/2 - 200, height/2 + 60);
    text("Your Score is: " + score, width/2 - 140, height/2 + 150);
    text("You used: " + bulletsUsed + " bullets", width/2 - 190, height/2 + 220);
          
    if(keyPressed && key == 'z') // If the player wants to play again
    {
      //resets everything
      begin = true;
      counter = 0; 
      score = 0;
      bulletsUsed = 0;
    }
  }
}
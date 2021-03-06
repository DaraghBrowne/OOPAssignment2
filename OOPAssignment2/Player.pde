class Player
{
  PVector pos; // controls the position of the objects

  float w, h; // width and height of th player
  float theta;
  color colour;//The colour of the tank being passed in as a parameter

  float trackTime = 1.0f / 60.0f;
  float fireRate = 10.0f; // how fast each bullet is fired
  float passBy = 0.0f; // how many bullets has passed by
  float toPass =  1.0f / fireRate;

  int speed;
  int x_coord; // x coordination of the player
  int y_coord; // y coordinationd of the player


  boolean live;  // to see if the bullet will live or not

  Player()
  {
    pos = new PVector(width / 2, height / 2); // determines the position of everything
  }
  Player(color colour)
  {
    this();
    this.colour = colour;

    speed = 15;
    theta= 0 ;
    w=40;
    h=40;
    x_coord = 40;
    y_coord = 40;
  }

  void display()
  {
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(theta);

    fill(255);
    rect(x_coord -40, y_coord -40, w, h); //outer square

    rect(x_coord - 30, y_coord-30, w/2, h/2); //inner square

    //wheels
    rect(x_coord - 50, y_coord - 50, w-30, h+20); //left wheel
    rect(x_coord, y_coord - 50, w-30, h+20); //right wheel

    //cannon
    fill(colour);
    rect(x_coord - 25, y_coord-30, w-30, -h);
    popMatrix();
  }

  void update()
  {
    float lx, ly;
    passBy += trackTime;

    lx = sin(theta);
    ly = -cos(theta);


    if (checkKey('w'))
    {
      pos.x += lx * speed;
      pos.y += ly * speed;
    }
    if (checkKey('s'))
    {
      pos.x -= lx * speed;
      pos.y -= ly * speed;
    }
    if (checkKey('a'))
    {
      theta -= 0.2f;
    }
    if (checkKey('d'))
    {
      theta += 0.2f;
    }
    if (checkKey('e'))
    {
      if (passBy > toPass)
      {
        Bullet bullet = new Bullet(); // creates the Bullet 
        bullet.pos.x = pos.x; // uses the player's x position
        bullet.pos.y = pos.y; // uses the player's y position
        bullet.theta = theta;
        players.add(bullet); 
        passBy = 0.0f; // resets the bullets that has passed by
        bulletsUsed++;
      }
    }
  }
  
  // determines if there is collision between the player and the enemy
  boolean collides(Player p) 
  {
     //check if they dont collide
    if (p.pos.x + p.w < pos.x) // to check the x axis of the player if it hits an enemy
    {
      return false;
    }
    if (p.pos.x > pos.x + w) // to check the x axis of the player if it hits an enemy
    {
      return false;
    }
    if (p.pos.y > pos.y + h) // to check the y axis of the player if it hits the enemy
    {
      return false;
    }
    if (p.pos.y + p.h < pos.y) // to check the y axis of the player if it hits the enemy
    {
      return false;
    }
    
    // If they collided then its true
    return true;
    
    
  }//end boolean
}
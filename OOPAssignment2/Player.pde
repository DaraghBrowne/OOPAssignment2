class Player
{
  PVector pos; // controls the position of the objects
  
  float w,h; // width and height of th player
  float theta;
  color colour;
  
  int speed;
  int x_coord; // x coordination of the player
  int y_coord; // y coordination of the player
  
   Player()
  {
    pos = new PVector(width / 2, height / 2); // determines the position of everything
  }
   Player(color colour)
  {
    this();
    this.colour = colour;
    
    speed = 10;
    theta= 0 ;
    w=40;
    h=40;
    x_coord = 200;
    y_coord = 400;
  }
  
  void display()
  {
    pushMatrix();
    translate(pos.x,pos.y);
    fill(255);
    rect(x_coord -40 , y_coord -40 , w,h); //outer square
      
    fill(255);
    rect(x_coord - 30, y_coord-30 ,w/2,h/2); //inner square
      
    //wheels
    fill(255);
    rect(x_coord - 50 , y_coord - 50 ,w-30,h+20); //left wheel
    rect(x_coord,y_coord - 50 ,w-30,h+20); //right wheel
      
    //cannon
    fill(colour);
    rect(x_coord - 25,y_coord-30,w-30,-h);
    popMatrix();
  }
  
  void update()
  {
   float lx, ly;
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
     theta -= 0.1f;
   }
   if (checkKey('d'))
   {
     theta += 0.1f;
   }
  }
}
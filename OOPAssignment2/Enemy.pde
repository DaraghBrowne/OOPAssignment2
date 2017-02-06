class Enemy extends Player
{
  float w,h;
  float x,y;
  
  float movementX = 0.1f; // to move the enemies' X- axis
  float movementY = 0.2f; // to move the enemies' Y- axis
  
  Enemy(float w, float h, float x, float y)
  {
    this.w = w;
    this.h = h;//this width and height for size of enemy
    
    pos.x = x; // random positions on x axis
    pos.y = y; // random positions on y axis
  }
  
  void update()
  {
    
  }
  
  void display()
  {
    stroke(255);
    
    //Allows the Enemies to move and to bounce back from the edge of the screen
    for(int i=0; i < enemies.size(); i ++)
    {
      if(pos.x > width - w || pos.x < 0)
      {
        movementX = -movementX; // this makes the enemies bounce back when it hits the width
      }
      
      if(pos.y > height - h || pos.y < 0)
      {
        movementY = -movementY; //this makes the enemies bounce back when it hits the height
      }
      
      pos.x += movementX; // this makes the enemies move
      pos.y += movementY; // this makes the enemies move
      
      
    }//end for loop
    
    
    // draws the enemy
    fill(0,120,250); // colour blue
    rect(pos.x,pos.y , w, h); 
    fill(0,255,255);
    stroke(0);
    rect(pos.x + 5, pos.y +5, 4,2); // left eye of the enemy
    rect(pos.x + 12, pos.y +5 , 4,2); // right eye of the enemy
    rect(pos.x + 5 , pos. y + 15, 10, 4); // mouth of the enemy
    
  }  
  
  
}
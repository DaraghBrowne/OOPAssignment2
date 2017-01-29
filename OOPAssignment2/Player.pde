class Player
{
  float w,h; // width and height of th player
  float theta;
  
  int x_coord; // x coordination of the player
  int y_coord; // y coordination of the player
  
   Player()
  {
    
  }
   Player(int x_coord, int y_coord)
  {
    this();
    this.x_coord = x_coord;
    this.y_coord = y_coord;
    
    theta= 0 ;
    w=40;
    h=40;
  }
}
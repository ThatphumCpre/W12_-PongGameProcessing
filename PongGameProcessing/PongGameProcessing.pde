void setup() {
  size(700, 700);
}
void draw() {
  background(40);
}

class Ball {
  float positionX, positionY, size, speedX, speedY; 

  Ball(int sizeInput) {}    
  void drawBall() {}               //Draw the ball 
  void move() {}                   //Move the ball 
  float getPositionX() {return 0.0;}          //Get positionX of ball 
  float getPositionY() {return 0.0;}          //Get positionY of ball
  void setPositionX(int x) {}      //Set positionX of ball 
  void setPositionY(int y) {}      //Set positionY of ball
  void setSpeedX(float factor) {}  //Multiply Speed of ball by input 
  void defaultSet(){}              //Set Ball to Start point
}


class Paddle {
  int positionY, positionX, score;  //collect position and player score
  Ball objectBall;  //collect object from Class Ball

  Paddle(Ball bounceBall, int x, int y) {}  //collect Ball object that want to
  void bounce() {}                 //Make target Ball bounce
  void drawPaddle() {}             //Draw Paddle 
  int getPositionY() {return 0;}            //Get positionY of paddle 
  void addPositionY(int adder) {}  //Add value to position to move paddle 
  int getScore() {return 0;}                //Get score from player 
  void addScore() {}               //Add 1 score to player 
}

class PongGame {
  Paddle player1;  //Set player1,2 as  object of Paddle
  Paddle player2;
  Ball pongBall;   //Set pongBall as object of Ball
  int pastMouse;   //Variable of the values of past mouse

  PongGame() {}
  void drawPongGame() {}        //Use to draw the game 
  void update() {}              //Use to update anything in game 
  void serveBall(int factor) {} //Put factor or side to serve the ball  

}

PongGame game;
void setup() {
  size(700, 700);
  game = new PongGame();
}
void draw() {
  background(40);
  game.drawPongGame();
  game.update();
}

class Ball {
  float positionX, positionY, size, speedX, speedY; 

  Ball(int sizeInput) {
    positionX = width/2;  //set position at Center
    positionY = height/2;
    size = sizeInput;     //set size
    speedX = -2;          //set  speed
    speedY = -3;
  }    

  void drawBall() {
    ellipse(positionX, positionY, size, size);
  }         

  void move() {
    positionX += speedX;  //update position from speed
    positionY += speedY;
    if (positionY < 0  || positionY > height) { //bounce on Top
      speedY *= -1;    //invert speed
    }
  }      

  float getPositionX() {
    return 0.0;
  }          //Get positionX of ball 
  float getPositionY() {
    return 0.0;
  }          //Get positionY of ball
  void setPositionX(int x) {
  }      //Set positionX of ball 
  void setPositionY(int y) {
  }      //Set positionY of ball
  void setSpeedX(float factor) {
    speedX = factor*speedX; //multiply speed by factor
  } 
  void defaultSet() {
  }              //Set Ball to Start point
}


class Paddle {
  int positionY, positionX, score;  //collect position and player score
  Ball objectBall;  //collect object from Class Ball

  Paddle(Ball bounceBall, int x, int y) {
    objectBall = bounceBall;   //collected ball class
    positionX=x;  //set position
    positionY=y;
    score = 0;    //start score for each player
  } 
  void bounce() {
    if ( positionX+50 > objectBall.getPositionX()  && positionY < objectBall.getPositionY() && positionY+200 > objectBall.getPositionY() && positionX < objectBall.getPositionX() ) {
      objectBall.setSpeedX(-1.5);
    }
  }                
  void drawPaddle() {
    rect(positionX, positionY, 50, 200);  //draw a Paddle
  }            
  int getPositionY() {
    return 0;
  }            //Get positionY of paddle 
  void addPositionY(int adder) {
    positionY += adder ;     //add to move position
  }  
  int getScore() {
    return 0;
  }                //Get score from player 
  void addScore() {
  }               //Add 1 score to player
}

class PongGame {
  Paddle player1;  //Set player1,2 as  object of Paddle
  Paddle player2;
  Ball pongBall;   //Set pongBall as object of Ball
  int pastMouse;   //Variable of the values of past mouse

  PongGame() {
    pongBall = new Ball(70);  //Instance Ball that size 70
    player1 = new Paddle(pongBall, 0, 0);           //instance player 1
    player2 = new Paddle(pongBall, width-50, 0);    //instance player 2
    pastMouse = 0;
  }
  void drawPongGame() {
    pongBall.drawBall();      //Draw PongBall
    player1.drawPaddle();                           //draw player1 Paddle
    player2.drawPaddle();                           //draw player2 Paddle
  }        
  void update() {
    pongBall.move();         //Move the Ball
    if ( mousePressed) {                         //if mouse press
      if (mouseX < width/2) {                   //and player 1 zone move player'1Paddle
        player1.addPositionY(mouseY-pastMouse);
      } else {
        player2.addPositionY(mouseY-pastMouse);  //if player 2 zone move player'2 Paddle
      }
    }

    player2.bounce();        //bounce player2 Paddle when ball on player2 side

    player1.bounce();        //bounce player1 Paddle when ball on player2 side

    pastMouse = mouseY;      //collect position of mouse
  }              
  void serveBall(int factor) {
  } //Put factor or side to serve the ball
}

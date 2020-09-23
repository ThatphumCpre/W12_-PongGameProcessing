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
    return  positionX;
  }           

  float getPositionY() {
    return positionY;
  }         

  void setPositionX(int x) {
    positionX = x;
  }      

  void setPositionY(int y) {
    positionY = y;
  }      

  void setSpeedX(float factor) {
    speedX = factor*speedX; //multiply speed by factor
  } 

  void defaultSet() {
    positionX = width/2;
    positionY = height/2;
    speedX = -random(3, 5); //Set Ball to Start point
    speedY = -random(3, 5);
  }
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
      println("Active");
    }
  }         

  void drawPaddle() {
    rect(positionX, positionY, 50, 200);  //draw a Paddle
  }            

  int getPositionY() {
    return positionY;  //return positionX
  }       

  void addPositionY(int adder) {
    positionY += adder ;     //add to move position
  }  

  int getScore() {
    return score; //Get score from player
  }       

  void addScore() {
    score += 1;  //Add 1 score to player
  }
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
    textSize(54);
    text(player1.getScore(), width/4, height/8);    //draw player  1 score
    text(player2.getScore(), width*3/4, height/8);  //draw player  2 score
    rect(width/2, 0, 10, height);                   //draw center line
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
    
    
    if (pongBall.getPositionX() > width/2) { //if in player2 side 
      player2.bounce();        //bounce player2 Paddle when ball on player2 side
    } else {
      player1.bounce();        //bounce player1 Paddle when ball on player2 side
    }
    
    
    if (pongBall.getPositionX() < 0) {    //if over the edge then plus the score
      player2.addScore();    //add score to player2
      serveBall(1);         //serveballto left side
    } 
    else if  (pongBall.getPositionX() > width)
    {
      player1.addScore();    //add score to player1
      serveBall(-1);          //serve to right side
    }
    
    pastMouse = mouseY;      //collect position of mouse
  }              
  
  void serveBall(int factor) {
    pongBall.setPositionX(width/2);         //set PongBall to center
    pongBall.setPositionY(height/2);
    pongBall.defaultSet();                  //set to default speed
    pongBall.setSpeedX(factor);           //set direction to factor
  }
}

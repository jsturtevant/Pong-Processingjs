float BallX=300;
float BallY=300;
float SpeedX=3;
float SpeedY=3;
float SizeX=600;
float SizeY=400;
float MovePaddleRight= 200;
float MovePaddleAI=200;
float PaddleSpeed=10;
float AIPoints=0;
float RightPoints=0;
bool KeyRightUpPressed = false;
bool KeyRightDownPressed = false;
//end of variables

var UpdateScore = function (LeftScore, RightScore){
	  document.getElementById('LeftPoints').innerHTML = LeftScore;
	  document.getElementById('RightPoints').innerHTML = RightScore;

};

void setup()  {
print("Hello!");
size(SizeX, SizeY);
background (100);
ellipse (BallX, BallY, 15, 15);
}

void draw()  {
	//Make ball, paddles and background
	background (100);
	ellipse (BallX, BallY, 15, 15);
	BallX=BallX+SpeedX;
	BallY=BallY+SpeedY;
	rect(540, MovePaddleRight, 10, 50);
	rect(50, MovePaddleAI, 10, 50);
	rect(300, 0, 5, 400);
	//Move paddles
	if (KeyRightUpPressed == true)
	{
	MovePaddleRight= MovePaddleRight - PaddleSpeed;
		if (MovePaddleRight <= 0)
		{
		MovePaddleRight = 0;
		}
	}
	if (KeyRightDownPressed == true)
	{
		MovePaddleRight = MovePaddleRight + PaddleSpeed;
		if (MovePaddleRight >= SizeY - 50)
		{
		MovePaddleRight = SizeY - 50;
		}
	}
	//AI paddle
	if (MovePaddleAI <= BallY)
	{
		MovePaddleAI = MovePaddleAI + 2;
	}
		if (MovePaddleAI >= BallY)
	{
		MovePaddleAI = MovePaddleAI - 2;
	}
	
	//Bounce ball off sides
	if (BallX>=SizeX || BallX<=0)
	{
		SpeedX=SpeedX*-1;
	}
	if (BallY>=SizeY || BallY<=0)
	{
		SpeedY=SpeedY*-1;
	}
	
	//Bounce ball off of paddles
	if (BallY >=MovePaddleRight && BallY <= MovePaddleRight + 51 && BallX == 540)
	{
		SpeedX = SpeedX * -1;
	}
	if (BallY >=MovePaddleAI && BallY <= MovePaddleAI + 51 && BallX == 60)
	{
		SpeedX = SpeedX * -1;
	}
	//send back ball to middle when reaches goal.
	if (BallX == 0)
	{
	BallX = 300;
	BallY = 100;
	SpeedY = SpeedY * -1;
	SpeedX = SpeedX * -1;
	RightPoints = RightPoints + 1;
	}
		if (BallX == SizeX)
	{
	BallX = 300;
	BallY = 100;
	SpeedY = SpeedY * -1;
	SpeedX = SpeedX * -1;
	AIPoints = AIPoints + 1;
	}
	UpdateScore(AIPoints, RightPoints);
}	
//end of draw

void keyPressed()
{
//Move right paddle
  if (key == CODED) {

    if (keyCode == UP) 
	{
		KeyRightUpPressed = true;
		

    } else if (keyCode == DOWN) 
	{
		KeyRightDownPressed = true;
		
    } 

  } 
//move left paddle


}
//end of keyPressed

void keyReleased()
{
//Move right paddle
  if (key == CODED) {

    if (keyCode == UP) 
	{
		KeyRightUpPressed = false;
		

    } else if (keyCode == DOWN) 
	{
		KeyRightDownPressed = false;
		
    } 

  } 



}
//end of keyReleased


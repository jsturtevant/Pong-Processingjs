float x=30;
float y=30;
float SpeedX=2;
float SpeedY=5;
float SizeX=650;
float SizeY=500;

void setup()  {
size(SizeX, SizeY);
background (100);
ellipse (x, y, 15, 15);
}

void draw()  {
	background (100);
	ellipse (x, y, 15, 15);
	x=x+SpeedX;
	y=y+SpeedY;
	
	if (x>SizeX || x<=0)
	{
		SpeedX=SpeedX*-1;
	}
	
	
	if (y>=SizeY || y<=0)
	{
		SpeedY=SpeedY*-1;
	}
	
}
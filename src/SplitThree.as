//Split3   ///////////////
// split 3way shot
/////////////////////////

class SplitThree extends Shot
{
	// PROPERTIES ////////////////////
	private var reloadTime:Number = 6;
	private var power:Number = 1;
	private var pos:Number;
	//	[2]
	//[1] [3]
	// CONSTRUCTOR ///////////////////
	function SplitThree()
	{
		onEnterFrame = checkHeight;
	}
	
	// MEATHODS //////////////////////
	public function updatePosition():Void
	{
		switch(pos)
		{
			case 1:
				_y-=speed*.8;
				_x-=speed*.4
				break;
			case 2:
				_y-=speed;
				break;
			case 3:
				_y-=speed*.8;
				_x+=speed*.4
				break;
		}
	}
}
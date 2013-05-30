//Split5   ///////////////
// split 3way shot
/////////////////////////

class SplitFive extends Shot
{
	// PROPERTIES ////////////////////
	private var reloadTime:Number = 8;
	private var power:Number = 1;
	private var pos:Number;
	//	[2]
	//[1] [3]
	// CONSTRUCTOR ///////////////////
	function SplitFive()
	{
		onEnterFrame = checkHeight;
	}
	
	// MEATHODS //////////////////////
	public function updatePosition():Void
	{
		switch(pos)
		{
			case 1:
				_y-=speed*.5;
				_x-=speed*.5
				break;
			case 2:
				_y-=speed*.8;
				_x-=speed*.4
				break;
			case 3:
				_y-=speed;
				break;
			case 4:
				_y-=speed*.8;
				_x+=speed*.4
				break;
			case 5:
				_y-=speed*.5;
				_x+=speed*.5
				break;
		}
	}
}
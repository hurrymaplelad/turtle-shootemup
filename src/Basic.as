// BASIC   ///////////////
// ship's default weapon
/////////////////////////

class Basic extends Shot
{
	// PROPERTIES ////////////////////
	
	// CONSTRUCTOR ///////////////////
	function Basic()
	{
		onEnterFrame = checkHeight;
	}
	
	// MEATHODS //////////////////////
	public function updatePosition():Void
	{
		_y-=speed;
	}
}
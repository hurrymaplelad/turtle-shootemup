// Rocket //////////
class Rocket extends Shot
{
	//PROPERTIES ////////////
	private var t:Number = 0;
	private var power:Number = 5;
	private var reloadTime:Number = 12;
	private var explosion:String = "gFieryExplosion";
	// CONSTRUCTOR ////////////////
	function Rocket()
	{
		onEnterFrame = checkHeight;
	}
	// MEATHODS ////////////////////
	public function updatePosition():Void
	{
		t++
		_y-=(t*t)/10+3
	}
}
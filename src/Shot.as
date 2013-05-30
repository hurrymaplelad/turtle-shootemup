/*/ Shot /////////////////
-basic projectile
//////////////////////////*/
class Shot extends MovieClip
{
	// PROPERTIES ////////////////////
	private var speed:Number = 13;
	// _y value above which the clip will be removed(smaller is higher)
	private var maxHeight:Number = -25;
	private var power:Number = 1;
	private var reloadTime:Number = 5;
	private var explosion:String = "gBasicExplosion";
	
	// CONSTRUCTOR ///////////////////
	function Shot()
	{
		onEnterFrame = checkHeight;
	}
	
	// MEATHODS //////////////////////
	public function hit():Void
	{
		var depth:Number = _root.increaseExplosionDepth();
		_root.attachMovie(explosion,explosion+depth,depth,{_x:this._x,_y:this._y})
		this.removeMovieClip();
	}
	public function updatePosition():Void
	{
		_y-=speed;
	}
	private function checkHeight():Void
	{
		if(_y<maxHeight)
		{
			this.removeMovieClip()
		}
	}
	public function getPower():Number
	{
		return(power);
	}
	public function getReloadTime():Number
	{
		return(reloadTime);
	}
}
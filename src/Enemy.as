// Enemy //////////////////////
// - basic enemy class
////////////////////////////////
class Enemy extends MovieClip
{
	// Properties ///////////////
		//behavior - array of actions to follow
	private var behaviorList:Array;
	private var currentBehavior:Number = 0;
	private var speed:Number;
	private var xOffset:Number;
	private var health:Number;
	private var explosion:String = "gFieryExplosion";
	private var	t:Number = 0;
	private var	angle:Number = 3*Math.PI/2;
	
	// Constructor //////////////
	// use initObeject in attachMovie
	// inlude 	{xOffset:Number
	//			_y:Number
	//			behaviorList:Array}
	function Enemy() 
	{
	}
	
	// Meathods //////////////////
	public function hit(damage:Number):Void
	{
		health -= damage;
		if(health<=0)
		{
			var depth:Number = _root.increaseExplosionDepth();
			_root.attachMovie(explosion,explosion+depth,depth,{_x:this._x,_y:this._y})
			this.removeMovieClip();
		}
	}
	public function updatePosition():Void
	{
		var oldX=_x;
		var oldY=_y;
		t++;
		switch(behaviorList[currentBehavior].valueOf())
		{
			case 1:
				_y+=speed
				_x = xOffset
				break;
			case 2:
				_y+=speed*.6;
				_x = xOffset + 300*Math.sin(_y/70)
				break;
			case 3:
				_y+=speed*.4;
				_x = 350+xOffset - 350*Math.sin(_y/30)
				break;
			case 4:
				_x += speed
				var u = _x-250;
				_y=((u*u*u)-(u*u))/10000+200
				break;
			case 5:
				if(t<30){
					_y+=speed;
					_x = xOffset;
					}
				else{
					if(t%10==0){angle+=Math.PI/2;}
				_x+=speed*Math.cos(angle);
				_y-=speed*Math.sin(angle);
				}
				break;
			case 6:
				angle+=t/1000
				_x+=speed*Math.cos(angle);
				_y-=speed*Math.sin(angle);
				break;
			case 'die':
				this.removeMovieClip()
				break;
			default:
				trace("unknown behavior:"+behaviorList[currentBehavior]);
				this.removeMovieClip()
				break;
		}
		var changeX = (_x-oldX);
		var changeY = (oldY-_y);
		this._rotation=180*Math.atan(changeX/changeY)/Math.PI;
		if(_y>Stage.height)
		{
			currentBehavior++;
			_y = -50
		}
	}
}
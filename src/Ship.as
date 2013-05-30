/*/  Ship ////////////////////
the player controlled ship in space shooter
///////////////////////////*/
class Ship extends MovieClip
{
	//// Properites /////////////
	static var acceleration:Number =4;
	static var deceleration:Number = .77
	static var maxSpeed:Number = 11;
	private var xSpeed:Number = 0;
	private var ySpeed:Number = 0;
	private var weapon:String;
	private var reloadCountdown:Number = 0;
	private var reloadTime:Number;
	// Constructor ////////////
	function Ship()
	{
		_x = (Stage.width/2)-(this._width/2);
		_y = Stage.height-25;
		switchWeapon("Basic")
	}
	///////////////////////////
	// Meathods ///////////////
	///////////////////////////
	public function switchWeapon(newWeapon:String):Void
	{
		weapon = newWeapon;
	}
	public function shoot(depth:Number):Array
	{
		var instanceName:String;
		var names:Array=[];
		var hShot:MovieClip;
		if(reloadCountdown<=0)
		{
			switch(weapon)
			{
				case "Basic":
					var shotX = this._x + _width/2;
					var shotY = this._y - _height;
					instanceName = weapon+depth;
					names.push(instanceName);
					hShot = _root.attachMovie("g"+weapon,instanceName,depth,{_x:shotX, _y:shotY});
				break;
				case "SplitThree":
					var shotX = this._x + _width/2;
					var shotY = this._y - _height;
					var i=1;
					for(i=1;i<=3;i++)
					{
					var ndepth = _root.increaseShotDepth()
					hShot= _root.attachMovie("g"+weapon,weapon+ndepth,ndepth,{_x:shotX, _y:shotY, pos:i});
					names.push(weapon+ndepth);
					}
				break;
				case "SplitFive":
					var shotX = this._x + _width/2;
					var shotY = this._y - _height;
					var i=1;
					for(i=1;i<=5;i++)
					{
					var ndepth = _root.increaseShotDepth()
					hShot= _root.attachMovie("g"+weapon,weapon+ndepth,ndepth,{_x:shotX, _y:shotY, pos:i});
					names.push(weapon+ndepth);
					}
				break;
				case "Rocket":
					var shotX = this._x + _width/2;
					var shotY = this._y - _height;
					instanceName = weapon+depth;
					names.push(instanceName);
					hShot = _root.attachMovie("g"+weapon,instanceName,depth,{_x:shotX, _y:shotY});
				break;
			}
			reloadTime = hShot.getReloadTime();
			reloadCountdown = reloadTime;
			return(names);
		}
	}
	public function thrust(angle:Number):Void
	{
		var newXSpeed = xSpeed+acceleration*Math.cos(angle);
		if (Math.abs(newXSpeed)>maxSpeed)
		{
			xSpeed = Math.abs(newXSpeed)/newXSpeed*maxSpeed;
		} else
		{
			xSpeed = newXSpeed;
		}
		var newYSpeed = ySpeed-acceleration*Math.sin(angle);
		if (Math.abs(newYSpeed)>maxSpeed)
		{
			ySpeed = Math.abs(newYSpeed)/newYSpeed*maxSpeed;
		} else
		{
			ySpeed = newYSpeed;
		}
	}
	public function decelerate():Void
	{
		ySpeed *= deceleration;
		if(Math.abs(ySpeed)<.05)
		{
			ySpeed = 0;
		}
		xSpeed *= deceleration;
		if(Math.abs(xSpeed)<.05)
		{
			xSpeed = 0;
		}
		
	}
		
	public function updatePosition():Void
	{
		_x += xSpeed;
		_y += ySpeed;
		// Check bounds//////
		if(_x<0){_x=0;}
		if(_x+_width>Stage.width){_x=Stage.width-_width;}
		if(_y-_height<0){_y=_height;}
		if(_y>Stage.height){_y=Stage.height;}
		// reload
		if(reloadCountdown>0)
		{
		reloadCountdown--;
		}
	}
	// GETTER/SETTERs //////////////////
	public function getReloadTime():Number
	{
		return(reloadTime);
	}
	public function getReloadCountdown():Number
	{
		return(reloadCountdown);
	}
}

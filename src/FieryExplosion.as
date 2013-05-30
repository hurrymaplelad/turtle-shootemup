class FieryExplosion extends MovieClip
{
	private var maxDepth:Number;
	private var nParticles:Number = 25;
	private var aParticles:Array = [];
	function FieryExplosion()
	{
		onEnterFrame = updatePosition
		this._visible = false;
		maxDepth = _root.increaseExplosionDepth(nParticles);
		var i = 0;
		for(i=0;i<nParticles;i++){
			var depth:Number = maxDepth-i;
			if(depth<=2001){
				depth+=298
			}
			var newX:Number = _x
			var newY:Number = _y
			var newSpeed:Number = Math.random()*5+6;
			var newAngle:Number = Math.random()*2*Math.PI;
			var newLife:Number = Math.random()*8+5
			aParticles.push(_root.attachMovie("fireyExplosionTop","fieryExplosionTop"+depth,depth,{_x:newX,_y:newY,speed:newSpeed,angle:newAngle,life:newLife}));
		}
	}
	public function updatePosition():Void
	{
		if(aParticles.length<=0)
		{
			this.removeMovieClip()
		}
		var i = 0;
		for(i=0;i<(nParticles);i++){
			aParticles[i].life--
			if(aParticles[i].life<=0)
			{
				aParticles[i].removeMovieClip()
				aParticles.splice(i,1)
			}
			aParticles[i].speed-=.8
			aParticles[i]._x += Math.cos(aParticles[i].angle)*aParticles[i].speed;
			aParticles[i]._y += Math.sin(aParticles[i].angle)*aParticles[i].speed;
		}
	}
}
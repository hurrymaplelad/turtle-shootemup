// Level UI /////////////////
class LevelUI
{
	// PROPERTIES //////////////
	private var scoreField:TextField;
		// reload bar 
	private var gReloadBar:MovieClip;
	private var reloadBarMaxHeight:Number;
	private var UIweapons:Array = [];
	// CONSTRUCTOR //////////
	function LevelUI()
	{
		scoreField.text=_global.score;
		reloadBarMaxHeight = gReloadBar.bar._height
		setUIweapons(["Basic","SplitThree","SplitFive","Rocket"]);
	}
	public function updateUI():Void
	{
		// update reload bar
		var reCountdown:Number = _root[_global.user].getReloadCountdown()
		var reTime:Number = _root[_global.user].getReloadTime()
		gReloadBar.bar._height=reloadBarMaxHeight*((reTime-reCountdown)/reTime);
	}
	public function setUIweapons(newSettings:Array):Void
	{
		var i:Number;
		UIweapons = newSettings
		for(i=0;i<newSettings.length;i++)
		{
			this["UIweapon"+(i+1)].gotoAndStop(newSettings[i]);
		}
	}
	public function switchUIweapon(weaponKey:Number)
	{
		_root[_global.user].switchWeapon(UIweapons[(weaponKey-1)]);
	}
}
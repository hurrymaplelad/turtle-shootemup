// LEVEL //////////
class Level
{
	// Properties //////////////
	private var currentLevel:String = "OuterSpace";
	private var currentWave:Number = 0;
	private var enemyDepthCounter:Number = 1900;
	// Constructor /////////////
	function Level()
	{
	}
	
	// Levels ////////////////
	//  level[wave][enemy] = {style,x,y,behavior[]}
	private var OuterSpace:Array = [
[{style:'eTie',xOffset:100,startY:-50,behavior:[2,'die']}
,{style:'eTie',xOffset:100,startY:-100,behavior:[2,'die']}
,{style:'eTie',xOffset:100,startY:-150,behavior:[2,'die']}
,{style:'eTie',xOffset:100,startY:-200,behavior:[2,'die']}
,{style:'eTie',xOffset:100,startY:-250,behavior:[2,'die']}
,{style:'eTie',xOffset:100,startY:-300,behavior:[2,'die']}
,{style:'eTie',xOffset:100,startY:-350,behavior:[2,'die']}
,{style:'eTie',xOffset:100,startY:-400,behavior:[2,'die']}
]
,[{style:'eTri',xOffset:125,startY:-50,behavior:[1,'die']}
,{style:'eTri',xOffset:400,startY:-50,behavior:[1,'die']}
]
,[{style:'eSpinner',xOffset:0,startY:-50,behavior:[3,4,'die']}
,{style:'eSpinner',xOffset:0,startY:-100,behavior:[3,4,'die']}
,{style:'eSpinner',xOffset:0,startY:-150,behavior:[3,4,'die']}
,{style:'eTie',xOffset:0,startY:-25,behavior:[2,'die']}
,{style:'eTie',xOffset:0,startY:-150,behavior:[2,'die']}
]
,[{style:'eTri',xOffset:100,startY:-125,behavior:[1,'die']}
,{style:'eTri',xOffset:175,startY:-100,behavior:[1,'die']}
,{style:'eTri',xOffset:250,startY:-75,behavior:[1,'die']}
,{style:'eTri',xOffset:325,startY:-100,behavior:[1,'die']}
,{style:'eTri',xOffset:400,startY:-125,behavior:[1,'die']}
]
]
	
	// Meathods /////////
	public function nextWave():Array
	{
		var enemyList:Array = this[currentLevel][currentWave];
		var enemyInstanceNames:Array = new Array();
		var i:Number;
		for(i=0;i<enemyList.length;i++)
		{
			var depth = increaseEnemyDepth();
			var style = enemyList[i].style;
			enemyInstanceNames.push(style+depth);
			_root.attachMovie(style,style+depth,depth,{xOffset:enemyList[i].xOffset,_y:enemyList[i].startY,behaviorList:enemyList[i].behavior})
		}
		currentWave++
		return(enemyInstanceNames);
	}

	private function increaseEnemyDepth():Number
	{
		enemyDepthCounter++;
		if(enemyDepthCounter>1999){
			enemyDepthCounter = 1900;
		}
		return(enemyDepthCounter);
	}
		
}
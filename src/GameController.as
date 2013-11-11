package
{
	import interfaces.ControllerInterface;
	import interfaces.NodeInterface;
	
	import model.NodeData;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import view.GameView;
	import view.MSButton;
	
	public class GameController extends Sprite implements ControllerInterface
	{
		private var gameView:GameView;
		private var mineData:Array;
		private var rowOrColumnCount:Number;
		private var mineCount:Number;
		
		public function GameController()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			this.rowOrColumnCount = 8;
			this.mineCount = 10; 
			this.mineData = new Array();
			this.initMines();	
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("starling framework initialialized");
			
			this.gameView = new GameView(this);
			this.addChild(gameView);	
		}	

		private function initMines():void
		{
			var i:int = 0;
			while (this.mineData.length < mineCount)
			{
				var mine:NodeData = new NodeData( this.randomRange(0,this.rowOrColumnCount-1), 
												  this.randomRange(0,this.rowOrColumnCount-1));
				
				if (!this.mineExists(mine))
				{
					this.mineData[i++] = mine;
					trace("MINE ADDED: " + mine.i + " - " + mine.j);
				}
			}
		}
		
		// Controller Interface
		
		public function nodeHit(node:MSButton):void
		{
			trace( "buton click i: " + node.i + " j: " + node.j);
			
			if (this.mineExists(node))
			 	node.upState = Assets.MineT;	
			else 
				this.uncoverNode(node.i, node.j);
			
		}
		
		// helper
		private function uncoverNode(rowIndex:int, colIndex:int):void
		{
			var count:int = 0;
			
			for ( var i:int=-1; i<2; i++ )
				for ( var j:int=-1; j<2; j++ )
				{
					if (i==0 && j==0)
						continue;
					
					var row:int = rowIndex + i;
					var col:int = colIndex + j;
					
					if ( (row>-1 && row<this.rowOrColumnCount) && 
						(col>-1 && col<this.rowOrColumnCount) && 
						this.mineExistsAtIndex(row, col) )
						count++;
				}
			
			if (count > 0)
			{
				//trace( "check me for i: " + row1 + " j: " + col1);
				this.gameView.getNode(rowIndex, colIndex).setText(count);
			}
			else
			{
				for ( var k:int=-1; k<2; k++ )
					for ( var l:int=-1; l<2; l++ )
					{
						if (k==0 && l==0)
							continue;
						
						var row1:int = rowIndex + k;
						var col1:int = colIndex + l;
						
						if ( (row1>-1 && row1<this.rowOrColumnCount) && 
							(col1>-1 && col1<this.rowOrColumnCount) )
						{
							trace( "check neighbors for i: " + row1 + " j: " + col1);
							this.uncoverNode(row1, col1);
						}
					}
			}
		}
		
		private function mineExists(node:NodeInterface):Boolean
		{
			for each (var mn:NodeData in this.mineData) 
				if (node.isSame(mn))
					return true;
			
			return false;
		}
		
		private function mineExistsAtIndex(i:int, j:int):Boolean
		{
			for each (var mn:NodeData in this.mineData) 
				if (mn.i == i && mn.j == j)
					return true;
			
			return false;
		}
		
		private function randomRange(minNum:Number, maxNum:Number):Number 
		{
			return (Math.ceil(Math.random() * (maxNum - minNum)) + minNum);
		}
		
	}
}
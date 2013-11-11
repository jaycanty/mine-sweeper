package
{
	import interfaces.ControllerInterface;
	import interfaces.NodeInterface;
	
	import model.NodeData;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	import view.GameView;
	import view.MSButton;
	import view.MessageView;
	
	public class GameController extends Sprite implements ControllerInterface
	{
		private var gameView:GameView;
		private var messageView:MessageView 
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
			this.addChild(this.gameView);	
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
		public function newEasyGame():void
		{
			if (this.messageView != null)
			{
				this.removeChild(this.messageView);
				this.messageView = null;
			}
			
			this.addChild(this.gameView);
			this.gameView = null;
			this.gameView = new GameView(this);
			this.addChild(this.gameView);
			
			
			
		}
		public function newMedGame():void
		{
			if (this.messageView != null)
			{
				this.removeChild(this.messageView);
				this.messageView = null;
			}
		}
		public function newHardGame():void
		{
			if (this.messageView != null)
			{
				this.removeChild(this.messageView);
				this.messageView = null;
			}
		}
		
		public function nodeHit(node:MSButton):void
		{
			trace( "buton click i: " + node.i + " j: " + node.j);
			
			if (this.mineExists(node))
			{
			 	node.upState = Assets.MineT;	
				this.loose();
			}
			else 
				this.uncoverNode(node);
			
		}
		
		// helper
		private function uncoverNode(node:MSButton):void
		{
			var count:int = 0;
			
			for ( var i:int=-1; i<2; i++ )
				for ( var j:int=-1; j<2; j++ )
				{
					if (i==0 && j==0)
						continue;
					
					var row:int = node.i + i;
					var col:int = node.j + j;
					
					if ( (row>-1 && row<this.rowOrColumnCount) && 
						(col>-1 && col<this.rowOrColumnCount) && 
						this.mineExists(this.gameView.getNode(row, col)) )
						count++;
				}
			
			node.enabled = false;
			
			if (count > 0)
			{
				node.setText(count);
			}
			else
			{
				for ( i=-1; i<2; i++ )
					for (j=-1; j<2; j++ )
					{
						if (i==0 && j==0)
							continue;
						
						row = node.i + i;
						col = node.j + j;
						
						if ( (row>-1 && row<this.rowOrColumnCount) && 
							(col>-1 && col<this.rowOrColumnCount) )
						{
							if ( this.gameView.getNode(row, col).enabled )
								this.uncoverNode(this.gameView.getNode(row, col));
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
		
		private function randomRange(minNum:Number, maxNum:Number):Number 
		{
			return (Math.ceil(Math.random() * (maxNum - minNum)) + minNum);
		}
		
		private function loose():void
		{
			if (this.messageView == null)
				this.messageView = new MessageView();
			
			this.messageView.x = this.gameView.x;
			this.messageView.y = this.gameView.y;
			this.messageView.width = this.gameView.width;
			this.messageView.height = this.gameView.height;
			this.addChild(this.messageView);
			
		}
		
		private function win():void
		{
			
			
		}
		
	}
}
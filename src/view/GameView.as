package view
{		
	import flash.utils.getQualifiedClassName;
	
	import interfaces.ControllerInterface;
	
	import starling.display.Button;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class GameView extends Sprite
	{
		private var frameEdge:Number;
		private var cellCount:Number;
		private var nodeEdge:Number;
		private var nodes:Array;
		private var controller:ControllerInterface;
		private var easyBtn:Button;
		private var medBtn:Button;
		private var hardBtn:Button;
		
		public function GameView(controller:ControllerInterface)
		{
			super();
			Assets.init();
			this.controller = controller;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			this.nodeEdge = Assets.NodeT.frame.width;
			this.cellCount = 8;
			this.frameEdge = nodeEdge * cellCount;
			this.nodes = [];
		}
		
		public function getNode(i:int, j:int):MSButton
		{
			return this.nodes[i][j] as MSButton;
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("game screen initialialized");
			this.drawScreen();
		}
		
		private function drawScreen():void
		{		
			var startX:Number = (Constant.Width - this.frameEdge)/2 
			var startXBtn:Number = startX + this.frameEdge - 100;
				
			this.easyBtn = new Button(Assets.EasyT); 
			this.easyBtn.x = startXBtn;
			this.easyBtn.y = 50;
			this.addChild(this.easyBtn);
			
			this.medBtn = new Button(Assets.MedT); 
			this.medBtn.x = startXBtn;
			this.medBtn.y = 100;
			this.addChild(this.medBtn);
			
			this.hardBtn = new Button(Assets.HardT); 
			this.hardBtn.x = startXBtn;
			this.hardBtn.y = 150;
			this.addChild(this.hardBtn);
				
			var addX:Number = startX;
			var addY:Number = 200;
			
			for ( var i:int=0; i<8; i++ )
			{
				nodes[i] = [];
				for ( var j:int=0; j<8; j++ )
				{
					var nodeBtn:MSButton = new MSButton(Assets.NodeT, i, j);
					nodeBtn.x = addX;
					nodeBtn.y = addY;
					this.nodes[i][j] = nodeBtn;
					this.addChild(nodeBtn);	
					addX += nodeBtn.width;
				}
				addX = startX;
				addY += nodeBtn.height;
			}
			
			this.addEventListener(Event.TRIGGERED, nodeHit); 
		}
		
		private function nodeHit(event:Event):void
		{
			// TODO Auto Generated method stub
			var clicked:Button = event.target as Button;
			if ( clicked == this.easyBtn)
				this.controller.newEasyGame();
			else if ( clicked == this.medBtn)
				this.controller.newMedGame();
			else if ( clicked == this.hardBtn)
				this.controller.newHardGame();
			else
			{
				var btn:MSButton = event.target as MSButton;
				this.controller.nodeHit(btn);
			}
		}
		
		
		
	}
}
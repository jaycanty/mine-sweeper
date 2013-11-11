package view
{		
	import flash.utils.getQualifiedClassName;
	
	import interfaces.ControllerInterface;
	
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class GameView extends Sprite
	{
		private var frameEdge:Number;
		
		private var cellCount:Number;
		private var nodeEdge:Number;
		private var nodes:Array;
		private var controller:ControllerInterface;
		
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
			var addX:Number = startX;
			var addY:Number = 100;
			
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
			var btn:MSButton = event.target as MSButton;
			this.controller.nodeHit(btn);
		}
		
		
		
	}
}
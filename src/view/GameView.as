package view
{		
	import flash.utils.getQualifiedClassName;
	
	import feathers.controls.Radio;
	import feathers.core.ToggleGroup;
	import feathers.themes.MetalWorksMobileTheme;
	
	import interfaces.ControllerInterface;
	
	import org.gestouch.events.GestureEvent;
	import org.gestouch.gestures.TapGesture;
	
	import starling.display.Button;
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class GameView extends Sprite
	{
		private var frameEdge:Number;
		private var cellCount:Number;
		private var nodeEdge:Number;
		private var gameType:Number;
		private var mineCount:Number;
		private var nodes:Array;
		private var controller:ControllerInterface;
		private var title:Image;
		private var newBtn:Button;
		private var group:ToggleGroup;
		private var radio1:Radio
		private var radio2:Radio
		private var radio3:Radio
		private var label:MSLabel;
		
		public function GameView(controller:ControllerInterface, type:Number)
		{
			super();
			Assets.init();
			this.controller = controller;
			this.nodes = [];
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
			this.nodeEdge = Assets.NodeT.frame.width;
			this.gameType = type;
			
			switch(type)
			{
				case Constant.MediumGame:
				{
					this.cellCount = Constant.MediumGameRowOrCol;
					this.mineCount = Constant.MediumGameMineCount; 
					
					break;
				}
				case Constant.HardGame:
				{
					this.cellCount = Constant.HardGameRowOrCol;
					this.mineCount = Constant.HardGameMineCount; 
					
					break;
				}
					
				default: // EasyGame
				{
					this.cellCount = Constant.EasyGameRowOrCol;
					this.mineCount = Constant.EasyGameMineCount; 
					
					break;
				}
			}
			
			this.frameEdge = nodeEdge * cellCount;
			
		}
		
		public function getNode(i:int, j:int):MSButton
		{
			return this.nodes[i][j] as MSButton;
		}
		
		public function changeMineCount(less:Boolean):void
		{
			if (less)
				this.mineCount--;
			else
				this.mineCount++;
			
			this.label.text = this.mineCount + "\nmines"
		}
		
		// private
		private function onAddedToStage(event:Event):void
		{
			this.drawScreen();
		}
		
		private function drawScreen():void
		{	
			var startX:Number = (Constant.Width - this.frameEdge)/2 
			
			this.title = new Image(Assets.TitleT);
			this.title.x = startX; 
			this.title.y = 10;
			this.addChild(this.title);
				
			this.newBtn = new Button(Assets.NewT); 
			this.newBtn.x = startX;
			this.newBtn.y = this.title.y + this.title.height + 10;
			this.addChild(this.newBtn);
			
			var tapGesture:TapGesture = new TapGesture(this.newBtn);
			tapGesture.addEventListener(GestureEvent.GESTURE_RECOGNIZED, onTap);
			
			// radio buttons
			new MetalWorksMobileTheme();
			
			this.group = new ToggleGroup();			
			var startXRadio:Number = startX + this.newBtn.width + 10;
						
			this.radio1 = new Radio();
			radio1.label = "Easy";
			radio1.toggleGroup = group;	
			radio1.x = startXRadio;
			radio1.y = this.title.y + this.title.height + 10;
			this.addChild( radio1 );
			
			this.radio2 = new Radio();
			radio2.label = "Medium";
			radio2.toggleGroup = group;
			radio2.x = startXRadio;
			radio2.y = this.title.y + this.title.height + 25;
			this.addChild( radio2 );
			
			this.radio3 = new Radio();
			radio3.label = "Hard";
			radio3.toggleGroup = group;
			radio3.x = startXRadio;
			radio3.y = this.title.y + this.title.height + 40;
			this.addChild( radio3 );
			
			this.group.selectedIndex = this.gameType;
			
			// mine count
			this.label = new MSLabel();
			this.label.text = this.mineCount + "\nmines"
			this.label.x = startX + this.frameEdge - 60;
			this.label.y =  this.title.y + this.title.height + 10;
			this.addChild(this.label);
			
			// game grid
			var addX:Number = startX;
			var addY:Number = this.title.y + this.title.height + 60;
			
			for ( var i:int=0; i<this.cellCount; i++ )
			{
				nodes[i] = [];
				for ( var j:int=0; j<this.cellCount; j++ )
				{
					var nodeBtn:MSButton = new MSButton(Assets.NodeT, this.controller, i, j);
					nodeBtn.x = addX;
					nodeBtn.y = addY;
					this.nodes[i][j] = nodeBtn;
					this.addChild(nodeBtn);	
					addX += nodeBtn.width;
				}
				addX = startX;
				addY += nodeBtn.height;
			}
		}
		
		private function onTap(event:GestureEvent):void
		{	
			this.controller.newGame(this.group.selectedIndex);			
		}

	}
}
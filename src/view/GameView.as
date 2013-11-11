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
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.events.TouchEvent;
	
	public class GameView extends Sprite
	{
		private var frameEdge:Number;
		private var cellCount:Number;
		private var nodeEdge:Number;
		private var nodes:Array;
		private var controller:ControllerInterface;
		private var newBtn:Button;
		private var group:ToggleGroup;
		private var radio1:Radio
		private var radio2:Radio
		private var radio3:Radio
		
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
				
			this.newBtn = new Button(Assets.NewT); 
			this.newBtn.x = startX;
			this.newBtn.y = 50;
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
			radio1.y = 50;
			this.addChild( radio1 );
			
			this.radio2 = new Radio();
			radio2.label = "Medium";
			radio2.toggleGroup = group;
			radio2.x = startXRadio;
			radio2.y = 65;
			this.addChild( radio2 );
			
			this.radio3 = new Radio();
			radio3.label = "Hard";
			radio3.toggleGroup = group;
			radio3.x = startXRadio;
			radio3.y = 80;
			this.addChild( radio3 );

			var addX:Number = startX;
			var addY:Number = 100;
			
			for ( var i:int=0; i<8; i++ )
			{
				nodes[i] = [];
				for ( var j:int=0; j<8; j++ )
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
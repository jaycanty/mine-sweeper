package view
{
	import interfaces.ControllerInterface;
	import interfaces.NodeInterface;
	
	import org.gestouch.events.GestureEvent;
	import org.gestouch.gestures.TapGesture;
	
	import starling.display.Button;
	import starling.textures.Texture;
	
	public class MSButton extends Button implements NodeInterface
	{
		private var controller:ControllerInterface;
		private var _i:Number;
		private var _j:Number;
		
		public function MSButton(upState:Texture, controller:ControllerInterface, i:Number, j:Number)
		{
			super(upState, "", null);
			this.controller = controller;
			this.i = i;
			this.j = j;
			
			this.fontColor = 0xFFFFFF;
			
			var tapGesture:TapGesture = new TapGesture(this);
			tapGesture.addEventListener(GestureEvent.GESTURE_RECOGNIZED, onTap);
			
			var doubleTapGesture:TapGesture = new TapGesture(this);
			doubleTapGesture.numTapsRequired = 2;
			doubleTapGesture.maxTapDelay = 200;
			doubleTapGesture.addEventListener(GestureEvent.GESTURE_RECOGNIZED, onDoubleTap);			
			tapGesture.requireGestureToFail(doubleTapGesture);
			
		}
		
		private function onTap(event:GestureEvent):void
		{	
			this.controller.nodeHit(this);
		}
		
		private function onDoubleTap(event:GestureEvent):void
		{
			// handle double tap!
			trace ("DOUBLE TOUCH: " + this.i + " - " + this.j );
		}
		
		public function setText(value:int):void
		{
			this.text = ""+value;
			
		}
		
		
		// NodeInterface
		public function get i():Number
		{
			return _i;
		}
		
		public function set i(value:Number):void
		{
			_i = value;
		}
		
		public function get j():Number
		{
			return _j;
		}
		
		public function set j(value:Number):void
		{
			_j = value;
		}
		
		public function isSame(node:NodeInterface):Boolean
		{
			if (this.i == node.i && this.j == node.j)
				return true;
			
			return false;
		}
	}
}
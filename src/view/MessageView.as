package view
{
	import interfaces.ControllerInterface;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	
	public class MessageView extends Sprite
	{
		private var image:Image;
		
		public function MessageView()
		{
			super();
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("message screen initialialized");
			this.image = new Image(Assets.LooseT);
			this.image.x = (Constant.Width - this.image.width)/2; 
			this.image.y = 200;
			this.addChild(this.image);
		}
		
	}
}
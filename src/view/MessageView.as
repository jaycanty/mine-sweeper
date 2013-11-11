package view
{
	import data.Constant;
	
	import interfaces.ControllerInterface;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class MessageView extends Sprite
	{
		private var image:Image;
		private var texture:Texture;
		private var x:Number;
		
		public function MessageView(texture:Texture, x:Number)
		{
			super();
			this.texture = texture;
			this.x = x;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("message screen initialialized");
			this.image = new Image(this.texture);
			this.image.x = this.x - 10; 
			this.image.y = 10;
			this.addChild(this.image);
		}
		
	}
}
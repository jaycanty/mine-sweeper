package view
{
	import interfaces.ControllerInterface;
	
	import starling.display.Image;
	import starling.display.Sprite;
	import starling.events.Event;
	import starling.textures.Texture;
	
	public class MessageView extends Sprite
	{
		private var image:Image;
		private var texture:Texture;
		
		public function MessageView(texture:Texture)
		{
			super();
			this.texture = texture;
			this.addEventListener(starling.events.Event.ADDED_TO_STAGE, onAddedToStage);
		}
		
		private function onAddedToStage(event:Event):void
		{
			trace("message screen initialialized");
			this.image = new Image(this.texture);
			this.image.x = (Constant.Width - this.image.width)/2; 
			this.image.y = 200;
			this.addChild(this.image);
		}
		
	}
}
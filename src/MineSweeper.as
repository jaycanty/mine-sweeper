package
{	
	import flash.display.Sprite;
	
	import starling.core.Starling;
	
	[SWF(frameRate="60", width="800", height="600", backgroundColor="0x333333")]
	public class MineSweeper extends Sprite
	{
		private var myStarling:Starling;
		
		public function MineSweeper()
		{			
			myStarling = new Starling(GameController, stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
		}
	}
}
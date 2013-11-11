package
{	
	import flash.display.Sprite;
	
	import org.gestouch.core.Gestouch;
	import org.gestouch.extensions.starling.StarlingDisplayListAdapter;
	import org.gestouch.extensions.starling.StarlingTouchHitTester;
	import org.gestouch.input.NativeInputAdapter;
	
	import starling.core.Starling;
	import starling.display.DisplayObject;
	import controller.GameController;
	
	[SWF(frameRate="60", width="800", height="800", backgroundColor="0x333333")]
	public class MineSweeper extends Sprite
	{
		private var myStarling:Starling;
		
		public function MineSweeper()
		{			
			myStarling = new Starling(GameController, stage);
			myStarling.antiAliasing = 1;
			myStarling.start();
			
			// bootstrap gestouch
			Gestouch.inputAdapter = new NativeInputAdapter(stage);
			Gestouch.addDisplayListAdapter(starling.display.DisplayObject, new StarlingDisplayListAdapter);
			Gestouch.addTouchHitTester(new StarlingTouchHitTester(myStarling), -1);
		}
	}
}
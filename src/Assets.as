package
{
	import flash.display.Bitmap;
	
	import starling.textures.Texture;

	public class Assets
	{
		[Embed(source="../media/node.png")]
		private static const Node:Class;
		
		[Embed(source="../media/mine.png")]
		private static const Mine:Class;
		
		public static var NodeT:Texture;
		public static var MineT:Texture;
		
		
		public static function init():void
		{
			var nodeBM:Bitmap = new Assets.Node as Bitmap;
			NodeT = Texture.fromBitmap(nodeBM);
			
			var mineBM:Bitmap = new Assets.Mine as Bitmap;
			MineT = Texture.fromBitmap(mineBM);
			
		}
		
		
		
	}
}
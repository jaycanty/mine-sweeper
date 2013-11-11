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
		
		[Embed(source="../media/loose.png")]
		private static const Loose:Class
		
		[Embed(source="../media/win.png")]
		private static const Win:Class
		
		[Embed(source="../media/new.png")]
		private static const New:Class
		
		
		public static var NodeT:Texture;
		public static var MineT:Texture;
		public static var LooseT:Texture;
		public static var WinT:Texture;
		public static var NewT:Texture;
		
		public static function init():void
		{
			var nodeBM:Bitmap = new Assets.Node as Bitmap;
			NodeT = Texture.fromBitmap(nodeBM);
			
			var mineBM:Bitmap = new Assets.Mine as Bitmap;
			MineT = Texture.fromBitmap(mineBM);
			
			var looseBM:Bitmap = new Assets.Loose as Bitmap;
			LooseT = Texture.fromBitmap(looseBM);
			
			var winBM:Bitmap = new Assets.Win as Bitmap;
			WinT = Texture.fromBitmap(winBM);
			
			var newBM:Bitmap = new Assets.New as Bitmap;
			NewT = Texture.fromBitmap(newBM);
			
		}
		
		
		
	}
}
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
		
		[Embed(source="../media/easy.png")]
		private static const Easy:Class
		
		[Embed(source="../media/med.png")]
		private static const Med:Class
		
		[Embed(source="../media/hard.png")]
		private static const Hard:Class
		
		public static var NodeT:Texture;
		public static var MineT:Texture;
		public static var LooseT:Texture;
		public static var WinT:Texture;
		public static var EasyT:Texture;
		public static var MedT:Texture;
		public static var HardT:Texture;
		
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
			
			var easyBM:Bitmap = new Assets.Easy as Bitmap;
			EasyT = Texture.fromBitmap(easyBM);
			
			var medBM:Bitmap = new Assets.Med as Bitmap;
			MedT = Texture.fromBitmap(medBM);
			
			var hardBM:Bitmap = new Assets.Hard as Bitmap;
			HardT = Texture.fromBitmap(hardBM);
		}
		
		
		
	}
}
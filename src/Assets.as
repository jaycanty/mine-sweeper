package
{
	import flash.display.Bitmap;
	
	import starling.textures.Texture;

	public class Assets
	{
		[Embed(source="../media/title.png")]
		private static const Title:Class;
		
		[Embed(source="../media/node.png")]
		private static const Node:Class;
		
		[Embed(source="../media/mine.png")]
		private static const Mine:Class;
		
		[Embed(source="../media/mine_suspect.png")]
		private static const MineSuspect:Class;
		
		[Embed(source="../media/loose.png")]
		private static const Loose:Class
		
		[Embed(source="../media/win.png")]
		private static const Win:Class
		
		[Embed(source="../media/new.png")]
		private static const New:Class
		
		public static var TitleT:Texture;
		public static var NodeT:Texture;
		public static var MineT:Texture;
		public static var MineSuspectT:Texture;
		public static var LooseT:Texture;
		public static var WinT:Texture;
		public static var NewT:Texture;
		
		public static function init():void
		{
			var titleBM:Bitmap = new Assets.Title as Bitmap;
			TitleT = Texture.fromBitmap(titleBM);
			
			var nodeBM:Bitmap = new Assets.Node as Bitmap;
			NodeT = Texture.fromBitmap(nodeBM);
			
			var mineBM:Bitmap = new Assets.Mine as Bitmap;
			MineT = Texture.fromBitmap(mineBM);
			
			var mineSuspectBM:Bitmap = new Assets.MineSuspect as Bitmap;
			MineSuspectT = Texture.fromBitmap(mineSuspectBM);
			
			var looseBM:Bitmap = new Assets.Loose as Bitmap;
			LooseT = Texture.fromBitmap(looseBM);
			
			var winBM:Bitmap = new Assets.Win as Bitmap;
			WinT = Texture.fromBitmap(winBM);
			
			var newBM:Bitmap = new Assets.New as Bitmap;
			NewT = Texture.fromBitmap(newBM);
			
		}
		
		
		
	}
}
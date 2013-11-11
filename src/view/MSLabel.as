package view
{
	import flash.text.TextFormat;
	
	import feathers.controls.Label;
	import feathers.controls.text.TextFieldTextRenderer;
	import feathers.core.ITextRenderer;
	
	public class MSLabel extends Label
	{
		public function MSLabel()
		{
			super();
			this.textRendererFactory = function():ITextRenderer
			{
				var textRenderer:TextFieldTextRenderer = new TextFieldTextRenderer();
				textRenderer.textFormat = new TextFormat( "Rockwell", 18, 0x6785A1 );
				textRenderer.embedFonts = false;
				textRenderer.isHTML = true;
				return textRenderer;
			}
		}
	
		
		
	}
}
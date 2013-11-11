package view
{
	import interfaces.NodeInterface;
	
	import starling.display.Button;
	import starling.textures.Texture;
	
	public class MSButton extends Button implements NodeInterface
	{
		private var _i:Number;
		private var _j:Number;
		
		public function MSButton(upState:Texture, i:Number, j:Number)
		{
			super(upState, "", null);
			this.i = i;
			this.j = j;
			
			this.fontColor = 0xFFFFFF;
		}
		
		public function setText(value:int):void
		{
			this.text = ""+value;
			
		}
		
		
		// NodeInterface
		public function get i():Number
		{
			return _i;
		}
		
		public function set i(value:Number):void
		{
			_i = value;
		}
		
		public function get j():Number
		{
			return _j;
		}
		
		public function set j(value:Number):void
		{
			_j = value;
		}
		
		public function isSame(node:NodeInterface):Boolean
		{
			if (this.i == node.i && this.j == node.j)
				return true;
			
			return false;
		}
	}
}
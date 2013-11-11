package model
{
	import interfaces.NodeInterface;

	public class NodeData implements NodeInterface
	{
		private var _i:Number;
		private var _j:Number;
		
		public function NodeData(i:Number, j:Number)
		{
			this.i = i;
			this.j = j;
		}

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
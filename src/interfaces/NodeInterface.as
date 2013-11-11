package interfaces
{
	public interface NodeInterface
	{
		function get i():Number;
		function set i(value:Number):void;
		function get j():Number;
		function set j(value:Number):void;
		function isSame(node:NodeInterface):Boolean;
	}
}
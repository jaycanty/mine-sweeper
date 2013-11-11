package interfaces
{
	import view.MSButton;

	public interface ControllerInterface
	{
		function nodeHit(node:MSButton):void;
		function nodeDoubleHit(node:MSButton):void;
		function newGame(type:int):void;
	}
}
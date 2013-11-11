package interfaces
{
	import view.MSButton;

	public interface ControllerInterface
	{
		function nodeHit(node:MSButton):void;
		function newEasyGame():void;
		function newMedGame():void;
		function newHardGame():void;
	}
}
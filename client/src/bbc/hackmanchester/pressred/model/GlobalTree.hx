package bbc.hackmanchester.pressred.model;

/**
 * The global data tree
 * @author John Beech
 */
class GlobalTree
{
	public var hackTimer:TimerModel;

	public function new() 
	{
		hackTimer = new TimerModel();
	}
}
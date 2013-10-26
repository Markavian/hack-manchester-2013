package bbc.hackmanchester.pressred.model;

/**
 * Model for a timer
 * @author John Beech
 */
class TimerModel
{
	var start:Date;
	var end:Date;

	public function new() 
	{
		start = Date.now();
		end = Date.now();
	}
	
	public function timeRemainingInSeconds():Float
	{
		return Math.round(end.getTime() - start.getTime());
	}
	
}
package bbc.hackmanchester.pressred.adapater;

import bbc.hackmanchester.pressred.model.TimerModel;
import motion.Actuate;

/**
 * Adapts timer data to the timer model
 * @author John Beech
 */
class TimerAdapter extends DataAdapter
{
	var model:TimerModel;

	public function new() 
	{
		super();
	}
	
	public function setup(endpoint:String, model:TimerModel)
	{
		this.endpoint = endpoint;
		this.model = model;
		
		// Load on start-up
		Actuate.timer(1.5).onComplete(load);
	}
	
	override private function onContentAvailable(content:Dynamic):Void
	{
		model.setEndTime(content.endTime);
	}
	
}
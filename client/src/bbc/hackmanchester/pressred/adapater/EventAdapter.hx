package bbc.hackmanchester.pressred.adapater;

import bbc.hackmanchester.pressred.model.EventModel;
import motion.Actuate;

/**
 * Adapts timer data to the timer model
 * @author John Beech
 */
class EventAdapter extends DataAdapter
{
	var model:EventModel;

	public function new() 
	{
		super();
	}
	
	public function setup(endpoint:String, model:EventModel)
	{
		this.endpoint = endpoint;
		this.model = model;
		
		// Load shortly after start-up, to build suspense
		Actuate.timer(1.5).onComplete(load);
	}
	
	override private function onContentAvailable(content:Dynamic):Void
	{
		model.setEndTime(content.endTime);
		model.graph = content.graph;
		
		model.updated.dispatch(model);
	}
	
	override private function onContentUnavailable(message:String):Void 
	{
		super.onContentUnavailable(message);
		model.setError("NO TIME");
	}
	
}
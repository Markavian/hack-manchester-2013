package bbc.hackmanchester.pressred.adapater;

import bbc.hackmanchester.pressred.model.TimetableModel;
import motion.Actuate;

/**
 * Adapts timetable data to the timetable model
 * @author John Beech
 */
class TimetableAdapter extends DataAdapter
{
	var model:TimetableModel;

	public function new() 
	{
		super();
	}
	
	public function setup(endpoint:String, model:TimetableModel)
	{
		this.endpoint = endpoint;
		this.model = model;
		
		load();
	}
	
	override private function onContentAvailable(content:Dynamic):Void
	{
		model.readFrom(content);
	}
	
	override private function onContentUnavailable(message:String):Void 
	{
		super.onContentUnavailable(message);
	}
	
}
package bbc.hackmanchester.pressred.adapater;

import bbc.hackmanchester.pressred.model.GraphModel;
import motion.Actuate;

/**
 * Graph data!
 * @author John Beech
 */
class GraphAdapter extends DataAdapter
{
	var model:GraphModel;

	public function new() 
	{
		super();
	}
	
	public function setup(endpoint:String, model:GraphModel)
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
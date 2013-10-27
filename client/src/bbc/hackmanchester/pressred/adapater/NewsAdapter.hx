package bbc.hackmanchester.pressred.adapater;

import bbc.hackmanchester.pressred.model.NewsModel;
import motion.Actuate;

/**
 * Adapts news data to the news model
 * @author John Beech
 */
class NewsAdapter extends DataAdapter
{
	var model:NewsModel;

	public function new() 
	{
		super();
	}
	
	public function setup(endpoint:String, model:NewsModel)
	{
		this.endpoint = endpoint;
		this.model = model;
		
		load();
	}
	
	override private function onContentAvailable(content:Dynamic):Void
	{
		model.readFrom(content);
		
		Actuate.timer(30).onComplete(load);
	}
	
	override private function onContentUnavailable(message:String):Void 
	{
		super.onContentUnavailable(message);
		
		Actuate.timer(30).onComplete(load);
	}
	
}
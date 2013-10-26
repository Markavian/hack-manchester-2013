package bbc.hackmanchester.pressred.adapater;

import flash.net.URLLoader;
import flash.net.URLRequest;
import flash.events.Event;
import flash.events.ErrorEvent;
import flash.events.IOErrorEvent;

import haxe.Json;

/**
 * Base adapter for loading data from a remote source.
 * @author John Beech
 */
class DataAdapter
{
	var loader:URLLoader;
	var endpoint:String;

	public function new() 
	{
		loader = new URLLoader();
		loader.addEventListener(Event.COMPLETE, onLoadComplete);
		loader.addEventListener(IOErrorEvent.IO_ERROR, onLoadError);
		endpoint = null;
	}
	
	public function load()
	{
		if (endpoint == null)
		{
			throw "Data Adapter Cannot load from a null endpoint.";
		}
		
		loader.load(new URLRequest(endpoint));
	}
	
	function onLoadComplete(e)
	{
		var data = Json.parse(loader.data);
		onContentAvailable(data);
	}
	
	function onLoadError(e:IOErrorEvent):Void
	{
		e.stopImmediatePropagation();
		onContentUnavailable(e.text);
	}
	
	function onContentAvailable(content:Dynamic):Void
	{
		throw "The onContentAvailable method needs overriding in sub-class.";
	}
	
	function onContentUnavailable(message:String):Void
	{
		trace(message);
	}
}
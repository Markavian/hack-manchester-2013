package bbc.hackmanchester.pressred.controller;

import bbc.hackmanchester.pressred.adapater.NewsAdapter;
import bbc.hackmanchester.pressred.model.GlobalTree;
import bbc.hackmanchester.pressred.adapater.EventAdapter;
import bbc.hackmanchester.pressred.adapater.TimetableAdapter;

/**
 * Handles loading and centralisation of data
 * @author John Beech
 */
class DataController
{
	public static var SERVER:String = "http://env-9066129.j.layershift.co.uk";
	
	var globalTree:GlobalTree;
	
	var eventAdapter:EventAdapter;
	var timetableAdapter:TimetableAdapter;
	var newsAdapter:NewsAdapter;

	public function new() 
	{
		globalTree = null;
		
		eventAdapter = new EventAdapter();
		timetableAdapter = new TimetableAdapter();
		newsAdapter = new NewsAdapter();
	}
	
	public function setup(tree:GlobalTree)
	{
		globalTree = tree;
		
		eventAdapter.setup(SERVER + "/event", globalTree.eventModel);
		timetableAdapter.setup(SERVER + "/timetable", globalTree.timetable);
		newsAdapter.setup(SERVER + "/news", globalTree.news);
	}
	
}
package bbc.hackmanchester.pressred.controller;

import bbc.hackmanchester.pressred.adapater.NewsAdapter;
import bbc.hackmanchester.pressred.model.GlobalTree;
import bbc.hackmanchester.pressred.adapater.TimerAdapter;
import bbc.hackmanchester.pressred.adapater.TimetableAdapter;

/**
 * Handles loading and centralisation of data
 * @author John Beech
 */
class DataController
{
	public static var SERVER:String = "http://env-9066129.j.layershift.co.uk";
	
	var globalTree:GlobalTree;
	
	var timerAdapter:TimerAdapter;
	var timetableAdapter:TimetableAdapter;
	var newsAdapter:NewsAdapter;

	public function new() 
	{
		globalTree = null;
		
		timerAdapter = new TimerAdapter();
		timetableAdapter = new TimetableAdapter();
		newsAdapter = new NewsAdapter();
	}
	
	public function setup(tree:GlobalTree)
	{
		globalTree = tree;
		
		timerAdapter.setup(SERVER + "/event", globalTree.hackTimer);
		timetableAdapter.setup(SERVER + "/timetable", globalTree.timetable);
		newsAdapter.setup(SERVER + "/news", globalTree.news);
	}
	
}
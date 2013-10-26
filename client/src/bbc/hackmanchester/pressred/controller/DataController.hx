package bbc.hackmanchester.pressred.controller;

import bbc.hackmanchester.pressred.model.GlobalTree;
import bbc.hackmanchester.pressred.adapater.TimerAdapter;
import bbc.hackmanchester.pressred.adapater.TimetableAdapter;

/**
 * Handles loading and centralisation of data
 * @author John Beech
 */
class DataController
{
	public static var SERVER:String = "http://localhost/pressred/";
	
	var globalTree:GlobalTree;
	
	var timerAdapter:TimerAdapter;
	var timetableAdapter:TimetableAdapter;

	public function new() 
	{
		globalTree = null;
		
		timerAdapter = new TimerAdapter();
		timetableAdapter = new TimetableAdapter();
	}
	
	public function setup(tree:GlobalTree)
	{
		globalTree = tree;
		
		timerAdapter.setup(SERVER + "timed.json", globalTree.hackTimer);
		timetableAdapter.setup(SERVER + "timetable.json", globalTree.timetable);
	}
	
}
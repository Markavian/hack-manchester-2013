package bbc.hackmanchester.pressred.controller;

import bbc.hackmanchester.pressred.model.GlobalTree;
import bbc.hackmanchester.pressred.adapater.TimerAdapter;

/**
 * Handles loading and centralisation of data
 * @author John Beech
 */
class DataController
{
	public static var SERVER:String = "http://localhost/pressred/";
	
	var globalTree:GlobalTree;
	
	var timerAdapter:TimerAdapter;

	public function new() 
	{
		globalTree = null;
		timerAdapter = new TimerAdapter();
	}
	
	public function setup(tree:GlobalTree)
	{
		globalTree = tree;
		timerAdapter.setup(SERVER + "time.json", globalTree.hackTimer);
	}
	
}
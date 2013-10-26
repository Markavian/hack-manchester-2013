package bbc.hackmanchester.pressred.controller;

import bbc.hackmanchester.pressred.model.GlobalTree;
import bbc.hackmanchester.pressred.adapater.TimerAdapter;

/**
 * Handles loading and centralisation of data
 * @author John Beech
 */
class DataController
{
	public static var SERVER:String = "http://env-9066129.j.layershift.co.uk/mango2/event";
	
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
		timerAdapter.setup(SERVER, globalTree.hackTimer);
	}
	
}
package bbc.hackmanchester.pressred.controller;

import bbc.hackmanchester.pressred.model.GlobalTree;

/**
 * Handles loading and centralisation of data
 * @author John Beech
 */
class DataController
{
	var globalTree:GlobalTree;

	public function new() 
	{
		globalTree = null;
	}
	
	public function setup(tree:GlobalTree)
	{
		globalTree = tree;
	}
	
}
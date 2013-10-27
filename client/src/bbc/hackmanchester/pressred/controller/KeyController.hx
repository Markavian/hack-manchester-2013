package bbc.hackmanchester.pressred.controller;

import flash.display.Stage;
import flash.events.KeyboardEvent;
import flash.display.StageDisplayState;

/**
 * Handles key events
 * @author John Beech
 */
class KeyController
{
	var stage:Stage;

	public function new() 
	{
		
	}
	
	public function setup(stage:Stage)
	{
		this.stage = stage;
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}
	
	function onKeyDown(keyEvent:KeyboardEvent)
	{
		if (keyEvent.ctrlKey && String.fromCharCode(keyEvent.charCode) == "f")
		{
			stage.displayState = StageDisplayState.FULL_SCREEN;
		}
	}
}
package bbc.hackmanchester.pressred.controller;

import bbc.hackmanchester.pressred.screen.Screen;
import flash.display.Sprite;
import flash.events.Event;

/**
 * Screen controller, handles scren focus within the app.
 * @author John Beech
 */
class ScreenController
{
	var screens:List<Screen>;
	var layer:Sprite;
	
	public function new() 
	{
		screens = new List<Screen>();
		layer = null;
	}
	
	public function setup(layer:Sprite)
	{
		this.layer = layer;
	}
	
	public function addScreen(screen:Screen)
	{
		screens.push(screen);
	}
	
	public function showScreen(screen:Screen)
	{
		for (s in screens)
		{
			if (s.artwork.parent == layer)
			{
				layer.removeChild(s.artwork);
			}
		}
		
		layer.addChild(screen.artwork);
	}
	
}
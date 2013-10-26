package bbc.hackmanchester.pressred;

import flash.display.Sprite;
import flash.events.Event;
import flash.Lib;

/**
 * Press Red!
 * Hack Day Companion tool
 * Entry point
 * @author John Beech
 */

class Main extends Sprite 
{
	var inited:Bool;
	
	var index:Index;

	function resize(e) 
	{
		if (!inited) init();
		// else (resize or orientation change)
		
		index.resize();
	}
	
	function init() 
	{
		if (inited) return;
		inited = true;

		index = new Index();
		stage.addChild(index.artwork);
		
		index.setup();
		
		index.screenController.showScreen(index.splashScreen);
	}

	public function new() 
	{
		super();	
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) 
	{
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() 
	{
		// static entry point
		Lib.current.stage.align = flash.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = flash.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}

package bbc.hackmanchester.pressred.screen;

import bbc.hackmanchester.pressred.ui.BaseUI;
import flash.display.Sprite;
import flash.display.Stage;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.geom.Rectangle;

/**
 * Basic screen
 * @author John Beech
 */
class Screen extends BaseUI
{	
	public static var WIDTH:Float = 800;
	public static var HEIGHT:Float = 480;

	var stage:Stage;
	
	public function new() 
	{
		super();
		
		artwork.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	
	function onEnterFrame(e)
	{
		if (artwork.stage != null)
		{
			if (stage == null)
			{
				stage = artwork.stage;
				stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
				stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
			}
			
			update();
		}
	}
	
	function onMouseDown(e:MouseEvent)
	{
		if (artwork.stage == null)
			return;
			
		beginThrow(stage.mouseY);
	}
	
	function onMouseUp(e:MouseEvent)
	{
		if (artwork.stage == null)
			return;
			
		endThrow(stage.mouseY);
	}
	
	var startY:Float = 0;
	function beginThrow(y:Float)
	{
		startY = y;
	}
	
	var velocityY:Float = 0;
	function endThrow(y:Float)
	{
		var endY:Float = y;
		velocityY = - (startY - endY);
		trace("End throw " + velocityY);
	}
	
	function update()
	{
		if (artwork.stage == null)
			return;
			
		if (artwork.height < Screen.HEIGHT)
		{
			artwork.y = 0;
			return;
		}
			
		if (velocityY != 0)
		{
			artwork.y = artwork.y + velocityY;
			var screenHeight = Screen.HEIGHT - 40;
			
			var bounds:Rectangle = artwork.getBounds(artwork);
			
			// limit bounds
			if (artwork.y > 0)
				artwork.y = 0;
			
			if (Math.abs(artwork.y - screenHeight) > bounds.height) {
				artwork.y = - (bounds.height - screenHeight);
			}
				
			// apply friction 
			velocityY = velocityY * 0.8;
			if (Math.abs(velocityY) < 0.1)
			{
				velocityY = 0;
			}
			trace("Velocity " + velocityY + " artwork " + artwork.y + " " + bounds.height + " " + Screen.HEIGHT);
		}
	}
	
}
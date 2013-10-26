package bbc.hackmanchester.pressred.ui;

import bbc.hackmanchester.pressred.model.TimerModel;
import bbc.hackmanchester.pressred.core.Text;
import flash.text.TextField;
import flash.text.TextFormatAlign;
import flash.events.Event;

/**
 * Timer UI shows how many hours left in the Hack
 * @author John Beech
 */
class TimerUI extends BaseUI
{
	var model:TimerModel;
	
	var textTime:TextField;
	
	public function new() 
	{
		super();
		
		textTime = Text.makeTextField("fonts/OpenSans-Bold.ttf", 48, 0x202020, TextFormatAlign.CENTER, true);
		textTime.width = 600;
		textTime.height = 60;
		artwork.addChild(textTime);
		
		artwork.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}
	
	public function setup(model:TimerModel)
	{
		this.model = model;
		
		updateTime();
	}
	
	function onEnterFrame(e)
	{
		updateTime();
	}
	
	function updateTime()
	{
		if (model == null)
		{
			textTime.text = "00:00:00:00".toUpperCase();
			return;
		}
		textTime.text = model.timeRemainingInSeconds + " seconds remaining";
	}
	
}
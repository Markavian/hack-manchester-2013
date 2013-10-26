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
	
	var iconClock:BitmapUI;
	var textTime:TextField;
	
	public function new() 
	{
		super();
		
		iconClock = new BitmapUI("img/clock-icon.png");
		iconClock.artwork.scaleX = iconClock.artwork.scaleY = 0.5;
		iconClock.artwork.x = -250;
		artwork.addChild(iconClock.artwork);
		
		textTime = Text.makeTextField("fonts/OpenSans-Bold.ttf", 84, 0x202020, TextFormatAlign.CENTER, true);
		textTime.width = 500;
		textTime.height = iconClock.artwork.height;
		alignLeft(textTime, iconClock.artwork);
		textTime.y = - textTime.height / 2;
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
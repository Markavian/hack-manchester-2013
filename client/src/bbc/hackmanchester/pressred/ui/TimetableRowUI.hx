package bbc.hackmanchester.pressred.ui;

import bbc.hackmanchester.pressred.model.TimetableRowModel;
import bbc.hackmanchester.pressred.core.Text;
import flash.text.TextField;
import flash.text.TextFormatAlign;
import flash.events.Event;

/**
 * Timer UI shows how many hours left in the Hack
 * @author John Beech
 */
class TimetableRowUI extends BaseUI
{
	var textTime:TextField;
	var textName:TextField;
	
	public function new() 
	{
		super();
		
		textTime = Text.makeTextField("fonts/OpenSans-Bold.ttf", 30, 0x202020, TextFormatAlign.RIGHT, true);
		textTime.width = 140;
		textTime.height = 40;
		artwork.addChild(textTime);
		
		textName = Text.makeTextField("fonts/OpenSans-Regular.ttf", 30, 0x202020, TextFormatAlign.LEFT, false);
		textName.width = 500;
		textName.height = 40;
		textName.x = 160;
		artwork.addChild(textName);
	}
	
	public function setup(model:TimetableRowModel)
	{
		textTime.text = model.time;
		textName.text = model.name;
	}
	
}
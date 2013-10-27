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
class TimetableSectionUI extends BaseUI
{
	var textName:TextField;
	
	public function new() 
	{
		super();
		
		textName = Text.makeTextField("fonts/OpenSans-Regular.ttf", 40, 0x202020, TextFormatAlign.LEFT, false);
		textName.width = 200;
		textName.height = 50;
		textName.x = 0;
		artwork.addChild(textName);
	}
	
	public function setup(name:String)
	{
		textName.text = name;
	}
	
}
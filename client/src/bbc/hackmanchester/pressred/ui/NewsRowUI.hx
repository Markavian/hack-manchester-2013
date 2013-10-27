package bbc.hackmanchester.pressred.ui;

import bbc.hackmanchester.pressred.model.NewsItemModel;
import bbc.hackmanchester.pressred.model.TimetableRowModel;
import bbc.hackmanchester.pressred.core.Text;
import flash.text.TextField;
import flash.text.TextFormatAlign;
import flash.events.Event;

/**
 * News row for a single item of news
 * @author John Beech
 */
class NewsRowUI extends BaseUI
{
	var textTime:TextField;
	var textText:TextField;
	
	public function new() 
	{
		super();
		
		textTime = Text.makeTextField("fonts/OpenSans-Bold.ttf", 22, 0x202020, TextFormatAlign.LEFT, true);
		textTime.width = 600;
		textTime.height = 30;
		artwork.addChild(textTime);
		
		textText = Text.makeTextField("fonts/OpenSans-Regular.ttf", 20, 0x202020, TextFormatAlign.RIGHT, false);
		textText.width = 600;
		textText.height = 60;
		textText.x = 0;
		alignBottom(textText, textTime);
		artwork.addChild(textText);
	}
	
	public function setup(model:NewsItemModel)
	{
		textTime.text = model.time;
		textText.htmlText = model.text;
	}
	
}
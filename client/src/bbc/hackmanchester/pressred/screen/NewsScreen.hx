package bbc.hackmanchester.pressred.screen;

import bbc.hackmanchester.pressred.core.Text;
import bbc.hackmanchester.pressred.model.NewsModel;
import bbc.hackmanchester.pressred.ui.BitmapUI;
import bbc.hackmanchester.pressred.ui.NewsUI;
import bbc.hackmanchester.pressred.ui.TimetableUI;
import bbc.hackmanchester.pressred.model.TimetableModel;
import flash.text.TextField;
import flash.text.TextFormatAlign;

/**
 * A list of news events
 * @author John Beech
 */
class NewsScreen extends ScreenWithTitle
{
	var news:NewsUI;
	
	public function new() 
	{
		super();
		
		news = cast addUI(new NewsUI());
	}
	
	public function setupModel(newsModel:NewsModel):Void
	{
		news.move(100, 120);
		news.setup(newsModel);
	}
}
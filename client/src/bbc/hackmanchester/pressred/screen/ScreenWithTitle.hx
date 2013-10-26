package bbc.hackmanchester.pressred.screen;

import bbc.hackmanchester.pressred.core.Text;
import flash.text.TextField;
import flash.text.TextFormatAlign;

/**
 * Simple template screen with title
 * @author John Beech
 */
class ScreenWithTitle extends Screen
{
	var textTitle:TextField;

	public function new() 
	{
		super();
		
		textTitle = Text.makeTextField("fonts/OpenSans-Bold.ttf", 64, 0x202020, TextFormatAlign.LEFT, true);
		textTitle.width = 500;
		textTitle.height = 100;
		textTitle.x = 120;
		textTitle.y = 20;
		artwork.addChild(textTitle);
	}
	
	public function setup(titleText:String)
	{
		textTitle.text = titleText;
	}
	
}
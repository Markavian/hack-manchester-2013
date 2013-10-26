package bbc.hackmanchester.pressred.screen;

import bbc.hackmanchester.pressred.core.Text;
import bbc.hackmanchester.pressred.ui.BitmapUI;
import flash.text.TextField;
import flash.text.TextFormatAlign;

/**
 * Simple template screen with title
 * @author John Beech
 */
class ScreenWithTitle extends Screen
{
	var textTitle:TextField;
	var icon:BitmapUI;

	public function new() 
	{
		super();
		
		textTitle = Text.makeTextField("fonts/OpenSans-Bold.ttf", 64, 0x202020, TextFormatAlign.LEFT, true);
		textTitle.width = 500;
		textTitle.height = 100;
		textTitle.x = 120;
		textTitle.y = 20;
		artwork.addChild(textTitle);
		
		icon = new BitmapUI();
		icon.artwork.x = Screen.WIDTH - 90;
		icon.artwork.y = Screen.HEIGHT - 90;
		icon.artwork.scaleX = icon.artwork.scaleY = 0.5;
		addUI(icon);
	}
	
	public function setup(titleText:String, iconPath:String=null)
	{
		textTitle.text = titleText;
		icon.setup(iconPath);
	}
	
}
package bbc.hackmanchester.pressred.screen;

import bbc.hackmanchester.pressred.ui.BaseUI;
import flash.display.Sprite;

/**
 * Basic screen
 * @author John Beech
 */
class Screen
{
	public static var WIDTH:Float = 800;
	public static var HEIGHT:Float = 480;
	
	public var artwork:Sprite;

	public function new() 
	{
		artwork = new Sprite();
	}
	
	function addUI(ui:BaseUI):BaseUI
	{
		artwork.addChild(ui.artwork);
		return ui;
	}
	
}
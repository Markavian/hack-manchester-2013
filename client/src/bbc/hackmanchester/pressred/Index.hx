package bbc.hackmanchester.pressred;

import bbc.hackmanchester.pressred.controller.ScreenController;
import bbc.hackmanchester.pressred.screen.Screen;
import bbc.hackmanchester.pressred.screen.SplashScreen;
import flash.display.Sprite;

/**
 * Index for main app.
 * @author John Beech
 */
class Index
{
	public var artwork:Sprite;
	public var screenController:ScreenController;
	
	public var splashScreen:Screen;

	public function new() 
	{
		artwork = new Sprite();
	}
	
	public function setup()
	{
		screenController = new ScreenController();
		screenController.setup(artwork);
		
		splashScreen = new SplashScreen();
	}
	
	public function resize()
	{
		screenController.resize();
	}
	
}
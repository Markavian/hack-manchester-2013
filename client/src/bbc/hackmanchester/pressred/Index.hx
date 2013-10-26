package bbc.hackmanchester.pressred;

import bbc.hackmanchester.pressred.controller.ScreenController;
import bbc.hackmanchester.pressred.controller.DataController;
import bbc.hackmanchester.pressred.screen.Screen;
import bbc.hackmanchester.pressred.screen.SplashScreen;
import bbc.hackmanchester.pressred.model.GlobalTree;
import flash.display.Sprite;

/**
 * Index for main app.
 * @author John Beech
 */
class Index
{
	public var artwork:Sprite;
	public var tree:GlobalTree;
	
	public var screenController:ScreenController;
	public var dataController:DataController;
	
	public var splashScreen:SplashScreen;

	public function new() 
	{
		artwork = new Sprite();
	}
	
	public function setup()
	{
		tree = new GlobalTree();
		
		screenController = new ScreenController();
		screenController.setup(artwork);
		
		dataController = new DataController();
		dataController.setup(tree);
		
		splashScreen = new SplashScreen();
		splashScreen.setup(tree.hackTimer);
	}
	
	public function resize()
	{
		screenController.resize();
	}
	
}
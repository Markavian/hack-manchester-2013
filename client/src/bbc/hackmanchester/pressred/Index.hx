package bbc.hackmanchester.pressred;

import bbc.hackmanchester.pressred.controller.ScreenController;
import bbc.hackmanchester.pressred.controller.DataController;
import bbc.hackmanchester.pressred.screen.Screen;
import bbc.hackmanchester.pressred.screen.SplashScreen;
import bbc.hackmanchester.pressred.model.GlobalTree;
import bbc.hackmanchester.pressred.singleton.EventBus;
import bbc.hackmanchester.pressred.ui.TabUI;
import flash.display.Sprite;

/**
 * Index for main app.
 * @author John Beech
 */
class Index
{
	public var artwork:Sprite;
	public var screens:Sprite;
	
	public var tree:GlobalTree;
	public var screenController:ScreenController;
	public var dataController:DataController;
	
	public var tabs:TabUI;
	public var splashScreen:SplashScreen;

	public function new() 
	{
		artwork = new Sprite();
		screens = new Sprite();
	}
	
	public function setup()
	{
		EventBus.setup();
		
		tree = new GlobalTree();
		
		tabs = new TabUI();
		tabs.setup();
		artwork.addChild(tabs.artwork);
		
		screenController = new ScreenController();
		screenController.setup(screens);
		
		dataController = new DataController();
		dataController.setup(tree);
		
		splashScreen = new SplashScreen();
		splashScreen.setup(tree.hackTimer);
		
		artwork.addChild(screens);
	}
	
	public function resize()
	{
		screenController.resize();
	}
	
}
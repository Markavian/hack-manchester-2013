package bbc.hackmanchester.pressred.ui;

import bbc.hackmanchester.pressred.singleton.EventBus;
import bbc.hackmanchester.pressred.core.Signal;

/**
 * A bunch of tabs for changing around the app.
 * @author John Beech
 */
class TabUI extends BaseUI
{
	var tabButtons:Array<ButtonUI>;
	
	var clockTab:ButtonUI;
	var streamTab:ButtonUI;
	var personTab:ButtonUI;
	var starTab:ButtonUI;
	var awardTab:ButtonUI;
	
	public function new() 
	{
		super();
		
		artwork.x = 50;
		artwork.y = 50;
		
		tabButtons = new Array<ButtonUI>();
	}
	
	public function setup()
	{
		clockTab = addTab("img/clock-tab.png", EventBus.showSplashScreen);
		streamTab = addTab("img/stream-tab.png", EventBus.showStreamScreen);
		personTab = addTab("img/person-tab.png", EventBus.showPersonScreen);
		starTab = addTab("img/star-tab.png", EventBus.showStarScreen);
		awardTab = addTab("img/awards-tab.png", EventBus.showAwardsScreen);
		
		var yoffset:Int = 0;
		for (button in tabButtons)
		{
			button.artwork.y = yoffset;
			yoffset = yoffset + 90;
		}
	}
	
	function addTab(tabIcon:String, signal:Signal):ButtonUI
	{
		var button:ButtonUI = new ButtonUI(tabIcon);
		
		addUI(button);
		tabButtons.push(button);
		
		button.clicked.add(signal.dispatch);
		
		return button;
	}
	
}
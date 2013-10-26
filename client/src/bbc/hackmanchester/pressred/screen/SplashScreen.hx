package bbc.hackmanchester.pressred.screen;

import bbc.hackmanchester.pressred.ui.TimerUI;
import bbc.hackmanchester.pressred.ui.TabUI;
import bbc.hackmanchester.pressred.model.TimerModel;

/**
 * Splash Screen, with timer and things
 * @author John Beech
 */
class SplashScreen extends Screen
{
	var timer:TimerUI;
	var tabs:TabUI;

	public function new() 
	{
		super();
		
		timer = cast addUI(new TimerUI());
		timer.artwork.x = Screen.WIDTH / 2 + 50;
		timer.artwork.y = 100;
		
		tabs = cast(addUI(new TabUI()));
	}
	
	public function setup(timerModel:TimerModel)
	{
		timer.setup(timerModel);
		tabs.setup();
	}
	
}
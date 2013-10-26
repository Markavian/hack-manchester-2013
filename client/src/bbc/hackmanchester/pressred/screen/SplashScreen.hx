package bbc.hackmanchester.pressred.screen;

import bbc.hackmanchester.pressred.ui.TimerUI;
import bbc.hackmanchester.pressred.model.TimerModel;

/**
 * Splash Screen, with timer and things
 * @author John Beech
 */
class SplashScreen extends Screen
{
	var timer:TimerUI;

	public function new() 
	{
		super();
		
		timer = cast addUI(new TimerUI());
		timer.artwork.x = Screen.WIDTH / 2 - timer.artwork.width / 2;
	}
	
	public function setup(timerModel:TimerModel)
	{
		timer.setup(timerModel);
	}
	
}
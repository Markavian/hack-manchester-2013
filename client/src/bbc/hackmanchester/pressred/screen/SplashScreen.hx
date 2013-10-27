package bbc.hackmanchester.pressred.screen;

import bbc.hackmanchester.pressred.model.EventModel;
import bbc.hackmanchester.pressred.ui.TimerUI;
import bbc.hackmanchester.pressred.ui.ButtonUI;
import bbc.hackmanchester.pressred.singleton.EventBus;

/**
 * Splash Screen, with timer and things
 * @author John Beech
 */
class SplashScreen extends Screen
{
	var timer:TimerUI;
	
	var timetableButton:ButtonUI;
	var biogButton:ButtonUI;

	public function new() 
	{
		super();
		
		timer = cast addUI(new TimerUI());
		timer.artwork.x = Screen.WIDTH / 2 + 50;
		timer.artwork.y = 100;
		
		timetableButton = cast addUI(new ButtonUI("img/time-table-icon.png"));
		timetableButton.move(300, 300);
		timetableButton.clicked.add(EventBus.showTimetableScreen.dispatch);
		
		biogButton = cast addUI(new ButtonUI("img/biog-icon.png"));
		biogButton.move(600, 300);
		biogButton.clicked.add(EventBus.showBiogScreen.dispatch);
	}
	
	public function setup(eventModel:EventModel)
	{
		timer.setup(eventModel);
	}
	
}
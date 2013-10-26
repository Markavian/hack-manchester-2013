package bbc.hackmanchester.pressred.singleton;

import bbc.hackmanchester.pressred.core.Signal;

class EventBus
{
	public static var showSplashScreen = new Signal();
	public static var showStreamScreen:Signal;
	public static var showPersonScreen:Signal;
	public static var showStarScreen:Signal;
	public static var showAwardsScreen:Signal;

	public static function setup()
	{
		showSplashScreen = new Signal();
		showStreamScreen = new Signal();
		showPersonScreen = new Signal();
		showStarScreen = new Signal();
		showAwardsScreen = new Signal();
	}
}
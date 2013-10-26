package bbc.hackmanchester.pressred.singleton;

import bbc.hackmanchester.pressred.core.Signal;

class EventBus
{
	public static var showSplashScreen = new Signal();
	public static var showStreamScreen = new Signal();
	public static var showPersonScreen = new Signal();
	public static var showStarScreen = new Signal();
	public static var showAwardsScreen = new Signal();
	public static var showTimetableScreen = new Signal();
	public static var showBiogScreen = new Signal();
}
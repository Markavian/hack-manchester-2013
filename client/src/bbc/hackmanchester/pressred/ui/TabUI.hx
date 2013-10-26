package bbc.hackmanchester.pressred.ui;

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
		clockTab = addTab("img/clock-tab.png");
		streamTab = addTab("img/stream-tab.png");
		personTab = addTab("img/person-tab.png");
		starTab = addTab("img/star-tab.png");
		awardTab = addTab("img/awards-tab.png");
		
		var yoffset:Int = 0;
		for (button in tabButtons)
		{
			button.artwork.y = yoffset;
			yoffset = yoffset + 90;
		}
	}
	
	function addTab(tabIcon:String):ButtonUI
	{
		var button:ButtonUI = new ButtonUI(tabIcon);
		
		addUI(button);
		tabButtons.push(button);
		
		return button;
	}
	
}
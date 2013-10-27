package bbc.hackmanchester.pressred.screen;
import bbc.hackmanchester.pressred.ui.ImageUI;

/**
 * ...
 * @author ...
 */
class GraphScreen extends ScreenWithTitle
{

	var image:ImageUI;
	
	public function new() 
	{
		super();
	}
	
	public function setupModel(imageURL :String):Void
	{
		if (image != null)
		{
			artwork.removeChild(image.artwork);
		}
		
		image = new ImageUI(imageURL, 400, 300);
		addUI(image);
		image.move(120, 150);
	}
	
}
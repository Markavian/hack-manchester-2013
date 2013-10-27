package bbc.hackmanchester.pressred.screen;
import bbc.hackmanchester.pressred.model.GraphModel;
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
	
	public function setupModel(model:GraphModel):Void
	{
		model.updated.add(onModelUpdated);
	}
	
	public function onModelUpdated(model:GraphModel)
	{
		if (image != null)
		{
			artwork.removeChild(image.artwork);
		}
		
		image = new ImageUI(model.graphUrl, 400, 300);
		addUI(image);
		image.move(120, 150);
	}
	
}
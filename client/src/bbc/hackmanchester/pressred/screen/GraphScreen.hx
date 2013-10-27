package bbc.hackmanchester.pressred.screen;
import bbc.hackmanchester.pressred.model.EventModel;
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
	
	public function setupModel(eventModel:EventModel):Void
	{
		eventModel.updated.add(onModelUpdated);
	}
	
	public function onModelUpdated(model:EventModel)
	{
		if (image != null)
		{
			artwork.removeChild(image.artwork);
		}
		
		image = new ImageUI(model.graph, 400, 300);
		addUI(image);
		image.move(120, 150);
	}
	
}
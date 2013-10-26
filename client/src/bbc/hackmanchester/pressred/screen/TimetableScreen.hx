package bbc.hackmanchester.pressred.screen;

import bbc.hackmanchester.pressred.core.Text;
import bbc.hackmanchester.pressred.ui.BitmapUI;
import bbc.hackmanchester.pressred.ui.TimetableUI;
import bbc.hackmanchester.pressred.model.TimetableModel;
import flash.text.TextField;
import flash.text.TextFormatAlign;

/**
 * A timetable of events at the hack day
 * @author John Beech
 */
class TimetableScreen extends ScreenWithTitle
{
	var timetable:TimetableUI;
	
	public function new() 
	{
		super();
		
		timetable = cast addUI(new TimetableUI());
	}
	
	public function setupModel(timetableModel:TimetableModel):Void
	{
		timetable.move(100, 120);
		timetable.setup(timetableModel);
	}
	
}
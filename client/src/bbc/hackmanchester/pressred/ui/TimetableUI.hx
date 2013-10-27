package bbc.hackmanchester.pressred.ui;

import bbc.hackmanchester.pressred.model.TimetableModel;
import flash.display.DisplayObject;

/**
 * Represents a timetable of events happening soon
 * @author John Beech
 */
class TimetableUI extends BaseUI
{
	var model:TimetableModel;
	
	var rows:Array<TimetableRowUI>;

	public function new() 
	{
		super();
		
		rows = new Array<TimetableRowUI>();
	}
	
	public function setup(model:TimetableModel)
	{
		this.model = model;
		
		model.updated.add(onModelUpdated);
		
		redraw();
	}
	
	function onModelUpdated(model)
	{
		redraw();
	}
	
	function redraw()
	{
		for (row in rows)
		{
			artwork.removeChild(row.artwork);
		}
		
		var lastRow:BaseUI = null;
		for (dayModel in model.days)
		{				
			var section = new TimetableSectionUI();
			section.setup(dayModel.day);
			
			addUI(section);
			
			if (lastRow != null)
			{
				alignBottom(section.artwork, lastRow.artwork);
			}
			lastRow = section;
			
			for (eventModel in dayModel.events)
			{
				var row = new TimetableRowUI();
				row.setup(eventModel);
				
				addUI(row);
				
				if (lastRow != null)
				{
					alignBottom(row.artwork, lastRow.artwork);
				}
				lastRow = row;
			}
			
		}
	}
	
}
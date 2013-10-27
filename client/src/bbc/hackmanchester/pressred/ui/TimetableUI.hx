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
	
	var rows:Array<BaseUI>;

	public function new() 
	{
		super();
		
		rows = new Array<BaseUI>();
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
		while (rows.length > 0)
		{
			artwork.removeChild(rows.pop().artwork);
		}
		
		var lastRow:BaseUI = null;
		for (dayModel in model.days)
		{				
			var section = new TimetableSectionUI();
			section.setup(dayModel.day);
			
			addUI(section);
			rows.push(section);
			
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
				rows.push(row);
				
				if (lastRow != null)
				{
					alignBottom(row.artwork, lastRow.artwork);
				}
				lastRow = row;
			}
			
		}
	}
	
}
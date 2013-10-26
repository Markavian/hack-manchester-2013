package bbc.hackmanchester.pressred.ui;

import bbc.hackmanchester.pressred.model.TimetableModel;

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
		
		var lastRow:TimetableRowUI = null;
		for (model in model.events)
		{
			var row = new TimetableRowUI();
			row.setup(model);
			
			addUI(row);
			
			if (lastRow != null)
			{
				alignBottom(row.artwork, lastRow.artwork);
			}
			lastRow = row;
		}
	}
	
}
package bbc.hackmanchester.pressred.model;

class TimetableModel extends BaseModel
{
	public var days:Array<TimetableDayModel>;

	public function new() 
	{
		super();
		
		days = new Array<TimetableDayModel>();
	}
	
	public function readFrom(object:Dynamic):Void
	{
		if (object == null)
			return;
		
		days = new Array<TimetableDayModel>();
		var daysArray:Array<Dynamic> = object;
		for (item in daysArray)
		{
			var day = new TimetableDayModel();
			day.readFrom(item);
			days.push(day);
		}
		
		updated.dispatch(this);
	}
}
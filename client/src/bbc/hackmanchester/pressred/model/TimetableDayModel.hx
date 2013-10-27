package bbc.hackmanchester.pressred.model;

class TimetableDayModel extends BaseModel
{
	public var day:String;
	public var events:Array<TimetableRowModel>;

	public function new() 
	{
		super();
		
		day = "Day of week";
		events = new Array<TimetableRowModel>();
	}
	
	public function readFrom(object:Dynamic)
	{
		if (object == null)
			return;
		
		this.day = Reflect.hasField(object, "day") ? object.day : "";
			
		events = new Array<TimetableRowModel>();
		if (Reflect.hasField(object, "events"))
		{
			var eventsArray:Array<Dynamic> = object.events;
			for (item in eventsArray)
			{
				var event = new TimetableRowModel();
				event.readFrom(item);
				events.push(event);
			}
		}
	}
	
}
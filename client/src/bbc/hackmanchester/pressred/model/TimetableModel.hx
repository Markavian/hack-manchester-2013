package bbc.hackmanchester.pressred.model;

class TimetableModel extends BaseModel
{
	public var events:Array<TimetableRowModel>;

	public function new() 
	{
		super();
		
		events = new Array<TimetableRowModel>();
	}
	
	public function readFrom(object:Dynamic):Void
	{
		if (object == null)
			return;
			
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
		
		updated.dispatch(this);
	}
}
package bbc.hackmanchester.pressred.model;

class TimetableRowModel extends BaseModel
{
	public var time:String;
	public var name:String;

	public function new() 
	{
		super();
		
		time = "--:--";
		name = "Pending...";
	}
	
	public function update(time:String, name:String):Void
	{
		this.time = time;
		this.name = name;
		
		updated.dispatch(this);
	}
	
	public function readFrom(object:Dynamic)
	{
		if (object == null)
			return;
		
		this.time = Reflect.hasField(object, "time") ? object.time : "";
		this.name = Reflect.hasField(object, "title") ? object.title : "";
	}
	
}
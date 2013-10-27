package bbc.hackmanchester.pressred.model;

class NewsItemModel extends BaseModel
{
	public var time:String;
	public var text:String;

	public function new() 
	{
		super();
		
		time = "Day / Date";
		text = "News Story...";
	}
	
	public function update(time:String, text:String):Void
	{
		this.time = time;
		this.text = text;
		
		updated.dispatch(this);
	}
	
	public function readFrom(object:Dynamic)
	{
		if (object == null)
			return;
		
		this.time = Reflect.hasField(object, "time") ? object.time : "";
		this.text = Reflect.hasField(object, "text") ? object.text : "";
	}
	
}
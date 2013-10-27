package bbc.hackmanchester.pressred.model;

class NewsItemModel extends BaseModel
{
	public var time:String;
	public var text:String;
	public var mediaUrl:String;

	public function new() 
	{
		super();
		
		time = "Day / Date";
		text = "News Story...";
		mediaUrl = "";
	}
	
	public function update(time:String, text:String, mediaUrl:String=""):Void
	{
		this.time = time;
		this.text = text;
		this.mediaUrl = mediaUrl;
		
		updated.dispatch(this);
	}
	
	public function readFrom(object:Dynamic)
	{
		if (object == null)
			return;
		
		this.time = Reflect.hasField(object, "time") ? object.time : "";
		this.text = Reflect.hasField(object, "text") ? object.text : "";
		this.mediaUrl = Reflect.hasField(object, "mediaUrl") ? object.mediaUrl : "";
	}
	
}
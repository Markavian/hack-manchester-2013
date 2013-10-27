package bbc.hackmanchester.pressred.model;

class GraphModel extends BaseModel
{
	public var graphUrl:String;

	public function new() 
	{
		super();
		
		graphUrl = "";
	}
	
	public function readFrom(object:Dynamic):Void
	{
		if (object == null)
			return;
			
		this.graphUrl = Reflect.hasField(object, "graph") ? object.graph : "";
		
		updated.dispatch(this);
	}
}
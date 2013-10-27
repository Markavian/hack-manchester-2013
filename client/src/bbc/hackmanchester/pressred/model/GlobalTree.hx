package bbc.hackmanchester.pressred.model;

/**
 * The global data tree
 * @author John Beech
 */
class GlobalTree extends BaseModel
{
	public var eventModel:EventModel;
	public var timetable:TimetableModel;
	public var news:NewsModel;
	public var graphModel:GraphModel;

	public function new() 
	{
		super();
		
		eventModel = new EventModel();
		timetable = new TimetableModel();
		news = new NewsModel();
		graphModel = new GraphModel();
	}
}
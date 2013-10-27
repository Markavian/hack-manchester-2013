package bbc.hackmanchester.pressred.model;

/**
 * Represents a list of news items
 * @author John Beech
 */
class NewsModel extends BaseModel
{
	public var newsItems:Array<NewsItemModel>;

	public function new() 
	{
		super();
		
		newsItems = new Array<NewsItemModel>();
	}
	
	public function readFrom(object:Dynamic)
	{
		if (object == null)
			return;
		
		newsItems = new Array<NewsItemModel>();
		if (Reflect.hasField(object, "newsItems"))
		{
			var newsItemsArray:Array<Dynamic> = object.newsItems;
			for (item in newsItemsArray)
			{
				var newsItem = new NewsItemModel();
				newsItem.readFrom(item);
				newsItems.push(newsItem);
			}
		}
		
		updated.dispatch(this);
	}
	
}
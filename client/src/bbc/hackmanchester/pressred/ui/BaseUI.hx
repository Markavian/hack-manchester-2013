package bbc.hackmanchester.pressred.ui;

import flash.display.DisplayObject;
import flash.display.Sprite;
import flash.geom.Rectangle;

/**
 * Base class for all onscreen UI elements
 * @author John Beech
 */
class BaseUI
{
	public var artwork:Sprite;

	public function new() 
	{
		artwork = new Sprite();
	}
	
	public function center(item:DisplayObject, xoffset:Float=0, yoffset:Float=0)
	{
		item.x = - Math.round(item.width / 2) + xoffset;
		item.y = - Math.round(item.height / 2) + yoffset;
	}
	
	public function alignLeft(item:DisplayObject, to:DisplayObject)
	{
		var bounds:Rectangle = to.getBounds(artwork);
		
		item.x = bounds.right;
	}
	
	public function alignBottom(item:DisplayObject, to:DisplayObject)
	{
		var bounds:Rectangle = to.getBounds(artwork);
		
		item.y = bounds.bottom;
	}
	
	function addUI(ui:BaseUI):BaseUI
	{
		artwork.addChild(ui.artwork);
		return ui;
	}
	
	function move(x:Float, y:Float):BaseUI
	{
		artwork.x = x;
		artwork.y = y;
		
		return this;
	}
	
	function scale(scale:Float):BaseUI
	{
		artwork.scaleX = artwork.scaleY = scale;
		
		return this;
	}
	
	function alpha(alpha:Float):BaseUI
	{
		artwork.alpha = alpha;
		
		return this;
	}
	
}
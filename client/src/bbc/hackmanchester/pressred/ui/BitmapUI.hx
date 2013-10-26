package bbc.hackmanchester.pressred.ui;

import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;
import openfl.Assets;

/**
 * Bitmap wrapper, for centering assets
 * @author John Beech
 */
class BitmapUI extends BaseUI
{
	var bitmap:Bitmap;

	public function new(asset:String=null) 
	{
		super();
		
		bitmap = new Bitmap(null, PixelSnapping.AUTO, true);
		setup(asset);
		artwork.addChild(bitmap);
	}
	
	public function setup(asset:String)
	{
		bitmap.bitmapData = (asset != null) ? Assets.getBitmapData(asset) : null;
		center(bitmap);
	}
	
}
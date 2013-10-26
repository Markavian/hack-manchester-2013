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

	public function new(asset:String) 
	{
		super();
		
		var asset = Assets.getBitmapData(asset);
		bitmap = new Bitmap(asset, PixelSnapping.AUTO, true);
		
		artwork.addChild(bitmap);
		center(bitmap);
	}
	
}
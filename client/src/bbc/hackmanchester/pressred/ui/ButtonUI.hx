package bbc.hackmanchester.pressred.ui;

import bbc.hackmanchester.pressred.core.Signal;
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.PixelSnapping;
import flash.events.MouseEvent;
import motion.Actuate;
import openfl.Assets;


/**
 * Bitmap wrapper, for centering assets
 * @author John Beech
 */
class ButtonUI extends BaseUI
{
	public var clicked:Signal;
	
	var bitmap:Bitmap;

	public function new(asset:String) 
	{
		super();
		
		clicked = new Signal();
		
		var asset = Assets.getBitmapData(asset);
		bitmap = new Bitmap(asset, PixelSnapping.AUTO, true);
		bitmap.scaleX = bitmap.scaleY = 0.5;
		
		artwork.addChild(bitmap);
		center(bitmap);
		
		artwork.addEventListener(MouseEvent.CLICK, onMouseClick);
	}
	
	function onMouseClick(e)
	{
		Actuate.apply(artwork, { scaleX: 0.5, scaleY: 0.5 } );
		Actuate.tween(artwork, 1.0, { scaleX: 1.0, scaleY: 1.0 } );
		clicked.dispatch(this);
	}
}
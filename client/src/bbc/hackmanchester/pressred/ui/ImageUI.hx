package bbc.hackmanchester.pressred.ui;

import flash.display.Sprite;    
import flash.display.Bitmap;
import flash.display.Loader;    
import flash.net.URLRequest;    
import flash.display.Graphics;

import flash.events.Event;              
import flash.events.ProgressEvent;
import flash.events.SecurityErrorEvent;
import flash.events.HTTPStatusEvent;
import flash.events.IOErrorEvent;

import flash.Lib; 

class ImageUI extends BaseUI
{
	private var request:URLRequest;
	private var loader:Loader;
	private var status:Int; // This will store the last HTTP status
	
	private var lastTime:Float;
	private var loading:Bool;
	
	private var targetWidth:Int;
	private var targetHeight:Int;
	private var targetPadding:Int;
	
	public function new (imageURL:String, width:Int = 400, height:Int = 300, padding:Int = 5)
	{
		super ();
		
		request = new URLRequest(imageURL);
		loader = new Loader();
		targetWidth = width;
		targetHeight = height;
		targetPadding = padding;
		
		var DP:Int = padding * 2;
		var g:Graphics = artwork.graphics;
		g.beginFill(0x202020, 1.0);
		g.drawRect(0, 0, targetWidth + DP, targetHeight + DP);
		
		// Prepare for loader.load() events
		loader.contentLoaderInfo.addEventListener(Event.COMPLETE, onComplete);
		loader.contentLoaderInfo.addEventListener(Event.OPEN, onOpen);
		loader.contentLoaderInfo.addEventListener(ProgressEvent.PROGRESS, onProgress);
		loader.contentLoaderInfo.addEventListener(SecurityErrorEvent.SECURITY_ERROR, onSecurity);
		loader.contentLoaderInfo.addEventListener(HTTPStatusEvent.HTTP_STATUS, onHTTPStatus);
		loader.contentLoaderInfo.addEventListener(IOErrorEvent.IO_ERROR, onIOError);
		loader.load(request);
		
		// Don't want to load more than one at a time that would be ridiculous
		loading = true;
		
		// Prepare for timing
		lastTime = Lib.getTimer();
		artwork.addEventListener(Event.ENTER_FRAME, onFrame);
	}
	
	private function onFrame(e:Event)
	{
		var time = Lib.getTimer();
		var delta = time - lastTime;
		if ( delta > 1000 * 60 ) { // Should be about 1 minute, if my guesses were correct
			if ( !loading ) { // If it's already loading we shouldn't initiate a new load
				loader.load( request );
				lastTime = time;
			}
		}
	}
	
	private function onComplete(event:Event):Void
	{
		if (status == 200) {  // 200 is a successful HTTP status
				
			var b:Bitmap = event.target.content; // This is where the bitmap lives
	
			// Remove the old children (older versions of the bitmap).. You know, for memory reasons
			while( artwork.numChildren > 0 ) {
				var a:Bitmap = cast(artwork.removeChildAt(0), Bitmap);
				a.bitmapData.dispose();                         
			}
			
			// Add the new one
			artwork.addChild(b);
			
			// Size the new one
			b.x = targetPadding;
			b.y = targetPadding;
			b.width = targetWidth;
			b.height = targetHeight;
		} 
			
		// Loading process is now complete
		loading = false;
	}
	
	private function onOpen(event:Event):Void
	{
		// The download has begun!
		loading = true;
	}

	private function onProgress(event:ProgressEvent):Void
	{
		var p = event.bytesLoaded/event.bytesTotal;
		// Math.round(p*100) is the current percent of bytes retrieved
	}

	private function onSecurity(event:SecurityErrorEvent):Void
	{
		trace("Security Error: " + event);
		loading = false;
	}

	private function onHTTPStatus(event:HTTPStatusEvent):Void
	{
		// Hopefully this is 200
		status = event.status;
	}

	private function onIOError(event:IOErrorEvent):Void
	{
		trace("IO Error: " + event);
		loading = false;
	}
}
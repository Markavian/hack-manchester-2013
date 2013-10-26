package bbc.hackmanchester.pressred.model;

/**
 * Model for a timer
 * @author John Beech
 */
class TimerModel
{
	var now:Date;
	var end:Date;

	public function new() 
	{
		now = Date.now();
		end = new Date(now.getFullYear(), now.getMonth(), now.getDate(), now.getHours() + 16, now.getMinutes(), now.getSeconds());
		
		trace(now.toString());
		trace(end.toString());
		trace(timeRemainingInSeconds());
	}
	
	public function timeRemainingInSeconds():Float
	{
		var time = Math.round(end.getTime() - now.getTime());
		
		#if flash
		time = Math.round(time / 1000);
		#end
		
		return time;
	}
	
	public function timeRemainingFormatted():String
	{
		now = Date.now();
		
		var seconds = timeRemainingInSeconds();
		
		var secondsPerMinute = 60;
		var secondsPerHour = secondsPerMinute * 60;
		var secondsPerDay = secondsPerHour * 24;
		
		var days:Float = Math.floor(seconds / secondsPerDay);
		var hours:Float = Math.floor((seconds % secondsPerDay) / secondsPerHour);
		var minutes:Float = Math.floor((seconds % secondsPerHour) / secondsPerMinute);
		var seconds:Float = Math.floor((seconds % secondsPerMinute));
		
		var dd = zeroPad(days);
		var hh = zeroPad(hours);
		var mm = zeroPad(minutes);
		var ss = zeroPad(seconds);

		return dd + ":" + hh + ":" + mm + ":" + ss;
	}
	
	function zeroPad(number:Float):String
	{
		var pad:String = Std.string(Math.round(number));
		if (pad.length == 1)
			pad = "0" + pad;
		return pad;
	}
	
}
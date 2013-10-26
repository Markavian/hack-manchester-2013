package bbc.hackmanchester.pressred.model;

import bbc.hackmanchester.pressred.core.Signal;

class BaseModel
{
	public var updated:Signal;
	
	public function new() 
	{
		updated = new Signal();
	}
}
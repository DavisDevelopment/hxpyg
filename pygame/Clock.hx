package pygame;

@:pythonImport('pygame.time', 'Clock')
extern class Clock {
	/* Constructor Function */
	function new():Void;

	/**
	  * Update [this] Clock
	  */
	function tick(?framerate:Int):Int;

	/**
	  * Returns the parameter passed to the last call to 'tick'
	  */
	function get_time():Int;
	function get_rawtime():Int;
}

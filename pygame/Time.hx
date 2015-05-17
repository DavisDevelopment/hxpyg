package pygame;

@:pythonImport('pygame', 'time')
extern class Time {
	/* Get the number of milliseconds since pygame.init() */
	static function get_ticks():Int;

	/* Pause the program for [ms] milliseconds */
	static function wait(ms : Int):Void;

	/* Pause the program for [ms] milliseconds */
	static function delay(ms : Int):Void;
}

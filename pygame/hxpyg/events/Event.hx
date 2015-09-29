package pygame.hxpyg.events;

class Event {
	/* Constructor Function */
	public function new(name : String):Void {
		type = name;
	}

/* === Instance Fields === */

	public var type : String;
}

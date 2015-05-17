package pygame;

@:enum
abstract PyEventType (Int) from Int {
	var KEYDOWN   = 2;
	var KEYUP     = 3;
	var MOUSEMOVE = 4;
	var MOUSEDOWN = 5;
	var MOUSEUP   = 6;
	var QUIT      = 12;
	var RESIZE    = 16;
}

package pygame;

@:pythonImport('pygame')
extern class Pygame {
	/* Initialize all imported pygame modules */
	static function init():Void;

	/* Uninitialize imported pygame modules */
	static function quit():Void;

/* === Window Flags === */

	static var FULLSCREEN:Int;
	static var RESIZABLE:Int;
	static var DOUBLEBUF:Int;
	static var HWSURFACE:Int;
	static var OPENGL:Int;
	static var NOFRAME:Int;
}

package pygame;

import python.Tuple;
import python.Tuple.Tuple2;

import pygame.Surface;
import pygame.Rect;

@:pythonImport('pygame', 'display')
extern class Display {
	/* Initialize the Pygame Display Module */
	static function init():Void;

	/* Ends the current Program, and stuff */
	static function quit():Void;

	/* Determines whether the pygame module has been 'init'ed */
	static function get_init():Bool;

	/* Do some stuff */
	static function set_mode(resolution:Tuple<Int>, ?flags:Int, ?depth:Int):Surface;

	/* Return the Surface being used by [this] Window */
	static function get_surface():Surface;

	/* Update [this] Surface */
	static function update(?rect:Rect):Void;

	/* Get the Window title */
	static function get_caption():Tuple2<String, String>;

	/* Set the Window title */
	static function set_caption(title:String, ?icontitle:String):Void;

	/* Set the Window Icon */
	static function set_icon(icon : Surface):Void;

	/* Determine whether [this] Window is active */
	static function get_active():Bool;
}

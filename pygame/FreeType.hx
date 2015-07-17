package pygame;

import pygame.Color;
import pygame.Rect;
import pygame.Surface;

import python.Tuple;
import python.Tuple.Tuple2;

@:pythonImport('pygame', 'freetype')
extern class FreeType {
	/**
	  * Initialize the FreeType module
	  */
	static function init():Void;

	/**
	  * Shut down the FreeType library
	  */
	static function quit():Void;

	/**
	  * Check whether FreeType has been initialized
	  */
	static function was_init():Bool;
}

@:pythonImport('pygame.freetype', 'Font')
extern class Font {
	/**
	  * Construct a new Font object
	  */
	function new(file:String, ?size:Int, ?font_index:Int, ?resolution:Int):Void;

/* === Instance Methods === */

	/**
	  * Obtain the dimensions of a particular piece of text, when drawn with [this] Font
	  */
	function get_rect(text:String, ?style:Int, ?rotation:Int, ?size:Int):Rect;

	/**
	  * Render some text onto a new Surface with [this] Font
	  */
	function render(text:String, ?fgcolor:Color, ?bgcolor:Color, ?style:Int, ?rotation:Int, ?size:Int):Tuple2<Surface, Rect>;

	/**
	  * Render some text onto a given Surface with [this] Font
	  */
	function render_to(surface:Surface, dest:Rect, text:String, ?fgcolor:Color, ?bgcolor:Color, ?style:Int, ?rotation:Int, ?size:Int):Tuple2<Surface, Rect>;

/* === Instance Fields === */

	/* The name of [this] Font */
	var name : String;

	/* The path [this] Font */
	var path : String;

	/* Whether [this] Font will be rendered underlined */
	var underline : Bool;
	var underline_adjustment : Float;

	/* Whether [this] Font will be rendered strong */
	var strong : Bool;
	var strength : Float;

	/* Whether [this] Font will be rendered oblique */
	var oblique : Bool;

	/* Whether [this] Font will be stretched horizontally */
	var wide : Bool;

	/* Whether [this] Font is fixed-width */
	var fixed_width(default, never) : Bool;

	/* Whether [this] Font is scalable */
	var scalable(default, never) : Bool;

	var antialiased : Bool;
	var kerning : Bool;
	var vertical : Bool;
	var rotation : Int;
	var origin : Bool;
	var pad : Bool;
}

@:pythonImport('pygame.freetype', 'SysFont')
extern class SysFont extends Font {
	/* Constructor Function */
	function new(name:String, ?size:Int, ?bold:Bool, ?italic:Bool):Void;
}

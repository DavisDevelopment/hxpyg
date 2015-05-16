package pygame;

import python.Tuple;
import python.Tuple.Tuple2;
import python.Tuple.*;

import pygame.Rect;

@:pythonImport('pygame', 'Surface')
extern class NSurface {
	/* Construst a new Surface */
	function new(dimensions:Tuple<Int>, ?flags:Int, ?depth:Int, ?masks:Dynamic):Void;

	/* Draw another Surface onto [this] One */
	function blit(source:Surface, dest:Tuple<Int>, ?area:Rect, ?special_flags:Int):Void;

	/* Create a new copy of [this] Surface, but with a different pixel format */
	function convert(?arg1:Dynamic, ?flags:Int):Surface;

	/* Change the pixel format of a Surface, including per-pixel alphas */
	function convert_alpha(?other:Surface):Surface;

	/* Create and return a copy of [this] Surface */
	function copy():Surface;

	/* Fill a certain portion of [this] Surface with a specified Color */
	function fill(color:Tuple<Int>, ?rect:Rect, ?special_flags:Int):Void;

	/* Scroll the Surface */
	function scroll(?dx:Int, ?dy:Int):Void;

	/* Get the color of the pixel at a given position */
	function get_at(pos : Tuple<Int>):Color;

	/* Set the Color of the pixel at the given position */
	function set_at(pos:Tuple<Int>, color:Color):Void;

	/* Get the Width of [this] Surface */
	function get_width():Int;
	
	/* Get the Height of [this] Surface */
	function get_height():Int;

	/* Get the Size of [this] Surface */
	function get_size():Tuple2<Int, Int>;
}

/* Placeholder Type until pygame.Color is implemented */
private typedef Color = Dynamic;

package pygame;

/* Python Imports */
import python.Tuple;

/* Pygame Imports */
import pygame.Surface;
import pygame.Rect;
import pygame.Color;

/* Tannus Imports */

@:pythonImport('pygame', 'draw')
extern class Draw {
	/**
	  * Draw a Rect onto a Surface
	  */
	static function rect(s:Surface, color:Color, rect:Rect, ?width:Int):Void;

	/**
	  * Draw a Polygon onto a Surface
	  */
	static function polygon(s:Surface, color:Color, vertices:Array<Array<Int>>, ?width:Int):Void;

	/**
	  * Draw a Circle around a Point
	  */
	static function circle(s:Surface, color:Color, pos:Tuple<Int>, radius:Int, ?width:Int):Void;

	/**
	  * Draw an Ellipse onto a Surface
	  */
	static function ellipse(s:Surface, color:Color, rect:Rect, ?width:Int):Void;

	/**
	  * Draw an Arc onto a Surface
	  */
	static function arc(s:Surface, color:Color, rect:Rect, start:Float, end:Float, ?width:Int):Void;

	/**
	  * Draw a Line onto a Surface
	  */
	static function line(s:Surface, color:Color, start:Tuple<Int>, end:Tuple<Int>, ?width:Int):Void;

	/**
	  * Draw an anti-aliased Line onto a Surface
	  */
	static function aaline(s:Surface, color:Color, start:Tuple<Int>, end:Tuple<Int>, ?width:Int):Void;

	/**
	  * Draw a list of lines onto a Surface
	  */
	static function lines(s:Surface, color:Color, closed:Bool, points:Array<Array<Int>>, ?width:Int):Void;

	/**
	  * Draw a list of anti-aliased lines onto a Surface
	  */
	static function aalines(s:Surface, color:Color, closed:Bool, points:Array<Array<Int>>, ?width:Int):Void;
}

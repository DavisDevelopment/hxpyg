package pygame;

import pygame.Surface;
import pygame.Rect;
import pygame.Color;

import python.Tuple.Tuple2;

import tannus.geom.Area;
import tannus.geom.Angle;

class Transform {
	/* Flip Surface */
	public static inline function flip(s:Surface, vertical:Bool, horizontal:Bool):Surface {
		return Nt.flip(s, vertical, horizontal);
	}

	/* Scale Surface */
	public static function scale(s:Surface, size:Area, ?dest:Surface):Surface {
		if (dest != null)
			return Nt.scale(s, size, dest);
		else
			return Nt.scale(s, size);
	}

	/* Smoothly Scale Surface */
	public static function smoothscale(s:Surface, size:Area, ?dest:Surface):Surface {
		if (dest != null)
			return Nt.smoothscale(s, size, dest);
		else
			return Nt.smoothscale(s, size);
	}

	/* Rotate Surface */
	public static inline function rotate(s:Surface, angle:Angle):Surface {
		return Nt.rotate(s, angle.degrees);
	}

	/* Double the size of [s] */
	public static function scale2x(s:Surface, ?dest:Surface):Surface {
		if (dest != null)
			return Nt.scale2x(s, dest);
		else
			return Nt.scale2x( s );
	}

	/* Get average Color of [s] */
	public static function average_color(s:Surface, ?rect:Rect):Color {
		if (rect != null)
			return Nt.average_color(s, rect);
		else
			return Nt.average_color( s );
	}

	public static var rotozoom:Surface->Float->Float->Surface = Nt.rotozoom;
	public static var chop:Surface->Rect->Surface = Nt.chop;
}

/**
  * Extern for pygame.transform
  */
@:pythonImport('pygame', 'transform')
extern class Nt {
	/**
	  * Flip the surface vertically, horizontally, or both
	  */
	static function flip(s:Surface, vertical:Bool, horizontal:Bool):Surface;

	/**
	  * Create and return a resized copy of [s]
	  */
	static function scale(s:Surface, size:Tuple2<Int, Int>, ?dest:Surface):Surface;

	/**
	  * Create and return a rotated copy of [s]
	  */
	static function rotate(s:Surface, angle:Float):Surface;

	/**
	  * scale and rotate
	  */
	static function rotozoom(s:Surface, angle:Float, scale:Float):Surface;

	/**
	  * Specialized Image doubler
	  */
	static function scale2x(s:Surface, ?dest:Surface):Surface;

	/**
	  * Scale an Image smoothly
	  */
	static function smoothscale(s:Surface, size:Tuple2<Int, Int>, ?dest:Surface):Surface;

	/**
	  * Do some chopping
	  */
	static function chop(s:Surface, rect:Rect):Surface;

	/**
	  * Get the average Color in a Surface
	  */
	static function average_color(s:Surface, ?rect:Rect):Color;
}

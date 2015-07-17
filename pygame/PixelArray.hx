package pygame;

/* Python Imports */
import python.Tuple;
import python.Tuple.Tuple2;
import python.Tuple.Tuple3;

/* Pygame Imports */
import pygame.Surface;
import pygame.Color;
import pygame.Rect;

/* Tannus Imports */
import tannus.io.Ptr;
import tannus.geom.Point;
import tannus.graphics.Color in Col;

/* Placeholder typedef, until the abstract is written */
@:forward
abstract PixelArray (PxArray) from PxArray {
	/* Constructor Function */
	public inline function new(s : Surface):Void {
		this = new PxArray(s);
	}

/* === Instance Methods === */

	/* Array Get */
	@:arrayAccess
	public inline function get(pos : Point):Col {
		return Col.fromInt(untyped this[pos.toPythonTwoTupleInt()]);
	}

	/* Array Set */
	@:arrayAccess
	public inline function set(pos:Point, col:Col):Col {
		untyped {
			this[pos.toPythonTwoTupleInt()] = col.toInt();
		};
		return col;
	}
}

@:pythonImport('pygame', 'PixelArray')
extern class PxArray {
	/* Constructor Function */
	function new(surface : Surface):Void;

/* === Instance Fields === */

	/* The Surface [this] is attached to */
	var surface : Surface;

	var itemsize : Int;

	var ndim : Int;

/* === Instance Methods === */

	/* Create a new Surface from the current PixelArray */
	function make_surface():Surface;

	/* To all pixels whose color is within [distance] of [color], assign [repcolor] as the new Color */
	function replace(color:Color, repcolor:Color, ?distance:Int):Void;

	/* Set all pixels whose color is within [distance] of [color], white */
	function extract(color:Color, ?distance:Int):Void;
}

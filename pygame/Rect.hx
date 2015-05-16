package pygame;

import tannus.math.TMath.i;
import tannus.geom.Rectangle;
import tannus.geom.Point;

import python.Tuple;
import python.Tuple.Tuple2;

@:forward
abstract Rect (NRect) from NRect {
	public inline function new(left:Int, top:Int, width:Int, height:Int):Void {
		this = new NRect(left, top, width, height);
	}

/* === Instance Fields === */

	/**
	  * The position of [this] Rect, as a Point
	  */
	public var position(get, set):Point;
	private inline function get_position():Point {
		return new Point(this.x, this.y);
	}
	private inline function set_position(np : Point):Point {
		this.x = i(np.x);
		this.y = i(np.y);

		return position;
	}

/* === Instance Methods === */

/* === Implicit Casting === */

	/* To tannus.geom.Rectangle */
	@:to
	public inline function toRectangle():Rectangle {
		return new Rectangle(this.x, this.y, this.w, this.h);
	}

	/* From tannus.geom.Rectangle */
	@:from
	public static inline function fromRectangle(r : Rectangle):Rect {
		return new Rect(i(r.x), i(r.y), i(r.w), i(r.h));
	}

	/* From Array<Number> */
	@:from
	public static inline function fromArray<T : Float>(a : Array<T>):Rect {
		return fromRectangle(Rectangle.fromArray(a));
	}
}

@:pythonImport('pygame', 'Rect')
extern class NRect {
	/* Construct a Rect */
	function new(l:Int, t:Int, w:Int, h:Int):Void;

/* === Instance Fields === */

	/* [this] Rect's position */
	var left:Int;
	var x:Int;
	var top:Int;
	var y:Int;
	var right:Int;
	var bottom:Int;
	var centerx:Int;
	var centery:Int;
	var center:Tuple2<Int, Int>;
	
	/* [this] Rect's size */
	var w:Int;
	var width:Int;
	var h:Int;
	var height:Int;
	var size:Tuple2<Int, Int>;

/* === Instance Methods === */

	/* Create and return a copy of [this] Rect */
	function copy():Rect;

	/* Return a new Rect which is moved to the given offset */
	function move(x:Int, y:Int):Rect;

	/* Moves [this] Rect in place */
	function move_ip(x:Int, y:Int):Void;

	/* Grow, or shrink, the Rect in size */
	function inflate(x:Int, y:Int):Rect;

	/* Inflate [this] Rect inplace */
	function inflate_ip(x:Int, y:Int):Void;

	/* Move [this] Rect inside of another Rect */
	function clamp(other : Rect):Rect;

	/* Clamp [this] Rect inplace */
	function clamp_ip(other : Rect):Void;

	/* Test if one Rect is inside another */
	function contains(other : Rect):Bool;

	/* Test if a Point is inside of [this] Rect */
	function collidepoint(x:Int, y:Int):Bool;
}

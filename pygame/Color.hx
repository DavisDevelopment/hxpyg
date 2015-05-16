package pygame;

import tannus.graphics.Color in TColor;

import python.Tuple;
import python.Tuple.Tuple4;

abstract Color (NColor) from NColor {
	/* Constructor Function */
	public inline function new(r:Int, g:Int, b:Int, a:Int):Void {
		this = new NColor(r, g, b, a);
	}

/* === Implicit Casting === */

	/* To tannus.graphics.Color */
	@:to
	public inline function toTColor():TColor {
		return new TColor(this.r, this.g, this.b, this.a);
	}

	/* From tannus.graphics.Color */
	@:from
	public static inline function fromTColor(c : TColor):Color {
		return new Color(c.red, c.green, c.blue, c.alpha);
	}

	/* To Tuple */
	@:to
	public inline function toTuple():CTup {
		return CTup.make(this.r, this.g, this.b, this.a);
	}

	/* From Tuple */
	@:from
	public static inline function fromTuple(t : CTup):Color {
		return new Color(t._1, t._2, t._3, t._4);
	}
}

@:pythonImport('pygame', 'Color')
extern class NColor {
	/* Construct new Color */
	function new(r:Int, g:Int, b:Int, a:Int):Void;

/* === Instance Fields === */

	var r:Int;
	var g:Int;
	var b:Int;
	var a:Int;

/* === Instance Methods === */

	function normalize():CTup;
}

private typedef CTup = Tuple4<Int, Int, Int, Int>;

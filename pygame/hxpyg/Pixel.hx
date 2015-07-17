package pygame.hxpyg;

import tannus.io.Ptr;
import tannus.geom.Point;
import tannus.graphics.Color;

import pygame.hxpyg.Pixels;
import python.Tuple;
import python.Tuple.Tuple2;

@:allow(pygame.hxpyg.Pixels)
abstract Pixel (Pixl) {
	/* Constructor Function */
	private inline function new(pos:Point, ref:Ptr<Color>):Void {
		this = new Tuple2(untyped [pos, ref]);
	}

/* === Instance Fields === */

	/**
	  * Internal reference to the Color Pointer
	  */
	private var ref(get, never):Ptr<Color>;
	private inline function get_ref() return this._2;

	/**
	  * Internal reference to [this] Pixel's Point
	  */
	private var pos(get, never):Point;
	private inline function get_pos() return this._1;

	/**
	  * The Color of [this] Pixel
	  */
	public var color(get, set):Color;
	private inline function get_color() return ref.get();
	private inline function set_color(nc : Color) return ref.set( nc );

	/**
	  * The position of [this] Pixel on the x-axis
	  */
	public var x(get, never):Int;
	private inline function get_x() return pos.ix;

	/**
	  * The position of [this] Pixel on the y-axis
	  */
	public var y(get, never):Int;
	private inline function get_y() return pos.iy;
}

private typedef Pixl = Tuple2<Point, Ptr<Color>>;

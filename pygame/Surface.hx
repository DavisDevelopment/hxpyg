package pygame;

import python.Tuple;
import python.Tuple.Tuple2;
import pygame.NSurface;

@:forward
abstract Surface (NSurface) from NSurface {
	public inline function new(w:Int, h:Int, ?flags:Int=0, ?depth:Int=0, ?masks:Dynamic):Void {
		this = new NSurface(new Tuple([w, h]), flags, depth, masks);
	}

/* === Instance Fields === */

	/**
	  * The width of [this] Surface
	  */
	public var width(get, never):Int;
	private inline function get_width() return (this.get_width());

	/**
	  * The height of [this] Surface
	  */
	public var height(get, never):Int;
	private inline function get_height() return (this.get_height());

	/**
	  * The 'size' of [this] Surface
	  */
	public var size(get, never):Tuple2<Int, Int>;
	private inline function get_size() {
		return (this.get_size());
	}

/* === Instance Methods === */

/* === Implicit Casting === */

	/* From NSurface */
	@:from
	public static inline function fromNSurface(ns : NSurface):Surface {
		return (cast ns);
	}
}

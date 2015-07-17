package pygame.hxpyg;

import pygame.hxpyg.Surface;
import pygame.hxpyg.Pixel;
import pygame.Surface in Surf;
import pygame.PixelArray;

import tannus.io.Ptr;
import tannus.geom.Point;
import tannus.geom.Rectangle;
import tannus.graphics.Color;

@:allow(pygame.hxpyg.Surface)
class Pixels implements pygame.hxpyg.SurfaceAccessor {
	/* Constructor Function */
	private function new(surf : Surface):Void {
		surface = surf;
		px = new PixelArray(surface.component);
	}

/* === Instance Methods === */

	/**
	  * Get the color of the pixel at the given Point
	  */
	public function get_color(pt : Point):Color {
		return px[pt];
	}

	/**
	  * Set the color of the pixel at the given Point
	  */
	public function set_color(pt:Point, color:Color):Color {
		return (px[pt] = color);
	}

	/**
	  * Get a Pixel
	  */
	public function get(pos : Point):Pixel {
		var color:Ptr<Color> = new Ptr(get_color.bind(pos), set_color.bind(pos));
		return new Pixel(pos, color);
	}

	/**
	  * Iterate over all Pixels
	  */
	public function each(pred : Pixel->Bool):Void {
		for (x in 0...surface.width) {
			for (y in 0...surface.height) {
				var pixl = get([x, y]);
				if (!pred(pixl))
					break;
			}
		}
	}
	
	/**
	  * Destroy [this] Pixels
	  */
	public inline function destroy():Void {
		python.Syntax.delete( px );
	}

/* === Instance Fields === */

	/* The Surface that [this] is bound to */
	private var surface : Surface;

	/* The PixelArray instance that [this] references internally */
	private var px : PixelArray;
}

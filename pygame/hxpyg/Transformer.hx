package pygame.hxpyg;

import pygame.hxpyg.Surface;
import pygame.Transform in Tr;

import tannus.io.Ptr;
import tannus.geom.*;
import tannus.math.Percent;

import Math.round;

@:allow(pygame.hxpyg.Surface)
class Transformer implements pygame.hxpyg.SurfaceAccessor {
	/* Constructor Function */
	private function new(s : Surface):Void {
		surf = s;
		c = Ptr.create(s.component);
	}

/* === Instance Methods === */

	/**
	  * Resize the Surface
	  */
	public function resize(nw:Float, nh:Float, smooth:Bool=false):Void {
		c &= (smooth?Tr.smoothscale:Tr.scale)(c, new Area(nw, nh));
	}


	/**
	  * Obtain a resized clone of the Surface
	  */
	public function resized(nw:Float, nh:Float, smooth:Bool=false):Surface {
		return new Surface((smooth?Tr.smoothscale:Tr.scale)(c, new Area(nw, nh)));
	}

	/**
	  * Resize [this] Surface to [amount]% of it's current size
	  */
	public function scale(amount:Percent, smooth:Bool=false):Void {
		resize(amount.of(surf.width), amount.of(surf.height), smooth);
	}

	/**
	  * Get a scaled copy of [this] Surface
	  */
	public function scaled(amount:Percent, smooth:Bool=false):Surface {
		return resized(amount.of(surf.width), amount.of(surf.height), smooth);
	}

	/**
	  * Rotate the Surface
	  */
	public function rotate(angle : Angle):Void {
		c &= Tr.rotate(c, angle);
	}

	/**
	  * Get a rotated copy of the Surface
	  */
	public function rotated(angle : Angle):Surface {
		return new Surface(Tr.rotate(c, angle));
	}

/* === Instance Fields === */

	/* The Surface instance that [this] is bound to */
	private var surf : Surface;
	
	/* A Pointer to the underlying Surface of [surf] */
	private var c : Ptr<pygame.Surface>;
}

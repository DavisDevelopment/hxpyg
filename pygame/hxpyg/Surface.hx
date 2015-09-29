package pygame.hxpyg;

import tannus.geom.Rectangle;
import tannus.geom.Point;
import tannus.graphics.Color;
import tannus.ds.EitherType in Either;

import pygame.Surface in Surf;
import pygame.PixelArray;

import pygame.hxpyg.Pixels;
import pygame.hxpyg.Transformer;
import pygame.hxpyg.DrawingContext;
import pygame.hxpyg.SurfaceDrawable;

@:allow(pygame.hxpyg.SurfaceAccessor)
class Surface {
	/* Constructor Function */
	public function new(comp : Either<Surface, Surf>):Void {
		switch (comp.type) {
			case Left(s):
				component = s.component;

			case Right(c):
				component = c;
		}

		transform = new Transformer(this);
	}

/* === Instance Methods === */

	/**
	  * Create and return a 'clone' of [this] Surface
	  */
	public inline function clone():Surface {
		return new Surface(component.copy());
	}

	/**
	  * Draw some "drawable" object onto [this] Surface
	  */
	public function draw(item : SurfaceDrawable):Void {
		item.drawToSurface( this );
	}

	/**
	  * Create and return a new sub-Surface of [this] one
	  */
	public inline function sub(rect : Rectangle):Surface {
		return new Surface(component.subsurface( rect ));
	}

	/**
	  * Fill some area of [this] Surface with a given Color
	  */
	public function fill(color:Color, ?area:Rectangle):Void {
		if (area == null)
			area = new Rectangle(0, 0, component.width, component.height);
		component.fill(color, area);
	}

	/**
	  * Get a Pixels instance bound to [this] Surface
	  */
	public function pixels():Pixels {
		return new Pixels( this );
	}

	/**
	  * Obtain a drawing context for [this] Surface
	  */
	public function getContext():DrawingContext {
		return new DrawingContext( this );
	}

	/**
	  * 'blit' [this] Surface onto a 'non-wrapped' pygame.Surface instance
	  */
	public function blitTo(s:Surf, pos:Point, ?area:Rectangle):Void {
		var dest:Rectangle = new Rectangle(pos.x, pos.y);
		if (area != null)
			s.blit(component, dest, area);
		else
			s.blit(component, dest);
	}

/* === Computed Instance Fields === */

	/**
	  * The width of [this] Surface
	  */
	public var width(get, never):Int;
	private inline function get_width() return component.width;

	/**
	  * The height of [this] Surface
	  */
	public var height(get, never):Int;
	private inline function get_height() return component.height;

	/**
	  * The Rectangle [this] Surface occupies
	  */
	public var rect(get, set):Rectangle;
	private function get_rect():Rectangle {
		return new Rectangle(0, 0, width, height);
	}
	private function set_rect(r : Rectangle):Rectangle {
		transform.resize(r.w, r.h);
		return rect;
	}

/* === Instance Fields === */

	/* Underlying pygame Surface */
	private var component : Surf;
	
	/* A Transformer instance bound to [this] Surface */
	public var transform : Transformer;
}

package pygame.hxpyg;

import tannus.io.Ptr;
import tannus.ds.EitherType;
import tannus.geom.*;
import tannus.graphics.Color;

import pygame.Draw;
import pygame.Surface in Surf;
import pygame.hxpyg.Surface;
import pygame.hxpyg.SurfaceAccessor;

import Math.round;

@:allow(pygame.hxpyg.Surface)
class DrawingContext implements SurfaceAccessor {
	/* Constructor Function */
	private function new(s : Surface):Void {
		surf = s;
		c = Ptr.create(s.component);
	}

/* === Instance Methods === */

	/**
	  * Blit another Surface onto [this] One
	  */
	public function blit(other:Surface, pos:Point, ?area:Rectangle):Void {
		var dest = new Rectangle(pos.x, pos.y);
		if (area != null)
			c.v.blit(other.component, dest, area);
		else
			c.v.blit(other.component, dest);
	}

	/**
	  * Fill the given Rectangle with the given Color
	  */
	public function fillRect(rect:Rectangle, color:Color):Void {
		Draw.rect(c, color, rect);
	}

	/**
	  * Stroke a Rectangle
	  */
	public function drawRect(rect:Rectangle, color:Color, width:Float):Void {
		Draw.rect(c, color, rect, round(width));
	}

	/**
	  * Fill a Polygon
	  */
	public function fillPolygon(shape:Polygon, color:Color):Void {
		Draw.polygon(c, color, shape.vertices);
	}

	/**
	  * Stroke a Polygon
	  */
	public function drawPolygon(shape:Polygon, color:Color, width:Float):Void {
		Draw.polygon(c.v, color, shape.vertices, round(width));
	}

/* === Instance Fields === */

	/* The Surface that [this] is bound to */
	private var surf : Surface;

	/* The underlying Surface to [surf] */
	private var c : Ptr<Surf>;
}

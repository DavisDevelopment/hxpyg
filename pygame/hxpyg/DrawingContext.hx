package pygame.hxpyg;

import tannus.io.Ptr;
import tannus.ds.EitherType;
import tannus.geom.*;
import tannus.graphics.Color;

import pygame.Draw;
import pygame.Surface in Surf;
import pygame.hxpyg.Surface;
import pygame.hxpyg.SurfaceAccessor;
import pygame.hxpyg.Path;

import Math.round;

@:allow(pygame.hxpyg.Surface)
class DrawingContext implements SurfaceAccessor {
	/* Constructor Function */
	private function new(s : Surface):Void {
		surf = s;
		c = s.component;
	}

/* === Instance Methods === */

	/**
	  * Blit another Surface onto [this] One
	  */
	public function blit(other:Surface, pos:Point, ?area:Rectangle):Void {
		var dest = new Rectangle(pos.x, pos.y);
		if (area != null)
			c.blit(other.component, dest, area);
		else
			c.blit(other.component, dest);
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
		Draw.polygon(c, color, shape.vertices, round(width));
	}

	/**
	  * Fill a Circle
	  */
	public function fillCircle(pos:Point, radius:Int, color:Color):Void {
		Draw.circle(c, color, pos, radius);
	}

	/**
	  * Stroke a Circle
	  */
	public function drawCircle(pos:Point, radius:Int, color:Color, width:Float):Void {
		Draw.circle(c, color, pos, radius, round(width));
	}

	/**
	  * Fill an Ellipse
	  */
	public function fillEllipse(rect:Rectangle, color:Color):Void {
		Draw.ellipse(c, color, rect);
	}

	/**
	  * Stroke an Ellipse
	  */
	public function drawEllipse(rect:Rectangle, color:Color, width:Float):Void {
		Draw.ellipse(c, color, rect, round(width));
	}

	/**
	  * Create a Rendering Path
	  */
	public inline function createPath():Path {
		return new Path(this);
	}

/* === Instance Fields === */

	/* The Surface that [this] is bound to */
	private var surf : Surface;

	/* The underlying Surface to [surf] */
	private var c : Surf;
}

package pygame.hxpyg.paths;

import tannus.geom.*;
import tannus.graphics.Color;

import pygame.hxpyg.Path;

@:access(pygame.hxpyg.Path)
class PathState {
	/* Constructor Function */
	public function new(p : Path):Void {
		owner = p;

		antiAlias = false;
		cursor = new Point(0, 0);
		lineColor = new Color(0, 0, 0);
		lineWidth = 1;
	}

/* === Instance Fields === */

	/* The Path that "owns" [this] State */
	private var owner : Path;

	/* The "current" position */
	public var cursor : Point;

	/* The "current" stroking Color */
	public var lineColor : Color;

	/* The "current" size of drawn lines */
	public var lineWidth : Float;

	/* Whether to anti-alias drawn lines */
	public var antiAlias : Bool;
}

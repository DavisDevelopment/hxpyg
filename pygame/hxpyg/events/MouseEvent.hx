package pygame.hxpyg.events;

import pygame.hxpyg.events.Event;

import tannus.geom.Point;
import tannus.inputs.MouseButton in Button;

class MouseEvent extends Event {
	/* Constructor Function */
	public function new(name:String, pos:Point, btn:Button):Void {
		super(name);
		position = pos;
		button = btn;
	}

/* === Instance Fields === */

	public var position : Point;
	public var button : Button;
}

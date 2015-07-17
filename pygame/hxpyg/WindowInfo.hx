package pygame.hxpyg;

import tannus.ds.Object;
import pygame.Pygame;

@:forward
abstract WindowInfo (WInfo) {
	/* Constructor Function */
	public inline function new():Void {
		this = {
			'fullscreen':false,
			'noframe':false,
			'resizable':false,
			'doublebuf':false,
			'hwsurface':false,
			'opengl':false
		};
	}

	public function flags():Int {
		var val:Int = 0;
		if (this.fullscreen)
			val = val|Pygame.FULLSCREEN;
		if (this.noframe)
			val = val|Pygame.NOFRAME;
		if (this.resizable)
			val = val|Pygame.RESIZABLE;
		if (this.doublebuf)
			val = val|Pygame.DOUBLEBUF;
		if (this.hwsurface)
			val = val|Pygame.HWSURFACE;
		if (this.opengl)
			val = val|Pygame.OPENGL;
		return val;
	}

	@:from
	public static function fromObject(o : Object):WindowInfo {
		return cast (o + new Object(new WindowInfo()));
	}

	@:from
	public static function fromDynamic(o : Dynamic):WindowInfo {
		return fromObject(o);
	}
}

typedef WInfo = {
	var fullscreen : Bool;
	var noframe : Bool;
	var resizable : Bool;
	var doublebuf : Bool;
	var hwsurface : Bool;
	var opengl : Bool;
};

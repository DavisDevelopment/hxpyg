package pygame.hxpyg;

import pygame.Image in Img;
import pygame.hxpyg.Surface;
import pygame.hxpyg.SurfaceAccessor;

class Image extends Surface {

/* === Instance Methods === */

	/**
	  * Save [this] Image to a File
	  */
	public inline function save(path : String):Void {
		Img.save(component, path);
	}

/* === Static Methods === */

	/**
	  * Load an Image from a File
	  */
	public static function load(path : String):Image {
		return new Image(Img.load(path));
	}
}

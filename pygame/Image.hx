package pygame;

import pygame.Surface;

@:pythonImport('pygame', 'image')
extern class Image {
	
	/* Loads an Image file as a Surface */
	static function load(path : String):Surface;

	/* Saves a Surface as an Image */
	static function save(img:Surface, path:String):Void;
}

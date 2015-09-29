package pygame.hxpyg;

import pygame.hxpyg.*;
import pygame.Surface in Surf;
import pygame.FreeType;
import pygame.FreeType.Font;
import pygame.FreeType.SysFont;

import tannus.ds.Ref;
import tannus.geom.*;
import tannus.graphics.Color;

import Math.*;

class TextRenderer implements SurfaceAccessor {
	/* Constructor Function */
	public function new(fontName:String, siz:Int):Void {
		font = new SysFont(fontName, siz);
		_size = siz;

		color = new Color(0, 0, 0);
		bgColor = new Color(255, 255, 255);
		rotation = new Angle( 0 );
	}

/* === Instance Methods === */

	/**
	  * Measure the size of [text] when drawn with [this] Renderer
	  */
	public function measure(text : String):Rectangle {
		return font.get_rect(text, 255, round(rotation.degrees));
	}

	/**
	  * Create a Surface with [text] drawn onto it with [this] Renderer
	  */
	public function render(text : String):Surface {
		var s:Surf = font.render(text, color, bgColor)._1;
		var surface:Surface = new Surface( s );
		return surface;
	}

	/**
	  * Render some text to [surface]
	  */
	public function render_to(surface:Surface, dest:Rectangle, text:String):Void {
		font.render_to(surface.component, dest, text, color, bgColor);
	}

/* === Computed Instance Fields === */

	/**
	  * The size of the Text
	  */
	public var size(get, set):Int;
	private inline function get_size():Int return _size;
	private function set_size(ns : Int):Int {
		font = new SysFont(font.name, ns);
		_size = ns;
		return size;
	}

	/**
	  * The name of the Font
	  */
	public var fontName(get, never):String;
	private inline function get_fontName() return font.name;

	/**
	  * Whether [this] Font is bold
	  */
	public var bold(get, set):Bool;
	private inline function get_bold() return (font.strong);
	private inline function set_bold(b : Bool) return (font.strong = b);

/* === Instance Fields === */

	private var font : Font;
	private var _size : Int;

	public var color : Color;
	public var bgColor : Color;
	public var rotation : Angle;
}

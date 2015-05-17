package pygame;

import haxe.extern.EitherType;

import python.Dict;
import pygame.PyEventType in Pt;
import pygame.Event;
import pygame.Keys;

import python.Tuple;
import python.Tuple.Tuple2;
import python.Tuple.Tuple3;
import python.Tuple.Tuple4;

import tannus.ds.Object;
import tannus.inputs.MouseButton;
import tannus.events.EventMod;

using tannus.ds.ArrayTools;
using Lambda;
class Events {
	/* Obtain the Array returned by Ne.get */
	public static inline function nget() return Ne.get();

	/**
	  * Obtain an Array of all events currently in the event queue
	  */
	public static function get():Array<Event> {
		return (nget().map(convert));
	}

	/**
	  * Create an Event instance from a PyEvent instance
	  */
	public static function convert(_e : PyEvent):Event {
		var e:PygEvent = _e;

		switch (e.type) {
			case Pt.QUIT:
				return Quit;

			case Pt.MOUSEMOVE:
				var pos:Tuple2<Int, Int> = cast e.data['pos'];
				var rel:Tuple2<Int, Int> = cast e.data['rel'];
				var buttons:Tuple<Int> = cast e.data['buttons'];
				return MouseMove(pos, rel, buttons.toArray());

			case Pt.MOUSEDOWN, Pt.MOUSEUP:
				var pos:Tuple2<Int, Int> = cast e.data['pos'];
				var button:MouseButton = cast e.data['button'];

				return ((e.type == Pt.MOUSEUP)?Event.MouseUp:Event.MouseDown)(pos, button);

			case Pt.KEYDOWN, Pt.KEYUP:
				var key:Int = cast e.data['key'];
				var kmods:Array<EventMod> = mods( e );

				return ((e.type==Pt.KEYUP)?Event.KeyUp:Event.KeyDown)(key, kmods);

			case Pt.RESIZE:
				var size:Tuple2<Int, Int> = cast e.data['size'];

				return Resize( size );

			default:
				return Other(cast e.type, e.data);
		}
	}

	/**
	  * Get an Array of Event Mods from a Keyboard Event
	  */
	private static function mods(e : PygEvent):Array<EventMod> {
		var mods:Array<EventMod> = new Array();
		var keys:Array<Bool> = Keys.get_pressed();
		var rel = (function(flag:Int, em:EventMod) if (keys[flag]) mods.push(em));

		rel(Pygame.K_RALT, Alt);
		rel(Pygame.K_LALT, Alt);
		rel(Pygame.K_RSHIFT, Shift);
		rel(Pygame.K_LSHIFT, Shift);
		rel(Pygame.K_LCTRL, Control);
		rel(Pygame.K_RCTRL, Control);
		rel(Pygame.K_RMETA, Meta);
		rel(Pygame.K_LMETA, Meta);
		rel(Pygame.K_RSUPER, Meta);
		rel(Pygame.K_LSUPER, Meta);

		return mods;
	}
}

@:pythonImport('pygame', 'event')
extern class Ne {
	/* Get all the events */
	static function get(?types:EitherType<Int, Array<Int>>):Array<Dynamic>;
}

/* Type Definition for Pygame Events */
private typedef PyEvent = {
	var type : Int;
	var __dict__ : Dict<String, Dynamic>;
};

/* Abstract Around PyEvent */
abstract PygEvent (PyEvent) from PyEvent {
	/* Constructor Function */
	public inline function new(e : PyEvent):Void {
		this = e;
	}

/* === Instance Fields === */

	/**
	  * The type of Event [this] is
	  */
	public var type(get, never):Pt;
	private inline function get_type():Pt {
		return cast this.type;
	}

	/**
	  * The data associated with [this] Event
	  */
	public var data(get, never):Object;
	private inline function get_data():Object {
		return Object.fromDict(this.__dict__);
	}
}

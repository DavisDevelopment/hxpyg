package pygame.hxpyg;

import pygame.Display;
import pygame.Pygame;
import pygame.Events in Ev;
import pygame.Clock;

import pygame.hxpyg.Surface;
import pygame.hxpyg.SurfaceAccessor;

import python.Tuple;

import tannus.geom.Rectangle; 
import tannus.io.Signal;
import tannus.io.EventDispatcher;
import tannus.graphics.Color;

class Window extends EventDispatcher implements SurfaceAccessor {
	/* Constructor Function */
	public function new(w:Int, h:Int, ?info:WindowInfo):Void {
		super();

		if (info == null)
			info = new WindowInfo();
		//- initialize pygame libs
		__loadLibs();

		//- open the pygame window and wrap it's Surface
		surface = new Surface(Display.set_mode(new Tuple([w, h]), info.flags()));
		clock = new Clock();
		bgcolor = new Color(255, 255, 255);
		frame = new Signal();
		closing = new Signal();

		__init();
	}

/* === Instance Methods === */

	/**
	  * Initialize [this] Window
	  */
	private inline function __init():Void {
		addSignals([
			'keydown',
			'keyup'
		]);
	}

	/**
	  * Load and initialize needed libs
	  */
	private inline function __loadLibs():Void {
		Pygame.init();
		Display.init();
	}

	/**
	  * Handle incoming Pygame Events
	  */
	private function _handleEvents(events : Array<pygame.Event>):Void {
		for (e in events) {
			switch (e) {
				/* Window is Being Closed */
				case Quit:
					close();

				/* Key is being pressed */
				case Event.KeyDown(key, mods):
					dispatch('keydown', {
						'key': key,
						'mods': mods
					});

				/* Key is being released */
				case Event.KeyUp(key, mods):
					dispatch('keyup', {
						'key': key,
						'mods': mods
					});

				default:
					null;
			}
		}
	}

	/**
	  * Update [this] Window's display
	  */
	public function update(?area:Rectangle):Void {
		if (area == null)
			Display.update();
		else
			Display.update(area);
	}

	/**
	  * Initiate Window's main loop
	  */
	public function startLoop():Void {
		while (_open) {
			//- Redraw the window's background
			surface.fill( bgcolor );

			//- Handle any incoming Events
			_handleEvents(Events.get());

			//- Fire the [frame] Signal
			frame.call( 0 );

			//- update the display
			update();
			clock.tick( 30 );
		}
	}

	/**
	  * Close [this] Window
	  */
	public function close():Void {
		Display.quit();
		Pygame.quit();
		closing.call(false);
		Sys.exit(0);
	}

	/**
	  * Listen for 'frame' Events
	  */
	public function onframe(f : Void->Void):Void {
		frame.on(function(x) f());
	}

	/**
	  * Set the icon for [this] Window
	  */
	public inline function setIcon(icon : Surface):Void {
		Display.set_icon( icon.component );
	}

/* === Computed Instance Fields === */

	/**
	  * The title of [this] Window
	  */
	public var title(get, set):String;
	private inline function get_title() return Display.get_caption()._1;
	private inline function set_title(nt : String) {
		Display.set_caption( nt );
		return nt;
	}

/* === Instance Fields === */

	/* The Window's Surface */
	public var surface : Surface;

	/* Background for [this] Window */
	public var bgcolor : Color;

	/* A Signal to be fired before each frame */
	public var frame : Signal<Int>;

	/* Signal which fires just before [this] Window closes */
	public var closing : Signal<Bool>;
	
	private var clock : Clock;
	private var _open : Bool = true;
}

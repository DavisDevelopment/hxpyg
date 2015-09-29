package pygame.hxpyg;

import tannus.geom.*;
import tannus.io.Ptr;
import tannus.ds.Ref;
import tannus.ds.ActionStack;
import tannus.io.Asserts.*;
import tannus.graphics.Color;

import pygame.hxpyg.*;
import pygame.hxpyg.paths.PathState;
import pygame.Surface;

import Math.*;

using Lambda;
using pygame.Draw;

@:access(pygame.hxpyg.DrawingContext)
class Path implements SurfaceAccessor {
	/* Constructor Function */
	public function new(c : DrawingContext):Void {
		ctx = c;
		surf = c.c;
		cached = false;
		states = new Array();
		state = new PathState( this );
	}

/* === Instance Methods === */

	/**
	  * Move the Cursor to the given Point
	  */
	public function moveTo(x:Float, y:Float):Void {
		state.cursor = new Point(x, y);
	}

	/**
	  * Draw a Line from the current point to the given point
	  */
	public function lineTo(x:Float, y:Float):Void {
		var line = (state.antiAlias ? surf.aaline : surf.line);
		line(lineColor, state.cursor.toGenericIntTuple(), new Point(x, y).toGenericIntTuple(), round(lineWidth));
		moveTo(x, y);
	}

	/**
	  * Draw the given Line
	  */
	public inline function drawLine(line : Line):Void {
		moveTo(line.start.x, line.start.y);
		lineTo(line.end.x, line.end.y);
	}

	/**
	  * Draw an Array of Lines
	  */
	public function drawLines(lines : Array<Line>):Void {
		for (l in lines)
			drawLine( l ); }

	/**
	  * Draw Vertices
	  */
	public function vertices(verts : Vertices):Void {
		drawLines(verts.toLines());
	}

	/**
	  * Draw a Shape
	  */
	public function shape(s : Shape):Void {
		vertices( s.getVertices() );
	}

/* === State Handling Methods === */

	/**
	  * "save" the current State
	  */
	public function save():Void {
		states.push(state.clone());
	}

	/**
	  * "restore" a saved State
	  */
	public function restore():Void {
		var saved:Null<PathState> = states.pop();
		assert(saved != null, 'Error: Nothing to restore!');
		state = saved;
	}

/* === Computed Instance Fields === */

	/**
	  * The current stroke color
	  */
	public var lineColor(get, set):Color;
	private inline function get_lineColor():Color {
		return state.lineColor;
	}
	private inline function set_lineColor(c : Color):Color {
		return (state.lineColor = c);
	}

	/**
	  * The current line size
	  */
	public var lineWidth(get, set):Float;
	private inline function get_lineWidth():Float {
		return state.lineWidth;
	}
	private inline function set_lineWidth(nw : Float):Float {
		return (state.lineWidth = nw);
	}

	/**
	  * Whether to anti-alias
	  */
	public var antiAlias(get, set):Bool;
	private inline function get_antiAlias():Bool return state.antiAlias;
	private inline function set_antiAlias(aa : Bool) return (state.antiAlias = aa);

/* === Instance Fields === */

	/* The drawing context being used */
	private var ctx : DrawingContext;

	/* The Surface being used by [ctx] */
	private var surf : Surface;

	/* Whether [this] Path is redrawable */
	private var cached : Bool;

	/* The Stack of Actions being taken */
	private var states : Array<PathState>;

	/* The State of [this] Path */
	private var state : PathState;
}

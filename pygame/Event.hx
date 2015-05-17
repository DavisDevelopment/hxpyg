package pygame;

import tannus.geom.Point;
import tannus.geom.Area;
import tannus.io.Byte;
import tannus.ds.Object;
import tannus.inputs.MouseButton;
import tannus.events.EventMod;

/**
  * Enum of all possible pygame Events
  */
enum Event {
	/* Mouse Motion */
	MouseMove(pos:Point, from:Point, buttons:Array<Int>);

	/* Mouse Down */
	MouseDown(pos:Point, button:MouseButton);

	/* Mouse Up */
	MouseUp(pos:Point, button:MouseButton);

	/* Key Down */
	KeyDown(key:Byte, mods:Array<EventMod>);

	/* Key Up */
	KeyUp(key:Byte, mods:Array<EventMod>);

	/* Unknown Event */
	Other(type:Int, data:Object);

	/* Resize Window */
	Resize(nsize : Area);

	/* Close Window */
	Quit;
}

package pygame;

import tannus.geom.Point;
import tannus.io.Byte;
import tannus.ds.Object;

/**
  * Enum of all possible pygame Events
  */
enum Event {
	/* Mouse Motion */
	MouseMove(npos : Point);

	/* Mouse Down */
	MouseDown(pos:Point, button:Int);

	/* Mouse Up */
	MouseUp(pos:Point, button:Int);

	/* Key Down */
	KeyDown(key:Byte);

	/* Key Up */
	KeyUp(key:Byte);

	/* Unknown Event */
	Other(type:Int, data:Object);

	/* Resize Window */
	Resize;

	/* Close Window */
	Quit;
}

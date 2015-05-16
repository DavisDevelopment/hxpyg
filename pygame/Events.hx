package pygame;

@:pythonImport('pygame', 'event')
extern class Events {
	/* Get all the events */
	static function get():Array<Dynamic>;
}

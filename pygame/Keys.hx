package pygame;

@:pythonImport('pygame', 'key')
extern class Keys {
	/* Determine whether Pygame is receiving input from the System */
	function get_focused():Bool;

	/* Get the state of all Keyboard buttons */
	static function get_pressed():Array<Bool>;
}

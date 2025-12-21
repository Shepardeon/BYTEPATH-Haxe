package engine.input;

class ActionState {
	public var up:Bool;
	public var down:Bool;
	public var pressed:Bool;
	public var released:Bool;

	public function new() {
		up = true;
		down = false;
		pressed = false;
		released = false;
	}

	public inline function resetFrame():Void {
		pressed = false;
		released = false;
	}
}

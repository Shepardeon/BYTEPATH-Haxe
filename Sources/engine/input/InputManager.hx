package engine.input;

import kha.input.Gamepad;
import kha.input.Mouse;
import kha.input.KeyCode;
import kha.input.Keyboard;

class InputManager {
	final bindings:Map<Action, Array<Input>>;
	final states:Map<Action, ActionState>;

	public function new() {
		bindings = [];
		states = [];
		_subscribeToKhaInput();
	}

	// BINDINGS
	public function bind(action:Action, input:Input):Void {
		if (!bindings.exists(action)) {
			bindings.set(action, []);
		}

		if (!states.exists(action)) {
			states.set(action, new ActionState());
		}

		bindings.get(action).push(input);
	}

	public function unbind(action:Action, input:Input):Void {
		if (!bindings.exists(action)) {
			return;
		}

		bindings.get(action).remove(input);
	}

	public function rebind(action:Action, input:Input):Void {
		unbind(action, input);
		bind(action, input);
	}

	public function clearBindings(action:Action) {
		if (!bindings.exists(action)) {
			return;
		}

		bindings.get(action).resize(0);
	}

	// UPDATE
	public function update():Void {
		for (state in states) {
			state.resetFrame();
		}
	}

	// QUERY
	public inline function isUp(action:Action):Bool {
		return states.get(action).up;
	}

	public inline function isDown(action:Action):Bool {
		return states.get(action).down;
	}

	public inline function isPressed(action:Action):Bool {
		return states.get(action).pressed;
	}

	public inline function isReleased(action:Action):Bool {
		return states.get(action).released;
	}

	// CONNECTION TO KHA
	private function _subscribeToKhaInput():Void {
		Keyboard.get().notify(_keyDown, _keyUp);
		Mouse.get().notify(_mouseButtonDown, _mouseButtonUp);

		if (Gamepad.get(0) != null) {
			_gamepadConnected(0);
		}

		Gamepad.notifyOnConnect(_gamepadConnected);
	}

	private function _keyDown(key:KeyCode):Void {
		_processInputDown(Input.Key(key));
	}

	private function _keyUp(key:KeyCode):Void {
		_processInputUp(Input.Key(key));
	}

	private function _mouseButtonDown(button:Int, x:Int, y:Int):Void {
		_processInputDown(Input.MouseButton(button));
	}

	private function _mouseButtonUp(button:Int, x:Int, y:Int):Void {
		_processInputUp(Input.MouseButton(button));
	}

	private function _gamepadConnected(pad:Int):Void {
		Gamepad.get(pad).notify((button:Int, value:Float) -> _gamepadButtonDown(pad, button), (button:Int, value:Float) -> _gamepadButtonUp(pad, button));
	}

	private function _gamepadButtonDown(pad:Int, button:Int):Void {
		_processInputDown(Input.GamepadButton(pad, button));
	}

	private function _gamepadButtonUp(pad:Int, button:Int):Void {
		_processInputUp(Input.GamepadButton(pad, button));
	}

	private function _processInputDown(input:Input) {
		for (action => inputs in bindings) {
			if (inputs.filter((i) -> i.equals(input)).length > 0) {
				var state = states.get(action);

				if (!state.down) {
					state.up = false;
					state.down = true;
					state.pressed = true;
					state.released = false;
				}
			}
		}
	}

	private function _processInputUp(input:Input) {
		for (action => inputs in bindings) {
			if (inputs.filter((i) -> i.equals(input)).length > 0) {
				var state = states.get(action);

				if (!state.up) {
					state.up = true;
					state.down = false;
					state.pressed = false;
					state.released = true;
				}
			}
		}
	}
}

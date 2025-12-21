package engine.input;

import kha.input.KeyCode;

enum Input {
	Key(key:KeyCode);
	MouseButton(button:Int);
	GamepadButton(pad:Int, button:Int);
}

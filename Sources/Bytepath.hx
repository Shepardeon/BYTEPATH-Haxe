package;

import kha.input.KeyCode;
import engine.input.Action;
import engine.input.InputManager;
import kha.Framebuffer;
import kha.Assets;

class GameActions {
	public static final Test = Action.create();
}

class Bytepath {
	private var _input = new InputManager();

	public function new() {
		// Ok for small games
		Assets.loadEverything(init);
	}

	private function init():Void {
		_input.bind(GameActions.Test, Input.Key(KeyCode.Space));
	}

	public function update(dt:Float):Void {
		trace("Input: up=" + _input.isUp(GameActions.Test) + ", down=" + _input.isDown(GameActions.Test) + ", pressed=" + _input.isPressed(GameActions.Test)
			+ ", released=" + _input.isReleased(GameActions.Test));

		_input.update();
	}

	public function render(frame:Framebuffer):Void {
		var g = frame.g2;
	}
}

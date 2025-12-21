package;

import engine.timer.Timer;
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

		var testTimer = Timer.after(3, () -> trace("3 seconds elapsed!"));
		// Timer.cancel(testTimer);
	}

	public function update(dt:Float):Void {
		Timer.update(dt);
		_input.update();
	}

	public function render(frame:Framebuffer):Void {
		var g = frame.g2;
	}
}

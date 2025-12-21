package;

import engine.timer.tweens.Easing;
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

	var x:Float = 0;
	var y:Float = 0;

	private function init():Void {
		_input.bind(GameActions.Test, Input.Key(KeyCode.Space));

		// Will complete
		Timer.tween(2, Easing.inOutBack).to(() -> x, (v) -> x = v, 2).then(() -> trace(x));

		// Will cancel halfway through
		var tween = Timer.tween(2).to(() -> y, (v) -> y = v, 2).then(() -> trace(y));
		Timer.after(1, () -> tween.cancel());
	}

	public function update(dt:Float):Void {
		trace("X:" + x + "\tY:" + y);

		Timer.update(dt);
		_input.update();
	}

	public function render(frame:Framebuffer):Void {
		var g = frame.g2;
	}
}

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

		var h = Timer.every(1, () -> trace("tick!"));
		Timer.after(3, () -> trace("3 seconds elapsed!"));
		Timer.after(4, () -> {
			trace("4 seconds elapsed! Stop ticking in 3 ticks...");
			Timer.after(3, () -> Timer.cancel(h));
		});
		Timer.after(3, () -> trace("3 seconds elapsed second!"));
		Timer.during(2, (dt) -> trace("During..."), () -> trace("TIME !"));
	}

	public function update(dt:Float):Void {
		Timer.update(dt);
		_input.update();
	}

	public function render(frame:Framebuffer):Void {
		var g = frame.g2;
	}
}

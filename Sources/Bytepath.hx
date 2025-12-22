package;

import engine.timer.Timer;
import game.rooms.RoomManager;
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
	private var _roomManager = new RoomManager();

	public function new() {
		// Ok for small games
		Assets.loadEverything(init);
	}

	private function init():Void {
		_input.bind(GameActions.Test, Input.Key(KeyCode.Space));
	}

	public function update(dt:Float):Void {
		Timer.update(dt);
		_input.update();
	}

	public function render(frame:Framebuffer):Void {
		var g = frame.g2;
	}
}

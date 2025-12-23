package;

import kha.System;
import kha.Scaler;
import game.rooms.concretes.Stage;
import kha.Image;
import kha.Window;
import engine.timer.Timer;
import game.rooms.RoomManager;
import engine.input.InputManager;
import kha.Framebuffer;
import kha.Assets;

class Bytepath {
	private var _input:InputManager;
	private var _roomManager:RoomManager;
	private var _renderTarget:Image;
	private var _window:Window;

	public function new() {
		_input = new InputManager();
		_roomManager = new RoomManager();
		_renderTarget = Image.createRenderTarget(Constants.GAME_WIDTH, Constants.GAME_HEIGHT, null, NoDepthAndStencil, 0);
		_window = Window.get(0);

		// Ok for small games
		Assets.loadEverything(init);
	}

	private function init():Void {
		_roomManager.goToRoom(new Stage());
	}

	public function update(dt:Float):Void {
		_roomManager.update(dt);

		Timer.update(dt);
		_input.update();
	}

	public function render(frame:Framebuffer):Void {
		var g = frame.g2;

		// Render the current room to the texture target
		_roomManager.render(_renderTarget.g2);

		// Render the result to the screen
		g.begin();
		Scaler.scale(_renderTarget, frame, System.screenRotation);
		g.end();
	}
}

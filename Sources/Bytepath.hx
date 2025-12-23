package;

import haxe.io.Input;
import engine.input.Action;
import kha.math.Vector2;
import kha.System;
import kha.Scaler;
import kha.Image;
import kha.Assets;
import kha.Framebuffer;
import engine.timer.Timer;
import engine.camera.Camera;
import engine.input.InputManager;
import game.rooms.RoomManager;
import game.rooms.concretes.Stage;

class GameAction {
	public static final Shake = Action.create();
}

class Bytepath {
	private var _input:InputManager;
	private var _roomManager:RoomManager;
	private var _renderTarget:Image;
	private var _mainCamera:Camera;

	public function new() {
		_input = new InputManager();
		_roomManager = new RoomManager();
		_renderTarget = Image.createRenderTarget(Constants.GAME_WIDTH, Constants.GAME_HEIGHT, null, NoDepthAndStencil, 0);
		_mainCamera = new Camera(new Vector2(Constants.GAME_WIDTH / 2, Constants.GAME_HEIGHT / 2), Constants.GAME_WIDTH, Constants.GAME_HEIGHT, 1, 0);

		// Ok for small games
		Assets.loadEverything(init);
	}

	private function init():Void {
		_roomManager.goToRoom(new Stage());

		_input.bind(GameAction.Shake, Input.Key(F3));
	}

	public function update(dt:Float):Void {
		_roomManager.update(dt);
		_mainCamera.update(dt);

		if (_input.isPressed(GameAction.Shake)) {
			_mainCamera.shake(4, 0.5, 10);
		}

		Timer.update(dt);
		_input.update();
	}

	public function render(frame:Framebuffer):Void {
		// Render the current room to the texture target
		_renderTarget.g2.begin();

		_mainCamera.attach(_renderTarget.g2);
		_roomManager.render(_renderTarget.g2);
		_mainCamera.detach(_renderTarget.g2);

		_renderTarget.g2.end();

		// Render the result to the screen
		frame.g2.begin();
		Scaler.scale(_renderTarget, frame, System.screenRotation);
		frame.g2.end();
	}
}

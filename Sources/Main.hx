package;

import kha.Window;
import kha.Scheduler;
import kha.Framebuffer;
import kha.System;

class Main {
	private static var _deltaTime:Float = 0;
	private static var _lastTime:Float = Scheduler.time();

	public static function main() {
		System.start({title: Constants.PROJECT_NAME, width: Constants.WINDOW_HEIGHT, height: Constants.WINDOW_HEIGHT}, init);
	}

	static function init(_:Window) {
		var game = new Bytepath();
		System.notifyOnFrames((buffers:Array<Framebuffer>) -> game.render(buffers[0]));
		Scheduler.addTimeTask(() -> {
			var currentTime = Scheduler.time();
			_deltaTime = currentTime - _lastTime;
			_lastTime = currentTime;

			game.update(_deltaTime);
		}, 0, Constants.UPDATE_RATE);
	}
}

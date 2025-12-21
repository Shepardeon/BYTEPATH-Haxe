package engine.timer.tasks;

import engine.timer.tweens.Tween;
import engine.timer.interfaces.ITimerTask;

class TweenTask implements ITimerTask {
	public var finished(default, null):Bool = false;

	private final _tween:Tween;

	public function new(tween:Tween) {
		_tween = tween;
	}

	public function update(dt:Float) {
		_tween.update(dt);
		finished = _tween.finished;
	}
}

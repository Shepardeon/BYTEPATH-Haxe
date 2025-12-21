package engine.timer.tasks;

import engine.timer.interfaces.ITimerTask;

class DuringTask implements ITimerTask {
	public var finished(default, null):Bool = false;

	private var _time:Float = 0;
	private final _duration:Float;
	private final _onUpdate:(Float) -> Void;
	private final _onComplete:Null<() -> Void>;

	public function new(duration:Float, onUpdate:(Float) -> Void, onComplete:Null<() -> Void> = null) {
		_duration = duration;
		_onUpdate = onUpdate;
		_onComplete = onComplete;
	}

	public function update(dt:Float) {
		_time += dt;
		var t = Math.min(_time / _duration, 1);
		_onUpdate(dt);

		if (t == 1) {
			finished = true;
			if (_onComplete != null) {
				_onComplete();
			}
		}
	}
}

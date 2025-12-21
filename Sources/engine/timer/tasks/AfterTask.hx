package engine.timer.tasks;

import engine.timer.interfaces.ITimerTask;

class AfterTask implements ITimerTask {
	public var finished(default, null):Bool = false;

	private var _time:Float = 0;
	private final _delay:Float;
	private final _callback:() -> Void;

	public function new(delay:Float, callback:() -> Void) {
		_delay = delay;
		_callback = callback;
	}

	public function update(dt:Float):Void {
		_time += dt;

		if (_time >= _delay) {
			finished = true;
			_callback();
		}
	}
}

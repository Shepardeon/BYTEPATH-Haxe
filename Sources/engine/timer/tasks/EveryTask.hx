package engine.timer.tasks;

import engine.timer.interfaces.ITimerTask;

class EveryTask implements ITimerTask {
	public var finished(default, null):Bool = false;

	private var _time:Float = 0;
	private var _repeat:Int;
	private final _interval:Float;
	private final _callback:() -> Void;

	public function new(interval:Float, callback:() -> Void, repeat:Int = -1) {
		_interval = interval;
		_repeat = repeat;
		_callback = callback;
	}

	public function update(dt:Float) {
		_time += dt;

		while (_time >= _interval && !finished) {
			_time -= _interval;
			_callback();
			if (_repeat > 0 && --_repeat == 0) {
				finished = true;
			}
		}
	}
}

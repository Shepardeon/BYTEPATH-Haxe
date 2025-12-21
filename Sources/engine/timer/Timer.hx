package engine.timer;

import engine.timer.tasks.DuringTask;
import engine.timer.tasks.EveryTask;
import engine.timer.tasks.AfterTask;
import engine.timer.interfaces.ITimerTask;
import engine.timer.handlers.TimerHandle;

class Timer {
	private static var _tasks:Map<TimerHandle, ITimerTask> = [];
	private static var _nextId:Int = 0;

	// -- API ----------------------------------------------------------
	public static function after(delay:Float, cb:() -> Void):TimerHandle {
		return _add(new AfterTask(delay, cb));
	}

	public static function every(interval:Float, cb:() -> Void, repeat:Int = -1):TimerHandle {
		return _add(new EveryTask(interval, cb, repeat));
	}

	public static function during(duration:Float, onUpdate:(Float) -> Void, onComplete:Null<() -> Void> = null):TimerHandle {
		return _add(new DuringTask(duration, onUpdate, onComplete));
	}

	public static function cancel(handle:TimerHandle):Void {
		if (!_tasks.exists(handle)) {
			return;
		}

		_tasks.remove(handle);
	}

	public static function clear():Void {
		_tasks.clear();
	}

	// -- API END ------------------------------------------------------

	public static function update(dt:Float):Void {
		for (h => task in _tasks) {
			task.update(dt);
			if (task.finished) {
				_tasks.remove(h);
			}
		}
	}

	private static inline function _add(task:ITimerTask):TimerHandle {
		var h = new TimerHandle(_nextId++);
		_tasks.set(h, task);

		return h;
	}
}

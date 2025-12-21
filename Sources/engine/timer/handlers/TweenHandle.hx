package engine.timer.handlers;

import engine.timer.tweens.Tween;

class TweenHandle {
	public final timer:TimerHandle;
	public final tween:Tween;

	public inline function new(timer:TimerHandle, tween:Tween) {
		this.timer = timer;
		this.tween = tween;
	}

	public inline function to(get:() -> Float, set:(Float) -> Void, end:Float):TweenHandle {
		tween.to(get, set, end);
		return this;
	}

	public inline function then(callback:() -> Void):TweenHandle {
		tween.then(callback);
		return this;
	}

	public inline function cancel():Void {
		tween.cancel();
		Timer.cancel(timer);
	}
}

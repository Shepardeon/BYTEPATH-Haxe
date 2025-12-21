package engine.timer.tweens;

class TweenProperty {
	private final _get:() -> Float;
	private final _set:(Float) -> Void;
	private final _start:Float;
	private final _end:Float;

	public function new(get:() -> Float, set:(Float) -> Void, end:Float) {
		_get = get;
		_set = set;
		_end = end;
		_start = get();
	}

	public inline function apply(k:Float) {
		_set(_start + (_end - _start) * k);
	}
}

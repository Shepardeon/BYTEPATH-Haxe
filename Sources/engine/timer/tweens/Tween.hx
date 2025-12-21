package engine.timer.tweens;

typedef Ease = (Float) -> Float;

class Tween {
	public var finished(default, null):Bool = false;

	private var _time:Float = 0;
	private final _duration:Float;
	private final _ease:Ease;
	private final _properties:Array<TweenProperty> = [];
	private var _onComplete:Null<() -> Void>;

	public function new(duration:Float, ease:Ease) {
		_duration = duration;
		_ease = ease;
	}

	public inline function to(get:() -> Float, set:(Float) -> Void, end:Float):Tween {
		_properties.push(new TweenProperty(get, set, end));
		return this;
	}

	public inline function then(cb:() -> Void):Tween {
		_onComplete = cb;
		return this;
	}

	public inline function cancel():Void {
		if (_onComplete != null) {
			_onComplete();
		}
	}

	public function update(dt:Float):Void {
		if (finished) {
			return;
		}

		_time += dt;
		var t = Math.min(_time / _duration, 1);
		var k = _ease(t);

		for (prop in _properties) {
			prop.apply(k);
		}

		if (t == 1) {
			finished = true;
			if (_onComplete != null) {
				_onComplete();
			}
		}
	}
}

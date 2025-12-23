package engine.camera;

class CameraShake {
	public var finished(default, null):Bool = false;

	private var _amplitude:Float;
	private var _duration:Float;
	private var _time:Float;
	private var _frequency:Float;
	private var _samples:Array<Float> = [];

	public function new(amplitude:Float, duration:Float, frequency:Float = 60) {
		_amplitude = amplitude;
		_duration = duration;
		_frequency = frequency;
		_time = 0;

		var sampleCount = Std.int(_duration * _frequency);
		for (i in 0...sampleCount) {
			_samples.push(2 * Math.random() - 1);
		}
	}

	public function update(dt:Float):Void {
		_time += dt;
		if (_time >= _duration) {
			finished = true;
		}
	}

	public function getNoise(samplePoint:Int):Float {
		if (samplePoint >= _samples.length) {
			return 0;
		}

		return _samples[samplePoint];
	}

	public function getDecay(time:Float):Float {
		if (time > _duration) {
			return 0;
		}

		return (_duration - time) / _duration;
	}

	public function getAmplitude(time:Null<Float> = null):Float {
		if (time == null) {
			if (finished) {
				return 0;
			}

			time = _time;
		}

		var s = time * _frequency;
		var s0 = Math.floor(s);
		var s1 = s0 + 1;
		var k = getDecay(time);

		return _amplitude * (getNoise(s0) + (s - s0) * (getNoise(s1) - getNoise(s0))) * k;
	}
}

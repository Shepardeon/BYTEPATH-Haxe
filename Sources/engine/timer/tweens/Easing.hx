package engine.timer.tweens;

// Taken from : https://easings.net/
class Easing {
	private static final BACK_CONST1 = 1.70158;
	private static final BACK_CONST2 = BACK_CONST1 + 1.525;
	private static final BACK_CONST3 = BACK_CONST1 + 1;

	private static final ELASTIC_CONST1 = (2 * Math.PI) / 3;
	private static final ELASTIC_CONST2 = (2 * Math.PI) / 4.5;

	private static final BOUNCE_N1 = 7.5625;
	private static final BOUNCE_D1 = 2.75;

	/// IN EASINGS ---------------------------------------------------
	public static inline function linear(t:Float):Float {
		return t;
	}

	public static inline function inQuad(t:Float):Float {
		return t * t;
	}

	public static inline function inCubic(t:Float):Float {
		return t * t * t;
	}

	public static inline function inQuart(t:Float):Float {
		return t * t * t * t;
	}

	public static inline function inQuint(t:Float):Float {
		return t * t * t * t * t;
	}

	public static inline function inSine(t:Float):Float {
		return 1 - Math.cos((t * Math.PI) / 2);
	}

	public static inline function inCirc(t:Float):Float {
		return 1 - Math.sqrt(1 - Math.pow(t, 2));
	}

	public static inline function inExpo(t:Float):Float {
		return t == 0 ? 0 : Math.pow(2, 10 * t - 10);
	}

	public static inline function inBack(t:Float):Float {
		return BACK_CONST3 * t * t * t - BACK_CONST1 * t * t;
	}

	public static inline function inElastic(t:Float):Float {
		return t == 0 ? 0 : t == 1 ? 1 : -Math.pow(2, 10 * t - 10) * Math.sin((t * 10 - 10.75) * ELASTIC_CONST1);
	}

	public static inline function inBounce(t:Float):Float {
		return 1 - outBounce(1 - t);
	}

	/// OUT EASINGS ---------------------------------------------------
	public static inline function outQuad(t:Float):Float {
		return 1 - (1 - t) * (1 - t);
	}

	public static inline function outCubic(t:Float):Float {
		return 1 - Math.pow(1 - t, 3);
	}

	public static inline function outQuart(t:Float):Float {
		return 1 - Math.pow(1 - t, 4);
	}

	public static inline function outQuint(t:Float):Float {
		return 1 - Math.pow(1 - t, 5);
	}

	public static inline function outSine(t:Float):Float {
		return Math.sin((t * Math.PI) / 2);
	}

	public static inline function outCirc(t:Float):Float {
		return Math.sqrt(1 - Math.pow(t - 1, 2));
	}

	public static inline function outExpo(t:Float):Float {
		return t == 1 ? 1 : 1 - Math.pow(2, -10 * t);
	}

	public static inline function outBack(t:Float):Float {
		return 1 + BACK_CONST3 * Math.pow(t - 1, 3) + BACK_CONST1 * Math.pow(t - 1, 2);
	}

	public static inline function outElastic(t:Float):Float {
		return t == 0 ? 0 : t == 1 ? 1 : Math.pow(2, -10 * t) * Math.sin((t * 10 - 0.75) * ELASTIC_CONST1) + 1;
	}

	public static inline function outBounce(t:Float):Float {
		if (t < 1 / BOUNCE_D1) {
			return BOUNCE_N1 * t * t;
		} else if (t < 2 / BOUNCE_D1) {
			return BOUNCE_N1 * (t -= 1.5 / BOUNCE_D1) * t + 0.75;
		} else if (t < 2.5 / BOUNCE_D1) {
			return BOUNCE_N1 * (t -= 2.25 / BOUNCE_D1) * t + 0.9375;
		} else {
			return BOUNCE_N1 * (t -= 2.625 / BOUNCE_D1) * t + 0.984375;
		}
	}

	/// IN-OUT EASINGS ---------------------------------------------------
	public static inline function inOutQuad(t:Float):Float {
		return t < 0.5 ? 2 * t * t : 1 - Math.pow(-2 * t + 2, 2) / 2;
	}

	public static inline function inOutCubic(t:Float):Float {
		return t < 0.5 ? 4 * t * t * t : 1 - Math.pow(-2 * t + 2, 3) / 2;
	}

	public static inline function inOutQuart(t:Float):Float {
		return t < 0.5 ? 8 * t * t * t * t : 1 - Math.pow(-2 * t + 2, 4) / 2;
	}

	public static inline function inOutQuint(t:Float):Float {
		return t < 0.5 ? 16 * t * t * t * t * t : 1 - Math.pow(-2 * t + 2, 5) / 2;
	}

	public static inline function inOutSine(t:Float):Float {
		return -(Math.cos(Math.PI * t) - 1) / 2;
	}

	public static inline function inOutCirc(t:Float):Float {
		return t < 0.5 ? (1 - Math.sqrt(1 - Math.pow(2 * t, 2))) / 2 : (Math.sqrt(1 - Math.pow(-2 * t + 2, 2)) + 1) / 2;
	}

	public static inline function inOutExpo(t:Float):Float {
		return return t == 0 ? 0 : t == 1 ? 1 : t < 0.5 ? Math.pow(2, 20 * t - 10) / 2 : (2 - Math.pow(2, -20 * t + 10)) / 2;
	}

	public static inline function inOutBack(t:Float):Float {
		return t < 0.5 ? (Math.pow(2 * t,
			2) * ((BACK_CONST2 + 1) * 2 * t - BACK_CONST2)) / 2 : (Math.pow(2 * t - 2, 2) * ((BACK_CONST2 + 1) * (t * 2 - 2) + BACK_CONST2) + 2) / 2;
	}

	public static inline function inOutElastic(t:Float):Float {
		return t == 0 ? 0 : t == 1 ? 1 : t < 0.5 ?
			-(Math.pow(2,
				20 * t - 10) * Math.sin((20 * t - 11.125) * ELASTIC_CONST2)) / 2 : (Math.pow(2, -20 * t + 10) * Math.sin((20 * t - 11.125) * ELASTIC_CONST2)) / 2
				+ 1;
	}

	public static inline function inOutBounce(t:Float):Float {
		return t < 0.5 ? (1 - outBounce(1 - 2 * t)) / 2 : (1 + outBounce(2 * t - 1)) / 2;
	}
}

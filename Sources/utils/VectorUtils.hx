package utils;

import kha.math.Vector2;

class VectorUtils {
	public static inline function distance(a:Vector2, b:Vector2):Float {
		return Math.sqrt(distance2(a, b));
	}

	public static inline function distance2(a:Vector2, b:Vector2):Float {
		return (b.x - a.x) * (b.x - a.x) + (b.y - a.y) * (b.y - a.y);
	}

	public static function rotateAround(toRotate:Vector2, origin:Vector2, angle:Float):Vector2 {
		var xx = toRotate.x - origin.x;
		var yy = toRotate.y - origin.y;
		var cos = Math.cos(angle);
		var sin = Math.sin(angle);

		return new Vector2(xx * cos - yy * sin + origin.x, xx * sin + yy * cos + origin.y);
	}

	public static inline function lerp(from:Vector2, to:Vector2, t:Float):Vector2 {
		return new Vector2(from.x + (to.x - from.x) * t, from.y + (to.y - from.y * t));
	}

	public static inline function lerpInPlace(from:Vector2, to:Vector2, t:Float):Void {
		from.x += (to.x - from.x) * t;
		from.y += (to.y - from.y) * t;
	}

	public static inline function deltaLerp(from:Vector2, to:Vector2, deltaTime:Float, smoothing:Float):Vector2 {
		return lerp(from, to, 1 - Math.exp(-deltaTime * smoothing));
	}

	public static function deltaLerpInPlace(from:Vector2, to:Vector2, deltaTime:Float, smoothing:Float):Void {
		lerpInPlace(from, to, 1 - Math.exp(-deltaTime * smoothing));
	}
}

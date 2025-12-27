package engine.physics;

import utils.VectorUtils;
import engine.physics.colliders.abstracts.Collider;
import kha.math.Vector2;

class Body {
	public var accelerationSmoothing:Float = 10;
	public var decelerationSmoothing:Float = 10;
	public var isGrounded:Bool;

	public var pos(default, null):Vector2;
	public var velocity(default, null):Vector2;
	public var isStatic(default, null):Bool;
	public var collider(default, null):Collider;

	public function new(x:Float, y:Float, collider:Collider, isStatic:Bool = false) {
		pos = new Vector2(x, y);
		velocity = new Vector2();
		this.collider = collider;
		this.isStatic = isStatic;
		this.isGrounded = false;
		this.collider.attach(this);
	}

	public function accelerateToVelocity(desired:Vector2, dt:Float, smoothing:Float = -1):Void {
		if (smoothing < 0) {
			smoothing = accelerationSmoothing;
		}

		velocity = VectorUtils.deltaLerp(velocity, desired, dt, smoothing);
	}

	public inline function decelerate(dt:Float):Void {
		accelerateToVelocity(new Vector2(), dt, decelerationSmoothing);
	}

	public inline function accelerateInDirection(direction:Vector2, maxSpeed:Float, dt:Float):Void {
		accelerateToVelocity(direction.mult(maxSpeed), dt);
	}

	public inline function addImpulse(force:Float, dt:Float) {
		accelerateToVelocity(velocity.mult(force), dt);
	}

	public inline function addImpulseInDirection(direction:Vector2, force:Float, dt:Float) {
		accelerateInDirection(direction.mult(force), force * force, dt);
	}
}

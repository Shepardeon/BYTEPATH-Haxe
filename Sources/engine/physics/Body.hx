package engine.physics;

import engine.physics.colliders.abstracts.Collider;
import kha.math.Vector2;

class Body {
	public var pos(default, null):Vector2;
	public var velocity(default, null):Vector2;
	public var isStatic(default, null):Bool;
	public var isGrounded(default, null):Bool;
	public var collider(default, null):Collider;

	public function new(x:Float, y:Float, collider:Collider, isStatic:Bool = false) {
		pos = new Vector2(x, y);
		velocity = new Vector2();
		this.collider = collider;
		this.isStatic = isStatic;
		this.isGrounded = false;
	}
}

package engine.physics.colliders.concretes;

import engine.physics.colliders.abstracts.Collider;

class CircleCollider extends Collider {
	public var radius(default, null):Float;

	public function new(body:Body, radius:Float) {
		super(body);
		this.radius = radius;
	}

	public function toAABB():AABB {
		return new AABB(body.pos.x - radius, body.pos.y - radius, radius * 2, radius * 2);
	}
}

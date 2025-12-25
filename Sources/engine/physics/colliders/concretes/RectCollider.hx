package engine.physics.colliders.concretes;

import engine.physics.colliders.abstracts.Collider;

class RectCollider extends Collider {
	public var width(default, null):Float;
	public var height(default, null):Float;

	public function new(body:Body, width:Float, height:Float) {
		super(body);
		this.width = width;
		this.height = height;
	}

	public function toAABB():AABB {
		return new AABB(body.pos.x - width * 0.5, body.pos.y - height * 0.5, width, height);
	}
}

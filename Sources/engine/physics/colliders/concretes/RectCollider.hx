package engine.physics.colliders.concretes;

import engine.physics.colliders.abstracts.Collider;

class RectCollider extends Collider {
	public var width(default, null):Float;
	public var height(default, null):Float;

	public function new(width:Float, height:Float, layer:Int = 0) {
		this.layer = layer;
		this.width = width;
		this.height = height;
	}

	public function toAABB():AABB {
		return new AABB(body.pos.x - width * 0.5, body.pos.y - height * 0.5, width, height);
	}
}

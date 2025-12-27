package engine.physics.colliders.concretes;

import kha.graphics2.Graphics;
import utils.GraphicsUtils;
import engine.physics.colliders.abstracts.Collider;

class CircleCollider extends Collider {
	public var radius(default, null):Float;

	public function new(radius:Float, layer:Int = 0) {
		this.layer = layer;
		this.radius = radius;
	}

	public function toAABB():AABB {
		return new AABB(body.pos.x - radius, body.pos.y - radius, radius * 2, radius * 2);
	}

	public function draw(g:Graphics):Void {
		GraphicsUtils.drawCircle(g, body.pos.x, body.pos.y, radius);
	}
}

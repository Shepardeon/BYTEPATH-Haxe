package engine.physics.colliders.concretes;

import kha.graphics2.Graphics;
import engine.physics.colliders.abstracts.Collider;

class RectCollider extends Collider {
	public var width(default, null):Float;
	public var height(default, null):Float;
	public var halfW(default, null):Float;
	public var halfH(default, null):Float;

	public function new(width:Float, height:Float, layer:Int = 0) {
		this.layer = layer;
		this.width = width;
		this.height = height;
		halfW = width * 0.5;
		halfH = height * 0.5;
	}

	public function toAABB():AABB {
		return new AABB(body.pos.x - halfW, body.pos.y - halfH, width, height);
	}

	public function draw(g:Graphics):Void {
		g.drawRect(body.pos.x - halfW, body.pos.y - halfH, width, height);
	}
}

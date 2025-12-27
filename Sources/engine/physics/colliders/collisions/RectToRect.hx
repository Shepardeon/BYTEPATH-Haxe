package engine.physics.colliders.collisions;

import utils.MathUtils;
import kha.math.Vector2;
import engine.physics.colliders.concretes.RectCollider;

class RectToRect {
	public static function test(a:RectCollider, b:RectCollider):CollisionManifold {
		var m = new CollisionManifold();

		var dx = b.body.pos.x - a.body.pos.x;
		var px = (a.halfW + b.halfW) - Math.abs(dx);
		if (px <= 0) {
			return m;
		}

		var dy = b.body.pos.y - a.body.pos.y;
		var py = (a.halfH + b.halfH) - Math.abs(dy);
		if (py <= 0) {
			return m;
		}

		m.isColliding = true;

		if (px < py) {
			m.penetration = px;
			m.normal = new Vector2(MathUtils.sign(dx), 0);
		} else {
			m.penetration = py;
			m.normal = new Vector2(0, MathUtils.sign(dy));
		}

		m.contactPoint = new Vector2(a.body.pos.x + m.normal.x + a.halfW, a.body.pos.y + m.normal.y + a.halfH);

		return m;
	}
}

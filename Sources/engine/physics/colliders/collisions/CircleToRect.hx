package engine.physics.colliders.collisions;

import utils.MathUtils;
import kha.math.Vector2;
import engine.physics.colliders.concretes.CircleCollider;
import engine.physics.colliders.concretes.RectCollider;

class CircleToRect {
	public static function test(a:CircleCollider, b:RectCollider):CollisionManifold {
		var m = new CollisionManifold();

		var closestX = Math.max(b.body.pos.x - b.halfW, Math.min(a.body.pos.x, b.body.pos.x + b.halfW));
		var closestY = Math.max(b.body.pos.y - b.halfH, Math.min(a.body.pos.y, b.body.pos.y + b.halfH));

		var closest = new Vector2(closestX, closestY);
		var delta = a.body.pos.sub(closest);
		var dist = delta.length;

		if (dist > a.radius) {
			return m;
		}

		m.isColliding = true;

		if (dist > 0) {
			m.normal = delta.mult(1 / dist);
			m.penetration = a.radius - dist;
			m.contactPoint = closest;
		} else {
			// Circle and rectangle are overlapped (centers at the same coords)
			var dx = a.body.pos.x - b.body.pos.x;
			var dy = a.body.pos.y - b.body.pos.y;
			var px = b.halfW - Math.abs(dx);
			var py = b.halfH - Math.abs(dy);

			if (px < py) {
				m.normal = new Vector2(MathUtils.sign(dx), 0);
				m.penetration = px;
			} else {
				m.normal = new Vector2(0, MathUtils.sign(dy));
				m.penetration = py;
			}

			m.contactPoint = a.body.pos.sub(m.normal.mult(a.radius));
		}

		return m;
	}
}

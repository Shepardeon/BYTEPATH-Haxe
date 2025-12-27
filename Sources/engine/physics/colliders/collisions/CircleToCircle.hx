package engine.physics.colliders.collisions;

import kha.math.Vector2;
import engine.physics.colliders.concretes.CircleCollider;

class CircleToCircle {
	public static function test(a:CircleCollider, b:CircleCollider):CollisionManifold {
		var m = new CollisionManifold();

		var delta = b.body.pos.sub(a.body.pos);
		var dist = delta.length;
		var r = a.radius + b.radius;

		// No collision
		if (dist >= r) {
			return m;
		}

		m.isColliding = true;

		if (dist > 0) {
			m.normal = delta.mult(1 / dist);
			m.penetration = r - dist;
			m.contactPoint = a.body.pos.add(m.normal.mult(a.radius));
		} else {
			// Circles are on top of one-another
			m.normal = new Vector2(1, 0);
			m.penetration = a.radius;
			m.contactPoint = new Vector2(a.body.pos.x, a.body.pos.y);
		}

		return m;
	}
}

package engine.physics.colliders;

import engine.physics.colliders.CollisionManifold;

enum CollisionResponse {
	Touch;
	Cross;
	Slide;
	Bounce;
}

class CollisionSolver {
	public static function touch(a:Body, b:Body, c:CollisionManifold) {
		// Position correction
		var p = c.normal.mult(c.penetration);
		a.pos.x += p.x;
		a.pos.y += p.y;

		// Cancel velocity
		a.velocity.x = 0;
		a.velocity.y = 0;
	}

	public static function slide(a:Body, b:Body, c:CollisionManifold) {
		// Position correction
		var p = c.normal.mult(c.penetration);
		a.pos.x += p.x;
		a.pos.y += p.y;

		// Remove normal component
		var vn = c.normal.mult(a.velocity.dot(c.normal));
		a.velocity.x -= vn.x;
		a.velocity.y -= vn.y;

		// Ground detection
		if (c.normal.y < 0) {
			a.isGrounded = true;
		}
	}

	public static function bounce(a:Body, b:Body, c:CollisionManifold, restitution:Float) {
		// Position correction
		var p = c.normal.mult(c.penetration);
		a.pos.x += p.x;
		a.pos.y += p.y;

		var vn = c.normal.mult(a.velocity.dot(c.normal));
		var vt = a.velocity.sub(vn);

		a.velocity.setFrom(vt.sub(vn.mult(restitution)));
	}
}

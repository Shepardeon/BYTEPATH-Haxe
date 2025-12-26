package engine.physics.colliders.collisions;

import engine.physics.colliders.concretes.CircleCollider;

class CircleToCircle {
	public static function test(a:CircleCollider, b:CircleCollider):CollisionManifold {
		return new CollisionManifold();
	}
}

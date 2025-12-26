package engine.physics.colliders.collisions;

import engine.physics.colliders.concretes.CircleCollider;
import engine.physics.colliders.concretes.RectCollider;

class CircleToRect {
	public static function test(a:CircleCollider, b:RectCollider):CollisionManifold {
		return new CollisionManifold();
	}
}

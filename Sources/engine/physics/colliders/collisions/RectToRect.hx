package engine.physics.colliders.collisions;

import engine.physics.colliders.concretes.RectCollider;

class RectToRect {
	public static function test(a:RectCollider, b:RectCollider):CollisionManifold {
		return new CollisionManifold();
	}
}

package engine.physics.colliders;

import engine.physics.colliders.collisions.RectToRect;
import engine.physics.colliders.collisions.CircleToRect;
import engine.physics.colliders.collisions.CircleToCircle;
import engine.physics.colliders.concretes.RectCollider;
import engine.physics.colliders.concretes.CircleCollider;
import engine.physics.colliders.abstracts.Collider;

class CollisionDispatcher {
	public static function collide(a:Collider, b:Collider):CollisionManifold {
		if (Std.isOfType(a, CircleCollider)) {
			return _collideCircle(cast a, b);
		}

		if (Std.isOfType(a, RectCollider)) {
			return _collideRect(cast a, b);
		}

		return new CollisionManifold();
	}

	private static function _collideCircle(a:CircleCollider, b:Collider):CollisionManifold {
		if (Std.isOfType(b, CircleCollider)) {
			return CircleToCircle.test(a, cast b);
		}

		if (Std.isOfType(b, RectCollider)) {
			return CircleToRect.test(a, cast b);
		}

		return new CollisionManifold();
	}

	private static function _collideRect(a:RectCollider, b:Collider):CollisionManifold {
		if (Std.isOfType(b, CircleCollider)) {
			return CircleToRect.test(cast b, a);
		}

		if (Std.isOfType(b, RectCollider)) {
			return RectToRect.test(a, cast b);
		}

		return new CollisionManifold();
	}
}

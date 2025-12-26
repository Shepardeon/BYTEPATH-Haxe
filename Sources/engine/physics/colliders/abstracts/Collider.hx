package engine.physics.colliders.abstracts;

abstract class Collider {
	public var body(default, null):Body;

	public function new(body:Body) {
		this.body = body;
	}

	public function collide(other:Collider):CollisionManifold {
		return CollisionDispatcher.collide(this, other);
	}

	public abstract function toAABB():AABB;
}

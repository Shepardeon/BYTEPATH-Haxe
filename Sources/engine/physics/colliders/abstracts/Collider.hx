package engine.physics.colliders.abstracts;

abstract class Collider {
	public var layer(default, null):Int = 0;
	public var body(default, null):Body;

	public function attach(body:Body) {
		this.body = body;
	}

	public function collide(other:Collider):CollisionManifold {
		return CollisionDispatcher.collide(this, other);
	}

	public abstract function toAABB():AABB;
}

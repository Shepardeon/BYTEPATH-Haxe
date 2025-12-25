package engine.physics.colliders.abstracts;

abstract class Collider {
	public var body(default, null):Body;

	public function new(body:Body) {
		this.body = body;
	}

	public abstract function toAABB():AABB;
}

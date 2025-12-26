package engine.physics.colliders;

import kha.math.Vector2;

class CollisionManifold {
	public var isColliding:Bool = false;
	public var normal:Vector2;
	public var penetration:Float = 0;
	public var contactPoint:Vector2;

	public function new() {}
}

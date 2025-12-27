package engine.physics;

import kha.graphics2.Graphics;
import engine.physics.colliders.CollisionMatrix;
import engine.physics.colliders.CollisionSolver;

class World {
	public var xGravity:Float;
	public var yGravity:Float;
	public var airFriction:Float;
	public var groundFriction:Float;
	public var bounceRestitution:Float;

	public var collisionMatrix(default, null):CollisionMatrix;

	private var _bodies:Array<Body>;
	private var _activeBodies:Array<Int>;

	public function new(xGravity:Float = 0, yGravity:Float = 0, airFriction:Float = 0.1, groundFriction:Float = 0.2, bounceRestitution:Float = 0.8) {
		this.xGravity = xGravity;
		this.yGravity = yGravity;
		this.airFriction = airFriction;
		this.groundFriction = groundFriction;
		this.bounceRestitution = bounceRestitution;

		_bodies = [];
	}

	public function initCollisionMatrix(layerCount:Int) {
		collisionMatrix = new CollisionMatrix(layerCount);
	}

	public function add(body:Body):Void {
		_bodies.push(body);

		if (!body.isStatic) {
			_activeBodies.push(_bodies.length - 1);
		}
	}

	public function remove(body:Body):Void {
		if (!body.isStatic) {
			var idx = _bodies.indexOf(body);
			_activeBodies.remove(idx);
		}

		_bodies.remove(body);
	}

	public function update(dt:Float):Void {
		for (idx in _activeBodies) {
			var body = _bodies[idx];

			// Reset ground property
			body.isGrounded = false;

			// Apply global forces
			_applyGravity(body, dt);
			_applyAirFriction(body);

			// Apply velocity to the position
			body.pos.x += body.velocity.x * dt;
			body.pos.y += body.velocity.y * dt;
		}

		// Detect collisions + Ground
		for (idx in _activeBodies) {
			var a = _bodies[idx];

			for (b in _bodies) {
				// Skip ourself
				if (a == b) {
					continue;
				}

				// AABB pass
				if (!a.collider.toAABB().intersects(b.collider.toAABB())) {
					continue;
				}

				// Collision detection
				var collision = a.collider.collide(b.collider);
				if (!collision.isColliding) {
					return;
				}

				// Collision response (will also set isGrounded)
				var response = collisionMatrix.get(a.collider.layer, b.collider.layer);
				switch (response) {
					case Cross:
						// Event only
					case Touch:
						CollisionSolver.touch(a, b, collision);
					case Slide:
						CollisionSolver.slide(a, b, collision);
					case Bounce:
						CollisionSolver.bounce(a, b, collision, bounceRestitution);
				}
			}

			// Apply ground friction to grounded bodies
			_applyGroundFriction(a);
		}
	}

	public function render(g:Graphics):Void {
		for (body in _bodies) {
			if (body.isStatic) {
				g.color = Red;
			} else {
				g.color = Green;
			}

			body.collider.render(g);
		}

		g.color = White;
	}

	private function _applyGravity(body:Body, dt:Float):Void {
		if (body.isStatic) {
			return;
		}

		body.velocity.x += xGravity * dt;
		body.velocity.y += yGravity * dt;
	}

	private function _applyAirFriction(body:Body):Void {
		if (body.isStatic) {
			return;
		}

		body.velocity.x *= (1 - airFriction);
		body.velocity.y *= (1 - airFriction);
	}

	private function _applyGroundFriction(body:Body):Void {
		if (body.isStatic || !body.isGrounded) {
			return;
		}

		body.velocity.x *= (1 - groundFriction);
	}
}

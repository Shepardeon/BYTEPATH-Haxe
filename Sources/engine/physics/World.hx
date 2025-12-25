package engine.physics;

class World {
	public var xGravity:Float;
	public var yGravity:Float;
	public var airFriction:Float;
	public var groundFriction:Float;

	private var _bodies:Array<Body>;

	public function new(xGravity:Float = 0, yGravity:Float = 0, airFriction:Float = 0.1, groundFriction:Float = 0.2) {
		this.xGravity = xGravity;
		this.yGravity = yGravity;
		this.airFriction = airFriction;
		this.groundFriction = groundFriction;

		_bodies = [];
	}

	public function add(body:Body) {
		_bodies.push(body);
	}

	public function update(dt) {}
}

package engine.physics;

import kha.math.Vector2;

class AABB {
	public var pos(default, null):Vector2;
	public var width(default, null):Float;
	public var height(default, null):Float;

	public function new(x:Float, y:Float, width:Float, height:Float) {
		pos = new Vector2(x, y);
		this.width = width;
		this.height = height;
	}

	/**
	 * Returns true if other is another AABB intersecting the current AABB
	 * @param other the other AABB to intersect 
	 * @return Bool
	 */
	public function intersects(other:AABB):Bool {
		if (other == this) {
			return false;
		}

		var a_minX = this.pos.x;
		var a_maxX = this.pos.x + this.width;
		var a_minY = this.pos.y;
		var a_maxY = this.pos.y + this.height;

		var b_minX = other.pos.x;
		var b_maxX = other.pos.x + other.width;
		var b_minY = other.pos.y;
		var b_maxY = other.pos.y + other.height;

		return (a_minX <= b_maxX && a_maxX >= b_minX) && (a_minY <= b_maxY && a_maxY >= b_minY);
	}

	/**
	 * Returns the 4 corners of the AABB in clockwise order from
	 		* the top left corner.
	 		* 
	 * @return Array<Vector2>
	 */
	public function getCorners():Array<Vector2> {
		return [
			new Vector2(pos.x, pos.y), // Top left
			new Vector2(pos.x + width, pos.y), // Top right
			new Vector2(pos.x + width, pos.y + height), // Bottom right
			new Vector2(pos.x, pos.y + height) // Bottom left
		];
	}
}

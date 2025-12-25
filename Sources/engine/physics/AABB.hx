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

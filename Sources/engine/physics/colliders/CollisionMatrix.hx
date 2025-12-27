package engine.physics.colliders;

import engine.physics.colliders.CollisionSolver.CollisionResponse;

class CollisionMatrix {
	private var _matrix:Array<Array<CollisionResponse>>;

	public function new(layerCount:Int = 1, defaultResponse:CollisionResponse = Cross) {
		_matrix = [];
		for (i in 0...layerCount) {
			_matrix[i] = [];
			for (j in 0...layerCount) {
				_matrix[i][j] = defaultResponse;
			}
		}
	}

	public function set(layerA:Int, layerB:Int, response:CollisionResponse):Void {
		_matrix[layerA][layerB] = response;
		_matrix[layerB][layerA] = response;
	}

	public inline function get(layerA:Int, layerB:Int):CollisionResponse {
		return _matrix[layerA][layerB];
	}
}

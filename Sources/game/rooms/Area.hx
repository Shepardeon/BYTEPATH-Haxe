package game.rooms;

import utils.VectorUtils;
import kha.math.Vector2;
import game.gameObjects.abstracts.GameObject;
import game.rooms.abstracts.Room;

class Area {
	private var _room:Room;
	private var _gameObjects:Array<GameObject>;

	public function new(room:Room) {
		_room = room;
		_gameObjects = [];
	}

	public function addGameObject(go:GameObject):GameObject {
		_gameObjects.push(go);

		// Allows to retreive the game object passed-in
		// which allows to write `var go = area.addGameObject(new GameObject(...));`
		return go;
	}

	public function getGameObjects(filter:(GameObject) -> Bool):Array<GameObject> {
		return _gameObjects.filter(filter);
	}

	public function queryCircleArea(origin:Vector2, radius:Float, classes:Array<Class<GameObject>>):Array<GameObject> {
		return _getGameObjectOfType(classes).filter((go) -> VectorUtils.distance(go.getPos(), origin) <= radius);
	}

	public function getClosestObjectInCircle(origin:Vector2, radius:Float, classes:Array<Class<GameObject>>):Null<GameObject> {
		var prefiltered = queryCircleArea(origin, radius, classes);

		if (prefiltered.length == 0) {
			return null;
		}

		// Sort the array in place
		prefiltered.sort((a:GameObject, b:GameObject) -> {
			return Std.int(VectorUtils.distance2(a.getPos(), b.getPos()));
		});

		return prefiltered[0];
	}

	public function update(dt:Float):Void {
		for (i in 0..._gameObjects.length) {
			var idx = _gameObjects.length - 1 - i;
			var go = _gameObjects[idx];

			go.update(dt);

			if (go.isDead()) {
				_gameObjects.remove(go);
			}
		}
	}

	public function render():Void {
		for (go in _gameObjects) {
			go.render();
		}
	}

	private function _getGameObjectOfType(classes:Array<Class<GameObject>>):Array<GameObject> {
		return _gameObjects.filter((go) -> {
			for (c in classes) {
				if (Std.isOfType(go, c)) {
					return true;
				}
			}

			return false;
		});
	}
}

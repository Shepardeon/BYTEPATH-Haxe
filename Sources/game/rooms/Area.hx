package game.rooms;

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
}

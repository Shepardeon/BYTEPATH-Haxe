package game.rooms;

import game.rooms.abstracts.Room;

class RoomManager {
	private var _currentRoom:Null<Room>;

	public function new() {}

	public function update(dt:Float):Void {
		_currentRoom?.update(dt);
	}

	public function render():Void {
		_currentRoom?.render();
	}

	public function goToRoom(room:Room):Void {
		_currentRoom = room;
	}
}

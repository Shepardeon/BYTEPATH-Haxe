package game.rooms;

import kha.graphics2.Graphics;
import game.rooms.abstracts.Room;

class RoomManager {
	private var _currentRoom:Null<Room>;

	public function new() {}

	public function update(dt:Float):Void {
		_currentRoom?.update(dt);
	}

	public function render(g:Graphics):Void {
		_currentRoom?.render(g);
	}

	public function goToRoom(room:Room):Void {
		_currentRoom = room;
	}
}

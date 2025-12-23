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
		g.begin();
		_currentRoom?.render(g);
		g.end();
	}

	public function goToRoom(room:Room):Void {
		_currentRoom = room;
	}
}

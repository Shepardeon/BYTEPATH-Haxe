package game.rooms.abstracts;

import kha.graphics2.Graphics;

abstract class Room {
	public abstract function update(dt:Float):Void;

	public abstract function render(g:Graphics):Void;
}

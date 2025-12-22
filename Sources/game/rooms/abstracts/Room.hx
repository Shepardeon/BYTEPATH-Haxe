package game.rooms.abstracts;

abstract class Room {
	public abstract function update(dt:Float):Void;

	public abstract function render():Void;
}

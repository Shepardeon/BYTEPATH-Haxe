package game.gameObjects.abstracts;

import kha.graphics2.Graphics;
import utils.UUID;
import game.rooms.Area;
import kha.math.Vector2;

abstract class GameObject {
	public var area(default, null):Area;
	public var uuid(default, null):String;
	public var pos(default, null):Vector2;
	public var isDead:Bool;

	public function new(area:Area, pos:Vector2) {
		this.area = area;
		this.pos = pos;
		this.uuid = UUID.newUuid();
		this.isDead = false;
	}

	public function getPos():Vector2 {
		return pos;
	}

	public abstract function update(dt:Float):Void;

	public abstract function render(g:Graphics):Void;
}

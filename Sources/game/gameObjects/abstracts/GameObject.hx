package game.gameObjects.abstracts;

import kha.graphics2.Graphics;
import utils.UUID;
import game.rooms.Area;
import kha.math.Vector2;

abstract class GameObject {
	private var _area:Area;
	private var _uuid:String;
	private var _pos:Vector2;
	private var _dead:Bool;

	public function new(area:Area, pos:Vector2) {
		_area = area;
		_pos = pos;
		_uuid = UUID.newUuid();
		_dead = false;
	}

	public function isDead():Bool {
		return _dead;
	}

	public function setDead(isDead:Bool):Void {
		_dead = isDead;
	}

	public function getPos():Vector2 {
		return _pos;
	}

	public abstract function update(dt:Float):Void;

	public abstract function render(g:Graphics):Void;
}

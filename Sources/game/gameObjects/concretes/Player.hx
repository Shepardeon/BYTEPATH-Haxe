package game.gameObjects.concretes;

import utils.GraphicsUtils;
import kha.math.Vector2;
import kha.graphics2.Graphics;
import game.rooms.Area;
import game.gameObjects.abstracts.GameObject;

class Player extends GameObject {
	public function new(area:Area, pos:Vector2) {
		super(area, pos);
	}

	public function update(dt:Float) {}

	public function render(g:Graphics) {
		GraphicsUtils.drawCircle(g, pos.x, pos.y, 25);
	}
}

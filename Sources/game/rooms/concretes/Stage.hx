package game.rooms.concretes;

import utils.GraphicsUtils;
import kha.graphics2.Graphics;
import game.rooms.abstracts.Room;

class Stage extends Room {
	private var _area:Area;

	public function new() {
		_area = new Area(this);
	}

	public function update(dt:Float):Void {}

	public function render(g:Graphics):Void {
		g.color = White;
		GraphicsUtils.drawCircle(g, Constants.GAME_WIDTH / 2, Constants.GAME_HEIGHT / 2, 20);
	}
}

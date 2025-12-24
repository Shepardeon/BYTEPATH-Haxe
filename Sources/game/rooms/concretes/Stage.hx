package game.rooms.concretes;

import Bytepath.GameAction;
import kha.math.Vector2;
import kha.graphics2.Graphics;
import game.rooms.abstracts.Room;
import game.gameObjects.concretes.Player;

class Stage extends Room {
	private var _area:Area;
	private var _player:Player;

	public function new() {
		_area = new Area(this);

		_player = new Player(_area, new Vector2(Constants.GAME_WIDTH / 2, Constants.GAME_HEIGHT / 2));
		_area.addGameObject(_player);
	}

	public function update(dt:Float):Void {
		_area.update(dt);

		if (Bytepath.input.isPressed(GameAction.Test)) {
			_player.setDead(true);
		}
	}

	public function render(g:Graphics):Void {
		_area.render(g);
	}
}

package game.rooms.concretes;

import engine.physics.colliders.concretes.RectCollider;
import engine.physics.Body;
import engine.physics.World;
import Bytepath.GameAction;
import kha.math.Vector2;
import kha.graphics2.Graphics;
import game.rooms.abstracts.Room;
import game.gameObjects.concretes.Player;

class Stage extends Room {
	private var _area:Area;
	private var _player:Player;
	private var _world:World;

	public function new() {
		_area = new Area(this);

		_player = new Player(_area, new Vector2(Constants.GAME_WIDTH / 2, Constants.GAME_HEIGHT / 2));
		// _area.addGameObject(_player);

		_world = new World(1200);
		_world.initCollisionMatrix(2);

		_world.add(new Body(10, 10, new RectCollider(10, 50, 0)));
	}

	public function update(dt:Float):Void {
		_area.update(dt);
		_world.update(dt);

		if (Bytepath.input.isPressed(GameAction.Test)) {
			_player.isDead = true;
		}
	}

	public function render(g:Graphics):Void {
		_area.render(g);
		_world.render(g);
	}
}

package game.rooms.concretes;

import engine.physics.colliders.concretes.CircleCollider;
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

	private var _testBody:Body;

	public function new() {
		_area = new Area(this);

		_player = new Player(_area, new Vector2(Constants.GAME_WIDTH / 2, Constants.GAME_HEIGHT / 2));
		// _area.addGameObject(_player);

		_world = new World(0, 600);
		_world.initCollisionMatrix(2);
		_world.bounceRestitution = 1.5;

		_world.add(new Body(10, 140, new RectCollider(20, 280, 0), true));
		_world.add(new Body(Constants.GAME_WIDTH - 10, 140, new RectCollider(20, 280, 0), true));
		_world.add(new Body(300, 10, new RectCollider(600, 20, 0), true));
		_world.add(new Body(300, Constants.GAME_HEIGHT - 10, new RectCollider(600, 20, 0), true));

		for (i in 0...10) {
			_world.add(new Body(25 + Math.random() * 300, 25 + Math.random() * 140, new CircleCollider(2 + Math.random() * (20 - 2), 1)));
		}

		_world.collisionMatrix.set(1, 1, Slide);
		_world.collisionMatrix.set(1, 0, Slide);
	}

	public function update(dt:Float):Void {
		_area.update(dt);
		_world.update(dt);
		// trace(_testBody.velocity);

		if (Bytepath.input.isPressed(GameAction.Test)) {
			_player.isDead = true;
		}
	}

	public function render(g:Graphics):Void {
		_area.render(g);
		_world.render(g);
	}
}

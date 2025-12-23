package engine.camera;

import kha.math.FastMatrix3;
import kha.graphics2.Graphics;
import kha.math.Vector2;

class Camera {
	private var _pos:Vector2;
	private var _width:Int;
	private var _height:Int;
	private var _scale:Float;
	private var _rotation:Float;

	private var _viewMatrix:FastMatrix3;

	public function new(pos:Vector2, width:Int, height:Int, scale:Float, rotation:Float) {
		_pos = pos;
		_width = width;
		_height = height;
		_scale = scale;
		_rotation = rotation;
	}

	public function attach(g:Graphics):Void {
		_computeViewMatrix();
		g.pushTransformation(_viewMatrix);
	}

	public function detach(g:Graphics):Void {
		g.popTransformation();
	}

	public function move(dx:Float, dy:Float):Void {
		_pos.x += dx;
		_pos.y += dy;
	}

	public function toWorldCoords(camCoords:Vector2):Vector2 {
		var cos = Math.cos(_rotation);
		var sin = Math.sin(_rotation);

		camCoords.x = (camCoords.x - _width / 2) / _scale;
		camCoords.y = (camCoords.y - _height / 2) / _scale;

		camCoords.x = cos * camCoords.x - sin * camCoords.y;
		camCoords.y = sin * camCoords.x + cos * camCoords.y;

		return camCoords;
	}

	public function toCameraCoords(worldCoords:Vector2):Vector2 {
		var cos = Math.cos(_rotation);
		var sin = Math.sin(_rotation);

		worldCoords.x -= _pos.x;
		worldCoords.y -= _pos.y;

		worldCoords.x = cos * worldCoords.x - sin * worldCoords.y;
		worldCoords.y = sin * worldCoords.x + cos * worldCoords.y;

		return worldCoords;
	}

	private function _computeViewMatrix():Void {
		_viewMatrix = FastMatrix3.identity();
		_viewMatrix = _viewMatrix.multmat(FastMatrix3.translation(_width / 2, _height / 2));
		_viewMatrix = _viewMatrix.multmat(FastMatrix3.scale(_scale, _scale));
		_viewMatrix = _viewMatrix.multmat(FastMatrix3.rotation(_rotation));
		_viewMatrix = _viewMatrix.multmat(FastMatrix3.translation(-_pos.x, -_pos.y));
	}
}

package utils;

import kha.graphics2.Graphics;

class GraphicsUtils {
	public static function drawCircle(g:Graphics, cx:Float, cy:Float, r:Float, segments:Int = 32):Void {
		var angleStep = Math.PI * 2 / segments;
		var prevX = cx + Math.cos(0) * r;
		var prevY = cy + Math.sin(0) * r;

		for (i in 1...segments + 1) {
			var angle = angleStep * i;
			var x = cx + Math.cos(angle) * r;
			var y = cy + Math.sin(angle) * r;

			g.drawLine(prevX, prevY, x, y);

			prevX = x;
			prevY = y;
		}
	}

	function fillCircle(g:Graphics, cx:Float, cy:Float, r:Float, segments:Int = 32) {
		var angleStep = Math.PI * 2 / segments;

		for (i in 0...segments) {
			var a1 = angleStep * i;
			var a2 = angleStep * (i + 1);

			g.fillTriangle(cx, cy, cx + Math.cos(a1) * r, cy + Math.sin(a1) * r, cx + Math.cos(a2) * r, cy + Math.sin(a2) * r);
		}
	}
}

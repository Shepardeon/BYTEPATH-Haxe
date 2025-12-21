package engine.timer.interfaces;

interface ITimerTask {
	public var finished(default, null):Bool;
	public function update(dt:Float):Void;
}

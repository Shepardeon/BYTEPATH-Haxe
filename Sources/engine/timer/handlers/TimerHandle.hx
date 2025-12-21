package engine.timer.handlers;

abstract TimerHandle(Int) {
	public inline function new(id:Int) {
		this = id;
	}
}

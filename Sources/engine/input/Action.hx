package engine.input;

abstract Action(Int) from Int to Int {
	static var nextId:Int = 0;

	private inline function new(id:Int) {
		this = id;
	}

	public static inline function create():Action {
		return new Action(nextId++);
	}
}

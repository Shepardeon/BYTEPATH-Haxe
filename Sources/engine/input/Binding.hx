package engine.input;

class Binding {
	public final input:Input;
	public final action:Action;

	public function new(input:Input, action:Action) {
		this.input = input;
		this.action = action;
	}
}

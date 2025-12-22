package utils;

class UUID {
	public static function newUuid():String {
		var hex = "0123456789abcdef";
		var uuid = "";

		for (i in 0...36) {
			switch (i) {
				case 8, 13, 18, 23:
					uuid += "-";
				case 14:
					uuid += "4"; // UUID v4
				case 19:
					uuid += hex.charAt((Std.random(16) & 0x3) | 0x8);
				default:
					uuid += hex.charAt(Std.random(16));
			}
		}

		return uuid;
	}
}

class_name Item
extends Resource

@export var item_name: String = '';
@export var sprite: Texture2D = Texture.new();

func _to_string() -> String:
	return item_name;

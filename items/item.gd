class_name Item
extends Resource

@export var type: String = '';
@export var item_name: String = '';
@export var sprite: Texture = Texture.new();

func _to_string() -> String:
	return item_name;

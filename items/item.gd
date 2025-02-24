class_name Item
extends Resource

#enum ITEM_TYPE  { HAT, CLOAK, BOOTS, WAND, RING, ORB, POTION, MISC }

@export var type: enums.ITEM_TYPE;
@export var item_name: String = '';
@export var sprite: Texture = Texture.new();

func _to_string() -> String:
	return item_name;

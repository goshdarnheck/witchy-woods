extends Object

class_name Equipment

var equipped = {
	"hat": null,
	"cloak": null,
	"boots": null,
	"wand": null,
	"wandSlots": null,
	"offhand": null
}

func _init():
	pass;

func equip_items(items):
	for item in items:
		equip_item(item);

func equip_item(item):
	if (item and "type" in item):
		match item.type:
			enums.ITEM_TYPE.HAT:
				equipped.hat = item;
			enums.ITEM_TYPE.CLOAK:
				equipped.cloak = item;
			enums.ITEM_TYPE.BOOTS:
				equipped.boots = item;
			enums.ITEM_TYPE.WAND:
				equipped.wand = item;

func get_equipped_items():
	return equipped;

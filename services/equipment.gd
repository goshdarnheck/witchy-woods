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
	if (item and item.type):
		match item.type:
			"hat":
				equipped.hat = item;
			"cloak":
				equipped.cloak = item;
			"boots":
				equipped.boots = item;
			"wand":
				equipped.wand = item;

func get_items():
	return equipped;

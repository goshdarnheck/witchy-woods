extends Object

class_name Inventory

var items = {
	"hats": [],
	"cloaks": [],
	"boots": [],
	"wands": [],
}

func _init():
	pass;

func add_items(items):
	for item in items:
		add_item(item);

func add_item(item):
	if (item.type == "wand"):
		items.wands.append(item);
	if (item.type == "hat"):
		items.hats.append(item);
	if (item.type == "boots"):
		items.boots.append(item);
	if (item.type == "cloak"):
		items.cloaks.append(item);

func get_items():
	return items;

func get_items_by_type(type):
	return items.type;

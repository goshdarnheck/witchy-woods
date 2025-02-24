extends Object

class_name Inventory

var items = {
	"hats": [],
	"cloaks": [],
	"boots": [],
	"wands": [],
	"orbs": []
}

func _init():
	pass;

func add_items(items):
	for item in items:
		add_item(item);

func add_item(item):
	if (item.type == enums.ITEM_TYPE.WAND):
		items.wands.append(item);
	if (item.type == enums.ITEM_TYPE.HAT):
		items.hats.append(item);
	if (item.type == enums.ITEM_TYPE.BOOTS):
		items.boots.append(item);
	if (item.type == enums.ITEM_TYPE.CLOAK):
		items.cloaks.append(item);
	if (item.type == enums.ITEM_TYPE.ORB):
		items.orbs.append(item);

func get_items():
	return items;

func get_items_by_type(type):
	return items.type;

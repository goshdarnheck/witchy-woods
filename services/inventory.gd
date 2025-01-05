extends Object

class_name Inventory

var items = {
	"wands": []
}

func _init():
	pass;

func add_item(item):
	items.wands.append(item);

func get_items():
	return items;

func get_items_by_type(type):
	return items.type;

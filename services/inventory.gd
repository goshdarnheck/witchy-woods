extends Object

class_name Inventory

var items = []

func add_items(items):
	for item in items:
		add_item(item);

func add_item(item):
	items.append(item);

func get_items():
	return items;

func get_items_by_type(type):
	var items_of_type = [];
	for item in items:
		if item.type == type:
			items_of_type.append(item);
	return items_of_type;

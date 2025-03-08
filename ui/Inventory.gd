extends Control

var selected_category = null;

func _ready():
	update();

func update():
	var items = Manager.inventory.get_items();
	var equipped_items = Manager.equipment.get_equipped_items();
	set_equip(equipped_items.hat, "hat");
	set_equip(equipped_items.cloak, "cloak");
	set_equip(equipped_items.boots, "boots");
	set_equip(equipped_items.wand, "wand");
	update_inventory_list(items);

func update_inventory_list(items):
	var item_scene = load("res://ui/bits/inv_list_item.tscn");
	var node = find_child("Items");
	
	for i in range(0, node.get_child_count()):
		node.get_child(i).queue_free();
	
	for item in items:
		var instance = item_scene.instantiate();
		instance.find_child("Name").text = item.item_name;
		instance.find_child("Icon").texture = item.sprite;
		node.add_child(instance);

func set_equip(item, typeName):
	if item:
		if "item_name" in item:
			find_child(typeName + "Name").text = item.item_name;
		if "sprite" in item:
			find_child(typeName + "Image").texture = item.sprite;
	else:
		find_child(typeName + "Name").text = "None";
		find_child(typeName + "Image").texture = load("res://textures/x-16.png");

func _on_boots_button_up():
	print("BOOOOOTS")
	pass # Replace with function body.

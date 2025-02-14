extends Control

func setContent(content):
	set_equip("hat", content.equipment.hat);
	set_equip("cloak", content.equipment.cloak);
	set_equip("boots", content.equipment.boots);
	set_equip("wand", content.equipment.wand);
	
	set_inventory_list(content.inventory);

func set_inventory_list(inventory):
	var item_scene = load("res://ui/bits/inv_list_item.tscn");
	var node = find_child("Items");
	
	for i in range(0, node.get_child_count()):
		node.get_child(i).queue_free();
	
	for cat in inventory:
		for item in inventory[cat]:
			var instance = item_scene.instantiate();
			
			if ("name" in item):
				instance.find_child("Name").text = item.name;
				instance.find_child("Icon").texture = load("res://textures/" + item.image);
			else:
				instance.find_child("Name").text = item.item_name;
				instance.find_child("Icon").texture = item.sprite;
			node.add_child(instance);
			print(item.type)

func set_equip(type, item):
	if item and "type" in item and type == item.type:
		if "name" in item:
			find_child(type + "Name").text = item.name;
		if "image" in item:
			find_child(type + "Image").texture = load("res://textures/" + item.image);
	else:
		find_child(type + "Name").text = "None";
		find_child(type + "Image").texture = load("res://textures/x-16.png");

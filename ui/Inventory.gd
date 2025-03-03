extends Control

var selected_category = null;

func setContent(content):
	set_equip(enums.ITEM_TYPE.HAT, content.equipment.hat, "hat");
	set_equip(enums.ITEM_TYPE.CLOAK, content.equipment.cloak, "cloak");
	set_equip(enums.ITEM_TYPE.BOOTS, content.equipment.boots, "boots");
	set_equip(enums.ITEM_TYPE.WAND, content.equipment.wand, "wand");
	
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

func set_equip(type, item, typeName):
	if item and "type" in item and type == item.type:
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

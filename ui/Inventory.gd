extends Control

func setContent(content):
	set_equip("hat", content.equipment.hat);
	set_equip("cloak", content.equipment.cloak);
	set_equip("boots", content.equipment.boots);
	set_equip("wand", content.equipment.wand);

func set_equip(type, item):
	if item and "type" in item and type == item.type:
		if "name" in item:
			find_child(type + "Name").text = item.name;
		if "image" in item:
			find_child(type + "Image").texture = load("res://textures/" + item.image);
	else:
		find_child(type + "Name").text = "None";
		find_child(type + "Image").texture = load("res://textures/x-16.png");

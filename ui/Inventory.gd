extends Control

func setContent(inventory):
	for wand in inventory.wands:
		if ("type" in wand and wand.type == "wand"):
			if "name" in wand:
				find_child("WandName").text = wand.name
			else:
				print("missing name inv wand")
		
			if "image" in wand:
				find_child("WandImage").texture = load("res://textures/" + wand.image);
			else:
				print("missing wand.image in inv")

	for hat in inventory.hats:
		if ("type" in hat and hat.type == "hat"):
			if "name" in hat:
				find_child("HatName").text = hat.name
			else:
				print("missing name inv hat")
		
			if "image" in hat:
				find_child("HatImage").texture = load("res://textures/" + hat.image);
			else:
				print("missing hat.image in inv")
				
	for cloak in inventory.cloaks:
		if ("type" in cloak and cloak.type == "cloak"):
			if "name" in cloak:
				find_child("CloakName").text = cloak.name
			else:
				print("missing name inv cloak")
		
			if "image" in cloak:
				find_child("CloakImage").texture = load("res://textures/" + cloak.image);
			else:
				print("missing cloak.image in inv")
				
	for boots in inventory.boots:
		if ("type" in boots and boots.type == "boots"):
			if "name" in boots:
				find_child("BootsName").text = boots.name
			else:
				print("missing name inv boots")
		
			if "image" in boots:
				find_child("BootsImage").texture = load("res://textures/" + boots.image);
			else:
				print("missing boots.image in inv")

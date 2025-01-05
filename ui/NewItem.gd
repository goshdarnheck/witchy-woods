extends Control

func setContent(items):
	for item in items:
		if "name" in item:
			find_child("Name").text = item.name
		else:
			print("missing name")
	
		if "image" in item:
			find_child("Image").texture = load("res://textures/" + item.image);
		else:
			print("missing image")

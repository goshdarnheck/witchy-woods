extends Control

func setContent(items):
	for item in items:
		if "item_name" in item:
			find_child("Name").text = item.item_name
		else:
			print("new item overlay: missing name")
	
		if "sprite" in item:
			find_child("Image").texture = item.sprite;
		else:
			print("new item overlay: missing image")

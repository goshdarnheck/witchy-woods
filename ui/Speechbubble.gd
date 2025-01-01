extends Control

func setContent(data):
	if "name" in data:
		find_child("Name").text = data.name
	else:
		print("missing name")
	
	if "text" in data:
		find_child("Text").text = data.text
	else:
		print("missing text")
		
	if "image" in data:
		find_child("Image").texture = load("res://textures/" + data.image);
	else:
		print("missing image")

	if "buttons" in data:
		for b in data.buttons:
			find_child("Responses").add_child(b);
	else:
		var Responses = find_child("Responses")
		for i in range(0, Responses.get_child_count()):
			Responses.get_child(i).queue_free();

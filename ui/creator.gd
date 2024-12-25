extends Control

var nameNode = null;

func _ready():
	nameNode = get_node("Control/Control/Name");
	pass 

func _on_awaken_button_pressed():
	
	var character_choices = {
		"name": nameNode.text,
		"study": "fire"
	}

	Events.broadcast("AWAKEN", character_choices);

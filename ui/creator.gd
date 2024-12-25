extends Control

var nameNode = null;
var studyNode = null;
var studySelected = "fire"

func _ready():
	studyNode = get_node("Name/Study");
	nameNode = get_node("Name/Input");

func _on_awaken_button_pressed():
	var character_choices = {
		"name": nameNode.text,
		"study": studySelected
	}

	Events.broadcast("AWAKEN", character_choices);


func _on_fire_pressed():
	studySelected = "fire"
	$Avatar.texture = load("res://textures/" + studySelected + "-player.png");

func _on_water_pressed():
	studySelected = "water"
	$Avatar.texture = load("res://textures/" + studySelected + "-player.png");

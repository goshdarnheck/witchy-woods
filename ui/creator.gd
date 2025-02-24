extends Control

var nameNode = null;
var studySelected = "fire"
var hat;
var boots;

func _ready():
	nameNode = get_node("Name/Input");
	hat = load("res://items/straw-hat.tres");
	boots = load("res://items/leather-boots.tres");

func _on_awaken_button_pressed():
	var character_choices = {
		"name": nameNode.text,
		"study": studySelected
	}

	var cloak = load("res://items/novice-plant-cloak.tres");
	
	Manager.inventory.add_items([hat, cloak, boots]);
	Manager.equipment.equip_items([hat, cloak, boots]);
	Manager.set_character(character_choices);
	Manager.load_stage("beginning");


func _on_fire_pressed():
	studySelected = "fire"
	$Avatar.texture = load("res://textures/" + studySelected + "-player.png");

func _on_water_pressed():
	studySelected = "water"
	$Avatar.texture = load("res://textures/" + studySelected + "-player.png");

func _on_plant_pressed():
	studySelected = "plant"
	$Avatar.texture = load("res://textures/" + studySelected + "-player.png");

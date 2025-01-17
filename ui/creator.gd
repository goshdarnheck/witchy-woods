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

	var hat = {
		"type": "hat",
		"name": "Straw Hat",
		"image": "novice-plant-hat.png"
	};
	
	var cloak = {
		"type": "cloak",
		"name": "Novice Plant Cloak",
		"image": "novice-plant-cloak.png"
	};
	
	var boots = {
		"type": "boots",
		"name": "Novice Boots",
		"image": "novice-boots.png"
	};
	
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

extends Control

func _ready():
	find_child("Name").text = Manager.character.name;
	find_child("Study").texture = load("res://textures/" + Manager.character.study + ".png");

func _process(delta):
	pass

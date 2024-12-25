extends Control

func _ready():
	$Name.text = Manager.character.name;
	$Study.texture = load("res://textures/" + Manager.character.study + ".png");

func _process(delta):
	pass

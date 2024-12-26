extends Node2D

func _ready():
	$Sprite.texture = load("res://textures/" + Manager.character.study + "-player.png");

func _process(delta):
	pass

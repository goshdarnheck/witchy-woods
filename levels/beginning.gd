extends Node2D

var no_player = false;

func _ready():
	if ($Player):
		$Player.position = Vector2(100, 100);

func _process(delta):
	pass

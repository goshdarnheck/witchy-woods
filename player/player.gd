extends CharacterBody2D

var speed = 400;  # speed in pixels/sec
var player = true;

func _ready():
	$Sprite.texture = load("res://textures/" + Manager.character.study + "-player.png");

func _process(delta):
	pass

func _physics_process(delta):
	var input_direction = Input.get_vector("left", "right", "up", "down").normalized()
	
	if (!Manager.paused):
		velocity = input_direction * speed
		move_and_slide()

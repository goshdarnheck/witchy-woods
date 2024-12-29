extends CharacterBody2D

var speed = 400;  # speed in pixels/sec
var player = true;

func _ready():
	$Sprite.texture = load("res://textures/" + Manager.character.study + "-player.png");

func _process(delta):
	pass

func _physics_process(delta):
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	if (!Manager.paused):
		velocity = direction * speed
		move_and_slide()

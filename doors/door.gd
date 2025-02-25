extends Area2D

var entered = false;
@export var dest: String;
@export var destx: int;
@export var desty: int;

func _ready():
	$EnterIcon.visible = false;
	
func _process(delta):
	var actionKey = Input.is_action_just_pressed("action");
	
	if entered && actionKey:
		if dest:
			Manager.load_level(dest);
		else:
			print("door has no dest!")

func _on_body_entered(body):
	if "player" in body:
		entered = true;
		$EnterIcon.visible = true;

func _on_body_exited(body):
	if "player" in body:
		entered = false;
		$EnterIcon.visible = false;

extends Area2D

var entered = false;
# item resource as export?
# @export var item: String;
@export var item: Resource;

func _ready():
	$EnterIcon.visible = false;
	
func _process(delta):
	var actionKey = Input.is_action_just_pressed("action");
	
	if entered && actionKey:
		print("OPEN CHEST")
		if item:
			print(item)
			Manager.inventory.add_items([item]);

func _on_body_entered(body):
	if "player" in body:
		entered = true;
		$EnterIcon.visible = true;

func _on_body_exited(body):
	if "player" in body:
		entered = false;
		$EnterIcon.visible = false;

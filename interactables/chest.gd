extends Area2D

var entered = false;
@export var item: Resource;
var giving_items: bool = false;

func _ready():
	$EnterIcon.visible = false;
	
func _process(delta):
	var actionKey = Input.is_action_just_pressed("action");
	
	if entered && actionKey:
		if giving_items:
			Manager.dismiss_items();
			giving_items = false;
		elif item:
			Manager.inventory.add_items([item]);
			Manager.show_items([item]);
			item = null;
			$EnterIcon.visible = false;
			giving_items = true;

func _on_body_entered(body):
	if "player" in body and item:
		entered = true;
		$EnterIcon.visible = true;

func _on_body_exited(body):
	if "player" in body:
		entered = false;
		$EnterIcon.visible = false;

extends Area2D

var entered = false;
var parent = null;

func _ready():
	parent = get_parent();
	$SpeechBubble.visible = false;

func _process(delta):
	var speakKey = Input.is_action_just_pressed("speak");
	var actionKey = Input.is_action_just_pressed("action");
	
	if entered:
		if speakKey:
			parent.speakKey();
		
		if actionKey:
			parent.actionKey();

func _on_body_entered(body):
	if "player" in body:
		entered = true;
		$SpeechBubble.visible = true;

func _on_body_exited(body):
	if "player" in body:
		entered = false;
		$SpeechBubble.visible = false;

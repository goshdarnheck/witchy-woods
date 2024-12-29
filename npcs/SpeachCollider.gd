extends Area2D

var entered = false;
var parent = null;
var speaking = false;

func _ready():
	parent = get_parent();

func _process(delta):
	var speakKey = Input.is_action_just_pressed("speak");
	var actionKey = Input.is_action_just_pressed("action");
	
	if entered:
		if speakKey:
			if "has_convo" in parent && parent.has_convo && !speaking:
				speaking = true;
				Manager.speech_bubble(parent.get_current_speech());
		
		if actionKey:
			if speaking:
				var next = parent.get_next_speech();
				print(next)
				if (next):
					Manager.speech_bubble(parent.get_next_speech());
				else:
					Manager.speech_bubble_close();

func _on_body_entered(body):
	if "player" in body:
		entered = true;
		$SpeechBubble.visible = true;


func _on_body_exited(body):
	if "player" in body:
		entered = false;
		$SpeechBubble.visible = false;

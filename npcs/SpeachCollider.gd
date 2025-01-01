extends Area2D

var entered = false;
var parent = null;
var speaking = false;

func _ready():
	parent = get_parent();
	parent.get_current_speech();
	$SpeechBubble.visible = false;

func _process(delta):
	var speakKey = Input.is_action_just_pressed("speak");
	var actionKey = Input.is_action_just_pressed("action");
	
	if entered:
		if speakKey && !speaking:
			speaking = true;
			Manager.speech_bubble(parent.get_current_speech());
		
		if actionKey && speaking:
			var next = parent.get_next_speech();

			if (next):
				Manager.speech_bubble(next);
			else:
				Manager.speech_bubble_close();
				speaking = false;

func _on_body_entered(body):
	if "player" in body:
		entered = true;
		$SpeechBubble.visible = true;

func _on_body_exited(body):
	if "player" in body:
		entered = false;
		$SpeechBubble.visible = false;

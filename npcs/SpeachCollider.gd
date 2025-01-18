extends Area2D

var entered = false;
var parent = null;
var end = false;
var giving_items = false;

func _ready():
	parent = get_parent();
	$SpeechBubble.visible = false;

func _process(delta):
	var actionKey = Input.is_action_just_pressed("action");
	
	if entered and actionKey:
		actionKey();
			
func actionKey():
	if giving_items:
		Manager.dismiss_items();
	if end == true:
		end = false;
		Manager.speech_bubble_close();
		if parent.current == null:
			$SpeechBubble.visible = false;
	elif parent.current:
		var speech = parent.convo[parent.current];
		if "func" in speech:
			parent.call(speech.func);
		else:
			if "items" in speech and speech.items:
				_give_items(speech.items);
			else:
				Manager.speech_bubble(speech);

			if "next" in speech:
				parent.current = speech["next"];
			if "end" in speech and speech.end == true:
				end = true;

func _give_items(items):
	giving_items = true;
	Manager.speech_bubble_close();
	Manager.inventory.add_item(items[0]);
	Manager.show_items(items);

func _on_body_entered(body):
	if "player" in body:
		entered = true;
		if parent.current:
			$SpeechBubble.visible = true;

func _on_body_exited(body):
	if "player" in body:
		entered = false;
		$SpeechBubble.visible = false;

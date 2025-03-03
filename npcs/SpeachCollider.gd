extends Area2D

var entered = false;
var callback = null;
var parent = null;
var end = false;
var giving_items = false;

func _ready():
	parent = get_parent();
	$SpeechBubble.visible = false;

func _process(delta):
	var actionKey = Input.is_action_just_pressed("action");
	
	if entered and actionKey:
		showCurrentSpeech();

func showCurrentSpeech():
	if giving_items:
		Manager.dismiss_items();
		giving_items = false;

	if callback:
		parent.call(callback);
		callback = null;

	if end == true:
		end = false;
		Manager.speech_bubble_close();
		if parent.current == null:
			$SpeechBubble.visible = false;
	elif parent.current:
		var speech = parent.convo[parent.current];

		if "items" in speech and speech.items:
			_give_items(speech.items);
		else:
			if "responses" in speech:
				speech.buttons = _gen_buttons(speech.responses);
			Manager.speech_bubble(speech);

		if "next" in speech:
			parent.current = speech["next"];

		if "end" in speech and speech.end == true:
			end = true;

		if "callback" in speech:
			callback = speech.callback;

func _gen_buttons(responses):
	var buttons = [];
	for i in range(responses.size()):
		var r = responses[i];
		var button = Button.new();
		button.text = r.text;
		button.pressed.connect(self._button_pressed.bind(i));
		buttons.append(button);
	return buttons

func _button_pressed(index):
	var speech = parent.convo[parent.current];
	var choice = speech.responses[index];
	
	if "next" in choice:
		parent.current = choice["next"];
		showCurrentSpeech();
	if "end" in choice && choice.end == true:
		Manager.speech_bubble_close();
		if !"next" in choice or choice.next == null:
			$SpeechBubble.visible = false;
	

func _give_items(items):
	giving_items = true;
	Manager.speech_bubble_close();
	Manager.inventory.add_items(items);
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

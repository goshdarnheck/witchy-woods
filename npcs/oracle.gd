extends CharacterBody2D

var displayName = "Oracle";
var current = "hey";
var convo = {
	"hey": {
		"name": displayName,
		"image": "oracle.png",
		"text": "Hello?",
		"next": "umm"
	},
	"umm": {
		"name": Manager.character.name,
		"image": Manager.character.study + "-player.png",
		"text": "umm...",
		"responses": [
			{
				"text": "Hello, it is I, " + Manager.character.name + "!",
				"callback": "speechChoices",
				"next": "apleasure"
			},
			{
				"text": "Heya!",
				"callback": null,
				"next": "goaway"
			}
		]
	},
	"goaway": {
		"name": displayName,
		"image": "oracle.png",
		"text": "Go away!",
	},
	"apleasure": {
		"name": displayName,
		"image": "oracle.png",
		"text": "A pleasure to meet you, I am the Oracle of This Place!",
	},
	"nothing": {
		"name": displayName,
		"image": "oracle.png",
		"text": "...",
	}
}

func speechChoices(data):
	print(data)

func get_current_speech():
	return get_speech(current)

func get_next_speech():
	if "next" in convo[current]:
		var key = convo[current]["next"]
		var next = get_speech(key)
		
		if (next):
			current = key;
			
			if "responses" in next:
				var buttons = [];
				for i in range(next.responses.size()):
					var r = next.responses[i];
					var button = Button.new();
					button.text = r.text;
					button.pressed.connect(self._button_pressed.bind(i));
					buttons.append(button);
					next.buttons = buttons;
			#else:
				#var button = Button.new();
				#button.text = "next";
				#button.pressed.connect(self._button_pressed.bind("next"));
				#next.buttons = [button];
			return next;
		else:
			return false;
	else:
		return false;

func get_speech(key):
	var speech = convo[key];
	if "responses" in speech:
		var buttons = [];
		for i in range(speech.responses.size()):
			var r = speech.responses[i];
			var button = Button.new();
			button.text = r.text;
			button.pressed.connect(self._button_pressed.bind(i));
			buttons.append(button);
			speech.buttons = buttons;
	return speech;

func _button_pressed(index):
	var next = get_speech(convo[current].responses[index].next);
	Manager.speech_bubble(next);

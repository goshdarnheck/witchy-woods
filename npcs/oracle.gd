extends StaticBody2D

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
		"func": "_end"
	},
	"apleasure": {
		"name": displayName,
		"image": "oracle.png",
		"text": "A pleasure to meet you, I am the Oracle of This Place!",
		"func": "_end"
	},
	"nothing": {
		"name": displayName,
		"image": "oracle.png",
		"text": "...",
	}
}
var speaking = false;

func speakKey():
	var speech = get_speech(current);
	Manager.speech_bubble(speech);
	speaking = true;

func actionKey():
	if speaking:
		if "responses" in convo[current]:
			print("MUST CHOOSE");
		elif "next" in convo[current]:
			var next = convo[current]["next"];
			var speech = get_speech(next);
			current = next;
			Manager.speech_bubble(speech);
		elif "func" in convo[current]:
			self.call(convo[current].func)
		else:
			Manager.speech_bubble_close();
			speaking = false;

func gen_buttons(responses):
	var buttons = [];
	for i in range(responses.size()):
		var r = responses[i];
		var button = Button.new();
		button.text = r.text;
		button.pressed.connect(self._button_pressed.bind(i));
		buttons.append(button);
	return buttons

func get_speech(key):
	var speech = convo[key];
	if "responses" in speech:
		speech.buttons = gen_buttons(speech.responses);
	return speech;

func _button_pressed(index):
	var next = convo[current].responses[index].next;
	var speech = get_speech(next);
	current = next
	Manager.speech_bubble(speech);

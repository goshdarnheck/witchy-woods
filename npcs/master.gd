extends CharacterBody2D

var displayName = "Old Magician";
var current = "takethese";
var convo = {
	"takethese": {
		"name": displayName,
		"image": "master.png",
		"text": "Take this...",
		"func": "_give_items"
	},
	"why": {
		"name": Manager.character.name,
		"image": Manager.character.study + "-player.png",
		"text": "huh? why?",
		"next": "dunno"
	},
	"dunno": {
		"image": "master.png",
		"name": displayName,
		"text": "I dunno lol"
	},
	"go": {
		"image": "master.png",
		"name": displayName,
		"text": "Go!"
	}
}
var speaking = false;

func speakKey():
	Manager.speech_bubble(convo[current]);
	speaking = true;

func actionKey():
	if speaking:
		if "next" in convo[current]:
			var next = convo[current]["next"];
			current = next;
			Manager.speech_bubble(convo[current]);
		elif "func" in convo[current]:
			self.call(convo[current].func);
		else:
			if (current == "dunno"):
				current = "go";
			speaking = false;
			Manager.speech_bubble_close();

func _give_items():
	var item = {
		"type": "wand",
		"name": "Stick Wand",
		"image": "wand.png"
	};
	
	speaking = false;
	current = "why";
	Manager.speech_bubble_close();
	Manager.inventory.add_item(item);
	Manager.show_items([item]);

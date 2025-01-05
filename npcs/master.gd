extends CharacterBody2D

var displayName = "Old Magician";
var current = "takethese";
var convo = {
	"takethese": {
		"name": displayName,
		"image": "master.png",
		"text": "Take these...",
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
			self.call(convo[current].func)
		else:
			if (current == "dunno"):
				current = "go";
			
			Manager.speech_bubble_close();
			speaking = false;

func _give_items():
	var item = {
		"type": "wand",
		"name": "Basic Wand",
		"image": "imagehere"
	};
	
	speaking = false;
	current = "why";
	Manager.speech_bubble_close();
	Manager.inventory.add_item(item);
	Manager.show_items([item]);

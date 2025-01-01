extends CharacterBody2D

var displayName = "Old Magician";
var current = "takethese";
var convo = {
	"takethese": {
		"name": displayName,
		"image": "master.png",
		"text": "Take these...",
		"next": "why"
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
	}
}

func get_current_speech():
	return convo[current];

func get_next_speech():
	if "next" in convo[current]:
		var next = convo[current]["next"];
		if (next):
			current = next;
			return convo[next];
		else:
			return false;
	else:
		return false;

#func _ready():
	#pass;
#
#func _process(delta):
	#pass;
#
#func _physics_process(delta):
	#pass;

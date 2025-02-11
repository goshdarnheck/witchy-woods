extends CharacterBody2D

var displayName = "Magician";
var current = "trick";
var speaking = false;
var convo = {
	"trick": {
		"name": displayName,
		"image": "magician.png",
		"text": "Want to see a trick?",
		"next": "umm"
	},
	"umm": {
		"name": Manager.character.name,
		"image": Manager.character.study + "-player.png",
		"text": "umm...",
		"responses": [
			{
				"text": "Yes!",
				"next": "yes"
			},
			{
				"text": "No",
				"next": "no"
			},
		]
	},
	"yes": {
		"name": displayName,
		"image": "magician.png",
		"text": "Abracadabra!",
		"callback": "_dissapear",
		"next": null,
		"end": true
	},
	"no": {
		"name": displayName,
		"image": "magician.png",
		"text": "Aww...",
		"next": "trick",
		"end": true
	}
}

func _dissapear():
	print("_dissapear!")
	self.queue_free();

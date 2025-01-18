extends CharacterBody2D

var displayName = "Robed Figure";
var current = "yes";
var speaking = false;
var convo = {
	"yes": {
		"name": displayName,
		"image": "dude.png",
		"text": "Yes?",
		"next": "no"
	},
	"no": {
		"name": displayName,
		"image": "dude.png",
		"text": "no!",
		"end": true,
		"next": "nothing"
	},
	"nothing": {
		"name": displayName,
		"image": "dude.png",
		"text": "...!",
		"end": true,
	},
}

extends CharacterBody2D

var displayName = "Old Magician";
var current = "takethese";
var image = "master.png";
var convo = {
	"takethese": {
		"name": displayName,
		"image": image,
		"text": "Take this...",
		"next": "give_items"
	},
	"give_items": {
		"items":[
			{
				"type": "wand",
				"name": "Stick Wand",
				"image": "stick-wand.png"
			}
		],
		"next": "why"
	},
	"why": {
		"name": Manager.character.name,
		"image": Manager.character.study + "-player.png",
		"text": "huh? why?",
		"next": "dunno"
	},
	"dunno": {
		"image": image,
		"name": displayName,
		"text": "I dunno lol",
		"end": true,
		"next": "go"
	},
	"go": {
		"image": image,
		"name": displayName,
		"text": "Go!",
		"end": true,
	}
}

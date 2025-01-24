extends CharacterBody2D

var displayName = "Yellow Witch";
var current = "magic";
var convo = {
	"magic": {
		"name": displayName,
		"image": "witch.png",
		"text": "Can you do magic?",
		"next": "umm"
	},
	"umm": {
		"name": Manager.character.name,
		"image": Manager.character.study + "-player.png",
		"text": "umm...",
		"responses": [
			{
				"text": "Yes!",
				"next": "magicyes"
			},
			{
				"text": "I'm not sure...",
				"next": "magicmaybe"
			},
			{
				"text": "Pardon?",
				"next": "magic",
				"end": true
			},
			{
				"text": "...",
				"next": null,
				"end": true
			}
		]
	},
	"magicyes": {
		"name": displayName,
		"image": "witch.png",
		"text": "Cool!",
		"end": true
	},
	"magicmaybe": {
		"name": displayName,
		"image": "witch.png",
		"text": "You should try!",
		"responses": [
			{
				"text": "Okay!",
				"next": "goodluck"
			},
			{
				"text": "I'm scared",
				"next": "scared"
			},
			{
				"text": "...",
				"next": null,
				"end": true
			}
		]
	},
	"goodluck": {
		"name": displayName,
		"image": "witch.png",
		"text": "Good luck!",
		"end": true
	},
	"scared": {
		"name": displayName,
		"image": "witch.png",
		"text": "Don't be scared!",
		"end": true
	}
}

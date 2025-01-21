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
				"text": "another question",
				"next": "q2"
			},
			{
				"text": "a response",
				"next": "test"
			},
			{
				"text": "Loop!",
				"next": "magic",
				"end": true
			},
			{
				"text": "Exit!",
				"next": null,
				"end": true
			}
		]
	},
	"q2": {
		"name": displayName,
		"image": "witch.png",
		"text": "TEST",
		"end": true
	},
	"test": {
		"name": displayName,
		"image": "witch.png",
		"text": "Well",
		"responses": [
			{
				"text": "another question",
				"next": "q2"
			},
			{
				"text": "a response",
				"next": "test"
			},
			{
				"text": "Exit!",
				"next": null,
				"end": true
			}
		]
	},
}

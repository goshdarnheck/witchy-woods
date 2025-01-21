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
				"next": "apleasure"
			},
			{
				"text": "Heya!",
				"next": "goaway"
			}
		]
	},
	"goaway": {
		"name": displayName,
		"image": "oracle.png",
		"text": "Go away!",
		"end": true,
		"next": "rude"
	},
	"apleasure": {
		"name": displayName,
		"image": "oracle.png",
		"text": "A pleasure to meet you, I am the Oracle of This Place!",
		"end": true,
		"next": "sopolite"
	},
	"sopolite": {
		"name": displayName,
		"image": "oracle.png",
		"text": "You're so polite!",
		"end": true
	},
	"rude": {
		"name": displayName,
		"image": "oracle.png",
		"text": "You're rude!",
		"end": true
	}
}

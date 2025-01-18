extends StaticBody2D

var displayName = "Noticable Rock";
var current = "hole";
var convo = {
	"hole": {
		"name": Manager.character.name,
		"image": Manager.character.study + "-player.png",
		"text": "Just a hole!",
		"next": null,
		"end": true
	}
}

extends Area2D

var displayName = "Noticable Rock";
var current = "nothing";
var convo = {
	"nothing": {
		"name": displayName,
		"image": "rock.png",
		"text": "...",
	},
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

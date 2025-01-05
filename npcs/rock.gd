extends StaticBody2D

var displayName = "Noticable Rock";
var current = "nothing";
var speaking = false;
var convo = {
	"nothing": {
		"name": displayName,
		"image": "rock.png",
		"text": "...",
	},
}

func speakKey():
	Manager.speech_bubble(convo[current]);
	
func actionKey():
	if "next" in convo[current]:
		var next = convo[current]["next"];
		current = next;
		Manager.speech_bubble(next);
	else:
		Manager.speech_bubble_close();

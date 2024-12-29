extends Area2D

func _on_body_entered(body):
	if "player" in body:
		print("test!!!!!!!!!!!!!!!!!!!!")
		$SpeechBubble.visible = true;


func _on_body_exited(body):
	if "player" in body:
		print("ahhhhhhhhhhh!")
		$SpeechBubble.visible = false;

extends Control

func setContent(data):
	if "text" in data:
		$Stuff/Text.text = data.text
	else:
		print("missing text")

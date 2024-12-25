extends Control

func _ready():
	$Name.text = Manager.character.name;
	print(Manager.character);

func _process(delta):
	pass

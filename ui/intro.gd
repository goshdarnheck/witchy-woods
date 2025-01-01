extends Control

func _ready():
	pass 

func _process(delta):
	pass

func _on_newgame_pressed():
	Manager.loadStage("creator");

func _on_loadgame_pressed():
	Manager.loadStage("load");

extends Control

func _ready():
	pass 

func _process(delta):
	pass

func _on_newgame_pressed():
	Manager.load_stage("creator");

func _on_loadgame_pressed():
	Manager.load_stage("load");

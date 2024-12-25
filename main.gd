extends Node2D

var world = "DEFAULT"
var ui = "INTRO"
var time_status = "PAUSED"
var character = {
	name: "default"
};

func _ready():
	Events.subscribe("NEW_GAME", self, "_eventHandler");
	Events.subscribe("AWAKEN", self, "_eventHandler");
	_load_UI("intro")

func _process(delta):
	pass;

func _eventHandler(event, data):
	print("main event handler, pass this to the state machine!", event, data);
	
	match (event):
		"NEW_GAME":
			_load_level("creator");
			_load_UI("creator");
		"AWAKEN":
			Manager.set_character(data);
			_load_level("beginning");
			_load_UI("overworld");

func _load_level(name):
	var scene = load("res://levels/" + name + ".tscn")
	var instance = scene.instantiate()
	
	for i in range(0, $World.get_child_count()):
		$World.get_child(i).queue_free()

	$World.add_child(instance)

func _load_UI(name):
	var scene = load("res://ui/" + name + ".tscn")
	var instance = scene.instantiate() #creates a new node
	
	for i in range(0, $UI.get_child_count()):
		$UI.get_child(i).queue_free()
		
	$UI.add_child(instance)

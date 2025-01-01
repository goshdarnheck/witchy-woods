extends Node

# BIG NODES
var World = null;
var UI = null;
var Overlay = null;

# CURRENT BIG NODES, kinda state
var world = "DEFAULT";
var ui = "INTRO";
var overlay = "none";

# BIG STATE I GUESS
var is_speaking = false;
var paused = false;

# player state, more detailed game state here? how do you make a game?
var character = {
	"name": "Fringor",
	"study": "fire"
}

func _ready():
	World = get_tree().get_root().get_node("Main/World");
	UI = get_tree().get_root().get_node("Main/UI");
	Overlay = get_tree().get_root().get_node("Main/Overlay");
	_load_UI("intro");

func isSpeechbubble():
	return _is_Overlay("Speechbubble")

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	var actionKey = Input.is_action_just_pressed("action");
	
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == KEY_TAB:
				if overlay == "inventory":
					_unpause();
					_clear_Overlay();
					overlay = "none"
				else:
					overlay = "inventory";
					_pause();
					_load_Overlay("inventory");

func _pause():
	paused = true;
	
func _unpause():
	paused = false;

func _process(delta):
	pass;

func loadStage(stageName):
	if stageName == "creator":
		_load_level("creator");
		_load_UI("creator");
	elif stageName == "load":
		_load_level("load");
		_load_UI("load");
	else:
		_load_level(stageName);
		_load_UI("overworld");

func speech_bubble(data):
	is_speaking = true;
	
	_pause();
	if !isSpeechbubble():
		_load_Overlay("Speechbubble");
	Overlay.get_child(0).setContent(data);

func speech_bubble_close():
	is_speaking = false;
	
	_unpause();
	_clear_Overlay();

func _eventHandler(event, data):
	print("manager event handler", event, data);

func _load_level(lname):
	var scene = load("res://levels/" + lname + ".tscn");
	print("res://levels/" + lname + ".tscn")
	var instance = scene.instantiate();

	if (!"no_player" in instance || !instance.no_player):
		var playerScene = load("res://player/player.tscn");
		var playerInstance = playerScene.instantiate();
		instance.add_child(playerInstance);
	
	for i in range(0, World.get_child_count()):
		World.get_child(i).queue_free();

	World.add_child(instance)
	

func _load_UI(name):
	var scene = load("res://ui/" + name + ".tscn");
	var instance = scene.instantiate();
	
	for i in range(0, UI.get_child_count()):
		UI.get_child(i).queue_free();
		
	UI.add_child(instance);
	
func _load_Overlay(name):
	var scene = load("res://ui/" + name + ".tscn");
	var instance = scene.instantiate();
	
	_clear_Overlay();
		
	Overlay.add_child(instance);

func _clear_Overlay():
	for i in range(0, Overlay.get_child_count()):
		Overlay.get_child(i).queue_free();

func _is_Overlay(name):
	if (Overlay.get_child_count() > 0):
		print(Overlay.get_child(0))
		return Overlay.get_child(0).name == name;

func set_character(data):
	character = data;

func save():
	pass;
	
func getSaves():
	pass;

func loadSave():
	pass;

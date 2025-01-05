extends Node

# BIG NODES
var World = null;
var UI = null;
var Overlay = null;

# CURRENT BIG NODES, kinda state
var world = "DEFAULT";
var ui = "INTRO";

# BIG STATE I GUESS
var paused = false;

# player state, more detailed game state here? how do you make a game?
var character = {
	"name": "Fringor",
	"study": "fire",
	"equipment": {}
}
var inventory = null;

func _ready():
	World = get_tree().get_root().get_node("Main/World");
	UI = get_tree().get_root().get_node("Main/UI");
	Overlay = get_tree().get_root().get_node("Main/Overlay");
	_load_ui("intro");
	inventory = Inventory.new();

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()
		
	var actionKey = Input.is_action_just_pressed("action");
	
	if event is InputEventKey:
		if event.pressed:
			if event.keycode == KEY_TAB:
				if _is_overlay("inventory"):
					_unpause();
					_clear_overlay();
				else:
					_pause();
					_load_overlay("inventory");
	
	if actionKey:
		if _is_overlay("NewItem"):
			_unpause();
			_clear_overlay();

func _pause():
	paused = true;
	
func _unpause():
	paused = false;

func _process(delta):
	pass;

func load_stage(stageName):
	if stageName == "creator":
		_load_level("creator");
		_load_ui("creator");
	elif stageName == "load":
		_load_level("load");
		_load_ui("load");
	else:
		_load_level(stageName);
		_load_ui("overworld");

func speech_bubble(data):
	if (!_is_overlay("NewItem")):
		_pause();
		if !_is_overlay("Speechbubble"):
			_load_overlay("Speechbubble");
		Overlay.get_child(0).setContent(data);

func speech_bubble_close():
	if _is_overlay("Speechbubble"):
		_unpause();
		_clear_overlay();

func show_items(items):
	_pause();
	Manager._load_overlay("NewItem");

func _load_level(lname):
	var scene = load("res://levels/" + lname + ".tscn");
	var instance = scene.instantiate();

	if (!"no_player" in instance || !instance.no_player):
		var playerScene = load("res://player/player.tscn");
		var playerInstance = playerScene.instantiate();
		instance.add_child(playerInstance);
	
	for i in range(0, World.get_child_count()):
		World.get_child(i).queue_free();

	World.add_child(instance)
	
func _load_ui(uiname):
	var scene = load("res://ui/" + uiname + ".tscn");
	var instance = scene.instantiate();
	
	for i in range(0, UI.get_child_count()):
		UI.get_child(i).queue_free();
		
	UI.add_child(instance);
	
func _load_overlay(oname):
	var scene = load("res://ui/" + oname + ".tscn");
	var instance = scene.instantiate();
	
	_clear_overlay();
	Overlay.add_child(instance);

func _clear_overlay():
	for i in range(0, Overlay.get_child_count()):
		Overlay.get_child(i).queue_free();

func _is_overlay(oname):
	if (Overlay.get_child_count() > 0):
		return Overlay.get_child(0).name == oname;

func set_character(data):
	character = data;

#func _event_handler(event, data):
	#print("manager event handler", event, data);

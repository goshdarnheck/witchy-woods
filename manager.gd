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
var speaking = false;
var showing_item = false;

# player state, more detailed game state here? how do you make a game?
var character = {
	"name": "Fringor",
	"study": "fire",
	"equipment": {
		
	}
}
var inventory = null;
var equipment = null;

func _ready():
	World = get_tree().get_root().get_node("Main/World");
	UI = get_tree().get_root().get_node("Main/UI");
	Overlay = get_tree().get_root().get_node("Main/Overlay");
	_load_ui("intro");
	inventory = Inventory.new();
	equipment = Equipment.new();

func _input(event):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

	var inventoryKey = Input.is_action_just_pressed("inventory");
	
	if inventoryKey and !speaking and !showing_item:
		if Overlay.find_child("Inventory").visible:
			Overlay.find_child("Inventory").visible = false;
			_unpause();
		else:
			_pause();
			Overlay.find_child("Inventory").update();
			Overlay.find_child("Inventory").visible = true;

func _pause():
	paused = true;
	
func _unpause():
	paused = false;

func _process(delta):
	pass;

func load_stage(stageName):
	if stageName == "creator":
		load_level("creator");
		_load_ui("creator");
	elif stageName == "load":
		load_level("load");
		_load_ui("load");
	else:
		load_level(stageName);
		_load_ui("overworld");

func speech_bubble(content):
	speaking = true;
	_pause();
	Overlay.find_child("Speechbubble").setContent(content);
	Overlay.find_child("Speechbubble").visible = true;

func speech_bubble_close():
	speaking = false;
	Overlay.find_child("Speechbubble").visible = false;
	_unpause();

func show_items(items):
	showing_item = true;
	_pause();
	Overlay.find_child("NewItem").setContent(items);
	Overlay.find_child("NewItem").visible = true;

func dismiss_items():
	showing_item = false;
	_unpause();
	Overlay.find_child("NewItem").visible = false;

func load_level(lname):
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

func set_character(data):
	character = data;

#func _event_handler(event, data):
	#print("manager event handler", event, data);

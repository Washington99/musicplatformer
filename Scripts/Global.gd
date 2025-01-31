extends Node

var current_scene = null

var player_accuracy: float = 100
var player_level: int = 0
var next_level: String 
var previous_level: String

var levels = []
var unlocked_levels = 1
var level_completed: bool = false

func _ready():
	var root = get_tree().root
	
	# Using a negative index counts from the end, so this gets the last child node of `root`.
	current_scene = root.get_child(-1)
	
	# Game automatically loads on running game
	load_game()
	
func goto_scene(path: String) -> void:
	
	# This function will usually be called from a signal callback,
	# or some other function in the current scene.
	# Deleting the current scene at this point is
	# a bad idea, because it may still be executing code.
	# This will result in a crash or unexpected behavior.

	# The solution is to defer the load to a later time, when
	# we can be sure that no code from the current scene is running:
	_deferred_goto_scene.call_deferred(path)


func _deferred_goto_scene(path: String) -> void:
	# It is now safe to remove the current scene.
	current_scene.free()

	# Load the new scene.
	var scene = ResourceLoader.load(path)

	# Instance the new scene.
	current_scene = scene.instantiate()

	# Add it to the active scene, as child of root.
	get_tree().root.add_child(current_scene)

	# Optionally, to make it compatible with the SceneTree.change_scene_to_file() API.
	get_tree().current_scene = current_scene

func save_game () -> void:
	
	var save_data: Dictionary = {
		"player_accuracy": player_accuracy,
		"player_level":  player_level,
		"next_level": next_level,
		"previous_level": previous_level,

		"levels": levels,
		"unlocked_levels": unlocked_levels,
		"level_completed": level_completed
	}
	
	var save_file = FileAccess.open("res://savefile.json", FileAccess.WRITE)
	var jsonString: String = JSON.stringify(save_data)
	
	save_file.store_line(jsonString)
	
	save_file.close()
	
func load_game () -> void:
	
	# No Data yet to Save
	# Happens at the very first run of the game
	if not FileAccess.file_exists("res://savefile.json"):
		print("no file")
		return # Nothing
	
	
	# Data to be saved exists
	var save_file = FileAccess.open("res://savefile.json", FileAccess.READ)
	var string_data: String = save_file.get_as_text()
	save_file.close()
	
	var save_data: Dictionary = JSON.parse_string(string_data)
	player_accuracy = save_data.player_accuracy
	player_level = save_data.player_level
	next_level = save_data.next_level
	previous_level = save_data.previous_level

	levels = save_data.levels
	unlocked_levels = save_data.unlocked_levels
	level_completed = save_data.level_completed	
		
func delete_save () -> void:
	if FileAccess.file_exists("res://savefile.json"):
		DirAccess.remove_absolute("res://savefile.json")
		
		player_accuracy = 100
		player_level = 0
		next_level = ""
		previous_level = ""
		levels = []
		unlocked_levels = 1
		level_completed = false

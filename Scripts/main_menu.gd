extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_start_pressed() -> void:
	Global.goto_scene("res://Scenes/level_1.tscn")


func _on_continue_pressed() -> void:
	Global.goto_scene("res://Scenes/level_select.tscn")


func _on_tutorial_pressed() -> void:
	Global.goto_scene("res://Scenes/tutorial.tscn")


func _on_credits_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed() -> void:
	get_tree().quit()

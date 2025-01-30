extends Control

var next_level = Global.next_level

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Label2.text = str(Global.player_accuracy)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_next_pressed() -> void:
	Global.player_accuracy = 100
	Global.goto_scene(next_level)

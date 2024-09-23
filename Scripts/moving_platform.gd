extends Node2D

@export var offset = Vector2(0, -250)
@export var duration = 5.0

func start_tween():
	var tween = get_tree().create_tween().set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.set_loops(1)
	tween.tween_property($".", "position", position + offset, duration / 2)
	tween.tween_property($".", "position", position, duration / 2)

func _on_switch_switch_on(name: String) -> void:
	start_tween()

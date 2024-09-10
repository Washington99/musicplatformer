extends Node2D

func _on_guitar_pressed() -> void:
	$Control/Guitar.hide()
	$Control/Piano.show()

func _on_piano_pressed() -> void:
	$Control/Guitar.show()
	$Control/Piano.hide()

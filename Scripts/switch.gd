extends Area2D

func _on_area_entered(area: Area2D) -> void:
	$TileMapLayer.set_cell(Vector2i(0,0), 0, Vector2i(13,9))
	$CollisionShape2D.set_deferred("disabled", true)
	$Timer.start()


func _on_timer_timeout() -> void:
	$TileMapLayer.set_cell(Vector2i(0,0), 0, Vector2i(12,9))
	$CollisionShape2D.set_deferred("disabled", false)

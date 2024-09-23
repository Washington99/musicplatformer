extends Area2D

class_name Switch

@export var is_one_time: bool = false
@export var switch_name: String = ""

signal switch_on(name: String)

func _on_area_entered(area: Area2D) -> void:
	$TileMapLayer.set_cell(Vector2i(0,0), 0, Vector2i(13,9))
	$CollisionShape2D.set_deferred("disabled", true)
	switch_on.emit(switch_name)
	
	if !is_one_time:
		$Timer.start()

func _on_timer_timeout() -> void:
	$TileMapLayer.set_cell(Vector2i(0,0), 0, Vector2i(12,9))
	$CollisionShape2D.set_deferred("disabled", false)
	
func switch_reset() -> void:
	$TileMapLayer.set_cell(Vector2i(0,0), 0, Vector2i(12,9))
	$CollisionShape2D.set_deferred("disabled", false)

extends Area2D

class_name Switch

@export var is_one_time: bool = false
@export var switch_name: String = ""
@export var trigger_keys: Array[String] = []

var triggered: bool = false
signal switch_on(name: String)

func _on_area_entered(area: Area2D) -> void:
	var music_resolver: MusicResolver = area.get_parent()
	var music_played: String = music_resolver.instrument_played + "_" + str(music_resolver.note_played)

	if music_played in trigger_keys:
		# triggered = true
		$TileMapLayer.set_cell(Vector2i(0,0), 0, Vector2i(13,9))
		# $CollisionShape2D.set_deferred("disabled", true)
		switch_name = music_played
		# switch_on.emit(switch_name)
		
		if !is_one_time:
			$Timer.start()

func _on_timer_timeout() -> void:
	$TileMapLayer.set_cell(Vector2i(0,0), 0, Vector2i(12,9))
	$CollisionShape2D.set_deferred("disabled", false)
	triggered = false

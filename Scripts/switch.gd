extends Area2D

class_name Switch

@export var is_one_time: bool = false
@export var switch_name: String = ""
@export var trigger_keys: Array[String] = []

var triggered: bool = false
signal switch_on(name: String)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		for audio in trigger_keys:
			var music_player = "res://Assets/Audio/" + audio + ".wav"
				
			$AudioStreamPlayer2D.stream = ResourceLoader.load(music_player)
			$AudioStreamPlayer2D.play()
			await $AudioStreamPlayer2D.finished
	else:
		print("from vertices ", body)

func _on_area_entered(area: Area2D) -> void:
	var music_resolver: MusicResolver = area.get_parent()
	var music_played: String = music_resolver.instrument_played + "_" + str(music_resolver.note_played)
	# music_resolver.set_disabled(true)

	if music_played in trigger_keys:
		# triggered = true
		$TileMapLayer.set_cell(Vector2i(0,0), 5, Vector2i(2,4))
		# $CollisionShape2D.set_deferred("disabled", true)
		switch_name = music_played
		# switch_on.emit(switch_name)
		
		if !is_one_time:
			$Timer.start()

func _on_timer_timeout() -> void:
	$TileMapLayer.set_cell(Vector2i(0,0), 5, Vector2i(1,4))
	$CollisionShape2D.set_deferred("disabled", false)
	triggered = false

extends Area2D

class_name Lifeform

@export var song_list: Array[String]

#func _on_body_entered(body: Node2D) -> void:
	#if Input.is_key_pressed(KEY_SPACE):
		#for audio in song_list:
			#var music_player = "res://Assets/Audio/" + audio + ".wav"
			#
			#$AudioStreamPlayer2D.stream = ResourceLoader.load(music_player)
			#$AudioStreamPlayer2D.play()
			#await $AudioStreamPlayer2D.finished


func _on_area_entered(area: Area2D) -> void:
	for audio in song_list:
		var music_player = "res://Assets/Audio/" + audio + ".wav"
			
		$AudioStreamPlayer2D.stream = ResourceLoader.load(music_player)
		$AudioStreamPlayer2D.play()
		await $AudioStreamPlayer2D.finished

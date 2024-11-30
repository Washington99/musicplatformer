extends Area2D

@export var song_list: Array[String]

func _on_area_entered(area: Area2D) -> void:

	for audio in song_list:
		var music_player = "res://Assets/Audio/" + audio + ".wav"
		
		
		print(music_player + "2")
		$AudioStreamPlayer2D.stream = ResourceLoader.load(music_player)
		$AudioStreamPlayer2D.play()
		await $AudioStreamPlayer2D.finished
		

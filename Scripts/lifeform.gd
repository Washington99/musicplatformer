extends Area2D

class_name Lifeform

@export var song_list: Array[String]

@export var instruments_selection: Array[String] = ["piano"]
@export var notes_selection: Array[int] = [1,3,5]
@export var num_songs: int = 1


func _on_ready() -> void:
	song_list.clear()
	randomize_song_list()
	print(song_list)
	
func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		for audio in song_list:
			var music_player = "res://Assets/Audio/" + audio + ".wav"
				
			$AudioStreamPlayer2D.stream = ResourceLoader.load(music_player)
			$AudioStreamPlayer2D.play()
			await $AudioStreamPlayer2D.finished
	
	# Remove in final product
	else:
		print("from lifeform ", body)

func randomize_song_list () -> void:
	
	while song_list.size() < num_songs:
		var temp: String = (
			instruments_selection.pick_random() + "_" + 
			str(notes_selection.pick_random())
		)

		if temp not in song_list:
			song_list.append(
				temp
			)
		


#func _on_area_entered(area: Area2D) -> void:
	#for audio in song_list:
		#var music_player = "res://Assets/Audio/" + audio + ".wav"
			#
		#$AudioStreamPlayer2D.stream = ResourceLoader.load(music_player)
		#$AudioStreamPlayer2D.play()
		#await $AudioStreamPlayer2D.finished

extends Area2D

class_name Lifeform

@export var song_list: Array[String]
@onready var animated_sprite = $AnimatedSprite2D

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


#func _on_area_entered(area: Area2D) -> void:
	#for audio in song_list:
		#var music_player = "res://Assets/Audio/" + audio + ".wav"
			#
			#$AudioStreamPlayer2D.stream = ResourceLoader.load(music_player)
			#$AudioStreamPlayer2D.play()
			#await $AudioStreamPlayer2D.finished

func _ready():
	animated_sprite.play("default")

func _on_area_entered(area: Area2D) -> void:\
	for audio in song_list:
		var music_player = "res://Assets/Audio/" + audio + ".wav"
			
		$AudioStreamPlayer2D.stream = ResourceLoader.load(music_player)
		$AudioStreamPlayer2D.play()
		await $AudioStreamPlayer2D.finished

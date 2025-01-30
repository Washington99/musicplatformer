extends Area2D

class_name Lifeform

@export var song_list: Array[String]
@onready var animated_sprite = $AnimatedSprite2D
@onready var animated_notes = get_node("AnimatedNote")

@export var instruments_selection: Array[String] = ["piano"]
@export var notes_selection: Array[int] = [1,3,5]
@export var num_songs: int = 1

var player_near: bool = false

func _on_ready() -> void:
	song_list.clear()
	randomize_song_list()
	# print(song_list)

func _physics_process(_delta: float) -> void:
	if player_near and Input.is_action_just_pressed("interact"):
		for audio in song_list:
			var music_player = "res://Assets/Audio/" + audio + ".wav"
			
			if "1" in audio:
				$AnimatedNote.play("green")
			elif "3" in audio:
				$AnimatedNote.play("blue")
			elif "5" in audio:
				$AnimatedNote.play("cyan")
			elif "6" in audio:
				$AnimatedNote.play("red")
			elif "8" in audio:
				$AnimatedNote.play("orange")
			elif "10" in audio:
				$AnimatedNote.play("purple")
			elif "12" in audio:
				$AnimatedNote.play("yellow")
				
			$AudioStreamPlayer2D.stream = ResourceLoader.load(music_player)
			$AudioStreamPlayer2D.play()
			await $AudioStreamPlayer2D.finished

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player_near = true

func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		player_near = false
	
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

func _ready():
	animated_sprite.play("default")

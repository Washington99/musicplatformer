extends Area2D

@export var notes_list: Array[String]
@export var num_notes_to_play: int = 3
@export var next_scene_path: String
@export var is_randomized: bool = false

var successfully_played: int = 0

func _on_body_entered(body: Node2D) -> void:
	var i: int = 0
	for audio in notes_list:
		if i < num_notes_to_play:
			var music_player = "res://Assets/Audio/" + audio + ".wav"
			
			$AudioStreamPlayer2D.stream = ResourceLoader.load(music_player)
			$AudioStreamPlayer2D.play()
			await $AudioStreamPlayer2D.finished
		
		i += 1

func _on_area_entered(area: Area2D) -> void:
	var music_resolver: MusicResolver = area.get_parent()
	var music_played: String = music_resolver.instrument_played + "_" + str(music_resolver.note_played)
	# music_resolver.set_disabled(true)

	if music_played == notes_list[successfully_played]:
		$TileMapLayer.set_cell(Vector2i(0,0), 0, Vector2i(12,12))
		successfully_played += 1
		
		if successfully_played == num_notes_to_play:
			successfully_played = 0
			get_tree().change_scene_to_file(next_scene_path)
		
	else: # Reset
		$TileMapLayer.set_cell(Vector2i(0,0), 0, Vector2i(11,12))
		successfully_played = 0
		if is_randomized:
			randomized_notes_list()
		# Call lifeform randomizer
		
func randomized_notes_list () -> void:
	randomize()
	notes_list.shuffle()

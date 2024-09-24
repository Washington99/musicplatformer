extends AudioStreamPlayer2D

var note_played: String = ""
var instrument_played: String = "piano"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if instrument_played != "" and note_played != "":
		
		var music_player = "res://Assets/Audio/" + instrument_played + "_" + note_played + ".wav"
		#var music_player = preload("res://Assets/Audio/piano_1.wav")
		#if !$".".is_playing():
			#$".".stream = music_player
			#$".".play()
			#
		#if finished:
			#note_played = ""
		print(music_player)
		if !$".".is_playing():
			$".".stream = ResourceLoader.load(music_player)
			$".".play()
		
		if $".".finished:
			note_played = ""


func _on_music_node_note_played(note_name: String) -> void:
	note_played = note_name

func _on_instrument_node_instrument_switched(instrument_name: String) -> void:
	instrument_played = instrument_name

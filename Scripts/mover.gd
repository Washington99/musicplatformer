extends Area2D



@export var lifeform: Lifeform

@export var dest_for_decreasing: Node2D
@export var dest_for_increasing: Node2D
@export var num_notes_to_play: int = 3

var states: Array[String] = ["zero", "first", "second_dec", "second_inc",]
var current_state: String = states[0]

#var current_note: int = 0
#var current_instrument: String = ""
#var seq_direction: int = 0
var temp: Array[int] = [1,3,5]
var note_sequence: Array[String] = ["piano_5", "piano_1", "piano_3", "piano_5", "piano_1"]

func _on_ready() -> void:
	var mover_note = lifeform.song_list[0].split("_")
	var instrument_to_use: String = mover_note[0]
	# var note_to_play: int = int(mover_note[1])
	
	#var i = 0
	#while i < num_notes_to_play:
		#note_sequence[i] = instrument_to_use + "_" + str(note_to_play)
		#pass
	
func _on_area_entered(area: Area2D) -> void:
	var music_resolver: MusicResolver = area.get_parent()
	var music_played: String = music_resolver.instrument_played + "_" + str(music_resolver.note_played)
	# music_resolver.set_disabled(true)
	
	#var num_notes: int = 3
	#var adjacent_notes: Array[String] = [
		#current_instrument + "_" + str(fposmod(current_note - 2, num_notes)), 
		#current_instrument + "_" + str(fposmod(current_note + 2, num_notes))
		#]
	#print(adjacent_notes)
	#
	#if current_state == states[2] and seq_direction:
		#print("good sequence")
		#
	#elif current_state == states[1] and music_played in adjacent_notes:
		#current_note = music_resolver.note_played
		#current_instrument = music_resolver.instrument_played
		#
		### adjacent_notes[0] indicates decreasing pitch
		### adjacent_notes[1] indicates increasing pitch
		#seq_direction = adjacent_notes.find(music_played)
		#current_state = states[2]
		#print(seq_direction)
		
	if current_state == states[0] and music_played == note_sequence[2]:
		print(fposmod(-1, 3))
		current_state = states[1]
		
	elif current_state == states[1] and music_played == note_sequence[1]:
		current_state = states[2]
	elif current_state == states[1] and music_played == note_sequence[3]:
		current_state = states[3]
		
	elif current_state == states[2] and music_played == note_sequence[0]:
		var player: Player = area.get_parent().get_parent()
		player.transform = dest_for_decreasing.transform
		current_state = states[0]
	elif current_state == states[3] and music_played == note_sequence[4]:
		var player: Player = area.get_parent().get_parent()
		player.transform = dest_for_increasing.transform
		current_state = states[0]
		
	else:
		current_state = states[0]
	

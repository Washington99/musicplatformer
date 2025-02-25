extends AudioStreamPlayer2D

class_name MusicResolver

var allowed_songs: Array[String]

var note_played: int = 0 # A note that is never defined
var instrument_played: String = "piano"

func _ready() -> void:
	for instrument: String in $"..".allowed_instruments:
		for note: String in $"..".allowed_notes:
			allowed_songs.append(instrument + "_" + note)
			
	print("note_1" in allowed_songs)

#func _draw() -> void:
	#if !$Area2D/CollisionShape2D.disabled:
		#draw_circle(Vector2(0,0), 50, $Area2D/CollisionShape2D.debug_color)


func play_music() -> void:
	resolve_music_key()
	
	if !$".".playing and instrument_played != "" and note_played != 0:
		
		var music_player = "res://Assets/Audio/" + instrument_played + "_" + str(note_played) + ".wav"
			
		$Area2D/CollisionShape2D.disabled = false
		queue_redraw()
		
		$".".stream = ResourceLoader.load(music_player)
		$".".play()
		
		await $".".finished	
		
		$Area2D/CollisionShape2D.disabled = true
		queue_redraw()
	
func is_playing_sound() -> bool:
	return playing
	
func get_playing_note() -> int:
	return note_played
			
func resolve_instrument(instrument) -> void:
	instrument_played = instrument

	
	## Prevents switching bug that happens when an instrument is switched
	## In the middle of play_music() causing the instrument played to switch
	## To the new one instead of finishing first
	note_played = 0
		

func resolve_music_key () -> void:
	if Input.is_action_just_pressed("note_1") and "1" in $"..".allowed_notes:
		note_played = 1
			
	elif Input.is_action_just_pressed("note_3") and "3" in $"..".allowed_notes:
		note_played = 3
			
	elif Input.is_action_just_pressed("note_5") and "5" in $"..".allowed_notes:
		note_played = 5

	if Input.is_action_just_pressed("note_6") and "6" in $"..".allowed_notes:
		note_played = 6
			
	elif Input.is_action_just_pressed("note_8") and "8" in $"..".allowed_notes:
		note_played = 8	
			
	elif Input.is_action_just_pressed("note_10") and "10" in $"..".allowed_notes:
		note_played = 10
			
	elif Input.is_action_just_pressed("note_12") and "12" in $"..".allowed_notes:
		note_played = 12
		

func _on_area_2d_area_entered(_area: Area2D) -> void:
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	queue_redraw()
	$"..".num_notes_played += 1

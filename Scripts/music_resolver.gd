extends AudioStreamPlayer2D

class_name MusicResolver

var level: int

var note_played: int = 0 # A note that is never defined
var instrument_played: String = "piano"

func _ready() -> void:
	level = $"..".level
	
	if level == 3:
		instrument_played = "violin"
		
	print($"..".player_accuracy)

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
	if level > 0:
		if Input.is_action_just_pressed("note_1"):
			note_played = 1
			
		elif Input.is_action_just_pressed("note_3"):
			note_played = 3
			
		elif Input.is_action_just_pressed("note_5"):
			note_played = 5
			
	if level > 1:
		if Input.is_action_just_pressed("note_6"):
			note_played = 6
			
		elif Input.is_action_just_pressed("note_8"):
			note_played = 8	
			
		elif Input.is_action_just_pressed("note_10"):
			note_played = 10
			
		elif Input.is_action_just_pressed("note_12"):
			note_played = 12
		

func _on_area_2d_area_entered(_area: Area2D) -> void:
	$Area2D/CollisionShape2D.set_deferred("disabled", true)
	queue_redraw()
	$"..".num_notes_played += 1

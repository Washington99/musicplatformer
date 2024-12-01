extends AudioStreamPlayer2D

class_name MusicResolver

var level: int

var note_played: int = 0 # A note that is never defined
var instrument_played: String = "piano"

func _ready() -> void:
	level = $"..".level

func _draw() -> void:
	if !$Area2D/CollisionShape2D.disabled:
		draw_circle(Vector2(0,0), 50, $Area2D/CollisionShape2D.debug_color)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func play_music() -> void:
	resolve_instrument()
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
	
	
			
func resolve_instrument() -> void:
	if level > 0 and Input.is_key_pressed(KEY_1):
		instrument_played = "piano"
		
	if level > 2 and Input.is_key_pressed(KEY_2):
		instrument_played = "violin"
	
	## Prevents switching bug that happens when an instrument is switched
	## In the middle of play_music() causing the instrument played to switch
	## To the new one instead of finishing first
	note_played = 0
		

func resolve_music_key () -> void:
	if level > 0:
		if Input.is_key_pressed(KEY_U):
			note_played = 1
			
		elif Input.is_key_pressed(KEY_I):
			note_played = 3
			
		elif Input.is_key_pressed(KEY_O):
			note_played = 5
			
	if level > 1:
		if Input.is_key_pressed(KEY_P):
			note_played = 6
			
		elif Input.is_key_pressed(KEY_J):
			note_played = 8	
			
		elif Input.is_key_pressed(KEY_K):
			note_played = 10
			
		elif Input.is_key_pressed(KEY_L):
			note_played = 12
		
		
#func set_disabled (is_disabled: bool) -> void:
	#$Area2D/CollisionShape2D.disabled = is_disabled

func _on_area_2d_area_entered(area: Area2D) -> void:
	$Area2D/CollisionShape2D.disabled = true
	queue_redraw()
	note_played = 0

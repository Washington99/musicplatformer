extends Area2D

class_name Switch

@export var is_one_time: bool = false
@export var switch_name: String = ""
@export var trigger_keys: Array[String] = []

@onready var animated_notes = get_node("AnimatedNote")

var player_near: bool = false
var triggered: bool = false

func _on_ready() -> void:
	pass

func _physics_process(_delta: float) -> void:
	if player_near and Input.is_action_just_pressed("interact"):
		for audio in trigger_keys:
			var music_player = "res://Assets/Audio/" + audio + ".wav"
				
			$AudioStreamPlayer2D.stream = ResourceLoader.load(music_player)
			$AudioStreamPlayer2D.play()
			await $AudioStreamPlayer2D.finished

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player_near = true
		
func _on_body_exited(body: Node2D) -> void:
	if body is Player:
		player_near = false
	
func _on_area_entered(area: Area2D) -> void:
	
	var music_resolver: MusicResolver = area.get_parent()
	var music_played: String = music_resolver.instrument_played + "_" + str(music_resolver.note_played)
	# music_resolver.set_disabled(true)

	if music_played in trigger_keys:
		# triggered = true
		$TileMapLayer.set_cell(Vector2i(0,0), 5, Vector2i(2,4))
		# $CollisionShape2D.set_deferred("disabled", true)
		switch_name = music_played
		# switch_on.emit(switch_name)
		
		#$Label.text = music_played
		
		if "1" in music_played:
			$AnimatedNote.play("green")
		elif "3" in music_played:
			$AnimatedNote.play("blue")
		elif "5" in music_played:
			$AnimatedNote.play("cyan")
		elif "6" in music_played:
			$AnimatedNote.play("red")
		elif "8" in music_played:
			$AnimatedNote.play("orange")
		elif "10" in music_played:
			$AnimatedNote.play("purple")
		elif "12" in music_played:
			$AnimatedNote.play("yellow")
		
		if !is_one_time:
			$Timer.start()
			
	else:
		var player: Player = music_resolver.get_parent()
		player.num_error_played += 1

func _on_timer_timeout() -> void:
	$TileMapLayer.set_cell(Vector2i(0,0), 5, Vector2i(1,4))
	$CollisionShape2D.set_deferred("disabled", false)
	triggered = false

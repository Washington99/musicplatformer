extends Node2D

###################################################
## should make this a State?
###################################################

var animation_playing: bool = false

func _draw() -> void:
	if animation_playing:
		$Area2D/CollisionShape2D.disabled = false
		draw_circle(Vector2(0,0), 50, $Area2D/CollisionShape2D.debug_color)
	else:
		$Area2D/CollisionShape2D.disabled = true

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("play_note") and !animation_playing:
		queue_redraw()
		$Sprite2D.show()
		$Timer.start()
		
		animation_playing = true

func _on_timer_timeout() -> void:
	$Sprite2D.hide()
	queue_redraw()
	animation_playing = false

extends CharacterBody2D

class_name Player

@export var level: int

# Should be exported
const SPEED = 200.0
const JUMP_VELOCITY = -400.0

const animation_time: float = 0.80
var isSinging = false
var footstep_frames : Array = [4,9]

@onready var music_resolver = get_node("MusicResolver")
@onready var animated_sprite_2d = get_node("AnimatedSprite2D")
@onready var jump = $Jump
@onready var walk = $Walk

# Should probably move the movement itself to another function
# So add-ons to the player is functional
func _physics_process(delta: float) -> void:
	
	# Gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump State
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump.play()

	# Running State
	var direction := Input.get_axis("Left", "Right")
	if direction:
		$AnimatedSprite2D.scale.x = abs($AnimatedSprite2D.scale.x)*direction
		if abs(velocity.y) < 0.25:
			$AnimatedSprite2D.play("Run")
			if !walk.is_playing:
				print("Walking")
		else:
			$AnimatedSprite2D.play("Jump")
		velocity.x = direction * SPEED
		
	# Idle State
	else:
		if abs(velocity.y) > 0.25:
			$AnimatedSprite2D.play("Jump")
		elif music_resolver.is_playing_sound():
			$AnimatedSprite2D.play("Sing")
		else:
			$AnimatedSprite2D.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("play_note") or Input.is_action_just_pressed("play_instrument"):
		$MusicResolver.play_music()
	
	move_and_slide()
	


func _on_animated_sprite_2d_frame_changed() -> void:
	if animated_sprite_2d.animation == "Idle": return
	if animated_sprite_2d.animation == "Jump": return
	if animated_sprite_2d.animation == "Sing": return
	if animated_sprite_2d.frame in footstep_frames:
		walk.pitch_scale = randf_range(0.8, 1.2)
		walk.play()

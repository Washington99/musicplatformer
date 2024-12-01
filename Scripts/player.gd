extends CharacterBody2D

class_name Player

@export var level: int

# Should be exported
const SPEED = 200.0
const JUMP_VELOCITY = -400.0

const animation_time: float = 0.80

# Should probably move the movement itself to another function
# So add-ons to the player is functional
func _physics_process(delta: float) -> void:
	
	# Gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Jump State
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		$AnimatedSprite2D.play("Jump")
		velocity.y = JUMP_VELOCITY

	# Running State
	var direction := Input.get_axis("Left", "Right")
	if direction:
		$AnimatedSprite2D.scale.x = direction
		$AnimatedSprite2D.play("Run")
		velocity.x = direction * SPEED
		
	# Idle State
	else:
		$AnimatedSprite2D.play("Idle")
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("play_note") or Input.is_action_just_pressed("play_instrument"):
		$MusicResolver.play_music()
	
	move_and_slide()
	

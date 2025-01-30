extends Button

@onready var sprite = get_node("AnimatedSprite2D")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _pressed():
	$AnimatedSprite2D.play("pressed")
	await get_tree().create_timer(0.084).timeout 
	$AnimatedSprite2D.play("default")

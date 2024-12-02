extends Camera2D

@export var level: int = 0

func _ready() -> void:
	if level < 2:
		$Control/Instruments.set_item_disabled(1, true)

func _on_c_button_down() -> void:
	Input.action_press("play_note")
	Input.action_release("play_note")
	Input.action_press("note_1")
	Input.action_release("note_1")


func _on_d_button_down() -> void:
	Input.action_press("play_note")
	Input.action_release("play_note")
	Input.action_press("note_3")
	Input.action_release("note_3")


func _on_e_button_down() -> void:
	Input.action_press("play_note")
	Input.action_release("play_note")
	Input.action_press("note_5")
	Input.action_release("note_5")


func _on_f_button_down() -> void:
	Input.action_press("play_note")
	Input.action_release("play_note")
	Input.action_press("note_6")
	Input.action_release("note_6")


func _on_g_button_down() -> void:
	Input.action_press("play_note")
	Input.action_release("play_note")
	Input.action_press("note_8")
	Input.action_release("note_8")


func _on_a_button_down() -> void:
	Input.action_press("play_note")
	Input.action_release("play_note")
	Input.action_press("note_10")
	Input.action_release("note_10")


func _on_b_button_down() -> void:
	Input.action_press("play_note")
	Input.action_release("play_note")
	Input.action_press("note_12")
	Input.action_release("note_12")


func _on_option_button_item_selected(index: int) -> void:
	Input.action_press("play_instrument")
	Input.action_release("play_instrument")
	
	if index == 0:
		Input.action_press("piano")
		Input.action_release("piano")
		
	if index == 1:
		Input.action_press("violin")
		Input.action_release("violin")

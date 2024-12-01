extends Area2D

@export var note_hint: Lifeform

func _on_area_entered(area: Area2D) -> void:
	var notes: MusicNode = area.get_parent()
	print("")
	if notes.note_played in note_hint.song_list:
		print("yes")
		

func _on_body_entered(body: Player) -> void:
	var notes: MusicResolver = body.get_child()
	print("")
	if notes.note_played in note_hint.song_list:
		print("yes")

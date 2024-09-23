extends Node2D

func open_door() -> void:
	$TileMapLayer.set_cell(Vector2i(0,0), 0, Vector2i(12,10))
	$TileMapLayer.set_cell(Vector2i(0,1), 0, Vector2i(12,11))
	
func close_door() -> void:
	$TileMapLayer.set_cell(Vector2i(0,0), 0, Vector2i(13,10))
	$TileMapLayer.set_cell(Vector2i(0,1), 0, Vector2i(13,11))

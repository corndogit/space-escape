extends StaticBody2D

@onready var tilemap : TileMap = get_node("/root/Level/TileMap")
const PANEL_TILES = [
	Vector2(30, 2),
	Vector2(30, 3),
	Vector2(31, 2),
	Vector2(31, 3)
]

func interact():
	print(str("Interaction with " + name))
	for tile in PANEL_TILES:
		tilemap.erase_cell(1, tile)

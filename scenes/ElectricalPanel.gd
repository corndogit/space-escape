extends Interactable

@onready var tilemap : TileMap = get_node("/root/Level/TileMap")
const PANEL_TILES = {
	"top_left": Vector2(30, 2),
	"bottom_left": Vector2(30, 3),
	"top_right": Vector2(31, 2),
	"bottom_right": Vector2(31, 3)
}

func interact():
	print(str("Interaction with " + name))
	for tile in PANEL_TILES.values():
		tilemap.erase_cell(1, tile)

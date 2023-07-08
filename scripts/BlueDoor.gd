extends Interactable

@onready var tilemap : TileMap = get_node("/root/Level/TileMap")
const DOOR_TILES = {
	"top_left": Vector2(16, -4),
	"bottom_left": Vector2(16, -3),
	"top_right": Vector2(17, -4),
	"bottom_right": Vector2(17, -3)
}

func interact():
	print("Interaction with %s" % name)
	erase()

func erase():
	for tile in DOOR_TILES.values():
		tilemap.erase_cell(1, tile)
	get_node("CollisionShape2D").queue_free()

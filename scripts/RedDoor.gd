extends Interactable

@onready var tilemap : TileMap = get_parent().get_node("TileMap")

const DOOR_TILES = {
	"top_left": Vector2(16, 0),
	"bottom_left": Vector2(16, 1),
	"top_right": Vector2(17, 0),
	"bottom_right": Vector2(17, 1)
}

func interact():
	print("Interaction with %s" % name)
	erase()
	super.interact()

func erase():
	for tile in DOOR_TILES.values():
		tilemap.erase_cell(1, tile)
	get_node(".").remove_from_group("Interactable")

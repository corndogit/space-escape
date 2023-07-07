extends Interactable

@onready var tilemap : TileMap = get_node("/root/Level/TileMap")
var panel_removed : bool = false
var battery_taken : bool = false
const PANEL_TILES = {
	"top_left": Vector2(30, 2),
	"bottom_left": Vector2(30, 3),
	"top_right": Vector2(31, 2),
	"bottom_right": Vector2(31, 3)
}

func _ready():
	State.electrical_panel = self

func interact():
	if not panel_removed:
		for tile in PANEL_TILES.values():
			tilemap.erase_cell(1, tile)
	DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "electrical_panel")

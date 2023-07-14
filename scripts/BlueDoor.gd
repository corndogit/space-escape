extends Interactable

@onready var tilemap : TileMap = get_parent().get_node("TileMap")
const DOOR_TILES = {
	"top_left": Vector2(16, -4),
	"bottom_left": Vector2(16, -3),
	"top_right": Vector2(17, -4),
	"bottom_right": Vector2(17, -3)
}
var puzzle_2_solved : bool = false

func _ready():
	State.blue_door = self

func interact():
	DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "blue_door")

func erase():
	for tile in DOOR_TILES.values():
		tilemap.erase_cell(1, tile)
	get_node(".").remove_from_group("Interactable")

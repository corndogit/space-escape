extends Interactable

@onready var tilemap : TileMap = get_parent().get_node("TileMap")

const DOOR_TILES = {
	"top_left": Vector2(16, 0),
	"bottom_left": Vector2(16, 1),
	"top_right": Vector2(17, 0),
	"bottom_right": Vector2(17, 1)
}

func _ready():
	State.red_door = self

func interact():
	DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "red_door")

func erase():
	$OpenDoorSFX.play()
	for tile in DOOR_TILES.values():
		tilemap.erase_cell(1, tile)
	get_node(".").remove_from_group("Interactable")

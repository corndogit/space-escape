extends Interactable

@onready var tilemap : TileMap = get_parent().get_node("TileMap")
const DIALOGUE_TYPE = CustomDialogue.DialogueType.INTERACTABLE
const DOOR_TILES = {
	"top_left": Vector2(16, -2),
	"bottom_left": Vector2(16, -1),
	"top_right": Vector2(17, -2),
	"bottom_right": Vector2(17, -1)
}
var puzzle_2_solved : bool = false

func _ready():
	State.blue_door = self

func interact():
	CustomDialogue.start(DIALOGUE_TYPE, "blue_door")

func erase():
	$OpenDoorSFX.play()
	for tile in DOOR_TILES.values():
		tilemap.erase_cell(1, tile)
	get_node(".").remove_from_group("Interactable")

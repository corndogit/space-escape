extends Interactable

@onready var tilemap : TileMap = get_parent().get_node("TileMap")
@onready var battery_taken_sfx = $BatteryTakenSFX
var panel_removed : bool = false
var battery_taken : bool = false
const PANEL_TILES = {
	"top_left": Vector2(30, 2),
	"bottom_left": Vector2(30, 3),
	"top_right": Vector2(31, 2),
	"bottom_right": Vector2(31, 3)
}
const DIALOGUE_TYPE = CustomDialogue.DialogueType.INTERACTABLE

func _ready():
	State.electrical_panel = self

func interact():
	if not panel_removed:
		for tile in PANEL_TILES.values():
			tilemap.erase_cell(1, tile)
	CustomDialogue.start(DIALOGUE_TYPE, "electrical_panel")

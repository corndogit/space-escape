extends Interactable

@onready var tilemap : TileMap = get_parent().get_node("TileMap")
@onready var level = get_parent()
@onready var player = level.get_node("Player")
@onready var camera = player.get_node("Camera2D")
var puzzle_scene = preload("res://scenes/puzzle_3.tscn").instantiate()
var interacted_with = false
var puzzle_3_solved = false
const DOOR_TILES = {
	"top_left": Vector2(16, -4),
	"bottom_left": Vector2(16, -3),
	"top_right": Vector2(17, -4),
	"bottom_right": Vector2(17, -3)
}

func _ready():
	State.yellow_door = self

func interact():
	if not interacted_with:
		DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "yellow_door")
	level.add_child(puzzle_scene)
	State.active_puzzle = self
	camera.enabled = false
	puzzle_scene.visible = true
	
func erase():
	for tile in DOOR_TILES.values():
		tilemap.erase_cell(1, tile)
	self.remove_from_group("Interactable")

func close_puzzle():
	puzzle_scene.visible = false
	if level.get_node_or_null(puzzle_scene.get_path()):
		level.remove_child(puzzle_scene)
	camera.enabled = true
	player.in_dialogue = false

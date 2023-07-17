extends Interactable

var puzzle_scene = preload("res://scenes/puzzle_2.tscn").instantiate()
var puzzle_2_solved : bool = false
@onready var level = get_parent()
@onready var player = level.get_node("Player")
@onready var camera = player.get_node("Camera2D")

func _ready():
	State.computer_wall = self

func interact():
	if not State.computer_table.powered or not State.computer_table.puzzle_1_solved:
		DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "computer_wall")
	else:
		level.add_child(puzzle_scene)
		State.active_puzzle = self
		camera.enabled = false
		puzzle_scene.visible = true

func close_puzzle():
	puzzle_scene.visible = false
	if level.get_node_or_null(puzzle_scene.get_path()):
		level.remove_child(puzzle_scene)
	camera.enabled = true
	player.in_dialogue = false
	if puzzle_2_solved:
		get_node(".").remove_from_group("Interactable")

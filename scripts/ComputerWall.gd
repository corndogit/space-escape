extends Interactable

var puzzle_scene = preload("res://scenes/puzzle_2.tscn").instantiate()
var puzzle_2_solved : bool = false
const DIALOGUE_TYPE = CustomDialogue.DialogueType.INTERACTABLE
@onready var level = get_parent()
@onready var player = level.get_node("Player")
@onready var camera = player.get_node("Camera2D")
@onready var close_sfx : AudioStreamPlayer = get_node_or_null("CloseSFX")

func _ready():
	State.computer_wall = self

func interact():
	if not State.computer_table.powered or not State.computer_table.puzzle_1_solved:
		CustomDialogue.start(DIALOGUE_TYPE, "computer_wall")
		
	else:
		player.in_puzzle = true
		level.add_child(puzzle_scene)
		State.active_puzzle = self
		camera.enabled = false
		puzzle_scene.visible = true

func close_puzzle():
	player.in_puzzle = false
	puzzle_scene.visible = false
	if close_sfx is AudioStreamPlayer:
		close_sfx.play()
	if level.get_node_or_null(puzzle_scene.get_path()):
		level.remove_child(puzzle_scene)
	camera.enabled = true
	player.in_dialogue = false
	if puzzle_2_solved:
		get_node(".").remove_from_group("Interactable")

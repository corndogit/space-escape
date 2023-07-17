extends Interactable

var powered : bool = false
var puzzle_1_solved : bool = false
var current_scene : Node
var clue_scene = preload("res://scenes/puzzle_2_clue.tscn").instantiate()
@onready var level = get_parent()
@onready var player = level.get_node("Player")
@onready var camera = player.get_node("Camera2D")

func _ready():
	State.computer_table = self
	current_scene = preload("res://scenes/puzzle_1.tscn").instantiate()
	current_scene.visible = false

func interact():
	if powered and puzzle_1_solved and current_scene != clue_scene:
		current_scene = clue_scene
	if not powered:
		DialogueManager.show_example_dialogue_balloon(load("res://resources/interactables.dialogue"), "computer_table")
	else:
		open_puzzle()

func open_puzzle():
	level.add_child(current_scene)
	State.active_puzzle = self
	camera.enabled = false
	current_scene.visible = true
	
func close_puzzle():
	# do not forget how to do this
	current_scene.visible = false
	if level.get_node_or_null(current_scene.get_path()):
		level.remove_child(current_scene)
	camera.enabled = true
	player.in_dialogue = false

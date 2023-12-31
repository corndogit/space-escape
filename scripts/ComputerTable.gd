extends Interactable

var powered : bool = false
var puzzle_1_solved : bool = false
var current_scene : Node
var puzzle_scene = preload("res://scenes/puzzle_1.tscn").instantiate()
var clue_scene = preload("res://scenes/puzzle_2_clue.tscn").instantiate()
@onready var insert_battery_sfx = $InsertBatterySFX
@onready var remove_battery_sfx = $RemoveBatterySFX
@onready var close_sfx : AudioStreamPlayer = get_node_or_null("CloseSFX")
@onready var level = get_parent()
@onready var player = level.get_node("Player")
@onready var camera = player.get_node("Camera2D")
const DIALOGUE_TYPE = CustomDialogue.DialogueType.INTERACTABLE

func _ready():
	State.computer_table = self
	current_scene = puzzle_scene
	current_scene.visible = false

func interact():
	if powered and current_scene != clue_scene:
		if puzzle_1_solved:
			current_scene = clue_scene
	if not powered:
		CustomDialogue.start(DIALOGUE_TYPE, "computer_table")
	else:
		open_puzzle()

func open_puzzle():
	player.in_puzzle = true
	level.add_child(current_scene)
	State.active_puzzle = self
	camera.enabled = false
	current_scene.visible = true
	
func close_puzzle():
	player.in_puzzle = false
	current_scene.visible = false
	if puzzle_1_solved and puzzle_scene != null:  # maybe dangerous change
		puzzle_scene.queue_free()
	if close_sfx is AudioStreamPlayer:
		close_sfx.play()
	if level.get_node_or_null(current_scene.get_path()):
		level.remove_child(current_scene)
	camera.enabled = true
	player.in_dialogue = false

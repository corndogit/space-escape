extends Node2D

var dialogue = load("res://resources/win_cutscene.dialogue")
var surprised_texture : Texture2D = load("res://assets/textures/CatGPT/surprised.png")
const COMMAND_STRING = "sudo rm /bin/CatGPT"
const DIALOGUE_TYPE = CustomDialogue.DialogueType.WINNING_CUTSCENE
@onready var cat_gpt = $Panel/CenterContainer/AspectRatioContainer/CatGPT
@onready var particles = $Panel/CenterContainer/CPUParticles2D
@onready var command_label = $Command

func _ready():
	# start
	await get_tree().create_timer(1.0).timeout
	CustomDialogue.start(DIALOGUE_TYPE, "start")
	await DialogueManager.dialogue_ended
	
	# command is typed in
	_type_command()
	cat_gpt.texture = surprised_texture
	CustomDialogue.start(DIALOGUE_TYPE, "type_command")
	await DialogueManager.dialogue_ended
	
	# CatGPT is deleted
	command_label.text += " >"
	cat_gpt.visible = false
	particles.emitting = true
	CustomDialogue.start(DIALOGUE_TYPE, "enter_command")
	await DialogueManager.dialogue_ended
	
	get_tree().change_scene_to_file("res://scenes/win_screen.tscn")

func _type_command():
	for c in COMMAND_STRING:
		command_label.text += c
		await get_tree().create_timer(0.1).timeout

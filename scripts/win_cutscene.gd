extends Node2D

var dialogue = load("res://resources/win_cutscene.dialogue")
var surprised_texture : Texture2D = load("res://assets/textures/CatGPT/surprised.png")
const command = "sudo rm /bin/CatGPT"
@onready var cat_gpt = $Panel/CenterContainer/AspectRatioContainer/CatGPT
@onready var particles = $Panel/CenterContainer/CPUParticles2D
@onready var command_label = $Command

func _ready():
	# start
	await get_tree().create_timer(2.0).timeout
	DialogueManager.show_example_dialogue_balloon(dialogue, "start")
	await DialogueManager.dialogue_ended
	
	# command is typed in
	_type_command()
	cat_gpt.texture = surprised_texture
	DialogueManager.show_example_dialogue_balloon(dialogue, "type_command")
	await DialogueManager.dialogue_ended
	
	# CatGPT is deleted
	command_label.text += " >"
	cat_gpt.visible = false
	particles.emitting = true
	DialogueManager.show_example_dialogue_balloon(dialogue, "enter_command")
	await DialogueManager.dialogue_ended
	
	get_tree().change_scene_to_file("res://scenes/win_screen.tscn")

func _type_command():
	for c in command:
		command_label.text += c
		await get_tree().create_timer(0.1).timeout

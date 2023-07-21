extends Node2D

@export var scroll_speed : float = 60.0
@onready var bg = get_node("ScrollBG")
@onready var bg_start = bg.position
@onready var bgm = get_node_or_null("BGM")
@onready var button_sfx = get_node_or_null("PanelContainer/CenterContainer/VBoxContainer/HowToPlay/Sound")

# Called when the node enters the scene tree for the first time.
func _ready():
	var panel = get_node("PanelContainer")
	var window_size = get_window().get_size_with_decorations()
	panel.custom_minimum_size.x = window_size.x
	panel.custom_minimum_size.y = window_size.y
	if bgm:
		bgm.play()

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")

func _process(delta):
	if bg.position.x < -(bg.size.x / 2):
		bg.position = bg_start
	bg.position.x -= scroll_speed * delta

func _on_how_to_play_pressed():
	button_sfx.play()
	add_child(load("res://scenes/how_to_play.tscn").instantiate())

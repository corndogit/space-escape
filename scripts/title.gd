extends Node2D

@export var scroll_speed : float = 60.0
@onready var bg = get_node("ScrollBG")
@onready var bg_midpoint = get_node("ScrollBG/Midpoint")
@onready var bg_start = bg.position
@onready var bgm = get_node_or_null("BGM")

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
	if bg_midpoint.position.x < 0:
		bg.position = bg_start
	bg.position.x -= scroll_speed * delta

func _on_how_to_play_pressed():
	get_node("PanelContainer/CenterContainer/VBoxContainer/HowToPlay/Sound").play()
	add_child(load("res://scenes/how_to_play.tscn").instantiate())

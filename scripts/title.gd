extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var panel = get_node("PanelContainer")
	var window_size = get_window().get_size_with_decorations()
	panel.custom_minimum_size.x = window_size.x
	panel.custom_minimum_size.y = window_size.y

func _on_start_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_how_to_play_pressed():
	get_tree().change_scene_to_file("res://scenes/how_to_play.tscn")

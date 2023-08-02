extends Node2D

@onready var time_taken_label = get_node("Control/PanelContainer/CenterContainer/VBoxContainer/TimeTaken")

func _ready():
	time_taken_label.text = time_taken_label.text % State.time_taken

func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/title_screen.tscn")

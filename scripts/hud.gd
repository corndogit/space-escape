extends Control

@onready var timer : Timer = get_node("CountdownTimer")
@onready var timer_label : Label = get_node("HFlowContainer/Timer")

func _ready():
	pass
	#State.hud = self

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	timer_label.text = format_time(timer.time_left)
	State.time_taken = get_time_taken()

func _on_countdown_timer_timeout():
	timer_label.visible = false
	get_tree().change_scene_to_file("res://scenes/lose_scene.tscn")

func format_time(time_in_seconds):
	var mins = int(time_in_seconds / 60) 
	var secs = int(time_in_seconds) % 60
	return "%02d:%02d" % [mins, secs]  # MM:SS with leading 0s

func get_time_taken():
	return format_time(timer.wait_time - timer.time_left)

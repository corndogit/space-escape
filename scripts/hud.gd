extends Control

@onready var timer : Timer = $CountdownTimer
@onready var timer_warning : Timer = $WarningTimer
@onready var timer_danger : Timer = $DangerTimer
@onready var timer_label : Label = $HFlowContainer/Timer
@onready var alert_loop : AudioStreamPlayer = $AlertLoop

func _ready():
	timer_warning.wait_time = timer.wait_time * 0.8
	timer_danger.wait_time = timer.wait_time - 60.0
	timer_warning.start()
	timer_danger.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	timer_label.text = format_time(timer.time_left)
	State.time_taken = get_time_taken()

func _on_countdown_timer_timeout():
	timer_label.visible = false
	get_tree().change_scene_to_file("res://scenes/ui/lose_scene.tscn")

func format_time(time_in_seconds):
	var mins = int(time_in_seconds / 60) 
	var secs = int(time_in_seconds) % 60
	return "%02d:%02d" % [mins, secs]  # MM:SS with leading 0s

func get_time_taken():
	return format_time(timer.wait_time - timer.time_left)

func _on_warning_timer_timeout():
	timer_label.add_theme_color_override("font_color", Color(0.9, 0.9, 0.3))
	alert_loop.play()
	await get_tree().create_timer(3.0).timeout
	alert_loop.stop()

func _on_danger_timer_timeout():
	timer_label.add_theme_color_override("font_color", Color(0.9, 0.3, 0.3))
	alert_loop.play()

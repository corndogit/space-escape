extends Control

@onready var timer : Timer = get_node("CountdownTimer")
@onready var timer_label : Label = get_node("HFlowContainer/Timer")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var mins = int(timer.time_left / 60) 
	var secs = int(timer.time_left) % 60
	timer_label.text = "%02d:%02d" % [mins, secs]  # MM:SS with leading 0s


func _on_countdown_timer_timeout():
	timer_label.visible = false

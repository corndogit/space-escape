extends PanelContainer

var closable = true

func _ready():
	var window_size = get_window().get_size_with_decorations()
	custom_minimum_size.x = window_size.x
	custom_minimum_size.y = window_size.y

func _on_mouse_entered():
	print("mouse entered %s" % name)
	closable = true
	
func _on_mouse_exited():
	print("mouse exited %s" % name)
	closable = false
	
func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and closable:
		get_parent().queue_free()

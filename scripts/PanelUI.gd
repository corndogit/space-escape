extends PanelContainer

var closable = false

func _ready():
	var window_size = get_window().get_size_with_decorations()
	custom_minimum_size.x = window_size.x
	custom_minimum_size.y = window_size.y

func _on_mouse_entered():
	closable = true
	
func _on_mouse_exited():
	closable = false
	
func _process(_delta):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) and closable:
		State.computer_table.close_puzzle()

func _on_puzzle_1_puzzle_solved():
	await get_tree().create_timer(3).timeout
	State.computer_table.close_puzzle()

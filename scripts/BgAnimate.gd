extends TextureRect

@export var speed : float = 1.0
var decreasing = true
var value = 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if decreasing:
		value -= speed * delta
		if value < 0.0:
			value = 0.0
			decreasing = not decreasing
	else:
		value += speed * delta
		if value > 1.0:
			value = 1.0
			decreasing = not decreasing
	
	modulate = Color(1, 1, 1, value)

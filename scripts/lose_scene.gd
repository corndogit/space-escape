extends Node2D

@onready var player : Node2D = get_node("Player")
@onready var sprite : AnimatedSprite2D = get_node("Player/AnimatedSprite2D")
@export var animation_speed : float = 30.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.position.x > -500:
		player.position.x -= animation_speed * delta
		sprite.rotation_degrees += animation_speed * delta
	else:
		player.position = Vector2(1184, 430)
		sprite.rotation = 0

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/ui/title_screen.tscn")

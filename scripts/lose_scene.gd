extends Node2D

@onready var player : Node2D = get_node("Player")
@onready var sprite : AnimatedSprite2D = get_node("Player/AnimatedSprite2D")
@export var animation_speed : float = 30.0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if player.position.x > -5000:
		player.position.x -= animation_speed * delta
	if sprite.rotation_degrees < 36000:
		sprite.rotation_degrees += animation_speed * delta


func _on_retry_pressed():
	get_tree().change_scene_to_file("res://scenes/level.tscn")


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://scenes/title.tscn")

extends CharacterBody2D


@export var speed : float = 300.0
@onready var sprite : AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var sight : RayCast2D = get_node("Sight")

func _process(delta):
	_calculate_movement(speed * delta)
	_check_for_interaction()

func _calculate_movement(diff : float):
	if Input.is_key_pressed(KEY_A):
		position.x -= diff
		sight.rotation_degrees = 90
		sprite.play("walk")
		if not sprite.flip_h:
			sprite.flip_h = true

	if Input.is_key_pressed(KEY_D):
		position.x += diff
		sight.rotation_degrees = -90
		sprite.play("walk")
		if sprite.flip_h:
			sprite.flip_h = false

	if Input.is_key_pressed(KEY_S):
		position.y += diff
		sight.rotation_degrees = 0
		sprite.play("walk")

	if Input.is_key_pressed(KEY_W):
		position.y -= diff
		sight.rotation_degrees = 180
		sprite.play("walk")

	if not Input.is_anything_pressed():
		sprite.play("idle")
	
	move_and_slide()

func _check_for_interaction():
	if Input.is_key_pressed(KEY_E):
		if sight.is_colliding():  # see if there is anything to interact with
			var target = sight.get_collider()
			target.get_groups()
			if target.is_in_group("Interactable"):
				target.interact()

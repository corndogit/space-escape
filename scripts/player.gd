extends CharacterBody2D


@export var speed : float = 300.0
@onready var sprite : AnimatedSprite2D = get_node("AnimatedSprite2D")
@onready var sight : RayCast2D = get_node("Sight")
@onready var indicator : Label = get_node("Indicator")
@onready var camera : Camera2D = get_node("Camera2D")
@onready var level = get_parent()
var handbook_scene = preload("res://scenes/handbook.tscn").instantiate()
var in_puzzle : bool = false
var in_dialogue : bool = false
var in_handbook : bool = false

func _process(delta):
	_calculate_movement(speed * delta)
	_check_for_interactable()
	
func _unhandled_input(_event):
	if Input.is_key_pressed(KEY_E) and _check_for_interactable() and not in_dialogue and not in_puzzle:
		_player_interact(sight.get_collider())
	
	elif Input.is_key_pressed(KEY_H):
		show_player_handbook()

func _calculate_movement(diff : float):
	if in_dialogue or in_handbook:  # disable movement during dialogue
		sprite.play("idle")
		return
		
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

func _check_for_interactable():
	if sight.is_colliding():  # see if there is anything to interact with
		var target = sight.get_collider()
		target.get_groups()
		if target.is_in_group("Interactable"):
			indicator.visible = true
			return true
	indicator.visible = false
	return false
	
func _player_interact(target):
	if in_dialogue:
		return
	in_dialogue = true  # entering dialogue
	var sound : AudioStreamPlayer = target.get_node_or_null("InteractionSFX")
	if sound is AudioStreamPlayer:
		sound.play()
	else:
		$Sounds/InteractionSFX.play()  # default interaction sound (local to Player)
	target.interact()
	await DialogueManager.dialogue_ended
	in_dialogue= false
	
func show_player_handbook():
	if not handbook_scene.is_inside_tree():
		$Sounds/OpenMenu.play()
		level.add_child(handbook_scene)
		camera.enabled = false
		in_handbook = true
	else:
		$Sounds/CloseMenu.play()
		level.remove_child(handbook_scene)
		if not in_puzzle:
			camera.enabled = true
		in_handbook = false

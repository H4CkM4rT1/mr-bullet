extends CharacterBody2D

@export var bala: PackedScene

func _physics_process(delta):
	var input_directions = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_directions * 400
	move_and_slide()

	look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		disparar()
	
func disparar():
	if bala ==null:
		return
	
	var nueva_bala =bala.instantiate()
	get_tree().current_scene.add_child(nueva_bala)
	
	nueva_bala.global_position = global_position
	nueva_bala.global_rotation = global_rotation
	

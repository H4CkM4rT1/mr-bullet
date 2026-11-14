extends CharacterBody2D

@export var bala: PackedScene

func _physics_process(delta):
	var input_directions = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_directions * 400
	move_and_slide()

	#look_at(get_global_mouse_position())
	if Input.is_action_just_pressed("shoot"):
		print("Disparo")
		disparar()
	
func disparar():
	if bala == null:
		print("n hay escena de bala")
		return
	
	var nueva_bala = bala.instantiate()
	nueva_bala.add_collision_exception_with(self)
	
	get_tree().current_scene.add_child(nueva_bala)
	
	var direction = get_global_mouse_position() - global_position

	nueva_bala.global_position = global_position + direction.normalized() * 25
	nueva_bala.global_rotation = direction.angle()
	
	print("bala si funciona")

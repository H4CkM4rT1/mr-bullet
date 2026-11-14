extends CharacterBody2D

@export var bala: PackedScene


func _physics_process(delta):
	var input_directions = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_directions * 400
	move_and_slide()


func _unhandled_input(event: InputEvent) -> void:
	#look_at(get_global_mouse_position())
	if event.is_action_pressed("shoot"):
		print("Disparo")
		disparar()


func disparar():
	if bala == null:
		print("n hay escena de bala")
		return
	
	var nueva_bala = bala.instantiate()
	get_tree().current_scene.add_child(nueva_bala)
	
	var direccion = get_global_mouse_position() - global_position
	
	nueva_bala.global_position = global_position + direccion.normalized() * 100
	nueva_bala.configurar_direccion(direccion)
	
	print("bala si funciona")

extends CharacterBody2D

@export var velocidad = 700.0
@export var max_rebotes = 5

var rebotes = 0

func configurar_direccion(direction: Vector2):
	velocity = direction.normalized() * velocidad
	look_at(global_position + direction)

func _physics_process(delta):
	var colision := move_and_collide(velocity * delta)
	
	if colision:
		var objeto_chocado = colision.get_collider()
		
		# Verificamos si chocó contra algo (por seguridad)
		if objeto_chocado:
			
			# Comprobamos si está en el grupo de enemigos ("enemy" o "enemies")
			if objeto_chocado.is_in_group("Enemy") or objeto_chocado.is_in_group("enemies"):
				if objeto_chocado.has_method("take_hit"):
					objeto_chocado.take_hit() # ¡Mata al enemigo!
				
				queue_free() # Destruye la bala al instante para que no lo empuje más
				return       # Corta la ejecución para que no haga el rebote
			
			else:
				# Si choca contra una pared, rebota normalmente
				velocity = velocity.bounce(colision.get_normal())
				rebotes += 1
				look_at(global_position + velocity)
				
				if rebotes >= max_rebotes:
					queue_free()

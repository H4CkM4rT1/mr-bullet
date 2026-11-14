extends CharacterBody2D

@export var velocidad = 700.0
@export var max_rebotes = 5

var rebotes =  0

func configurar_direccion(direction: Vector2):
	velocity = direction.normalized() * velocidad
	look_at(global_position + direction)


func _physics_process(delta):
	var colision = move_and_collide(velocity * delta)
	
	if colision:
		velocity = velocity.bounce(colision.get_normal())
		rebotes += 1
		look_at(global_position + velocity)
		
		if rebotes >= max_rebotes:
			queue_free()

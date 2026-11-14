extends CharacterBody2D

@export var velocidad = 700.0
@export var max_rebotes = 5

var rebotes =  0

func _ready():
	velocity = Vector2.RIGHT.rotated(global_rotation) * velocidad
	
func _physics_process(delta):
	var colision = move_and_collide(velocity * delta)
	
	if colision:
		velocity = velocity.bounce(colision.get_normal())
		rebotes += 1
		
		if rebotes >= max_rebotes:
			queue_free()

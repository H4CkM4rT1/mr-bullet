class_name Enemy
extends CharacterBody2D

@export var speed: float = 150.0
@export var health: int = 1

var player: Node2D = null

func _ready() -> void:
	player = get_tree().get_first_node_in_group("player")


func _physics_process(_delta: float) -> void:
	if player:
		var direction = global_position.direction_to(player.global_position)
		velocity = direction * speed
	else:
		velocity = Vector2.DOWN * speed

	move_and_slide()


func take_hit(damage: int = 1) -> void:
	print("Le dispararon al enemigo")
	health -= damage
	if health <= 0:
		die()


func die() -> void:
	queue_free()

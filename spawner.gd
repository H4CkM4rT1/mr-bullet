extends Node2D

@export var escena: PackedScene
@export var timeout := 3.0

@onready var timer: Timer = %Timer


func _ready() -> void:
	timer.start(timeout)



func _on_timer_timeout() -> void:
	timer.start(timeout)
	var enemy: Node2D = escena.instantiate()
	enemy.global_position = global_position + Vector2.UP.rotated(randf_range(0, TAU))
	get_tree().current_scene.add_child(enemy)

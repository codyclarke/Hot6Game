extends Area2D

var speed: int = 500
var rotation_degrees_per_second: float  = 360

func _physics_process(delta: float) -> void:
	rotate(rotation_degrees_per_second * delta)
	position.x += (speed * delta)
	

extends Area2D

@export var speed: int = 300
@export var rotation_degrees_per_second: float = 360

@onready var _normal_position: Vector2 = position

func _physics_process(delta: float) -> void:
	_normal_position = Vector2(_normal_position.x + (speed * delta), _normal_position.y)
	position.x = _normal_position.x + randi_range(-5, 5)
	position.y = _normal_position.y + randi_range(-5, 5)

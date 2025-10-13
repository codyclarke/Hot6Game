class_name CharacterState extends Node

enum LookDirection { LEFT, RIGHT }
enum MovementType { IDLE, RUNNING, JUMPING }

signal turned(direction: LookDirection)
signal moved(movement_type: MovementType)


var look_direction: LookDirection = LookDirection.RIGHT:
	set(value):
		if value == look_direction: pass
		turned.emit(look_direction)
		look_direction = value


var movement_type: MovementType:
	set(value):
		if value == movement_type: pass
		moved.emit(value)
		movement_type = value

func moving(_velocity: Vector2) -> void:
	_set_look_direction(_velocity.x)
	_set_movement_type(_velocity)


func _set_look_direction(velocity_x: float) -> void:
	if velocity_x < 0: look_direction = LookDirection.LEFT
	elif velocity_x > 0: look_direction = LookDirection.RIGHT
	
	
func _set_movement_type(_velocity: Vector2) -> void:
	if _velocity.y != 0: movement_type = MovementType.JUMPING
	elif _velocity.x != 0: movement_type = MovementType.RUNNING
	else: movement_type = MovementType.IDLE 

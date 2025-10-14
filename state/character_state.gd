class_name CharacterState extends Node

enum LookDirection { LEFT, RIGHT }
enum MovementType { IDLE, RUNNING, JUMPING, WALLGRAB }

signal turned(direction: LookDirection)
signal moved(movement_type: MovementType, direction_sign: int)

#used to give a simple numerical sign value to look direction which is helpful for things like sprite flipping and offsets where needed
var direction_sign : int = 1

var look_direction: LookDirection = LookDirection.RIGHT:
	set(value):
		if value == look_direction: return
		turned.emit(value)
		look_direction = value


var movement_type: MovementType:
	set(value):
		if value == movement_type: return
		moved.emit(value,direction_sign)
		movement_type = value
		

func moving(_velocity: Vector2, is_on_wall:bool) -> void:
	_set_look_direction(_velocity.x)
	_set_movement_type(_velocity,is_on_wall)

#added direction_sign assignment
func _set_look_direction(velocity_x: float) -> void:
	if velocity_x < 0: look_direction = LookDirection.LEFT; direction_sign = -1
	elif velocity_x > 0: look_direction = LookDirection.RIGHT; direction_sign = 1
	
	
func _set_movement_type(_velocity: Vector2, is_on_wall:bool) -> void:
	if is_on_wall: movement_type = MovementType.WALLGRAB
	elif _velocity.y != 0: movement_type = MovementType.JUMPING
	elif _velocity.x != 0: movement_type = MovementType.RUNNING
	else: movement_type = MovementType.IDLE 

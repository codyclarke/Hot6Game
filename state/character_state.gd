class_name CharacterState extends Node

enum LookDirection { LEFT, RIGHT }
enum MovementType { IDLE, RUNNING, JUMPING, WALLGRAB }

signal turned(direction: LookDirection)
signal moved(movement_type: MovementType)

static func orient_vector(vector: Vector2, _look_direction: LookDirection) -> Vector2:
	var oriented_x = orient_float(vector.x, _look_direction)
	return Vector2(oriented_x, vector.y)
	
static func orient_float(value: float, _look_direction: LookDirection) -> float:
	return value * (1 if _look_direction == LookDirection.RIGHT else -1)

var look_direction: LookDirection = LookDirection.RIGHT:
	set(value):
		if value == look_direction: 
			return
		turned.emit(value)
		look_direction = value


var movement_type: MovementType:
	set(value):
		if value == movement_type: 
			return
		moved.emit(value)
		movement_type = value
		#if value == MovementType.WALLGRAB:
			#self._turn()
		

func moving(_velocity: Vector2, is_on_wall:bool) -> void:
	_set_look_direction(_velocity.x)
	_set_movement_type(_velocity,is_on_wall)


func _set_look_direction(velocity_x: float) -> void:
	if velocity_x < 0: look_direction = LookDirection.LEFT
	elif velocity_x > 0: look_direction = LookDirection.RIGHT
	
	
func _set_movement_type(_velocity: Vector2, is_on_wall:bool) -> void:
	if is_on_wall: movement_type = MovementType.WALLGRAB
	elif _velocity.y != 0: movement_type = MovementType.JUMPING
	elif _velocity.x != 0: movement_type = MovementType.RUNNING
	else: movement_type = MovementType.IDLE 

func _turn() -> void:
	var new_look = LookDirection.LEFT if look_direction == LookDirection.RIGHT else LookDirection.RIGHT
	look_direction = new_look

func orient(value: float) -> float:
	return orient_float(value, self.look_direction)

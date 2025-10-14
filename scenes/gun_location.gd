extends Node2D

var gun_position: Dictionary ={
	"wallgrab": Vector2(-40.0,-10.0),
	"running": Vector2(16.0,-10.0),
}

var look_direction: CharacterState.LookDirection = CharacterState.LookDirection.RIGHT:
	set(value):
		if value != null && look_direction != null && value != look_direction:
			position.x *= -1
		look_direction = value

func _on_character_turned(direction: CharacterState.LookDirection) -> void:
	look_direction = direction
	

func _on_character_state_moved(movement_type: CharacterState.MovementType, direction_sign: int) -> void:
	match movement_type:
		CharacterState.MovementType.RUNNING: position = Vector2(gun_position["running"].x*direction_sign,gun_position["running"].y)
		CharacterState.MovementType.WALLGRAB: position = Vector2(gun_position["wallgrab"].x*direction_sign,gun_position["wallgrab"].y)

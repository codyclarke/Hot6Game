extends Node2D

var look_direction: CharacterState.LookDirection = CharacterState.LookDirection.RIGHT:
	set(value):
		if value != null && look_direction != null && value != look_direction:
			position.x *= -1
		look_direction = value


func _on_character_turned(direction: CharacterState.LookDirection) -> void:
	look_direction = direction
		

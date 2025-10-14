extends AnimatedSprite2D

func _on_character_moved(movement_type: CharacterState.MovementType) -> void:
	match movement_type:
		CharacterState.MovementType.IDLE: play('idle'); offset.x=0
		CharacterState.MovementType.RUNNING: play('run'); offset.x=0
		CharacterState.MovementType.JUMPING: play('jump'); offset.x=0
		CharacterState.MovementType.WALLGRAB: 
			play('wallgrab')
			offset.x = 16


func _on_character_state_turned(direction: CharacterState.LookDirection) -> void:
	scale.x = CharacterState.orient_float(1, direction)

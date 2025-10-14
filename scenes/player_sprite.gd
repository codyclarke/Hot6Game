extends AnimatedSprite2D

func _on_character_moved(movement_type: CharacterState.MovementType, direction_sign:int) -> void:
	match movement_type:
		CharacterState.MovementType.IDLE: play('idle'); offset.x=0
		CharacterState.MovementType.RUNNING: play('run'); offset.x=0
		CharacterState.MovementType.JUMPING: play('jump'); offset.x=0
		CharacterState.MovementType.WALLGRAB: 
			play('wallgrab')
			offset.x = -16*direction_sign

func _on_character_turned(direction: CharacterState.LookDirection) -> void:
	flip_h = true if direction == CharacterState.LookDirection.LEFT else false

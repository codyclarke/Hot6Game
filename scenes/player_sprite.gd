extends AnimatedSprite2D

func _on_character_moved(movement_type: CharacterState.MovementType) -> void:
	match movement_type:
		CharacterState.MovementType.IDLE: play('idle')
		CharacterState.MovementType.RUNNING: play('run')
		CharacterState.MovementType.JUMPING: play('jump')


func _on_character_turned(direction: CharacterState.LookDirection) -> void:
	flip_h = true if direction == CharacterState.LookDirection.LEFT else false

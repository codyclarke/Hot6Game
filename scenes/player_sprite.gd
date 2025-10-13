extends AnimatedSprite2D


func _on_player_move_left(_velocity: float, is_on_floor: bool) -> void:
	play('run' if is_on_floor else 'jump')
	if !flip_h:
		flip_h = true


func _on_player_move_right(_velocity: float, is_on_floor: bool) -> void:
	play('run' if is_on_floor else 'jump')
	if flip_h:
		flip_h = false


func _on_player_stop(is_on_floor: bool) -> void:
	play('idle' if is_on_floor else 'jump')

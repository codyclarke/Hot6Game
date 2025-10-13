extends Node2D

@onready var player_sprite = $"../PlayerSprite"
var _flipped = false

func _on_player_move_left(_velocity: float, _is_on_floor: bool) -> void:
	if !_flipped:
		position.x *= -1
		_flipped = true


func _on_player_move_right(_velocity: float, _is_on_floor: bool) -> void:
	if _flipped:
		position.x *= -1
		_flipped = false

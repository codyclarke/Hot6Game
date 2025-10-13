extends Node2D

@onready var player_sprite = $"../PlayerSprite"
var _flipped = false

# I'm aware this is probably an insane way to handle flipping a position every once in a while
#  I'm not good at Godot! Maybe a signal would be appropriate here?
func _physics_process(delta: float) -> void:
	if player_sprite.flip_h && !_flipped:
		position.x *= -1
		_flipped = true
		pass
	elif !player_sprite.flip_h && _flipped:
		position.x *= -1
		_flipped = false
		

extends Area2D

@onready var player = $"../Player"

#checks if player is outside of the stage boundary and if so, resets their position to their starting position
func _on_body_exited(body: Node2D) -> void:
	if body == player:
		player.reset_position()

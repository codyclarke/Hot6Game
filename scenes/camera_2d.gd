extends Camera2D

@onready var player = $"../Player"

func _process(delta: float) -> void:
	if player.global_position.x > global_position.x+200:
		global_position.x = player.global_position.x -200
	if player.global_position.x < global_position.x-200:
		global_position.x = player.global_position.x +200
	

extends Camera2D

@onready var player = $"../Player"
@export var x_offset = 200
@export var y_offset = 100

func _process(delta: float) -> void:
	if player.global_position.x > global_position.x+x_offset:
		global_position.x = player.global_position.x -x_offset
	if player.global_position.x < global_position.x-x_offset:
		global_position.x = player.global_position.x +x_offset
	if player.global_position.y > global_position.y+y_offset:
		global_position.y = player.global_position.y -y_offset
	if player.global_position.y < global_position.y-y_offset:
		global_position.y = player.global_position.y +y_offset

extends Node2D

var gun_position: Dictionary ={
	"wallgrab": Vector2(40.0,-5.0),
	"running": Vector2(16.0, -5.0),
}	

func _on_character_state_moved(movement_type: CharacterState.MovementType) -> void:
	match movement_type:
		CharacterState.MovementType.WALLGRAB: position = gun_position['wallgrab']
		_: position = gun_position['running']

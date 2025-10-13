extends CharacterBody2D

@onready var stage = $"../"
@onready var player_sprite = $PlayerSprite
@onready var name_label: Label = $NameLabel
@onready var gun_location: Node2D = $GunLocation
@onready var character_state = $CharacterState

@export var character_data: CharacterData = PlayerData.new().generate()
@onready var projectile: PackedScene = preload("res://scenes/projectile.tscn")
	
func _ready() -> void:
	name_label.text = character_data.full_name()
		
func _process(_delta: float) -> void:
	var velocity_x: float = Input.get_axis("move_left", "move_right") * character_data.speed
	var velocity_y: float = _calculate_velocity_y()
	velocity = Vector2(velocity_x, velocity_y)
	character_state.moving(velocity)
	move_and_slide()
	if Input.is_action_just_pressed("attack"):
		spawn_projectile()
		

func _calculate_velocity_y() -> float:
	if is_on_floor() && Input.is_action_just_pressed("jump"):
		return character_data.jump_speed * -1
	elif is_on_floor():
		return 0
	else:
		return min(velocity.y + stage.gravity, stage.max_velocity)


func spawn_projectile():
	var direction = 1 if character_state.look_direction == CharacterState.LookDirection.RIGHT else -1
	var bang = projectile.instantiate()
	bang.init(gun_location.global_position, direction)
	owner.add_child(bang)

extends CharacterBody2D

@onready var stage = $"../"
@onready var player_sprite = $PlayerSprite
@onready var name_label: Label = $NameLabel
@onready var gun_location: Node2D = $GunLocation
@onready var character_state = $CharacterState

@export var character_data: CharacterData = PlayerData.new().generate()
@onready var projectile: PackedScene = preload("res://scenes/projectile.tscn")

var start_position : Vector2

func _ready() -> void:
	name_label.text = character_data.full_name()
	start_position = position

func _process(_delta: float) -> void:
	move_and_slide()
	character_state.moving(velocity,is_on_wall())
	if Input.is_action_just_pressed("attack"):
		spawn_projectile()

func _physics_process(delta: float) -> void:
	_calculate_velocity(delta)
	
func _calculate_velocity(delta) ->  void:
	velocity.x = int(lerp(velocity.x,Input.get_axis("move_left", "move_right") * character_data.speed,delta*10))
	if (is_on_floor() || is_on_wall()) && Input.is_action_just_pressed("jump"):
		velocity.y = character_data.jump_speed * -1
		if is_on_wall(): 
			velocity.x = -character_data.speed*3 if character_state.look_direction == CharacterState.LookDirection.RIGHT else character_data.speed*3
	elif is_on_floor():
		velocity.y = 0
	elif !is_on_wall():
		velocity.y = min(velocity.y + stage.gravity, stage.max_velocity)

func spawn_projectile():
	var direction = 1 if character_state.look_direction == CharacterState.LookDirection.RIGHT else -1
	var  state = "wallgrab" if  character_state.movement_type == CharacterState.MovementType.WALLGRAB else "running"
	direction = direction*-1 if state == "wallgrab" else direction
	var bang = projectile.instantiate()
	bang.init(gun_location.global_position, direction)
	owner.add_child(bang)

#used in stage_boundaries.gd to reset the position if the player goes out of bounds
func reset_position():
	position = start_position

func _on_character_state_moved(movement_type: CharacterState.MovementType, _direction_sign: int) -> void:
	velocity.y = 0.0 if movement_type == CharacterState.MovementType.WALLGRAB else velocity.y 

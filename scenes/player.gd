extends CharacterBody2D

@export var player_data: PlayerData = PlayerData.new()
@export var character_data: CharacterData = player_data.generate()

@onready var player_sprite = $PlayerSprite
@onready var name_label: Label = $NameLabel
@onready var gun_location: Node2D = $GunLocation
@onready var projectile: PackedScene = preload("res://scenes/projectile.tscn")

@onready var character_state = $CharacterState
@onready var gravity: GravityState = GravityState.new()	

var start_position : Vector2

func _init() -> void:
	# need to add created nodes as children so they're destroyed when Player is.
	#  else, we get a memory leak.
	add_child(player_data)
	add_child(character_data)

func _ready() -> void:
	name_label.text = character_data.full_name()
	start_position = position

func _process(_delta: float) -> void:
	velocity.x = Input.get_axis("move_left", "move_right") * character_data.speed
	character_state.moving(velocity)
	move_and_slide()
	if Input.is_action_just_pressed("attack"):
		spawn_projectile()
		
func _physics_process(delta: float) -> void:
	velocity.y = _calculate_velocity_y(delta)
	
func _calculate_velocity_y(delta: float) -> float:
	if is_on_floor() && Input.is_action_just_pressed("jump"):
		return character_data.jump_speed * -1
	elif is_on_floor():
		return 0
	elif velocity.y == gravity.max_velocity:
		return velocity.y
	else:
		# return min(velocity.y + (gravity.acceleration * delta), gravity.max_velocity)
		return min(velocity.y + gravity.acceleration, gravity.max_velocity)

func spawn_projectile():
	var direction = 1 if character_state.look_direction == CharacterState.LookDirection.RIGHT else -1
	var bang = projectile.instantiate()
	bang.init(gun_location.global_position, direction)
	owner.add_child(bang)

#used in stage_boundaries.gd to reset the position if the player goes out of bounds
func reset_position():
	position = start_position

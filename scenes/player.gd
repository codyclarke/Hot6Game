extends CharacterBody2D

@export var player_data: PlayerData = PlayerData.new()
@export var character_data: CharacterData = player_data.generate()

@onready var player_sprite = $PlayerSprite
@onready var name_label: Label = $NameLabel
@onready var gun_location: Node2D = $PlayerSprite/GunLocation
@onready var character_state = $CharacterState
@onready var wall_slide_speed: float = 3.0
@onready var projectile: PackedScene = preload("res://scenes/projectile.tscn")

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
	elif is_on_wall():
		velocity.y = min(velocity.y + gravity.acceleration/wall_slide_speed, gravity.max_velocity)

	elif is_on_floor():
		velocity.y = 0
	elif !is_on_wall():
		velocity.y = min(velocity.y + gravity.acceleration, gravity.max_velocity)

func spawn_projectile():
	var bang = projectile.instantiate()
	bang.init(gun_location.global_position, character_state.orient(1))
	owner.add_child(bang)

#used in stage_boundaries.gd to reset the position if the player goes out of bounds
func reset_position():
	position = start_position

func _on_character_state_moved(movement_type: CharacterState.MovementType) -> void:
	velocity.y = 0.0 if movement_type == CharacterState.MovementType.WALLGRAB else velocity.y 

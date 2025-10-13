extends CharacterBody2D

signal move_left(velocity: float, is_on_floor: bool)
signal move_right(velocity: float, is_on_: bool)
signal stop(is_on_ground: bool)

@onready var stage = $"../"
@onready var player_sprite = $PlayerSprite
@onready var name_label: Label = $NameLabel
@onready var gun_location: Node2D = $GunLocation

@export var character_data: CharacterData = PlayerData.new().generate()
@onready var projectile: PackedScene = preload("res://scenes/projectile.tscn")

enum LookDirection { LEFT, RIGHT }
enum ActionState { RUN, JUMP, IDLE }

var _look_direction: LookDirection = LookDirection.RIGHT
var _move_speed: float = 0 # TODO: this probably duplicates velocity, which could be modified directly
var _action_state: ActionState = ActionState.JUMP
	
func _ready() -> void:
	name_label.text = character_data.full_name()
		
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		spawn_projectile()

func _physics_process(delta: float) -> void:
	move_and_slide()
	_update_state()
	if _action_state == ActionState.JUMP:
		velocity.y = min(velocity.y + stage.gravity, stage.max_velocity)
	position.x = lerp(position.x, position.x + character_data.speed * _move_speed, delta)

		
func _update_state() -> void:
	var input_speed = Input.get_axis("move_left", "move_right")
	_action_state = _calculate_action_state(input_speed)
	_look_direction = _calculate_look_direction(input_speed)
	_move_speed = _calculate_move_speed(input_speed, _action_state)

	
func _calculate_action_state(input_speed: float) -> ActionState:
	if is_on_floor() && Input.is_action_just_pressed("jump"):
		velocity.y = character_data.jump_speed * -1
		return ActionState.JUMP
	elif !is_on_floor(): return ActionState.JUMP
	elif input_speed == 0: return ActionState.IDLE
	else: return ActionState.RUN
	
func _calculate_look_direction(input_speed: float) -> LookDirection:
	if input_speed < 0:
		move_left.emit(input_speed, is_on_floor())
		return LookDirection.LEFT
	elif input_speed > 0:
		move_right.emit(input_speed, is_on_floor())
		return LookDirection.RIGHT
	else:
		stop.emit(is_on_floor())
		return _look_direction
	
func _calculate_move_speed(input_speed: float, action_state: ActionState) -> float:
	match action_state:
		_: return input_speed

func spawn_projectile():
	var direction = 1 if _look_direction == LookDirection.RIGHT else -1
	var bang = projectile.instantiate()
	bang.init(gun_location.global_position, direction)
	owner.add_child(bang)

extends CharacterBody2D

@onready var stage = $"../"

@export var character_state: CharacterState = PlayerState.new().generate()
@export var projectile: PackedScene = preload("res://scenes/projectile.tscn")

func _init() -> void:
	pass
	
func _ready() -> void:
	var name_label = Label.new()
	name_label.text = character_state.full_name()
	name_label.position = Vector2(0, 100)
	add_child(name_label)
	
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		spawn_projectile()

func _physics_process(delta: float) -> void:
	move_and_slide()
	if !is_on_floor():
		velocity.y = min(velocity.y + stage.gravity, stage.max_velocity)
	position.x = lerp(position.x, position.x + character_state.speed * Input.get_axis("move_left", "move_right"),delta)
	if is_on_floor() && Input.is_action_just_pressed("jump"):
		velocity.y = character_state.jump_speed * -1

func spawn_projectile():
	var bang = projectile.instantiate()
	owner.add_child(bang)
	bang.position = position

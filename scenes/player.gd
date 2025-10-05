extends CharacterBody2D

@onready var stage = $"../"

@export var health: int = 5
@export var speed: float = 200.0
@export var jump_speed: float = 20.0
@export var projectile: PackedScene = preload("res://scenes/projectile.tscn")

# when object is initialized
func _init() -> void:
	pass
	
# when object is loaded into a scene
func _ready() -> void:
	pass
	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("attack"):
		spawn_projectile()

func _physics_process(delta: float) -> void:
	move_and_slide()
	if !is_on_floor():
		velocity.y = min(velocity.y + stage.gravity, stage.max_velocity)
	position.x = lerp(position.x, position.x + speed * Input.get_axis("move_left", "move_right"),delta)
	if is_on_floor() && Input.is_action_just_pressed("jump"):
		velocity.y = jump_speed * -1

func spawn_projectile():
	var projectile = projectile.instantiate()
	owner.add_child(projectile)
	projectile.position = position
